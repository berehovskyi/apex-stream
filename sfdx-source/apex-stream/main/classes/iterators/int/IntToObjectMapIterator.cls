/**
 * @author O. Berehovskyi>
 */
public class IntToObjectMapIterator implements Iterator<Object> {

    private final Iterator<Integer> iterator;
    private final IIntFunction mapper;

    public IntToObjectMapIterator(final Iterator<Integer> iterator, final IIntFunction mapper) {
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
