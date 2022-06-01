/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class LongDropIterator extends LongBaseIterator {

    private final Iterator<Long> iterator;
    private final ILongPredicate predicate;

    public LongDropIterator(final Iterator<Long> iterator, final ILongPredicate predicate) {
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
