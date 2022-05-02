/**
 * @author O. Berehovskyi>
 */
public class ObjectToIntMapIterator implements Iterator<Integer> {

    private final Iterator<Object> iterator;
    private final IToIntFunction mapper;

    public ObjectToIntMapIterator(final Iterator<Object> iterator, final IToIntFunction mapper) {
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
