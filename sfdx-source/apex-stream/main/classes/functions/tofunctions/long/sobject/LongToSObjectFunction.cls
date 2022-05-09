/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link ILongToSObjectFunction} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class LongToSObjectFunction implements ILongToSObjectFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract SObject apply(Long l);
    // @end-group
    //</editor-fold>

}
