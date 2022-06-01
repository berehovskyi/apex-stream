/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class IntForEachIterator implements Iterator<Integer> {

    private final Iterator<Integer> iterator;
    private final IIntConsumer consumer;

    public IntForEachIterator(final Iterator<Integer> iterator, final IIntConsumer consumer) {
        this.iterator = iterator;
        this.consumer = consumer;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public Integer next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    private Integer computeNext() {
        final Integer next = iterator.next();
        consumer.accept(next);
        return next;
    }

}
