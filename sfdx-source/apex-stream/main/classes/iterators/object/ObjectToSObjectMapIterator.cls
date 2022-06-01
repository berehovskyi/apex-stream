/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class ObjectToSObjectMapIterator implements Iterator<SObject> {

    private final Iterator<Object> iterator;
    private final IToSObjectFunction mapper;

    public ObjectToSObjectMapIterator(final Iterator<Object> iterator, final IToSObjectFunction mapper) {
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
