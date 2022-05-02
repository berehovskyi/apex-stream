/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link IIntToLongFunction} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class IntToLongFunction implements IIntToLongFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long apply(Integer i);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `IIntToLongFunction` that returns the Long value
     * of the Integer input argument by casting it to an Long.
     * @return the `IIntToLongFunction`
     */
    public static IntToLongFunction asLong() {
        return new IntToLong();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class IntToLong extends IntToLongFunction {
        public override Long apply(Integer i) { return (Long) i; }
    }
    // @end-group
    //</editor-fold>

}
