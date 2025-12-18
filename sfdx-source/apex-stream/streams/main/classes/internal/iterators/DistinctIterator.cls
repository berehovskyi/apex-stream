/**
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public inherited sharing class DistinctIterator extends BaseIterator {
    private final Iterator<Object> iterator;
    private final IFunction classifier;
    private final Set<Object> results = new Set<Object>();

    public DistinctIterator(final Iterator<Object> iterator) {
        Validate.notNull(iterator);
        this.iterator = iterator;
    }

    public DistinctIterator(final Iterator<Object> iterator, final IFunction classifier) {
        Validate.notNull(iterator);
        Validate.notNull(classifier);
        this.iterator = iterator;
        this.classifier = classifier;
    }

    protected override void computeNext() {
        while (hasNext = iterator.hasNext()) {
            next = iterator.next();
            final Object result = classifier == null ? next : classifier.apply(next);
            // prettier-ignore
            if (results.add(result)) { return; }
        }
    }
}
