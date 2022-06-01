/**
 * @description Inherits {@link ILongToSObjectFunction} functional interface and provides
 * common class level implementations, and related utilities.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class LongToSObjectFunction implements ILongToSObjectFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract SObject apply(Long l);
    // @end-group
    //</editor-fold>

}
