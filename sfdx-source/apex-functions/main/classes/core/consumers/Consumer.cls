/**
 * @description Provides default and static methods of 
 * {@link IConsumer} functional interface.
 *
 * @see IConsumer
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class Consumer implements IConsumer {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `Consumer` that executes `this` operation
     * first, then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `Consumer`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual Consumer andThen(final IConsumer after) {
        return compose(new List<IConsumer>{ this, after });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `Consumer` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param consumers the operations to sequentially perform
     *
     * @return the composed `Consumer`
     *
     * @throws NullPointerException if `consumers` is null or some element is null
     */
    public static Consumer compose(final List<IConsumer> consumers) {
        Validate.noNullElements(consumers);
        return new Compose(consumers);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compose extends Consumer {
        private final List<IConsumer> consumers;
        private Compose(List<IConsumer> consumers) { this.consumers = consumers; }
        public override void accept(Object o) {
            for (IConsumer consumer : consumers) { consumer.accept(o); }
        }
    }
    // @end-group
    //</editor-fold>

}
