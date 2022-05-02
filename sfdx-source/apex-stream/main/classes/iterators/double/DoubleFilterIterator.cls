/**
 * @author O. Berehovskyi>
 */
public virtual class DoubleFilterIterator implements Iterator<Double> {

    protected final Iterator<Double> iterator;
    private final IDoublePredicate predicate;
    protected Boolean hasNext = false, hasNextEvaluated = false;
    protected Double next;

    public DoubleFilterIterator(final Iterator<Double> iterator, final IDoublePredicate predicate) {
        this.iterator = iterator;
        this.predicate = predicate;
    }

    public Boolean hasNext() {
        if (!hasNextEvaluated) {
            computeNext();
            hasNextEvaluated = true;
        }
        return hasNext;
    }

    public Double next() {
        if (!hasNextEvaluated) { hasNext = hasNext(); }
        if (!hasNext) { throw new NoSuchElementException(); }
        hasNextEvaluated = false;
        return next;
    }

    protected virtual void computeNext() {
        while (iterator.hasNext()) {
            next = iterator.next();
            if (predicate.test(next)) {
                hasNext = true;
                return;
            }
        }
        hasNext = false;
    }

}
