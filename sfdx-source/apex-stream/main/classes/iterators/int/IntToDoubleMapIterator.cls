/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class IntToDoubleMapIterator implements Iterator<Double> {

    private final Iterator<Integer> iterator;
    private final IIntToDoubleFunction mapper;

    public IntToDoubleMapIterator(final Iterator<Integer> iterator, final IIntToDoubleFunction mapper) {
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
