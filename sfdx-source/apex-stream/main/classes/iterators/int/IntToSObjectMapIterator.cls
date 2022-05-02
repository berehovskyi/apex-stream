/**
 * @author O. Berehovskyi>
 */
public class IntToSObjectMapIterator implements Iterator<SObject> {

    private final Iterator<Integer> iterator;
    private final IIntToSObjectFunction mapper;

    public IntToSObjectMapIterator(final Iterator<Integer> iterator, final IIntToSObjectFunction mapper) {
        this.iterator = iterator;
        this.mapper = mapper;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public SObject next() {
        return mapper.apply(iterator.next());
    }

}
