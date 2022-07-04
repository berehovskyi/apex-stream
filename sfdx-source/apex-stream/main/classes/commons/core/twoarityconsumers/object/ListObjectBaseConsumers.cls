/**
 * @description Provides common implementations of `List<T> - Object` {@link BiConsumer}
 * and related utilities.
 *
 * @see BiConsumer
 * @see Collector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class ListObjectBaseConsumers {

    @TestVisible
    private ListObjectBaseConsumers(){}

    //<editor-fold desc="Built-Ins">
    // @start-group Add To List<Object>
    /**
     * @description Returns a `BiConsumer` that casts the first input argument to `List<Object>`
     * and adds the second input argument to this `List`.
     *
     * @return the `BiConsumer`
     *
     * @throws NullPointerException if the first input argument is null
     *
     * @see ObjectIterable.toList
     */
    public static BiConsumer addToList() {
        return new AddToList();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AddToList extends BiConsumer {
        public override void accept(Object container, Object o) { ((List<Object>) container).add(o); }
    }
    // @end-group
    //</editor-fold>

}
