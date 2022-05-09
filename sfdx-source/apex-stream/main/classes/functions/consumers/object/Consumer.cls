/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IConsumer} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see IObjectIterable.forEach
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
     * @param after the operation to perform after this operation
     * @return the composed `Consumer`
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
     * @param consumers the operations to sequentially perform
     * @return the composed `Consumer`
     * @throws NullPointerException if `consumers` is null or some element is null
     */
    public static Consumer compose(final List<IConsumer> consumers) {
        Validate.noNullElements(consumers);
        return new Compose(consumers);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Consumer` that debugs an input argument.
     * @param loggingLevel the logging level
     * @param message the message
     * @return the `Consumer`
     * @throws NullPointerException if `loggingLevel` or `message` is null
     */
    public static Consumer debug(final LoggingLevel loggingLevel, final String message) {
        Validate.notNull(loggingLevel);
        Validate.notNull(message);
        return new Debug(loggingLevel, message);
    }

    /**
     * @description Returns a `Consumer` that debugs an input argument.
     * @param loggingLevel the logging level
     * @return the `Consumer`
     * @throws NullPointerException if `loggingLevel` is null
     */
    public static Consumer debug(final LoggingLevel loggingLevel) {
        return debug(loggingLevel, '');
    }

    /**
     * @description Returns a `Consumer` that debugs an input argument.
     * @param message the message
     * @return the `Consumer`
     * @throws NullPointerException if `message` is null
     */
    public static Consumer debug(final String message) {
        return debug(LoggingLevel.INFO, message);
    }

    /**
     * @description Returns a `Consumer` that debugs an input argument.
     * @return the `Consumer`
     */
    public static Consumer debug() {
        return debug(LoggingLevel.INFO, '');
    }

    /**
     * @description Returns a `Consumer` that debugs an input argument
     * using the pretty-print format.
     * @param loggingLevel the logging level
     * @param message the message
     * @return the `Consumer`
     * @throws NullPointerException if `loggingLevel` or `message` is null
     */
    public static Consumer debugPretty(final LoggingLevel loggingLevel, final String message) {
        Validate.notNull(loggingLevel);
        Validate.notNull(message);
        return new DebugPretty(loggingLevel, message);
    }

    /**
     * @description Returns a `Consumer` that debugs an input argument
     * using the pretty-print format.
     * @param loggingLevel the logging level
     * @return the `Consumer`
     * @throws NullPointerException if `loggingLevel` is null
     */
    public static Consumer debugPretty(final LoggingLevel loggingLevel) {
        return debugPretty(loggingLevel, '');
    }

    /**
     * @description Returns a `Consumer` that debugs an input argument
     * using the pretty-print format.
     * @param message the message
     * @return the `Consumer`
     * @throws NullPointerException if `message` is null
     */
    public static Consumer debugPretty(final String message) {
        return debugPretty(LoggingLevel.INFO, message);
    }

    /**
     * @description Returns a `Consumer` that debugs an input argument
     * using the pretty-print format.
     * @return the `Consumer`
     */
    public static Consumer debugPretty() {
        return debugPretty(LoggingLevel.INFO, '');
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compose extends Consumer {
        private final List<IConsumer> consumers;
        private Compose(List<IConsumer> consumers) { this.consumers = consumers; }
        public override void accept(Object o) {
            for (IConsumer consumer : consumers) {
                consumer.accept(o);
            }
        }
    }

    private class Debug extends Consumer {
        private final String message;
        private final LoggingLevel level;
        private Debug(LoggingLevel level, String message){ this.level = level; this.message = message; }
        public override void accept(Object o) { System.debug(level, message + o); }
    }

    private class DebugPretty extends Consumer {
        private final String message;
        private final LoggingLevel level;
        private DebugPretty(LoggingLevel level, String message){ this.level = level; this.message = message; }
        public override void accept(Object o) { System.debug(level, message + JSON.serializePretty(o)); }
    }
    // @end-group
    //</editor-fold>

}
