/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class SObjectFlatMapIterator extends SObjectBaseIterator {

    private final Iterator<SObject> iterator;
    private final ISObjectFunction mapper;
    private Iterator<SObject> innerIterator;

    public SObjectFlatMapIterator(final Iterator<SObject> iterator, final ISObjectFunction mapper) {
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
                final Iterable<SObject> result = (Iterable<SObject>) mapper.apply(sObj);
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
