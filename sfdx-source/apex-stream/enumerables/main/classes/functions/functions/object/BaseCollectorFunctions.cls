/**
 * @description Provides base implementations of {@link Function}
 * and related utilities that are used by {@link IEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class BaseCollectorFunctions {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected BaseCollectorFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Function` that returns the final result of Double averaging.
     *
     * @return the `Function`
     *
     * @see BaseCollectors.averagingDouble
     */
    public static Function averagingDouble() {
        return new AveragingDoubleFinisher();
    }

    /**
     * @description Returns a `Function` that returns the final result of Double summing.
     *
     * @return the `Function`
     *
     * @see BaseCollectors.averagingDouble
     */
    public static Function summingDouble() {
        return new SummingDoubleFinisher();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    private class AveragingDoubleFinisher extends Function {
        public override Object apply(Object o) {
            final List<Double> doubles = (List<Double>) o;
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
    //</editor-fold>

}
