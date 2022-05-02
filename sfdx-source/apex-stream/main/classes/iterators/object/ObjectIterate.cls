/**
 * @author O. Berehovskyi>
 */
public class ObjectIterate implements Iterator<Object> {

    private final IUnaryOperator operator;
    private Object next;

    public ObjectIterate(final Object seed, final IUnaryOperator operator) {
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
