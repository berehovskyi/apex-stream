/**
 * @author O. Berehovskyi>
 */
public class DoubleDropIterator extends DoubleBaseIterator {

    private final Iterator<Double> iterator;
    private final IDoublePredicate predicate;

    public DoubleDropIterator(final Iterator<Double> iterator, final IDoublePredicate predicate) {
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
