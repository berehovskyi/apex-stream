/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Extends `Function` functions and provides `ListFunction`
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class ListFunction extends Function {

    //<editor-fold desc="List Functions">
    // @start-group List Functions
    /**
     * @description Returns a `Function` that returns the list element stored at the specified index.
     * @param index the index
     * @return the `Function`
     * @throws NullPointerException if `index` is null
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
