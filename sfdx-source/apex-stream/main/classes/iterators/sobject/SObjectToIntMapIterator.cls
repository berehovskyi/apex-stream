/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class SObjectToIntMapIterator implements Iterator<Integer> {

    private final Iterator<SObject> iterator;
    private final ISObjectToIntFunction mapper;

    public SObjectToIntMapIterator(final Iterator<SObject> iterator, final ISObjectToIntFunction mapper) {
        this.iterator = iterator;
        this.mapper = mapper;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public Integer next() {
        return mapper.apply(iterator.next());
    }

}
