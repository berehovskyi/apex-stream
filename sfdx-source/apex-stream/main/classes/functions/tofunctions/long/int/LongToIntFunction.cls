/**
 * @description Provides default and static methods of 
 * {@link ILongToIntFunction} functional interface.
 *
 * @see ILongToIntFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class LongToIntFunction implements ILongToIntFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer apply(Long l);
    // @end-group
    //</editor-fold>

}
