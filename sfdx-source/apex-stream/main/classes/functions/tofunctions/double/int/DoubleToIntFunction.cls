/**
 * @description Provides default and static methods of 
 * {@link IDoubleToIntFunction} functional interface.
 *
 * @see IDoubleToIntFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class DoubleToIntFunction implements IDoubleToIntFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer apply(Double d);
    // @end-group
    //</editor-fold>

}
