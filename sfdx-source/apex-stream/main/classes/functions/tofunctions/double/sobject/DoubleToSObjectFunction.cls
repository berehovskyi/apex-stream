/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IDoubleToSObjectFunction} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class DoubleToSObjectFunction implements IDoubleToSObjectFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract SObject apply(Double d);
    // @end-group
    //</editor-fold>

}
