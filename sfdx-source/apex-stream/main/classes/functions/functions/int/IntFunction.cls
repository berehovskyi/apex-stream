/**
 * @description Inherits {@link IIntFunction} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 *
 * @see IIntIterable.mapToObject
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class IntFunction implements IIntFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(Integer i);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `IntFunction` that returns a string that represents the Integer input argument.
     *
     * @return the `SObjectFunction`
     *
     * @see String.valueOf
     */
    public static IntFunction toString() {
        return new IntToString();
    }

    /**
     * @description Returns a `IntFunction` that returns the Integer input argument as object.
     *
     * @return the `SObjectFunction`
     */
    public static IntFunction toObject() {
        return new IntToObject();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class IntToString extends IntFunction {
        public override Object apply(Integer i) { return String.valueOf(i); }
    }

    private class IntToObject extends IntFunction {
        public override Object apply(Integer i) { return i; }
    }
    // @end-group
    //</editor-fold>

}
