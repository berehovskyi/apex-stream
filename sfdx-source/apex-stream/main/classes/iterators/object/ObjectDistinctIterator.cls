/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class ObjectDistinctIterator extends ObjectBaseIterator {

    private final Iterator<Object> iterator;
    private final IFunction classifier;
    private final Set<Object> sObjects = new Set<Object>();

    public ObjectDistinctIterator(final Iterator<Object> iterator) {
        this(iterator, null);
    }

    public ObjectDistinctIterator(final Iterator<Object> iterator, final IFunction classifier) {
        this.iterator = iterator;
        this.classifier = classifier;
    }

    protected override void computeNext() {
        while (hasNext = iterator.hasNext()) {
            next = iterator.next();
            final Object result = classifier == null ? next : classifier.apply(next);
            if (sObjects.add(result)) { return; }
        }
    }

}
