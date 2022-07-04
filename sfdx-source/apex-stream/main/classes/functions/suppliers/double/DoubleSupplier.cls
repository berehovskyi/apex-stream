/**
 * @description Provides default and static methods of 
 * {@link IDoubleSupplier} functional interface.
 *
 * @see IDoubleSupplier
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class DoubleSupplier implements IDoubleSupplier {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double get();
    // @end-group
    //</editor-fold>

}
