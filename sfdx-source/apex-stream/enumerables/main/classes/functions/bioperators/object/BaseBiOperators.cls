/**
 * @description
 * @author Oleh Berehovskyi
 */
public inherited sharing class BaseBiOperators {
    
    @TestVisible
    private BaseBiOperators() {}

    /**
     * @description Returns a `BiOperator` that return a lesser Integer input argument.
     *
     * @return the `BiOperator`
     */
    public static BiOperator min() {
        return new Min();
    }

    /**
     * @description Returns a `BiOperator` that return a greater Integer input argument.
     *
     * @return the `BiOperator`
     */
    public static BiOperator max() {
        return new Max();
    }

    private class Min extends BiOperator {
        public override Object apply(Object o1, Object o2) {
            return Comparer.compareObjects(o1, o2) != 1 ? o1 : o2;
        }
    }

    private class Max extends BiOperator {
        public override Object apply(Object o1, Object o2) {
            return Comparer.compareObjects(o1, o2) == 1 ? o1 : o2;
        }
    }

}