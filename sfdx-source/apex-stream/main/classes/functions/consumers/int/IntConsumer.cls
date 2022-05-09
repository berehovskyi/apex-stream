/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IIntConsumer} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see IIntIterable.forEach
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
     * @param after the operation to perform after this operation
     * @return the composed `IntConsumer`
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
     * @param consumers the operations to sequentially perform
     * @return the composed `IntConsumer`
     * @throws NullPointerException if `consumers` is null or some element is null
     */
    public static IntConsumer compose(final List<IIntConsumer> consumers) {
        Validate.noNullElements(consumers);
        return new Compose(consumers);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `IntConsumer` that debugs an input argument.
     * @param loggingLevel the logging level
     * @param message the message
     * @return the `IntConsumer`
     * @throws NullPointerException if `loggingLevel` or `message` is null
     */
    public static IntConsumer debug(final LoggingLevel loggingLevel, final String message) {
        Validate.notNull(loggingLevel);
        Validate.notNull(message);
        return new Debug(loggingLevel, message);
    }

    /**
     * @description Returns a `IntConsumer` that debugs an input argument.
     * @param loggingLevel the logging level
     * @return the `IntConsumer`
     * @throws NullPointerException if `loggingLevel` is null
     */
    public static IntConsumer debug(final LoggingLevel loggingLevel) {
        return debug(loggingLevel, '');
    }

    /**
     * @description Returns a `IntConsumer` that debugs an input argument.
     * @param message the message
     * @return the `IntConsumer`
     * @throws NullPointerException if `message` is null
     */
    public static IntConsumer debug(final String message) {
        return debug(LoggingLevel.INFO, message);
    }

    /**
     * @description Returns a `IntConsumer` that debugs an input argument.
     * @return the `IntConsumer`
     */
    public static IntConsumer debug() {
        return debug(LoggingLevel.INFO, '');
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

    private class Debug extends IntConsumer {
        private final String message;
        private final LoggingLevel level;
        private Debug(LoggingLevel level, String message){ this.level = level; this.message = message; }
        public override void accept(Integer i) { System.debug(level, message + i); }

    }
    // @end-group
    //</editor-fold>

}
