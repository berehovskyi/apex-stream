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
public virtual inherited sharing class CollectorFunctions extends BaseCollectorFunctions {

    @TestVisible
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

//    /**
//     * @description Returns a `Function` that returns the final result of Double averaging.
//     *
//     * @return the `Function`
//     *
//     * @see Collectors.averagingDouble
//     */
//    public static Function averagingDouble() {
//        return new AveragingDoubleFinisher();
//    }
//
//    /**
//     * @description Returns a `Function` that returns the final result of Double summation.
//     *
//     * @return the `Function`
//     *
//     * @see Collectors.summingDouble
//     */
//    public static Function summingDouble() {
//        return new SummingDoubleFinisher();
//    }

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
     * @see Collectors.groupingBy
     */
    public static Function groupByObject(final IFunction finisher) {
        return new GroupByObjectFinisher(finisher);
    }

    /**
     * @description Returns a `Function` that returns the final result of SObject reducing
     * as `SObjectOptional`.
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
    private class GroupByBoolFinisher extends Function {
        private final IFunction finisher;
        private GroupByBoolFinisher(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Boolean, Object> m = ((Map<Boolean, Object>) o);
            for (Boolean k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByIdFinisher extends Function {
        private final IFunction finisher;
        private GroupByIdFinisher(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Id, Object> m = ((Map<Id, Object>) o);
            for (Id k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByStringFinisher extends Function {
        private final IFunction finisher;
        private GroupByStringFinisher(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<String, Object> m = ((Map<String, Object>) o);
            for (String k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByBlobFinisher extends Function {
        private final IFunction finisher;
        private GroupByBlobFinisher(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Blob, Object> m = ((Map<Blob, Object>) o);
            for (Blob k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByDateFinisher extends Function {
        private final IFunction finisher;
        private GroupByDateFinisher(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Date, Object> m = ((Map<Date, Object>) o);
            for (Date k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByDatetimeFinisher extends Function {
        private final IFunction finisher;
        private GroupByDatetimeFinisher(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Datetime, Object> m = ((Map<Datetime, Object>) o);
            for (Datetime k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByTimeFinisher extends Function {
        private final IFunction finisher;
        private GroupByTimeFinisher(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Time, Object> m = ((Map<Time, Object>) o);
            for (Time k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByIntFinisher extends Function {
        private final IFunction finisher;
        private GroupByIntFinisher(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Integer, Object> m = ((Map<Integer, Object>) o);
            for (Integer k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByLongFinisher extends Function {
        private final IFunction finisher;
        private GroupByLongFinisher(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Long, Object> m = ((Map<Long, Object>) o);
            for (Long k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByDoubleFinisher extends Function {
        private final IFunction finisher;
        private GroupByDoubleFinisher(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Double, Object> m = ((Map<Double, Object>) o);
            for (Double k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    private class GroupByObjectFinisher extends Function {
        private final IFunction finisher;
        private GroupByObjectFinisher(IFunction finisher) { this.finisher = finisher; }
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
//            if (integers[0] == 0) { return 0; }
            if (integers[0] == 0) { return null; }
            return integers[1] / (Double) integers[0];
        }
    }

    private class AveragingLongFinisher extends Function {
        public override Object apply(Object o) {
            final List<Long> longs = (List<Long>) o;
//            if (longs[0] == 0) { return 0; }
            if (longs[0] == 0) { return null; }
            return longs[1] / (Double) longs[0];
        }
    }

//    private class AveragingDoubleFinisher extends Function {
//        public override Object apply(Object o) {
//            final List<Double> doubles = (List<Double>) o;
//            if (doubles[2] == 0) { return 0; }
//            return (doubles[0] + doubles[1]) / doubles[2];
//        }
//    }
//
//    private class SummingDoubleFinisher extends Function {
//        public override Object apply(Object o) {
//            final List<Double> doubles = (List<Double>) o;
//            return doubles[0] + doubles[1];
//        }
//    }

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
