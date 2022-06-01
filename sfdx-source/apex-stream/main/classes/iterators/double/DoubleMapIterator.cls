/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class DoubleMapIterator implements Iterator<Double> {

    private final Iterator<Double> iterator;
    private final IDoubleUnaryOperator mapper;

    public DoubleMapIterator(final Iterator<Double> iterator, final IDoubleUnaryOperator mapper) {
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
