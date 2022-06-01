/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class ObjectForEachIterator implements Iterator<Object> {

    private final Iterator<Object> iterator;
    private final IConsumer consumer;

    public ObjectForEachIterator(final Iterator<Object> iterator, final IConsumer consumer) {
        this.iterator = iterator;
        this.consumer = consumer;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public Object next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    private Object computeNext() {
        final Object next = iterator.next();
        consumer.accept(next);
        return next;
    }

}
