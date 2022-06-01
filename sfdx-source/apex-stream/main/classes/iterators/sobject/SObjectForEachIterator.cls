/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class SObjectForEachIterator implements Iterator<SObject> {

    private final Iterator<SObject> iterator;
    private final ISObjectConsumer consumer;

    public SObjectForEachIterator(final Iterator<SObject> iterator, final ISObjectConsumer consumer) {
        this.iterator = iterator;
        this.consumer = consumer;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public SObject next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    private SObject computeNext() {
        final SObject next = iterator.next();
        consumer.accept(next);
        return next;
    }

}
