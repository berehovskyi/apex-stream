/**
 * @description Inherits {@link ILongConsumer} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 *
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

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `LongConsumer` that debugs an input argument.
     *
     * @param loggingLevel the logging level
     * @param message the message
     *
     * @return the `LongConsumer`
     *
     * @throws NullPointerException if `loggingLevel` or `message` is null
     */
    public static LongConsumer debug(final LoggingLevel loggingLevel, final String message) {
        Validate.notNull(loggingLevel);
        Validate.notNull(message);
        return new Debug(loggingLevel, message);
    }

    /**
     * @description Returns a `LongConsumer` that debugs an input argument.
     *
     * @return the `LongConsumer`
     */
    public static LongConsumer debug() {
        return debug(LoggingLevel.INFO, '');
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

    private class Debug extends LongConsumer {
        private final String message;
        private final LoggingLevel level;
        private Debug(LoggingLevel level, String message){ this.level = level; this.message = message; }
        public override void accept(Long l) { System.debug(level, message + l); }

    }
    // @end-group
    //</editor-fold>

}
