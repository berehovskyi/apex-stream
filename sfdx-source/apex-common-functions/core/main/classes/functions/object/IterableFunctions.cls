/**
 * @description Provides common implementations of {@link Function}
 * and related utilities that are used by {@link Collectors}.
 *
 * @see Function
 * @see Collectors
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class IterableFunctions {
    @TestVisible
    protected IterableFunctions() {
    }

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
        return new GetElement(index);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class GetElement extends Function {
        private final Integer index;
        private GetElement(Integer index) {
            AfSupport.notNull(index);
            this.index = index;
        }
        public override Object apply(Object o) {
            Iterator<Object> iterator = ((Iterable<Object>) o)?.iterator();
            AfSupport.notNull(iterator);
            Integer i = 0;
            while (iterator.hasNext()) {
                Object current = iterator.next();
                // prettier-ignore
                if (i == index) { return current; }
                i++;
            }
            throw new NoSuchElementException(
                String.format(Label.AF_ErrorMessage_IndexOutOfBounds, new List<Integer>{ index })
            );
        }
    }
    // @end-group
    //</editor-fold>
}
