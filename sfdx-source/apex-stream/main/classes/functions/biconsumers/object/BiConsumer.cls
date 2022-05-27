/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IBiConsumer} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see IBiConsumer
 * @see Collector
 */
public abstract inherited sharing class BiConsumer implements IBiConsumer {

    /**
     * @description Downstream collector.
     */
    public ICollector downstream { get; set; }

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Object o1, Object o2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `BiConsumer` that executes `this` operation first,
     * then the `after` operation in that order.
     * @param after the operation to perform after this operation
     * @return the composed `BiConsumer`
     * @throws NullPointerException if `after` is null
     */
    public virtual BiConsumer andThen(final IBiConsumer after) {
        return compose(new List<IBiConsumer>{ this, after });
    }

    /**
     * @description Returns a composed `BiConsumer` that executes `before` operation first,
     * then the `this` operation in that order.
     * @param before the operation to perform before this operation
     * @return the composed `BiConsumer`
     * @throws NullPointerException if `before` is null
     */
    public virtual BiConsumer compose(final IBiConsumer before) {
        return compose(new List<IBiConsumer>{ before, this });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `BiConsumer` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     * @param consumers the operations to sequentially perform
     * @return the composed `BiConsumer`
     * @throws NullPointerException if `consumers` is null or some element is null
     */
    public static BiConsumer compose(final List<IBiConsumer> consumers) {
        Validate.noNullElements(consumers);
        return new Compose(consumers);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a composed `BiConsumer` that executes `accumulator` operation,
     * if the second input argument satisfies the predicate.
     * @param predicate the predicate applied to the second input argument
     * @param accumulator the operation to perform after filtering
     * @return the composed `BiConsumer`
     * @throws NullPointerException if `predicate` or `accumulator` is null
     */
    public static BiConsumer filtering(final IPredicate predicate, final IBiConsumer accumulator) {
        Validate.notNull(predicate);
        Validate.notNull(accumulator);
        return new Filtering(predicate, accumulator);
    }

    /**
     * @description Returns a composed `BiConsumer` that applies `accumulator` operation to
     * the result returned by the mapper.
     * @param mapper the operator applied to the second input argument
     * @param accumulator the operation to perform
     * @return the composed `BiConsumer`
     * @throws NullPointerException if `mapper` or `accumulator` is null
     */
    public static BiConsumer mapping(final IFunction mapper, final IBiConsumer accumulator) {
        Validate.notNull(mapper);
        Validate.notNull(accumulator);
        return new Mapping(mapper, accumulator);
    }

    /**
     * @description Returns a composed `BiConsumer` that applies `accumulator`
     * operation to the `Iterable<Object>` elements produced by the `mapper`.
     * @param mapper the operator applied to the second input argument which must produce `Iterable<Object>`
     * @param accumulator the operation to perform
     * @return the composed `BiConsumer`
     * @throws NullPointerException if `mapper` or `accumulator` is null
     */
    public static BiConsumer flatMapping(final IFunction mapper, final IBiConsumer accumulator) {
        Validate.notNull(mapper);
        Validate.notNull(accumulator);
        return new FlatMapping(mapper, accumulator);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compose extends BiConsumer {
        private final List<IBiConsumer> consumers;
        private Compose(List<IBiConsumer> consumers) { this.consumers = consumers; }
        public override void accept(Object o1, Object o2) {
            for (IBiConsumer consumer : consumers) {
                consumer.accept(o1, o2);
            }
        }
    }

    private class Filtering extends BiConsumer {
        private final IPredicate predicate;
        private final IBiConsumer accumulator;
        private Filtering(IPredicate predicate, IBiConsumer accumulator) {
            this.predicate = predicate;
            this.accumulator = accumulator;
        }
        public override void accept(Object container, Object o) {
            if (predicate.test(o)) { accumulator.accept(container, o); }
        }
    }

    private class Mapping extends BiConsumer {
        private final IFunction mapper;
        private final IBiConsumer accumulator;
        private Mapping(IFunction mapper, IBiConsumer accumulator) {
            this.mapper = mapper;
            this.accumulator = accumulator;
        }
        public override void accept(Object container, Object o) {
            accumulator.accept(container, mapper.apply(o));
        }
    }

    private class FlatMapping extends BiConsumer {
        private final IFunction mapper;
        private final IBiConsumer accumulator;
        private FlatMapping(IFunction mapper, IBiConsumer accumulator) {
            this.mapper = mapper;
            this.accumulator = accumulator;
        }
        public override void accept(Object container, Object o) {
            final Iterable<Object> result = (Iterable<Object>) mapper.apply(o);
            if (result != null) {
                final Iterator<Object> iterator = result.iterator();
                while (iterator.hasNext()) {
                    this.accumulator.accept(container, iterator.next());
                }
            }
        }
    }
    // @end-group
    //</editor-fold>

}
