/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class DoubleToSObjectMapIterator implements Iterator<SObject> {

    private final Iterator<Double> iterator;
    private final IDoubleToSObjectFunction mapper;

    public DoubleToSObjectMapIterator(final Iterator<Double> iterator, final IDoubleToSObjectFunction mapper) {
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
