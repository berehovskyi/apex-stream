/**
 * @description Provides default and static methods of 
 * {@link IIntToDoubleFunction} functional interface.
 *
 * @see IIntToDoubleFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class IntToDoubleFunction implements IIntToDoubleFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double apply(Integer i);
    // @end-group
    //</editor-fold>

}
