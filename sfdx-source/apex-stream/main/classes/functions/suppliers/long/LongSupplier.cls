/**
 * @description Provides default and static methods of 
 * {@link ILongSupplier} functional interface.
 *
 * @see ILongSupplier
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class LongSupplier implements ILongSupplier {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long get();
    // @end-group
    //</editor-fold>

}
