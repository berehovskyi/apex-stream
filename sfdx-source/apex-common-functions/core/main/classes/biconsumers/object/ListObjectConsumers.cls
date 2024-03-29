/**
 * @description Provides common implementations of `List<T> - Object` {@link BiConsumer}
 * and related utilities that are used by {@link Collectors}.
 *
 * @see BiConsumer
 * @see Collectors
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class ListObjectConsumers extends BaseListObjectConsumers {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected ListObjectConsumers() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<String>`, gets the first element and appends to it the function applied to the second argument as
     * `String` using the `delimiter`.
     *
     * @param mapper the mapping function
     * @param delimiter the `String` to be used between each element
     * @param prefix the `String` to be used at the beginning of the joined result
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `delimiter` or `prefix` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see Collectors.joining
     */
    public static BiConsumer joining(final IFunction mapper, final String delimiter, final String prefix) {
        return new JoiningString(mapper, delimiter, prefix);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Integer>`, which is used as a container to track the number of elements
     * and the total sum.
     *
     * @param mapper the function applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see Collectors.averagingInt
     */
    public static BiConsumer averagingInt(final IFunction mapper) {
        return new AveragingInt(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Long>`, which is used as a container to track the number of elements and the total sum.
     *
     * @param mapper the function applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `mapper` is null
     * @throws NullPointerException if at least one of the input arguments is null
     *
     * @see Collectors.averagingLong
     */
    public static BiConsumer averagingLong(final IFunction mapper) {
        return new AveragingLong(mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Object>`, gets the first element and reduces its value using `accumulator`.
     *
     * @param accumulator the `IBiOperator` to be used between each element
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `accumulator` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.reducing
     */
    public static BiConsumer reducing(final IBiOperator accumulator) {
        return new Reducing(accumulator);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Object>`, gets the first element and reduces its value using `accumulator`.
     *
     * @param accumulator the `IBiOperator` to be used between each element
     * @param mapper the `IFunction` applied to the second input argument
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `accumulator` or `mapper` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.reducing
     */
    public static BiConsumer reducing(final IBiOperator accumulator, final IFunction mapper) {
        return new ReducingByMapper(accumulator, mapper);
    }

    /**
     * @description Returns a `BiConsumer` that casts the first input argument to
     * `List<Object>`, if it is empty puts the first element as the second input argument.
     * Otherwise, gets the first element and reduces its value using `accumulator`.
     *
     * @param accumulator the `IBiOperator` to be used between each element
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if `accumulator` is null
     * @throws NullPointerException if the first input argument is null
     *
     * @see Collectors.reducing
     */
    public static BiConsumer reducingOptional(final IBiOperator accumulator) {
        
        return new ReducingOptional(accumulator);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private abstract class Operating extends BiConsumer {
        protected final IFunction mapper;
        protected Operating(IFunction mapper) {
            Validate.notNull(mapper);
            this.mapper = mapper;
        }
    }

    private class JoiningString extends BiConsumer {
        private final IFunction mapper;
        private final String delimiter;
        private final String prefix;
        private JoiningString(IFunction mapper, String delimiter, String prefix) {
            Validate.notNull(mapper);
            Validate.notNull(delimiter);
            Validate.notNull(prefix);
            this.mapper = mapper;
            this.delimiter = delimiter;
            this.prefix = prefix;
        }
        public override void accept(Object container, Object o) {
            final List<String> strings = (List<String>) container;
            strings[0] = strings[0] + (strings[0].length() > 0 ? delimiter : prefix) + (String) mapper.apply(o);
        }
    }

    private class AveragingInt extends Operating {
        private AveragingInt(IFunction mapper) { super(mapper); }
        public override void accept(Object container, Object o) {
            final List<Integer> integers = (List<Integer>) container;
            integers[0]++;
            integers[1] += (Integer) mapper.apply(o);
        }
    }

    private class AveragingLong extends Operating {
        private AveragingLong(IFunction mapper) { super(mapper); }
        public override void accept(Object container, Object o) {
            final List<Long> integers = (List<Long>) container;
            integers[0]++;
            integers[1] += (Long) mapper.apply(o);
        }
    }

    private class Reducing extends BiConsumer {
        private final IBiOperator operator;
        private Reducing(IBiOperator operator) {
            Validate.notNull(operator);
            this.operator = operator;
        }
        public override void accept(Object container, Object o) {
            ((List<Object>) container)[0] = operator.apply(((List<Object>) container)[0], o);
        }
    }

    private class ReducingByMapper extends BiConsumer {
        private final IBiOperator operator;
        private final IFunction mapper;
        private ReducingByMapper(IBiOperator operator, IFunction mapper) {
            Validate.notNull(operator);
            Validate.notNull(mapper);
            this.operator = operator;
            this.mapper = mapper;
        }
        public override void accept(Object container, Object o) {
            ((List<Object>) container)[0] = operator.apply(((List<Object>) container)[0], mapper.apply(o));
        }
    }

    private class ReducingOptional extends BiConsumer {
        private final IBiOperator operator;
        private ReducingOptional(IBiOperator operator) {
            Validate.notNull(operator);
            this.operator = operator;
        }
        public override void accept(Object container, Object o) {
            final List<Object> identityContainer = (List<Object>) container;
            if (!identityContainer.isEmpty()) {
                identityContainer[0] = operator.apply(identityContainer[0], o);
            } else {
                identityContainer.add(o);
            }
        }
    }
    // @end-group
    //</editor-fold>

}
