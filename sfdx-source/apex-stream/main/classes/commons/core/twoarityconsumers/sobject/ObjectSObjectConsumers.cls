/**
 * @description Provides common implementations of {@link ObjectSObjectConsumer}
 * and related utilities that are used by {@link SObjectCollectors}.
 *
 * @see ObjectSObjectConsumer
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class ObjectSObjectConsumers {

    @TestVisible
    private ObjectSObjectConsumers(){}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
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
            if (predicate.test(sObj)) { accumulator.accept(container, sObj); }
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
            accumulator.accept(container, mapper.apply(sObj));
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
                    accumulator.accept(container, iterator.next());
                }
            }
        }
    }
    // @end-group
    //</editor-fold>

}
