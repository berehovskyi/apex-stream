/**
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public inherited sharing class TakeIterator extends BaseIterator {
    private final Iterator<Object> iterator;
    private final IPredicate predicate;

    public TakeIterator(final Iterator<Object> iterator, final IPredicate predicate) {
        Validate.notNull(iterator);
        Validate.notNull(predicate);
        this.iterator = iterator;
        this.predicate = predicate;
    }

    protected override void computeNext() {
        hasNext = iterator.hasNext();
        if (hasNext) {
            next = iterator.next();
            hasNext = predicate.test(next);
        }
    }
}
