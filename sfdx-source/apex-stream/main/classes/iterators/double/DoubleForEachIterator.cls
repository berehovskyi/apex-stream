/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class DoubleForEachIterator implements Iterator<Double> {

    private final Iterator<Double> iterator;
    private final IDoubleConsumer consumer;

    public DoubleForEachIterator(final Iterator<Double> iterator, final IDoubleConsumer consumer) {
        this.iterator = iterator;
        this.consumer = consumer;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public Double next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    private Double computeNext() {
        final Double next = iterator.next();
        consumer.accept(next);
        return next;
    }

}
