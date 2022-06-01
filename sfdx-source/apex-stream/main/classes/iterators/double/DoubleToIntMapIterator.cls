/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class DoubleToIntMapIterator implements Iterator<Integer> {

    private final Iterator<Double> iterator;
    private final IDoubleToIntFunction mapper;

    public DoubleToIntMapIterator(final Iterator<Double> iterator, final IDoubleToIntFunction mapper) {
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
