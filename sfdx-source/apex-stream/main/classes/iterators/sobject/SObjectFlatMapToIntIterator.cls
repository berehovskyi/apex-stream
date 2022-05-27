/**
 * @author O. Berehovskyi
 */
public class SObjectFlatMapToIntIterator extends IntBaseIterator {

    private final Iterator<SObject> iterator;
    private final ISObjectFunction mapper;
    private Iterator<Integer> innerIterator;

    public SObjectFlatMapToIntIterator(final Iterator<SObject> iterator, final ISObjectFunction mapper) {
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
                final Iterable<Integer> result = (Iterable<Integer>) mapper.apply(sObj);
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
