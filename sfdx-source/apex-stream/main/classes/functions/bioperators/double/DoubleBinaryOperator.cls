/**
 * @description Provides default and static methods of 
 * {@link IDoubleBinaryOperator} functional interface.
 *
 * @see IDoubleBinaryOperator
 * @see DoubleStream.zip
 * @see DoubleSequence.zip
 * @see IDoubleIterable.reduce
 * @see Collector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class DoubleBinaryOperator implements IDoubleBinaryOperator {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double apply(Double d1, Double d2);
    // @end-group
    //</editor-fold>

}
