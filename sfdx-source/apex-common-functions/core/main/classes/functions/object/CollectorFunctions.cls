/**
 * @description Provides common implementations of {@link Function}
 * and related utilities that are used by {@link Collectors}.
 *
 * @see Function
 * @see Collectors
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
@SuppressWarnings('PMD.CognitiveComplexity')
public virtual inherited sharing class CollectorFunctions extends BaseCollectorFunctions {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected CollectorFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Function` that appends the `suffix` the
     * the boxed string.
     *
     * @param suffix the string to append
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `index` is null
     *
     * @see Collectors.joining
     */
    public static Function append(final String suffix) {
        return new AppendFinisher(suffix);
    }

    /**
     * @description Returns a `Function` that returns the final result of summing.
     *
     * @return the `Function`
     *
     * @see Collectors.summingInt
     * @see Collectors.summingLong
     */
    public static Function summing() {
        return new SummingFinisher();
    }

    /**
     * @description Returns a `Function` that returns the final result of Integer averaging.
     *
     * @return the `Function`
     *
     * @see Collectors.averagingInt
     */
    public static Function averagingInt() {
        return new AveragingIntFinisher();
    }

    /**
     * @description Returns a `Function` that returns the final result of Long averaging.
     *
     * @return the `Function`
     *
     * @see Collectors.averagingLong
     */
    public static Function averagingLong() {
        return new AveragingLongFinisher();
    }

    /**
     * @description Returns a `Function` that applies the `finisher` to every map value
     * and returns the grouping by booleans final result.
     *
     * @param finisher the function applied to every map value
     *
     * @return the `Function`
     *
     * @see Collectors.groupingByBool
     */
    public static Function groupByBool(final IFunction finisher) {
        return new GroupByBoolFinisher(finisher);
    }

    /**
     * @description Returns a `Function` that applies the `finisher` to every map value
     * and returns the grouping by ids final result.
     *
     * @param finisher the function applied to every map value
     *
     * @return the `Function`
     *
     * @see Collectors.groupingById
     */
    public static Function groupById(final IFunction finisher) {
        return new GroupByIdFinisher(finisher);
    }

    /**
     * @description Returns a `Function` that applies the `finisher` to every map value
     * and returns the grouping by strings final result.
     *
     * @param finisher the function applied to every map value
     *
     * @return the `Function`
     *
     * @see Collectors.groupingByString
     */
    public static Function groupByString(final IFunction finisher) {
        return new GroupByStringFinisher(finisher);
    }

    /**
     * @description Returns a `Function` that applies the `finisher` to every map value
     * and returns the grouping by blobs final result.
     *
     * @param finisher the function applied to every map value
     *
     * @return the `Function`
     *
     * @see Collectors.groupingByBlob
     */
    public static Function groupByBlob(final IFunction finisher) {
        return new GroupByBlobFinisher(finisher);
    }

    /**
     * @description Returns a `Function` that applies the `finisher` to every map value
     * and returns the grouping by dates final result.
     *
     * @param finisher the function applied to every map value
     *
     * @return the `Function`
     *
     * @see Collectors.groupingByDate
     */
    public static Function groupByDate(final IFunction finisher) {
        return new GroupByDateFinisher(finisher);
    }

    /**
     * @description Returns a `Function` that applies the `finisher` to every map value
     * and returns the grouping by datetimes final result.
     *
     * @param finisher the function applied to every map value
     *
     * @return the `Function`
     *
     * @see Collectors.groupingByDatetime
     */
    public static Function groupByDatetime(final IFunction finisher) {
        return new GroupByDatetimeFinisher(finisher);
    }

    /**
     * @description Returns a `Function` that applies the `finisher` to every map value
     * and returns the grouping by times final result.
     *
     * @param finisher the function applied to every map value
     *
     * @return the `Function`
     *
     * @see Collectors.groupingByTime
     */
    public static Function groupByTime(final IFunction finisher) {
        return new GroupByTimeFinisher(finisher);
    }

    /**
     * @description Returns a `Function` that applies the `finisher` to every map value
     * and returns the grouping by integers final result.
     *
     * @param finisher the function applied to every map value
     *
     * @return the `Function`
     *
     * @see Collectors.groupingByInt
     */
    public static Function groupByInt(final IFunction finisher) {
        return new GroupByIntFinisher(finisher);
    }

    /**
     * @description Returns a `Function` that applies the `finisher` to every map value
     * and returns the grouping by longs final result.
     *
     * @param finisher the function applied to every map value
     *
     * @return the `Function`
     *
     * @see Collectors.groupingByLong
     */
    public static Function groupByLong(final IFunction finisher) {
        return new GroupByLongFinisher(finisher);
    }

    /**
     * @description Returns a `Function` that applies the `finisher` to every map value
     * and returns the grouping by Doubles final result.
     *
     * @param finisher the function applied to every map value
     *
     * @return the `Function`
     *
     * @see Collectors.groupingByDouble
     */
    public static Function groupByDouble(final IFunction finisher) {
        return new GroupByDoubleFinisher(finisher);
    }

    /**
     * @description Returns a `Function` that applies the `finisher` to every map value
     * and returns the grouping by objects final result.
     *
     * @param finisher the function applied to every map value
     *
     * @return the `Function`
     *
     * @see Collectors.groupingByObject
     */
    public static Function groupByObject(final IFunction finisher) {
        return new GroupByObjectFinisher(finisher);
    }

    /**
     * @description Returns a `Function` that returns the final result of SObject reducing
     * as `Optional`.
     *
     * @return the `Function`
     *
     * @see Collectors.reducing
     */
    public static Function reducingOptional() {
        return new ReducingOptionalFinisher();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private abstract class GroupFinisher extends Function {
        protected final IFunction finisher;
        protected GroupFinisher(IFunction finisher) { this.finisher = finisher; }
    }

    private class GroupByBoolFinisher extends GroupFinisher {
        private GroupByBoolFinisher(IFunction finisher) { super(finisher); }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Boolean, Object> m = ((Map<Boolean, Object>) o);
            for (Boolean k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByIdFinisher extends GroupFinisher {
        private GroupByIdFinisher(IFunction finisher) { super(finisher); }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Id, Object> m = ((Map<Id, Object>) o);
            for (Id k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByStringFinisher extends GroupFinisher {
        private GroupByStringFinisher(IFunction finisher) { super(finisher); }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<String, Object> m = ((Map<String, Object>) o);
            for (String k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByBlobFinisher extends GroupFinisher {
        private GroupByBlobFinisher(IFunction finisher) { super(finisher); }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Blob, Object> m = ((Map<Blob, Object>) o);
            for (Blob k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByDateFinisher extends GroupFinisher {
        private GroupByDateFinisher(IFunction finisher) { super(finisher); }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Date, Object> m = ((Map<Date, Object>) o);
            for (Date k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByDatetimeFinisher extends GroupFinisher {
        private GroupByDatetimeFinisher(IFunction finisher) { super(finisher); }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Datetime, Object> m = ((Map<Datetime, Object>) o);
            for (Datetime k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByTimeFinisher extends GroupFinisher {
        private GroupByTimeFinisher(IFunction finisher) { super(finisher); }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Time, Object> m = ((Map<Time, Object>) o);
            for (Time k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByIntFinisher extends GroupFinisher {
        private GroupByIntFinisher(IFunction finisher) { super(finisher); }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Integer, Object> m = ((Map<Integer, Object>) o);
            for (Integer k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByLongFinisher extends GroupFinisher {
        private GroupByLongFinisher(IFunction finisher) { super(finisher); }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Long, Object> m = ((Map<Long, Object>) o);
            for (Long k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByDoubleFinisher extends GroupFinisher {
        private GroupByDoubleFinisher(IFunction finisher) { super(finisher); }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Double, Object> m = ((Map<Double, Object>) o);
            for (Double k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByObjectFinisher extends GroupFinisher {
        private GroupByObjectFinisher(IFunction finisher) { super(finisher); }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Object, Object> m = ((Map<Object, Object>) o);
            for (Object k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class AppendFinisher extends Function {
        private final String suffix;
        private AppendFinisher(String suffix) { this.suffix = suffix; }
        public override Object apply(Object o) { return ((List<String>) o)[0] + suffix; }
    }

    private class AveragingIntFinisher extends Function {
        public override Object apply(Object o) {
            final List<Integer> integers = (List<Integer>) o;
            if (integers[0] == 0) { return null; }
            return integers[1] / (Double) integers[0];
        }
    }

    private class SummingFinisher extends Function {
        public override Object apply(Object o) {
            final List<Object> objects = (List<Object>) o;
            if (objects[0] == 0) { return null; }
            return objects[1];
        }
    }

    private class AveragingLongFinisher extends Function {
        public override Object apply(Object o) {
            final List<Long> longs = (List<Long>) o;
            if (longs[0] == 0) { return null; }
            return longs[1] / (Double) longs[0];
        }
    }

    private class ReducingOptionalFinisher extends Function {
        public override Object apply(Object o) {
            return ((List<Object>) o).isEmpty()
                ? Optional.empty()
                : Optional.ofNullable(((List<Object>) o)[0]);
        }
    }
    // @end-group
    //</editor-fold>

}
