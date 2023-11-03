/**
 * @description Provides common implementations of {@link BiConsumer}
 * and related utilities.
 *
 * @see BiConsumer
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class BiConsumers {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected BiConsumers() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a composed `BiConsumer` that executes `accumulator` operation,
     * if the second input argument satisfies the predicate.
     *
     * @param predicate the predicate applied to the second input argument
     * @param accumulator the operation to perform after filtering
     *
     * @return the composed `BiConsumer`
     *
     * @throws NullPointerException if `predicate` or `accumulator` is null
     */
    public static BiConsumer filtering(final IPredicate predicate, final IBiConsumer accumulator) {
        return new Filtering(predicate, accumulator);
    }

    /**
     * @description Returns a composed `BiConsumer` that applies `accumulator` operation to
     * the result returned by the mapper.
     *
     * @param mapper the operator applied to the second input argument
     * @param accumulator the operation to perform
     *
     * @return the composed `BiConsumer`
     *
     * @throws NullPointerException if `mapper` or `accumulator` is null
     */
    public static BiConsumer mapping(final IFunction mapper, final IBiConsumer accumulator) {
        return new Mapping(mapper, accumulator);
    }

    /**
     * @description Returns a composed `BiConsumer` that applies `accumulator`
     * operation to the `Iterable<Object>` elements produced by the `mapper`.
     *
     * @param mapper the operator applied to the second input argument which must produce `Iterable<Object>`
     * @param accumulator the operation to perform
     *
     * @return the composed `BiConsumer`
     *
     * @throws NullPointerException if `mapper` or `accumulator` is null
     */
    public static BiConsumer flatMapping(final IFunction mapper, final IBiConsumer accumulator) {
        return new FlatMapping(mapper, accumulator);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private abstract class Operating extends BiConsumer {
        protected final IFunction mapper;
        protected final IBiConsumer accumulator;
        protected Operating(IFunction mapper, IBiConsumer accumulator) {
            Validate.notNull(mapper);
            Validate.notNull(accumulator);
            this.mapper = mapper;
            this.accumulator = accumulator;
        }
    }

    private class Filtering extends BiConsumer {
        private final IPredicate predicate;
        private final IBiConsumer accumulator;
        private Filtering(IPredicate predicate, IBiConsumer accumulator) {
            Validate.notNull(predicate);
            Validate.notNull(accumulator);
            this.predicate = predicate;
            this.accumulator = accumulator;
        }
        public override void accept(Object container, Object o) {
            if (predicate.test(o)) { accumulator.accept(container, o); }
        }
    }

    private class Mapping extends Operating {
        private Mapping(IFunction mapper, IBiConsumer accumulator) { super(mapper, accumulator); }
        public override void accept(Object container, Object o) { accumulator.accept(container, mapper.apply(o)); }
    }

    private class FlatMapping extends Operating {
        private FlatMapping(IFunction mapper, IBiConsumer accumulator) { super(mapper, accumulator); }
        public override void accept(Object container, Object o) {
            final Iterable<Object> result = (Iterable<Object>) mapper.apply(o);
            if (result == null) { return; } 
            final Iterator<Object> iterator = result.iterator();
            while (iterator.hasNext()) {
                this.accumulator.accept(container, iterator.next());
            }
        }
    }
    // @end-group
    //</editor-fold>

}
