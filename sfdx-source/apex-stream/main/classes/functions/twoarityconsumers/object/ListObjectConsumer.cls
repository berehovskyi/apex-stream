/**
 * @description Provides common class level implementations, and related utilities for
 * `List<T> - Object` two-arity consumers. Typically is used by collectors.
 *
 * @see IBiConsumer
 * @see Collector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class ListObjectConsumer extends BiConsumer {

    //<editor-fold desc="Add To List<Object>">
    // @start-group Add To List<Object>
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to `List<Object>`
     * and adds the second input argument to this `List`.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.toList
     */
    public static BiConsumer addToList() {
        return new AddToList();
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to `List`
     * and adds to this `List<Object>` the result returned by the `mapper` applied to the second
     * input argument.
     *
     * @param mapper the function applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see Collector.toList
     */
    public static BiConsumer addToList(final IFunction mapper) {
        Validate.notNull(mapper);
        return new AddToListByClassifier(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="List-String BiConsumers">
    // @start-group List-String BiConsumers
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<String>`, gets the first element and appends to it the second argument as
     * `String` using the `delimiter`.
     *
     * @param delimiter the `String` to be used between each element
     * @param prefix the `String` to be used at the beginning of the joined result
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `delimiter` or the `prefix` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see Collector.joining
     */
    public static BiConsumer joining(final String delimiter, final String prefix) {
        Validate.notNull(delimiter);
        Validate.notNull(prefix);
        return new JoiningString(delimiter, prefix);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="List-Integer BiConsumers">
    // @start-group List-Integer BiConsumers
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Integer>`, which is used as a container to track the number of elements
     * and the total sum.
     *
     * @param mapper the function applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see Collector.averagingInt
     */
    public static BiConsumer averagingInt(final IToIntFunction mapper) {
        Validate.notNull(mapper);
        return new AveragingInt(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Integer>`, which is used as a container to track the total sum.
     *
     * @param mapper the function applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see Collector.summingInt
     */
    public static BiConsumer summingInt(final IToIntFunction mapper) {
        Validate.notNull(mapper);
        return new SummingInt(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="List-Long BiConsumers">
    // @start-group List-Long BiConsumers
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Long>`, which is used as a container to track the number of elements and the total sum.
     *
     * @param mapper the function applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see Collector.averagingLong
     */
    public static BiConsumer averagingLong(final IToLongFunction mapper) {
        Validate.notNull(mapper);
        return new AveragingLong(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Long>`, which is used as a container to track the total sum.
     *
     * @param mapper the function applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see Collector.summingLong
     */
    public static BiConsumer summingLong(final IToLongFunction mapper) {
        Validate.notNull(mapper);
        return new SummingLong(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="List-Double BiConsumers">
    // @start-group List-Double BiConsumers
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Double>`, which is used as a container to track the number of elements
     * and the total sum using `Kahan Summation`.
     *
     * @param mapper the function applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see Collector.averagingDouble
     */
    public static BiConsumer averagingDouble(final IToDoubleFunction mapper) {
        Validate.notNull(mapper);
        return new AveragingDouble(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Double>`, which is used as a container to track the total sum using
     * `Kahan Summation`.
     *
     * @param mapper the function applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see Collector.summingDouble
     */
    public static BiConsumer summingDouble(final IToDoubleFunction mapper) {
        Validate.notNull(mapper);
        return new SummingDouble(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="List-Object BiConsumers">
    // @start-group List-Object BiConsumers
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Object>`, gets the first element and reduces its value using `accumulator`.
     *
     * @param accumulator the `IBinaryOperator` to be used between each element
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `accumulator` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.reducing
     */
    public static BiConsumer reducing(final IBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        return new Reducing(accumulator);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Object>`, gets the first element and reduces its value using `accumulator`.
     *
     * @param accumulator the `IBinaryOperator` to be used between each element
     * @param mapper the `IFunction` applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `accumulator` or the `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.reducing
     */
    public static BiConsumer reducing(final IBinaryOperator accumulator, final IFunction mapper) {
        Validate.notNull(accumulator);
        Validate.notNull(mapper);
        return new ReducingByMapper(accumulator, mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Object>`, if it is empty puts the first element as the second input argument.
     * Otherwise, gets the first element and reduces its value using `accumulator`.
     *
     * @param accumulator the `IBinaryOperator` to be used between each element
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the `accumulator` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collector.reducing
     */
    public static BiConsumer reducingOptional(final IBinaryOperator accumulator) {
        Validate.notNull(accumulator);
        return new ReducingOptional(accumulator);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AddToList extends BiConsumer {
        public override void accept(Object container, Object o) { ((List<Object>) container).add(o); }
    }

    private class AddToListByClassifier extends BiConsumer {
        private final IFunction mapper;
        private AddToListByClassifier(IFunction mapper){ this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((List<Object>) container).add(mapper.apply(o)); }
    }

    private class JoiningString extends BiConsumer {
        private final String delimiter;
        private final String prefix;
        private JoiningString(String delimiter, String prefix) {
            this.delimiter = delimiter;
            this.prefix = prefix;
        }
        public override void accept(Object container, Object o) {
            List<String> strings = (List<String>) container;
            strings[0] = strings[0] + (strings[0].length() > 0 ? delimiter : prefix) + (String) o;
        }
    }

    private class AveragingInt extends BiConsumer {
        private final IToIntFunction mapper;
        private AveragingInt(IToIntFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) {
            List<Integer> integers = (List<Integer>) container;
            integers[0]++;
            integers[1] += mapper.apply(o);
        }
    }

    private class AveragingLong extends BiConsumer {
        private final IToLongFunction mapper;
        private AveragingLong(IToLongFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) {
            List<Long> integers = (List<Long>) container;
            integers[0]++;
            integers[1] += mapper.apply(o);
        }
    }

    private class AveragingDouble extends BiConsumer {
        private final IToDoubleFunction mapper;
        private AveragingDouble(IToDoubleFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) {
            List<Double> avgContainer = ((List<Double>) container);
            avgContainer[2]++;
            avgContainer[3] += ListDoubleConsumer.kahanSum(avgContainer, mapper.apply(o));
        }
    }

    private class SummingInt extends BiConsumer {
        private final IToIntFunction mapper;
        private SummingInt(IToIntFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((List<Integer>) container)[0] += mapper.apply(o); }
    }

    private class SummingLong extends BiConsumer {
        private final IToLongFunction mapper;
        private SummingLong(IToLongFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((List<Long>) container)[0] += mapper.apply(o); }
    }

    private class SummingDouble extends BiConsumer {
        private final IToDoubleFunction mapper;
        private SummingDouble(IToDoubleFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) {
            List<Double> sumContainer = ((List<Double>) container);
            sumContainer[2] += ListDoubleConsumer.kahanSum(sumContainer, mapper.apply(o));
        }
    }

    private class Reducing extends BiConsumer {
        private final IBinaryOperator operator;
        private Reducing(IBinaryOperator operator) { this.operator = operator; }
        public override void accept(Object container, Object o) {
            ((List<Object>) container)[0] = operator.apply(((List<Object>) container)[0], o);
        }
    }

    private class ReducingByMapper extends BiConsumer {
        private final IBinaryOperator operator;
        private final IFunction mapper;
        private ReducingByMapper(IBinaryOperator operator, IFunction mapper) {
            this.operator = operator;
            this.mapper = mapper;
        }
        public override void accept(Object container, Object o) {
            ((List<Object>) container)[0] = operator.apply(((List<Object>) container)[0], mapper.apply(o));
        }
    }

    private class ReducingOptional extends BiConsumer {
        private final IBinaryOperator operator;
        private ReducingOptional(IBinaryOperator operator) { this.operator = operator; }
        public override void accept(Object container, Object o) {
            List<Object> identityBox = (List<Object>) container;
            if (!identityBox.isEmpty()) {
                identityBox[0] = operator.apply(identityBox[0], o);
            } else {
                identityBox.add(o);
            }
        }
    }
    // @end-group
    //</editor-fold>
}
