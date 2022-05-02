/**
 * @author O. Berehovskyi>
 */
public class IntDropIterator extends IntBaseIterator {

    private final Iterator<Integer> iterator;
    private final IIntPredicate predicate;

    public IntDropIterator(Iterator<Integer> iterator, IIntPredicate predicate) {
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
