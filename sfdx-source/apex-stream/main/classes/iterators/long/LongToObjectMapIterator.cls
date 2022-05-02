/**
 * @author O. Berehovskyi>
 */
public class LongToObjectMapIterator implements Iterator<Object> {

    private final Iterator<Long> iterator;
    private final ILongFunction mapper;

    public LongToObjectMapIterator(final Iterator<Long> iterator, final ILongFunction mapper) {
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
