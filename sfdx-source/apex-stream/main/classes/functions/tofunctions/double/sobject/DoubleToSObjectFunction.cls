/**
 * @description Inherits {@link IDoubleToSObjectFunction} functional interface and provides
 * common class level implementations, and related utilities.
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
