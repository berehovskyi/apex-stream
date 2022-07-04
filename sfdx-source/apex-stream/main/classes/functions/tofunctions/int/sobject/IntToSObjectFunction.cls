/**
 * @description Provides default and static methods of 
 * {@link IIntToSObjectFunction} functional interface.
 *
 * @see IIntToSObjectFunction
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
