/**
 * @description Provides default and static methods of 
 * {@link ISObjectBiConsumer} functional interface.
 *
 * @see ISObjectBiConsumer
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectBiConsumer implements ISObjectBiConsumer {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract void accept(SObject sObj1, SObject sObj2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `SObjectBiConsumer` that executes `this` operation
     * first, then the `after` operation in that order.
     *
     * @param after the operation to perform after this operation
     *
     * @return the composed `SObjectBiConsumer`
     *
     * @throws NullPointerException if `after` is null
     */
    public virtual SObjectBiConsumer andThen(final ISObjectBiConsumer after) {
        return compose(new List<ISObjectBiConsumer>{ this, after });
    }

    /**
     * @description Returns a composed `SObjectBiConsumer` that executes `before` operation
     * first, then the `this` operation in that order.
     *
     * @param before the operation to perform before this operation
     *
     * @return the composed `SObjectBiConsumer`
     *
     * @throws NullPointerException if `before` is null
     */
    public virtual SObjectBiConsumer compose(final ISObjectBiConsumer before) {
        return compose(new List<ISObjectBiConsumer>{ before, this });
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `SObjectBiConsumer` that sequentially executes the operations
     * in the same order as the order of the consumers input list.
     *
     * @param consumers the operations to sequentially perform
     *
     * @return the composed `SObjectBiConsumer`
     *
     * @throws NullPointerException if `consumers` is null or some element is null
     */
    public static SObjectBiConsumer compose(final List<ISObjectBiConsumer> consumers) {
        Validate.noNullElements(consumers);
        return new Compose(consumers);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Compose extends SObjectBiConsumer {
        private final List<ISObjectBiConsumer> consumers;
        private Compose(List<ISObjectBiConsumer> consumers) { this.consumers = consumers; }
        public override void accept(SObject sObj1, SObject sObj2) {
            for (ISObjectBiConsumer consumer : consumers) {
                consumer.accept(sObj1, sObj2);
            }
        }
    }
    // @end-group
    //</editor-fold>

}
