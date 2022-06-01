/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class LongIterate implements Iterator<Long> {

    private final ILongUnaryOperator operator;
    private Long next;

    public LongIterate(final Long seed, final ILongUnaryOperator operator) {
        this.operator = operator;
        next = seed;
    }

    public Boolean hasNext() {
        return true;
    }

    public Long next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Long computeNext() {
        final Long prev = next;
        next = operator.apply(next);
        return prev;
    }

}
