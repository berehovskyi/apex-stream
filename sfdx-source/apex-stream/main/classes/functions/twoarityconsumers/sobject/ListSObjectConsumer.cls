/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Provides common class level implementations, and related utilities for
 * `List<T> - SObject` two-arity consumers. Typically is used by collectors.
 * @see IObjectSObjectConsumer
 * @see SObjectCollector
 */
public abstract inherited sharing class ListSObjectConsumer extends ObjectSObjectConsumer {

    //<editor-fold desc="Add to List<Object> ObjectSObjectConsumer">
    // @start-group Add to List<Object> ObjectSObjectConsumer
    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `List<Object>` and adds to this `List` the result returned by the `mapper`
     * applied to the second input argument.
     * @param mapper the function applied to the second input argument
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     * @see SObjectCollector.toList
     */
    public static ObjectSObjectConsumer addToList(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new AddToObjectList(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="List-String ObjectSObjectConsumer">
    // @start-group List-String ObjectSObjectConsumer
    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `List<String>`, gets the first element and appends to it the second argument as
     * `String` using the `delimiter`.
     * @param mapper the function applied to the second input argument
     * @param delimiter the `String` to be used between each element
     * @param prefix the `String` to be used at the beginning of the joined result
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `mapper`, `delimiter`, or the `prefix` is null
     * @throws NullPointerException if at least one of the input arguments is null
     * @see SObjectCollector.joining
     */
    public static ObjectSObjectConsumer joining(
            final ISObjectFunction mapper,
            final String delimiter,
            final String prefix
    ) {
        Validate.notNull(mapper);
        Validate.notNull(delimiter);
        Validate.notNull(prefix);
        return new JoiningString(mapper, delimiter, prefix);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="List-Integer ObjectSObjectConsumer">
    // @start-group List-Integer ObjectSObjectConsumer
    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `List<Integer>`, which is used as a container to track the number of elements and the total sum.
     * @param mapper the function applied to the second input argument
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     * @see SObjectCollector.averagingInt
     */
    public static ObjectSObjectConsumer averagingInt(final ISObjectToIntFunction mapper) {
        Validate.notNull(mapper);
        return new AveragingInt(mapper);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `List<Integer>`, which is used as a container to track the total sum.
     * @param mapper the function applied to the second input argument
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     * @see SObjectCollector.summingInt
     */
    public static ObjectSObjectConsumer summingInt(final ISObjectToIntFunction mapper) {
        Validate.notNull(mapper);
        return new SummingInt(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="List-Long ObjectSObjectConsumer">
    // @start-group List-Long ObjectSObjectConsumer
    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `List<Long>`, which is used as a container to track the number of elements and the total sum.
     * @param mapper the function applied to the second input argument
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     * @see SObjectCollector.averagingLong
     */
    public static ObjectSObjectConsumer averagingLong(final ISObjectToLongFunction mapper) {
        Validate.notNull(mapper);
        return new AveragingLong(mapper);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `List<Long>`, which is used as a container to track the total sum.
     * @param mapper the function applied to the second input argument
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     * @see SObjectCollector.summingLong
     */
    public static ObjectSObjectConsumer summingLong(final ISObjectToLongFunction mapper) {
        Validate.notNull(mapper);
        return new SummingLong(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="List-Double ObjectSObjectConsumer">
    // @start-group List-Double ObjectSObjectConsumer
    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `List<Double>`, which is used as a container to track the number of elements
     * and the total sum using `Kahan Summation`.
     * @param mapper the function applied to the second input argument
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     * @see SObjectCollector.averagingDouble
     */
    public static ObjectSObjectConsumer averagingDouble(final ISObjectToDoubleFunction mapper) {
        Validate.notNull(mapper);
        return new AveragingDouble(mapper);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `List<Double>`, which is used as a container to track the total sum using
     * `Kahan Summation`.
     * @param mapper the function applied to the second input argument
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     * @see SObjectCollector.summingDouble
     */
    public static ObjectSObjectConsumer summingDouble(final ISObjectToDoubleFunction mapper) {
        Validate.notNull(mapper);
        return new SummingDouble(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="List-SObject ObjectSObjectConsumer">
    // @start-group List-SObject ObjectSObjectConsumer
    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `List<Object>`, gets the first element and reduces its value using `accumulator`.
     * @param accumulator the `ISObjectBinaryOperator` to be used between each element
     * @return the `ObjectSObjectConsumer`
     * @throws NullPointerException if the `accumulator` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.reducing
     */
    public static ObjectSObjectConsumer reducing(final ISObjectBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        return new Reducing(accumulator);
    }

    /**
     * @description Returns a `ObjectSObjectConsumer` that casts the first input argument to
     * `List<Object>`, if it is empty puts the first element as the second input argument.
     * Otherwise, gets the first element and reduces its value using `accumulator`.
     * @param accumulator the `ObjectSObjectConsumer` to be used between each element
     * @return the `BiConsumer`
     * @throws NullPointerException if the `accumulator` is null
     * @throws NullPointerException if the first input argument is null
     * @see SObjectCollector.reducing
     */
    public static ObjectSObjectConsumer reducingOptional(final ISObjectBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        return new ReducingOptional(accumulator);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AddToObjectList extends ObjectSObjectConsumer {
        private final ISObjectFunction classifier;
        private AddToObjectList(ISObjectFunction classifier) { this.classifier = classifier; }
        public override void accept(Object container, SObject sObj) {
            ((List<Object>) container).add(classifier.apply(sObj));
        }
    }

    private class JoiningString extends ObjectSObjectConsumer {
        private final ISObjectFunction mapper;
        private final String delimiter;
        private final String prefix;
        private JoiningString(ISObjectFunction mapper, String delimiter, String prefix) {
            this.mapper = mapper;
            this.delimiter = delimiter;
            this.prefix = prefix;
        }
        public override void accept(Object o, SObject sObj) {
            List<String> strings = (List<String>) o;
            strings[0] = strings[0] + (strings[0].length() > 0 ? delimiter : prefix) + (String) mapper.apply(sObj);
        }
    }

    private class AveragingInt extends ObjectSObjectConsumer {
        private final ISObjectToIntFunction mapper;
        private AveragingInt(ISObjectToIntFunction mapper) { this.mapper = mapper; }
        public override void accept(Object o, SObject sObj) {
            List<Integer> integers = (List<Integer>) o;
            integers[0]++;
            integers[1] += mapper.apply(sObj);
        }
    }

    private class AveragingLong extends ObjectSObjectConsumer {
        private final ISObjectToLongFunction mapper;
        private AveragingLong(ISObjectToLongFunction mapper) { this.mapper = mapper; }
        public override void accept(Object o, SObject sObj) {
            List<Long> integers = (List<Long>) o;
            integers[0]++;
            integers[1] += mapper.apply(sObj);
        }
    }

    private class AveragingDouble extends ObjectSObjectConsumer {
        private final ISObjectToDoubleFunction mapper;
        private AveragingDouble(ISObjectToDoubleFunction mapper) { this.mapper = mapper; }
        public override void accept(Object o, SObject sObj) {
            List<Double> avgContainer = ((List<Double>) o);
            avgContainer[2]++;
            avgContainer[3] += ListDoubleConsumer.kahanSum(avgContainer, mapper.apply(sObj));
        }
    }

    private class SummingInt extends ObjectSObjectConsumer {
        private final ISObjectToIntFunction mapper;
        private SummingInt(ISObjectToIntFunction mapper) { this.mapper = mapper; }
        public override void accept(Object o, SObject sObj) { ((List<Integer>) o)[0] += mapper.apply(sObj); }
    }

    private class SummingLong extends ObjectSObjectConsumer {
        private final ISObjectToLongFunction mapper;
        private SummingLong(ISObjectToLongFunction mapper) { this.mapper = mapper; }
        public override void accept(Object o, SObject sObj) { ((List<Long>) o)[0] += mapper.apply(sObj); }
    }

    private class SummingDouble extends ObjectSObjectConsumer {
        private final ISObjectToDoubleFunction mapper;
        private SummingDouble(ISObjectToDoubleFunction mapper) { this.mapper = mapper; }
        public override void accept(Object o, SObject sObj) {
            List<Double> sumContainer = ((List<Double>) o);
            sumContainer[2] += ListDoubleConsumer.kahanSum(sumContainer, mapper.apply(sObj));
        }
    }

    private class Reducing extends ObjectSObjectConsumer {
        private final ISObjectBinaryOperator operator;
        private Reducing(ISObjectBinaryOperator operator) { this.operator = operator; }
        public override void accept(Object container, SObject sObj) {
            ((List<SObject>) container)[0] = operator.apply(((List<SObject>) container)[0], sObj);
        }
    }

    private class ReducingOptional extends ObjectSObjectConsumer {
        private final ISObjectBinaryOperator operator;
        private ReducingOptional(ISObjectBinaryOperator operator) { this.operator = operator; }
        public override void accept(Object container, SObject sObj) {
            List<SObject> identityBox = (List<SObject>) container;
            if (!identityBox.isEmpty()) {
                identityBox[0] = operator.apply(identityBox[0], sObj);
            } else {
                identityBox.add(sObj);
            }
        }
    }
    // @end-group
    //</editor-fold>

}
