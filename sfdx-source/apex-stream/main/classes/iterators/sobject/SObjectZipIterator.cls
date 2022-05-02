/**
 * @author O. Berehovskyi>
 */
public class SObjectZipIterator implements Iterator<SObject> {

    private final Iterator<SObject> iterator1;
    private final Iterator<SObject> iterator2;
    private final ISObjectBinaryOperator combiner;

    public SObjectZipIterator(final Iterator<SObject> iterator1, final Iterator<SObject> iterator2, final ISObjectBinaryOperator combiner) {
        this.iterator1 = iterator1;
        this.iterator2 = iterator2;
        this.combiner = combiner;
    }

    public SObject next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Boolean hasNext() {
        return iterator1.hasNext() && iterator2.hasNext();
    }

    private SObject computeNext() {
        return combiner.apply(iterator1.next(), iterator2.next());
    }

}
