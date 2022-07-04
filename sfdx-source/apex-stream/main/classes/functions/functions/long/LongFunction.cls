/**
 * @description Provides default and static methods of 
 * {@link ILongFunction} functional interface.
 * 
 * @see ILongFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class LongFunction implements ILongFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(Long l);
    // @end-group
    //</editor-fold>

}
