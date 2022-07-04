/**
 * @description Provides default, static methods and encapsulates downstream collector of 
 * {@link IObjectSObjectConsumer} functional interface.
 *
 * @see IObjectSObjectConsumer
 * @see SObjectCollectors
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class ObjectSObjectConsumer implements IObjectSObjectConsumer {

    /**
     * @description Downstream collector.
     */
    public ISObjectCollector downstream { get; set; }

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Object container, SObject sObj);
    // @end-group
    //</editor-fold>

}
