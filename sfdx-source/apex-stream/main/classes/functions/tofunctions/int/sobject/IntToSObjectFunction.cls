/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link IIntToSObjectFunction} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class IntToSObjectFunction implements IIntToSObjectFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract SObject apply(Integer i);
    // @end-group
    //</editor-fold>

}
