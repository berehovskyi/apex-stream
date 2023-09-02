/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class MapIterator implements Iterator<Object> {

    private final Iterator<Object> iterator;
    private final IFunction mapper;

    public MapIterator(final Iterator<Object> iterator, final IFunction mapper) {
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
