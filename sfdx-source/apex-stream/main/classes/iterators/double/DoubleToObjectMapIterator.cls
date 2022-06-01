/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class DoubleToObjectMapIterator implements Iterator<Object> {

    private final Iterator<Double> iterator;
    private final IDoubleFunction mapper;

    public DoubleToObjectMapIterator(final Iterator<Double> iterator, final IDoubleFunction mapper) {
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
