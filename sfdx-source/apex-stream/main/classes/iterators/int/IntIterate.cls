/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class IntIterate implements Iterator<Integer> {

    private final IIntUnaryOperator operator;
    private Integer next;

    public IntIterate(final Integer seed, final IIntUnaryOperator operator) {
        this.operator = operator;
        next = seed;
    }

    public Boolean hasNext() {
        return true;
    }

    public Integer next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Integer computeNext() {
        final Integer prev = next;
        next = operator.apply(next);
        return prev;
    }

}
