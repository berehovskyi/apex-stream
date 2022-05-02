/**
 * @author O. Berehovskyi>
 */
public class LongToSObjectMapIterator implements Iterator<SObject> {

    private final Iterator<Long> iterator;
    private final ILongToSObjectFunction mapper;

    public LongToSObjectMapIterator(final Iterator<Long> iterator, final ILongToSObjectFunction mapper) {
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
