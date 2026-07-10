/**
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public inherited sharing class FilterIterator extends BaseIterator {
    private final Iterator<Object> iterator;
    private final IPredicate predicate;

    public FilterIterator(final Iterator<Object> iterator, final IPredicate predicate) {
        AfSupport.notNull(iterator);
        AfSupport.notNull(predicate);
        this.iterator = iterator;
        this.predicate = predicate;
    }

    protected override void computeNext() {
        while (iterator.hasNext()) {
            next = iterator.next();
            if (predicate.test(next)) {
                hasNext = true;
                return;
            }
        }
        hasNext = false;
    }
}
