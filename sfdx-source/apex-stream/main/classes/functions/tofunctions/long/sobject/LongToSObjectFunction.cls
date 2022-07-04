/**
 * @description Provides default and static methods of 
 * {@link ILongToSObjectFunction} functional interface.
 *
 * @see ILongToSObjectFunction
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
