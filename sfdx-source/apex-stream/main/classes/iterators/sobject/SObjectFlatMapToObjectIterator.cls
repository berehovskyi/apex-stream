/**
 * @author O. Berehovskyi
 */
public class SObjectFlatMapToObjectIterator extends ObjectBaseIterator {

    private final Iterator<SObject> iterator;
    private final ISObjectFunction mapper;
    private Iterator<Object> innerIterator;

    public SObjectFlatMapToObjectIterator(final Iterator<SObject> iterator, final ISObjectFunction mapper) {
        this.iterator = iterator;
        this.mapper = mapper;
    }

    protected override void computeNext() {
        if (!hasInnerNext()) {
            next = innerIterator.next();
            hasNext = true;
            return;
        }
        while (iterator.hasNext()) {
            if (hasInnerNext()) {
                final SObject sObj = iterator.next();
                final Iterable<Object> result = (Iterable<Object>) mapper.apply(sObj);
                if (result != null) { innerIterator = result.iterator(); }
            }
            if (!hasInnerNext()) {
                next = innerIterator.next();
                hasNext = true;
                return;
            }
        }
        hasNext = false;
    }
    
    private Boolean hasInnerNext() {
        return innerIterator == null || !innerIterator.hasNext();
    }
    
}
