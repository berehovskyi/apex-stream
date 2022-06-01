/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class IntDistinctIterator extends IntBaseIterator {

    private final Iterator<Integer> iterator;
    private final IIntUnaryOperator classifier;
    private final Set<Integer> integers = new Set<Integer>();

    public IntDistinctIterator(final Iterator<Integer> iterator) {
        this(iterator, null);
    }

    public IntDistinctIterator(final Iterator<Integer> iterator, final IIntUnaryOperator classifier) {
        this.iterator = iterator;
        this.classifier = classifier;
    }

    protected override void computeNext() {
        while (hasNext = iterator.hasNext()) {
            next = iterator.next();
            final Integer result = classifier == null ? next : classifier.apply(next);
            if (integers.add(result)) { return; }
        }
    }

}
