/**
 * @description Provides common implementations of {@link ToSObjectFunction}
 * and related utilities.
 *
 * @see ToSObjectFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class ToSObjectFunctions {

    @TestVisible
    private ToSObjectFunctions(){}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `ToSObjectFunction` that returns the SObject value
     * of the Object input argument by casting it to an SObject.
     *
     * @return the `ToLongFunction`
     */
    public static ToSObjectFunction asSObject() {
        return new ToSObject();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ToSObject extends ToSObjectFunction {
        public override SObject apply(Object o) { return (SObject) o; }
    }
    // @end-group
    //</editor-fold>

}
