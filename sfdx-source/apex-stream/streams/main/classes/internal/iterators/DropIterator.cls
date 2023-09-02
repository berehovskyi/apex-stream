/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class DropIterator extends BaseIterator {

    private final Iterator<Object> iterator;
    private final IPredicate predicate;

    public DropIterator(final Iterator<Object> iterator, final IPredicate predicate) {
        this.iterator = iterator;
        this.predicate = predicate;
    }

    protected override void computeNext() {
        if (!isInit) {
            while (hasNext = iterator.hasNext()) {
                next = iterator.next();
                if (!predicate.test(next)) { return; }
            }
        }
        hasNext = hasNext && iterator.hasNext();
        if (!hasNext) { return; }
        next = iterator.next();
    }

}
