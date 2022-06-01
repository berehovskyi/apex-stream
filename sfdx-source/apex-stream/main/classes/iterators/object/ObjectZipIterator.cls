/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class ObjectZipIterator implements Iterator<Object> {

    private final Iterator<Object> iterator1;
    private final Iterator<Object> iterator2;
    private final IBinaryOperator combiner;

    public ObjectZipIterator(final Iterator<Object> iterator1, final Iterator<Object> iterator2, final IBinaryOperator combiner) {
        this.iterator1 = iterator1;
        this.iterator2 = iterator2;
        this.combiner = combiner;
    }

    public Object next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Boolean hasNext() {
        return iterator1.hasNext() && iterator2.hasNext();
    }

    private Object computeNext() {
        return combiner.apply(iterator1.next(), iterator2.next());
    }

}
