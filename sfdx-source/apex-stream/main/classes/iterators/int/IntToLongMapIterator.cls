/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class IntToLongMapIterator implements Iterator<Long> {

    private final Iterator<Integer> iterator;
    private final IIntToLongFunction mapper;

    public IntToLongMapIterator(final Iterator<Integer> iterator, final IIntToLongFunction mapper) {
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
