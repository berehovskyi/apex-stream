/**
 * @author O. Berehovskyi>
 */
public class SObjectToLongMapIterator implements Iterator<Long> {

    private final Iterator<SObject> iterator;
    private final ISObjectToLongFunction mapper;

    public SObjectToLongMapIterator(final Iterator<SObject> iterator, final ISObjectToLongFunction mapper) {
        this.iterator = iterator;
        this.mapper = mapper;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public Long next() {
        return mapper.apply(iterator.next());
    }

}
