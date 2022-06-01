/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class ObjectToLongMapIterator implements Iterator<Long> {

    private final Iterator<Object> iterator;
    private final IToLongFunction mapper;

    public ObjectToLongMapIterator(final Iterator<Object> iterator, final IToLongFunction mapper) {
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
