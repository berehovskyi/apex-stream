/**
 * @description
 * @author Oleh Berehovskyi
 */
public inherited sharing class BaseFunctions {

    /**
     * @description Returns a `Function` that returns the final result of Double averaging.
     *
     * @return the `Function`
     *
     * @see SObjectCollectors.averagingDouble
     */
    public static Function averagingDouble() {
        return new AveragingDoubleFinisher();
    }

    public static Function summingDouble() {
        return new SummingDoubleFinisher();
    }

    private class AveragingDoubleFinisher extends Function {
        public override Object apply(Object o) {
            final List<Double> doubles = (List<Double>) o;
//            if (doubles[2] == 0) { return 0; }
            if (doubles[2] == 0) { return null; }
            return (doubles[0] + doubles[1]) / doubles[2];
        }
    }

    private class SummingDoubleFinisher extends Function {
        public override Object apply(Object o) {
            final List<Double> doubles = (List<Double>) o;
            if (doubles[2] == 0) { return null; }
            return doubles[0] + doubles[1];
        }
    }

}
