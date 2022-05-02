/**
 * @author O. Berehovskyi>
 */
public class IntZipIterator implements Iterator<Integer> {

    private final Iterator<Integer> iterator1;
    private final Iterator<Integer> iterator2;
    private final IIntBinaryOperator combiner;

    public IntZipIterator(final Iterator<Integer> iterator1, final Iterator<Integer> iterator2, final IIntBinaryOperator combiner) {
        this.iterator1 = iterator1;
        this.iterator2 = iterator2;
        this.combiner = combiner;
    }

    public Integer next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Boolean hasNext() {
        return iterator1.hasNext() && iterator2.hasNext();
    }

    private Integer computeNext() {
        return combiner.apply(iterator1.next(), iterator2.next());
    }

}
