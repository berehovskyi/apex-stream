/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link IObjectIntConsumer} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class ObjectIntConsumer implements IObjectIntConsumer {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Object o, Integer l);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `ObjectIntConsumer` of the `IBiConsumer`.
     * @param consumer the binary consumer
     * @return the composed `ObjectIntConsumer`
     * @throws NullPointerException if `consumer` is null
     */
    public static ObjectIntConsumer of(final IBiConsumer consumer) {
        return new OfBiConsumer(consumer);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class OfBiConsumer extends ObjectIntConsumer {
        private final IBiConsumer consumer;
        private OfBiConsumer(IBiConsumer consumer) { this.consumer = consumer; }
        public override void accept(Object container, Integer i) {
            consumer.accept(container, i);
        }
    }
    // @end-group
    //</editor-fold>

}
