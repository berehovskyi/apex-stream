/**
 * @description Provides common implementations of {@link IntToDoubleFunction}
 * and related utilities.
 *
 * @see IntToDoubleFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class IntToDoubleFunctions {

    @TestVisible
    private IntToDoubleFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `IIntToDoubleFunction` that returns the Double value
     * of the Integer input argument.
     *
     * @return the `IIntToDoubleFunction`
     *
     * @see Double.valueOf
     */
    public static IntToDoubleFunction valueOf() {
        return new IntToDouble();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class IntToDouble extends IntToDoubleFunction {
        public override Double apply(Integer i) { return Double.valueOf(i); }
    }
    // @end-group
    //</editor-fold>

}
