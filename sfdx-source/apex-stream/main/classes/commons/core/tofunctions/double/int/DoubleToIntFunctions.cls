/**
 * @description Provides common implementations of {@link DoubleToIntFunction}
 * and related utilities.
 *
 * @see DoubleToIntFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class DoubleToIntFunctions {

    @TestVisible
    private DoubleToIntFunctions(){}
    
    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `DoubleToIntFunction` that returns the Integer value
     * of the Double input argument by casting it to an Integer.
     *
     * @return the `DoubleToIntFunction`
     *
     * @see Double.intValue
     */
    public static DoubleToIntFunction intValue() {
        return new IntValue();
    }

    /**
     * @description Returns a `DoubleToIntFunction` that returns the closest Integer to the Double
     * input argument. If the result is less than -2,147,483,648 or greater than 2,147,483,647,
     * Apex generates an error.
     *
     * @return the `DoubleToIntFunction`
     *
     * @see Math.round
     */
    public static DoubleToIntFunction round() {
        return new RoundToInt();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class IntValue extends DoubleToIntFunction {
        public override Integer apply(Double x) { return x.intValue(); }
    }

    private class RoundToInt extends DoubleToIntFunction {
        public override Integer apply(Double x) { return Math.round(x); }
    }
    // @end-group
    //</editor-fold>

}
