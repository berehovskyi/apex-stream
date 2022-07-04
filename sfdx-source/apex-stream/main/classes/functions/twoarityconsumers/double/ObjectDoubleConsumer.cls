/**
 * @description Provides default and static methods of 
 * {@link IObjectDoubleConsumer} functional interface.
 *
 * @see IObjectDoubleConsumer
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class ObjectDoubleConsumer implements IObjectDoubleConsumer {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Object o, Double d);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `ObjectDoubleConsumer` of the `IBiConsumer`.
     *
     * @param consumer the binary consumer
     *
     * @return the composed `ObjectDoubleConsumer`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public static ObjectDoubleConsumer compose(final IBiConsumer consumer) {
        Validate.notNull(consumer);
        return new ForBiConsumer(consumer);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ForBiConsumer extends ObjectDoubleConsumer {
        private final IBiConsumer consumer;
        private ForBiConsumer(IBiConsumer consumer) { this.consumer = consumer; }
        public override void accept(Object container, Double d) { consumer.accept(container, d); }
    }
    // @end-group
    //</editor-fold>

}
