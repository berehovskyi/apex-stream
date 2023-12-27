/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class ForEachIterator implements Iterator<Object> {

    private final Iterator<Object> iterator;
    private final IConsumer consumer;

    public ForEachIterator(final Iterator<Object> iterator, final IConsumer consumer) {
        Validate.notNull(iterator);
        Validate.notNull(consumer);
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
