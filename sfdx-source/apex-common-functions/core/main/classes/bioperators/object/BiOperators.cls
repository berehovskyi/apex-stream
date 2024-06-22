/**
 * @description Provides base implementations of {@link BiOperator}
 * and related utilities that are used by {@link IEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class BiOperators {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected BiOperators() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `BiOperator` that return a lesser input argument.
     *
     * @return the `BiOperator`
     * 
     * @example
     * BiOperators.min().apply(2, 5); // 2
     */
    public static BiOperator min() {
        return new Min();
    }

    /**
     * @description Returns a `BiOperator` that return a greater input argument.
     *
     * @return the `BiOperator`
     * 
     * @example
     * BiOperators.max().apply(2, 5); // 5
     */
    public static BiOperator max() {
        return new Max();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    private class Min extends BiOperator {
        private final IComparer comp = Comparer.defaultOrder();
        public override Object apply(Object o1, Object o2) { return comp.compare(o1, o2) != 1 ? o1 : o2; }
    }

    private class Max extends BiOperator {
        private final IComparer comp = Comparer.defaultOrder();
        public override Object apply(Object o1, Object o2) { return comp.compare(o1, o2) == 1 ? o1 : o2; }
    }
    //</editor-fold>

}
