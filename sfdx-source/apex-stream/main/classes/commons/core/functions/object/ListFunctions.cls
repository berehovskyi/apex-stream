/**
 * @description Provides common implementations of {@link Function}
 * and related utilities that are used by {@link SObjectCollectors}.
 * 
 * @see Function
 * @see SObjectCollectors
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class ListFunctions {

    @TestVisible
    private ListFunctions() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Function` that returns the list element stored at the specified index.
     *
     * @param index the index
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `index` is null
     *
     * @see List.get
     */
    public static Function get(final Integer index) {
        Validate.notNull(index);
        return new GetFromList(index);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class GetFromList extends Function {
        private final Integer index;
        private GetFromList(Integer index) { this.index = index; }
        public override Object apply(Object o) { return ((List<Object>) o)[index]; }
    }
    // @end-group
    //</editor-fold>

}
