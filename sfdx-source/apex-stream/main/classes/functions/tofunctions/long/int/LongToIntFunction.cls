/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link ILongToIntFunction} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class LongToIntFunction implements ILongToIntFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer apply(Long l);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `ILongToIntFunction` that returns the Integer value
     * of the Long input argument.
     * @return the `ILongToIntFunction`
     * @see Integer.valueOf
     */
    public static LongToIntFunction valueOf() {
        return new LongToInt();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class LongToInt extends LongToIntFunction {
        public override Integer apply(Long l) { return Integer.valueOf(l); }
    }
    // @end-group
    //</editor-fold>

}
