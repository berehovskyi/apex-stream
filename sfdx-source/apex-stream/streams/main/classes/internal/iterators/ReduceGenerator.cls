/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class ReduceGenerator implements Iterator<Object> {

    private final IOperator operator;
    private Object next;

    public ReduceGenerator(final Object seed, final IOperator operator) {
        Validate.notNull(operator);
        this.operator = operator;
        next = seed;
    }

    public Boolean hasNext() {
        return true;
    }

    public Object next() {
        if (!hasNext()) { throw new NoSuchElementException(); }
        return computeNext();
    }

    public Object computeNext() {
        final Object prev = next;
        next = operator.apply(next);
        return prev;
    }

}
