/**
 * @description Provides default and static methods of 
 * {@link IIntToLongFunction} functional interface.
 *
 * @see IIntToLongFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class IntToLongFunction implements IIntToLongFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long apply(Integer i);
    // @end-group
    //</editor-fold>

}
