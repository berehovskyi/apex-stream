/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class LongDistinctIterator extends LongBaseIterator {

    private final Iterator<Long> iterator;
    private final ILongUnaryOperator classifier;
    private final Set<Long> longs = new Set<Long>();

    public LongDistinctIterator(final Iterator<Long> iterator) {
        this(iterator, null);
    }

    public LongDistinctIterator(final Iterator<Long> iterator, final ILongUnaryOperator classifier) {
        this.iterator = iterator;
        this.classifier = classifier;
    }

    protected override void computeNext() {
        while (hasNext = iterator.hasNext()) {
            next = iterator.next();
            final Long result = classifier == null ? next : classifier.apply(next);
            if (longs.add(result)) { return; }
        }
    }

}
