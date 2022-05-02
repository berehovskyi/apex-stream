/**
 * @author O. Berehovskyi>
 */
public class ObjectDropIterator extends ObjectBaseIterator {

    private final Iterator<Object> iterator;
    private final IPredicate predicate;

    public ObjectDropIterator(final Iterator<Object> iterator, final IPredicate predicate) {
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
