/**
 * @author O. Berehovskyi>
 */
public class LongToDoubleIterator implements Iterator<Double> {

    private final Iterator<Long> iterator;
    private final ILongToDoubleFunction mapper;

    public LongToDoubleIterator(final Iterator<Long> iterator, final ILongToDoubleFunction mapper) {
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
