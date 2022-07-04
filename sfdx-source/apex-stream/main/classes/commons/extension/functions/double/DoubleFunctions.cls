/**
 * @description Provides common implementations of {@link DoubleFunction}
 * and related utilities.
 *
 * @see DoubleFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class DoubleFunctions {

    @TestVisible
    private DoubleFunctions(){}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `DoubleFunction` that returns a string that represents
     * the Double input argument using the locale of the context user.
     *
     * @return the `SObjectFunction`
     *
     * @see Double.format
     */
    public static DoubleFunction format() {
        return new Format();
    }

    /**
     * @description Returns a `DoubleFunction` that returns a string that represents
     * the Double input argument.
     *
     * @return the `SObjectFunction`
     *
     * @see String.valueOf
     */
    public static DoubleFunction toString() {
        return new ToString();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Format extends DoubleFunction {
        public override Object apply(Double x) { return x.format(); }
    }

    private class ToString extends DoubleFunction {
        public override Object apply(Double x) { return String.valueOf(x); }
    }
    // @end-group
    //</editor-fold>

}
