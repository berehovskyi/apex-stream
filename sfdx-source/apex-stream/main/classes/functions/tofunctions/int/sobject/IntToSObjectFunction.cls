/**
 * @description Inherits {@link IIntToSObjectFunction} functional interface and provides
 * common class level implementations, and related utilities.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class IntToSObjectFunction implements IIntToSObjectFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract SObject apply(Integer i);
    // @end-group
    //</editor-fold>

}
