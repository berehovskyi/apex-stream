/**
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public inherited sharing class ForEachIterator implements Iterator<Object> {
    private final Iterator<Object> iterator;
    private final IConsumer consumer;

    public ForEachIterator(final Iterator<Object> iterator, final IConsumer consumer) {
        AfSupport.notNull(iterator);
        AfSupport.notNull(consumer);
        this.iterator = iterator;
        this.consumer = consumer;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public Object next() {
        // prettier-ignore
        if (!hasNext()) { throw new NoSuchElementException(); }
        final Object next = iterator.next();
        consumer.accept(next);
        return next;
    }
}
