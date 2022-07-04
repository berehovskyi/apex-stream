/**
 * @description Provides default and static methods of 
 * {@link IDoubleToSObjectFunction} functional interface.
 *
 * @see IDoubleToSObjectFunction
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class DoubleToSObjectFunction implements IDoubleToSObjectFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract SObject apply(Double d);
    // @end-group
    //</editor-fold>

}
