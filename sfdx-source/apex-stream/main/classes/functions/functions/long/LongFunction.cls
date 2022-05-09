/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link ILongFunction} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see ILongIterable.mapToObject
 */
public abstract inherited sharing class LongFunction implements ILongFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(Long l);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `LongFunction` that returns a string that represents the Long input argument.
     * @return the `SObjectFunction`
     * @see String.valueOf
     */
    public static LongFunction toString() {
        return new LongToString();
    }

    /**
     * @description Returns a `LongFunction` that returns the Long input argument as object.
     * @return the `SObjectFunction`
     */
    public static LongFunction toObject() {
        return new LongToObject();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class LongToString extends LongFunction {
        public override Object apply(Long l) { return String.valueOf(l); }
    }

    private class LongToObject extends LongFunction {
        public override Object apply(Long l) { return l; }
    }
    // @end-group
    //</editor-fold>

}
