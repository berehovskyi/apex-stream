/**
 * @author O. Berehovskyi>
 */
public class DoubleToLongMapIterator implements Iterator<Long> {

    private final Iterator<Double> iterator;
    private final IDoubleToLongFunction mapper;

    public DoubleToLongMapIterator(final Iterator<Double> iterator, final IDoubleToLongFunction mapper) {
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
