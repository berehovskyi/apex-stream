/**
 * @author O. Berehovskyi>
 */
public class SObjectDistinctIterator extends SObjectBaseIterator {

    private final Iterator<SObject> iterator;
    private final ISObjectFunction classifier;
    private final Set<Object> results = new Set<Object>();

    public SObjectDistinctIterator(final Iterator<SObject> iterator) {
        this(iterator, null);
    }

    public SObjectDistinctIterator(final Iterator<SObject> iterator, final ISObjectFunction classifier) {
        this.iterator = iterator;
        this.classifier = classifier;
    }

    protected override void computeNext() {
        while (hasNext = iterator.hasNext()) {
            next = iterator.next();
            final Object result = classifier == null ? next : classifier.apply(next);
            if (results.add(result)) { return; }
        }
    }

}
