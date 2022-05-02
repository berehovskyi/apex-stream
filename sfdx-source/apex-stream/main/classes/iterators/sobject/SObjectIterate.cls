/**
 * @author O. Berehovskyi>
 */
public class SObjectIterate implements Iterator<SObject> {

    private final ISObjectUnaryOperator operator;
    private SObject next;

    public SObjectIterate(final SObject seed, final ISObjectUnaryOperator operator) {
        this.operator = operator;
        next = seed;
    }

    public Boolean hasNext() {
        return true;
    }

    public SObject next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public SObject computeNext() {
        final SObject prev = next;
        next = operator.apply(next);
        return prev;
    }

}
