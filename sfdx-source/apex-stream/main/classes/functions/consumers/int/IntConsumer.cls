/**
 * @description Provides default and static methods of 
 * {@link IIntConsumer} functional interface.
 *
 * @see IIntConsumer
 * @see IIntIterable.forEach
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class IntConsumer implements IIntConsumer {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Integer i);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `IntConsumer` that executes `this` operation
     * first, then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `IntConsumer`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual IntConsumer andThen(final IIntConsumer after) {
        return compose(new List<IIntConsumer>{ this, after });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `IntConsumer` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param consumers the operations to sequentially perform
     *
     * @return the composed `IntConsumer`
     *
     * @throws NullPointerException if `consumers` is null or some element is null
     */
    public static IntConsumer compose(final List<IIntConsumer> consumers) {
        Validate.noNullElements(consumers);
        return new Compose(consumers);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compose extends IntConsumer {
        private final List<IIntConsumer> consumers;
        private Compose(List<IIntConsumer> consumers) { this.consumers = consumers; }
        public override void accept(Integer i) {
            for (IIntConsumer consumer : consumers) {
                consumer.accept(i);
            }
        }
    }
    // @end-group
    //</editor-fold>

}
