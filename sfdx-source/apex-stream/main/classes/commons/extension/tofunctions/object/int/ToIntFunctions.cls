/**
 * @description Provides common implementations of {@link ToIntFunction}
 * and related utilities.
 *
 * @see ToIntFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class ToIntFunctions {

    @TestVisible
    private ToIntFunctions() {}

    //<editor-fold desc="Object To Int Functions">
    // @start-group Object To Int Functions
    /**
     * @description Returns a `ToIntFunction` that returns the Integer value
     * of the Object input argument by casting it to an Integer.
     *
     * @return the `ToIntFunction`
     */
    public static ToIntFunction asInt() {
        return new AsInt();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the Integer value
     * of the Object input argument.
     *
     * @return the `ToIntFunction`
     *
     * @see Integer.valueOf
     */
    public static ToIntFunction valueOf() {
        return new IntValueOf();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class IntValueOf extends ToIntFunction {
        public override Integer apply(Object o) { return Integer.valueOf(o); }
    }

    private class AsInt extends ToIntFunction {
        public override Integer apply(Object o) { return (Integer) o; }
    }
    // @end-group
    //</editor-fold>

}
