/**
 * @description Provides common implementations of {@link ToDoubleFunction}
 * and related utilities.
 *
 * @see ToDoubleFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class ToDoubleFunctions {

    @TestVisible
    private ToDoubleFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `ToDoubleFunction` that returns the Double value
     * of the Object input argument by casting it to an Double.
     *
     * @return the `ToDoubleFunction`
     */
    public static ToDoubleFunction asDouble() {
        return new AsDouble();
    }

    /**
     * @description Returns a `ToDoubleFunction` that returns the Double value
     * of the Object input argument.
     *
     * @return the `ToDoubleFunction`
     *
     * @see Double.valueOf
     */
    public static ToDoubleFunction valueOf() {
        return new DoubleValueOf();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class DoubleValueOf extends ToDoubleFunction {
        public override Double apply(Object o) { return Double.valueOf(o); }
    }

    private class AsDouble extends ToDoubleFunction {
        public override Double apply(Object o) { return (Double) o; }
    }
    // @end-group
    //</editor-fold>

}
