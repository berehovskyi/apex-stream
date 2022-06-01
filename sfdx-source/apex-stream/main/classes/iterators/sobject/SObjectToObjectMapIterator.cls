/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class SObjectToObjectMapIterator implements Iterator<Object> {

    private final Iterator<SObject> iterator;
    private final ISObjectFunction mapper;

    public SObjectToObjectMapIterator(final Iterator<SObject> iterator, final ISObjectFunction mapper) {
        this.iterator = iterator;
        this.mapper = mapper;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public Object next() {
        return mapper.apply(iterator.next());
    }

}
