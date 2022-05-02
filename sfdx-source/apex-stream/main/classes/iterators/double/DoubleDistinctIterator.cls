/**
 * @author O. Berehovskyi>
 */
public class DoubleDistinctIterator extends DoubleBaseIterator {

    private final Iterator<Double> iterator;
    private final IDoubleUnaryOperator classifier;
    private final Set<Double> doubles = new Set<Double>();

    public DoubleDistinctIterator(final Iterator<Double> iterator) {
        this(iterator, null);
    }

    public DoubleDistinctIterator(final Iterator<Double> iterator, final IDoubleUnaryOperator classifier) {
        this.iterator = iterator;
        this.classifier = classifier;
    }

    protected override void computeNext() {
        while (hasNext = iterator.hasNext()) {
            next = iterator.next();
            final Double result = classifier == null ? next : classifier.apply(next);
            if (doubles.add(result)) { return; }
        }
    }

}
