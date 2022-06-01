/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class LongForEachIterator implements Iterator<Long> {

    private final Iterator<Long> iterator;
    private final ILongConsumer consumer;

    public LongForEachIterator(final Iterator<Long> iterator, final ILongConsumer consumer) {
        this.iterator = iterator;
        this.consumer = consumer;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public Long next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    private Long computeNext() {
        final Long next = iterator.next();
        consumer.accept(next);
        return next;
    }

}
