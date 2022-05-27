/**
 * @author O. Berehovskyi
 */
public class ObjectFlatMapToSObjectIterator extends SObjectBaseIterator {

    private final Iterator<Object> iterator;
    private final IFunction mapper;
    private Iterator<SObject> innerIterator;

    public ObjectFlatMapToSObjectIterator(final Iterator<Object> iterator, final IFunction mapper) {
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
                final Object o = iterator.next();
                final Iterable<SObject> result = (Iterable<SObject>) mapper.apply(o);
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
