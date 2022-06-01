/**
 * @description Inherits {@link IObjectDoubleConsumer} functional interface and provides
 * common class level implementations, and related utilities.
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
    public static ObjectDoubleConsumer of(final IBiConsumer consumer) {
        return new OfBiConsumer(consumer);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class OfBiConsumer extends ObjectDoubleConsumer {
        private final IBiConsumer consumer;
        private OfBiConsumer(IBiConsumer consumer) { this.consumer = consumer; }
        public override void accept(Object container, Double d) { consumer.accept(container, d); }
    }
    // @end-group
    //</editor-fold>

}
