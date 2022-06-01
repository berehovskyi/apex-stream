/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class ObjectFlatMapIterator extends ObjectBaseIterator {

    private final Iterator<Object> iterator;
    private final IFunction mapper;
    private Iterator<Object> innerIterator;

    public ObjectFlatMapIterator(final Iterator<Object> iterator, final IFunction mapper) {
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
                final Iterable<Object> result = (Iterable<Object>) mapper.apply(o);
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
