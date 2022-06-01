/**
 * @description Inherits {@link IObjectSObjectConsumer} functional interface and provides
 * common class level implementations, and related utilities.
 *
 * @see IObjectSObjectConsumer
 * @see SObjectCollector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class ObjectSObjectConsumer implements IObjectSObjectConsumer {

    /**
     * @description Downstream collector.
     */
    public ISObjectCollector downstream { get; set; }

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Object container, SObject sObj);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Composed BiConsumers">
    // @start-group Composed BiConsumers
    /**
     * @description Returns a composed `ObjectSObjectConsumer` that executes `accumulator`
     * operation, if the second input argument satisfies the predicate.
     *
     * @param predicate the predicate applied to the second input argument
     * @param accumulator the operation to perform after filtering
     *
     * @return the composed `ObjectSObjectConsumer`
     *
     * @throws NullPointerException if `predicate` or `accumulator` is null
     */
    public static ObjectSObjectConsumer filtering(
            final ISObjectPredicate predicate,
            final IObjectSObjectConsumer accumulator
    ) {
        Validate.notNull(predicate);
        Validate.notNull(accumulator);
        return new Filtering(predicate, accumulator);
    }

    /**
     * @description Returns a composed `ObjectSObjectConsumer` that applies `accumulator`
     * operation to the result returned by the `mapper`.
     *
     * @param mapper the operator applied to the second input argument
     * @param accumulator the operation to perform
     *
     * @return the composed `ObjectSObjectConsumer`
     *
     * @throws NullPointerException if `mapper` or `accumulator` is null
     */
    public static ObjectSObjectConsumer mapping(final ISObjectFunction mapper, final IBiConsumer accumulator) {
        Validate.notNull(mapper);
        Validate.notNull(accumulator);
        return new Mapping(mapper, accumulator);
    }

    /**
     * @description Returns a composed `ObjectSObjectConsumer` that applies `accumulator`
     * operation to the `Iterable<SObject>` elements produced by the `mapper`.
     *
     * @param mapper the operator applied to the second input argument which must produce `Iterable<SObject>`
     * @param accumulator the operation to perform
     *
     * @return the composed `ObjectSObjectConsumer`
     *
     * @throws NullPointerException if `mapper` or `accumulator` is null
     */
    public static ObjectSObjectConsumer flatMapping(final ISObjectFunction mapper, final IBiConsumer accumulator) {
        Validate.notNull(mapper);
        Validate.notNull(accumulator);
        return new FlatMapping(mapper, accumulator);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Filtering extends ObjectSObjectConsumer {
        private final ISObjectPredicate predicate;
        private final IObjectSObjectConsumer accumulator;
        private Filtering(ISObjectPredicate predicate, IObjectSObjectConsumer accumulator) {
            this.predicate = predicate;
            this.accumulator = accumulator;
        }
        public override void accept(Object container, SObject sObj) {
            if (predicate.test(sObj)) { this.accumulator.accept(container, sObj); }
        }
    }

    private class Mapping extends ObjectSObjectConsumer {
        private final ISObjectFunction mapper;
        private final IBiConsumer accumulator;
        private Mapping(ISObjectFunction mapper, IBiConsumer accumulator) {
            this.mapper = mapper;
            this.accumulator = accumulator;
        }
        public override void accept(Object container, SObject sObj) {
            this.accumulator.accept(container, mapper.apply(sObj));
        }
    }

    private class FlatMapping extends ObjectSObjectConsumer {
        private final ISObjectFunction mapper;
        private final IBiConsumer accumulator;
        private FlatMapping(ISObjectFunction mapper, IBiConsumer accumulator) {
            this.mapper = mapper;
            this.accumulator = accumulator;
        }
        public override void accept(Object container, SObject sObj) {
            final Iterable<SObject> result = (Iterable<SObject>) mapper.apply(sObj);
            if (result != null) {
                final Iterator<SObject> iterator = result.iterator();
                while (iterator.hasNext()) {
                    this.accumulator.accept(container, iterator.next());
                }
            }
        }
    }
    // @end-group
    //</editor-fold>

}
