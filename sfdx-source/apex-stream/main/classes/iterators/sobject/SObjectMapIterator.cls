/**
 * @author O. Berehovskyi>
 */
public class SObjectMapIterator implements Iterator<SObject> {

    private final Iterator<SObject> iterator;
    private final ISObjectUnaryOperator mapper;

    public SObjectMapIterator(final Iterator<SObject> iterator, final ISObjectUnaryOperator mapper) {
        this.iterator = iterator;
        this.mapper = mapper;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public SObject next() {
        return mapper.apply(iterator.next());
    }

}
