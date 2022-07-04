/**
 * @description Provides default and static methods of 
 * {@link IDoubleFunction} functional interface.
 * 
 * @see IDoubleFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class DoubleFunction implements IDoubleFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(Double d);
    // @end-group
    //</editor-fold>

}
