/**
 * @author O. Berehovskyi>
 */
public class LongToIntMapIterator implements Iterator<Integer> {

    private final Iterator<Long> iterator;
    private final ILongToIntFunction mapper;

    public LongToIntMapIterator(final Iterator<Long> iterator, final ILongToIntFunction mapper) {
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
