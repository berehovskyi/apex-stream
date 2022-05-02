/**
 * @author O. Berehovskyi>
 */
public class LongMapIterator implements Iterator<Long> {

    private final Iterator<Long> iterator;
    private final ILongUnaryOperator mapper;

    public LongMapIterator(final Iterator<Long> iterator, final ILongUnaryOperator mapper) {
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
