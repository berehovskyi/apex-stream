/**
 * @description Provides default and static methods of 
 * {@link ILongToDoubleFunction} functional interface.
 *
 * @see ILongToDoubleFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class LongToDoubleFunction implements ILongToDoubleFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double apply(Long l);
    // @end-group
    //</editor-fold>

}
