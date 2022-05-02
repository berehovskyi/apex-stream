/**
 * @author O. Berehovskyi>
 */
public class DoubleTakeIterator implements Iterator<Double> {

    private final Iterator<Double> iterator;
    private final IDoublePredicate predicate;
    private Boolean hasNext = false, hasNextEvaluated = false, hasNextPresent = false;
    private Double next;

    public DoubleTakeIterator(final Iterator<Double> iterator, final IDoublePredicate predicate) {
        this.iterator = iterator;
        this.predicate = predicate;
    }

    public Boolean hasNext() {
        if (hasNextEvaluated) return hasNext;
        hasNext = iterator.hasNext();
        hasNextEvaluated = true;
        if (hasNext) hasNextPresent = testNext();
        return hasNext;
    }

    public Double next() {
        if (hasNextEvaluated && !hasNext) {
            next = null;
            throw new NoSuchElementException();
        }
        hasNextEvaluated = false;
        if (hasNextPresent) {
            hasNextPresent = false;
            return next;
        }
        if (testNext()) {
            return next;
        } else {
            next = null;
            hasNextPresent = true;
            throw new NoSuchElementException();
        }
    }

    private Boolean testNext() {
        next = iterator.next();
        hasNext = predicate.test(next);
        return hasNext;
    }

}
