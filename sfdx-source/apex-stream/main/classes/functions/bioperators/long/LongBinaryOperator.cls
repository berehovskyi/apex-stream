/**
 * @description Provides default and static methods of 
 * {@link ILongBinaryOperator} functional interface.
 *
 * @see ILongBinaryOperator
 * @see LongStream.zip
 * @see LongSequence.zip
 * @see ILongIterable.reduce
 * @see Collector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class LongBinaryOperator implements ILongBinaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long apply(Long l1, Long l2);
    // @end-group
    //</editor-fold>

}
