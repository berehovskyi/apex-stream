/**
 * @description Inherits {@link IObjectLongConsumer} functional interface and provides
 * common class level implementations, and related utilities.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class ObjectLongConsumer implements IObjectLongConsumer {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Object o, Long l);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `ObjectLongConsumer` of the `IBiConsumer`.
     *
     * @param consumer the binary consumer
     *
     * @return the composed `ObjectLongConsumer`
     *
     * @throws NullPointerException if `consumer` is null
     */
    public static ObjectLongConsumer of(final IBiConsumer consumer) {
        Validate.notNull(consumer);
        return new OfBiConsumer(consumer);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class OfBiConsumer extends ObjectLongConsumer {
        private final IBiConsumer consumer;
        private OfBiConsumer(IBiConsumer consumer) { this.consumer = consumer; }
        public override void accept(Object container, Long l) {
            consumer.accept(container, l);
        }
    }
    // @end-group
    //</editor-fold>

}
