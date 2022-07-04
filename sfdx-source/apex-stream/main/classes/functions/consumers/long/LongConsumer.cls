/**
 * @description Provides default and static methods of 
 * {@link ILongConsumer} functional interface.
 *
 * @see ILongConsumer
 * @see ILongIterable.forEach
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class LongConsumer implements ILongConsumer {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Long l);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `LongConsumer` that executes `this` operation
     * first, then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `LongConsumer`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual LongConsumer andThen(final ILongConsumer after) {
        return compose(new List<ILongConsumer>{ this, after });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `LongConsumer` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param consumers the operations to sequentially perform
     *
     * @return the composed `LongConsumer`
     *
     * @throws NullPointerException if `consumers` is null or some element is null
     */
    public static LongConsumer compose(final List<ILongConsumer> consumers) {
        Validate.noNullElements(consumers);
        return new Compose(consumers);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compose extends LongConsumer {
        private final List<ILongConsumer> consumers;
        private Compose(List<ILongConsumer> consumers) { this.consumers = consumers; }
        public override void accept(Long l) {
            for (ILongConsumer consumer : consumers) {
                consumer.accept(l);
            }
        }
    }
    // @end-group
    //</editor-fold>

}
