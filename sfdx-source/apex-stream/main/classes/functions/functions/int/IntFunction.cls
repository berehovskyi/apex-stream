/**
 * @description Provides default and static methods of 
 * {@link IIntFunction} functional interface.
 * 
 * @see IIntFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class IntFunction implements IIntFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Object apply(Integer i);
    // @end-group
    //</editor-fold>
    
}
