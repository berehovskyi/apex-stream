/**
 * @author O. Berehovskyi>
 */
public class IntMapIterator implements Iterator<Integer> {

    private final Iterator<Integer> iterator;
    private final IIntUnaryOperator mapper;

    public IntMapIterator(final Iterator<Integer> iterator, final IIntUnaryOperator mapper) {
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
