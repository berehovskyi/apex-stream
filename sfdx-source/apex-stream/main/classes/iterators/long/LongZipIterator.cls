/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class LongZipIterator implements Iterator<Long> {

    private final Iterator<Long> iterator1;
    private final Iterator<Long> iterator2;
    private final ILongBinaryOperator combiner;

    public LongZipIterator(final Iterator<Long> iterator1, final Iterator<Long> iterator2, final ILongBinaryOperator combiner) {
        this.iterator1 = iterator1;
        this.iterator2 = iterator2;
        this.combiner = combiner;
    }

    public Long next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Boolean hasNext() {
        return iterator1.hasNext() && iterator2.hasNext();
    }

    private Long computeNext() {
        return combiner.apply(iterator1.next(), iterator2.next());
    }

}
