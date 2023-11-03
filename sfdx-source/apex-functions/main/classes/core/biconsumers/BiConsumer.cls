/**
 * @description Provides default and static methods of 
 * {@link IBiConsumer} functional interface.
 *
 * @see IBiConsumer
 * @see Collector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class BiConsumer implements IBiConsumer {

    /**
     * @description Downstream collector.
     */
    public ICollector downstream { get; set; }

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Object o1, Object o2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `BiConsumer` that executes `this` operation first,
     * then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `BiConsumer`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual BiConsumer andThen(final IBiConsumer after) {
        return compose(new List<IBiConsumer>{ this, after });
    }

    /**
     * @description Returns a composed `BiConsumer` that executes `before` operation first,
     * then the `this` operation in that order.
     *
     * @param before the operation to perform before this operation
     *
     * @return the composed `BiConsumer`
     *
     * @throws NullPointerException if `before` is null
     */
    public virtual BiConsumer compose(final IBiConsumer before) {
        return compose(new List<IBiConsumer>{ before, this });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `BiConsumer` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param consumers the operations to sequentially perform
     *
     * @return the composed `BiConsumer`
     *
     * @throws NullPointerException if `consumers` is null or some element is null
     */
    public static BiConsumer compose(final List<IBiConsumer> consumers) {
        return new Compose(consumers);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compose extends BiConsumer {
        private final List<IBiConsumer> consumers;
        private Compose(List<IBiConsumer> consumers) {
            Validate.noNullElements(consumers);
            this.consumers = consumers;
        }
        public override void accept(Object o1, Object o2) {
            for (IBiConsumer consumer : consumers) { consumer.accept(o1, o2); }
        }
    }
    // @end-group
    //</editor-fold>

}
