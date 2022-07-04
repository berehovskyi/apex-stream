/**
 * @description Provides default and static methods of 
 * {@link IDoubleToLongFunction} functional interface.
 *
 * @see IDoubleToLongFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class DoubleToLongFunction implements IDoubleToLongFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long apply(Double d);
    // @end-group
    //</editor-fold>

}
