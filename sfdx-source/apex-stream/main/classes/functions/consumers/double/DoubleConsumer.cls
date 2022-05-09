/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IDoubleConsumer} functional interface and provides default methods,
 * common class level implementations, and related utilities.
 * @see IDoubleIterable.forEach
 */
public abstract inherited sharing class DoubleConsumer implements IDoubleConsumer {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(Double d);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
    * @description Returns a composed `DoubleConsumer` that executes `this` operation
    * first, then the `after` operation in that order.
    * @param after the operation to perform after this operation
    * @return the composed `DoubleConsumer`
    * @throws NullPointerException if `after` is null
    */
    public virtual DoubleConsumer andThen(final IDoubleConsumer after) {
        return compose(new List<IDoubleConsumer>{ this, after });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `DoubleConsumer` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     * @param consumers the operations to sequentially perform
     * @return the composed `DoubleConsumer`
     * @throws NullPointerException if `consumers` is null or some element is null
     */
    public static DoubleConsumer compose(final List<IDoubleConsumer> consumers) {
        Validate.noNullElements(consumers);
        return new Compose(consumers);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `DoubleConsumer` that debugs an input argument.
     * @param loggingLevel the logging level
     * @param message the message
     * @return the `DoubleConsumer`
     * @throws NullPointerException if `loggingLevel` or `message` is null
     */
    public static DoubleConsumer debug(final LoggingLevel loggingLevel, final String message) {
        Validate.notNull(loggingLevel);
        Validate.notNull(message);
        return new Debug(loggingLevel, message);
    }

    /**
     * @description Returns a `DoubleConsumer` that debugs an input argument.
     * @param loggingLevel the logging level
     * @return the `DoubleConsumer`
     * @throws NullPointerException if `loggingLevel` is null
     */
    public static DoubleConsumer debug(final LoggingLevel loggingLevel) {
        return debug(loggingLevel, '');
    }

    /**
     * @description Returns a `DoubleConsumer` that debugs an input argument.
     * @param message the message
     * @return the `DoubleConsumer`
     * @throws NullPointerException if `message` is null
     */
    public static DoubleConsumer debug(final String message) {
        return debug(LoggingLevel.INFO, message);
    }

    /**
     * @description Returns a `DoubleConsumer` that debugs an input argument.
     * @return the `DoubleConsumer`
     */
    public static DoubleConsumer debug() {
        return debug(LoggingLevel.INFO, '');
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compose extends DoubleConsumer {
        private final List<IDoubleConsumer> consumers;
        private Compose(List<IDoubleConsumer> consumers) { this.consumers = consumers; }
        public override void accept(Double d) {
            for (IDoubleConsumer consumer : consumers) {
                consumer.accept(d);
            }
        }
    }

    private class Debug extends DoubleConsumer {
        private final String message;
        private final LoggingLevel level;
        private Debug(LoggingLevel level, String message){
            this.level = level;
            this.message = message;
        }
        public override void accept(Double d) { System.debug(level, message + d); }

    }
    // @end-group
    //</editor-fold>

}
