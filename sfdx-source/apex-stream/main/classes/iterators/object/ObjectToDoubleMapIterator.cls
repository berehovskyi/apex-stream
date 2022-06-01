/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class ObjectToDoubleMapIterator implements Iterator<Double> {

    private final Iterator<Object> iterator;
    private final IToDoubleFunction mapper;

    public ObjectToDoubleMapIterator(final Iterator<Object> iterator, final IToDoubleFunction mapper) {
        this.iterator = iterator;
        this.mapper = mapper;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public Double next() {
        return mapper.apply(iterator.next());
    }

}
