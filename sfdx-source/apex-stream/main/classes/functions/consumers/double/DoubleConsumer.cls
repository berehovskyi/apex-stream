/**
 * @description Provides default and static methods of 
 * {@link IDoubleConsumer} functional interface.
 *
 * @see IDoubleConsumer
 * @see IDoubleIterable.forEach
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class DoubleConsumer implements IDoubleConsumer {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Double d);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `DoubleConsumer` that executes `this` operation
     * first, then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `DoubleConsumer`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual DoubleConsumer andThen(final IDoubleConsumer after) {
        return compose(new List<IDoubleConsumer>{ this, after });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `DoubleConsumer` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param consumers the operations to sequentially perform
     *
     * @return the composed `DoubleConsumer`
     *
     * @throws NullPointerException if `consumers` is null or some element is null
     */
    public static DoubleConsumer compose(final List<IDoubleConsumer> consumers) {
        Validate.noNullElements(consumers);
        return new Compose(consumers);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compose extends DoubleConsumer {
        private final List<IDoubleConsumer> consumers;
        private Compose(List<IDoubleConsumer> consumers) { this.consumers = consumers; }
        public override void accept(Double d) {
            for (IDoubleConsumer consumer : consumers) {
                consumer.accept(d);
            }
        }
    }
    // @end-group
    //</editor-fold>

}
