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
public inherited sharing class CollectorFunctions {

    @TestVisible
    private CollectorFunctions(){}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Function` that returns the final result of object reducing
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
    private class ReducingOptionalFinisher extends Function {
        public override Object apply(Object o) {
            return ((List<Object>) o).isEmpty() ? Optional.empty() : Optional.ofNullable(((List<Object>) o)[0]);
        }
    }
    // @end-group
    //</editor-fold>

}
