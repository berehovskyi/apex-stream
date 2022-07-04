/**
 * @description Provides default and static methods of 
 * {@link ISObjectConsumer} functional interface.
 *
 * @see ISObjectConsumer
 * @see ISObjectIterable.forEach
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectConsumer implements ISObjectConsumer {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(SObject sObj);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `SObjectConsumer` that executes `this` operation
     * first, then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `SObjectConsumer`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual SObjectConsumer andThen(final ISObjectConsumer after) {
        return compose(new List<ISObjectConsumer>{ this, after });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `SObjectConsumer` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param consumers the operations to sequentially perform
     *
     * @return the composed `SObjectConsumer`
     *
     * @throws NullPointerException if `consumers` is null or some element is null
     */
    public static SObjectConsumer compose(final List<ISObjectConsumer> consumers) {
        Validate.noNullElements(consumers);
        return new Compose(consumers);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compose extends SObjectConsumer {
        private final List<ISObjectConsumer> consumers;
        private Compose(List<ISObjectConsumer> consumers) { this.consumers = consumers; }
        public override void accept(SObject sObj) {
            for (ISObjectConsumer consumer : consumers) {
                consumer.accept(sObj);
            }
        }
    }
    // @end-group
    //</editor-fold>

}
