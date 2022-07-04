/**
 * @description Provides default and static methods of 
 * {@link IIntBinaryOperator} functional interface.
 *
 * @see IIntBinaryOperator
 * @see IntStream.zip
 * @see IntSequence.zip
 * @see IIntIterable.reduce
 * @see Collector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class IntBinaryOperator implements IIntBinaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer apply(Integer i1, Integer i2);
    // @end-group
    //</editor-fold>

}
