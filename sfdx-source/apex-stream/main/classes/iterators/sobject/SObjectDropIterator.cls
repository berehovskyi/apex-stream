/**
 * @author O. Berehovskyi>
 */
public class SObjectDropIterator extends SObjectBaseIterator {

    private final Iterator<SObject> iterator;
    private final ISObjectPredicate predicate;

    public SObjectDropIterator(final Iterator<SObject> iterator, final ISObjectPredicate predicate) {
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
