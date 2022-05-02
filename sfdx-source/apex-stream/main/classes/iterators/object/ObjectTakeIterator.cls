/**
 * @author O. Berehovskyi>
 */
public class ObjectTakeIterator implements Iterator<Object> {

    private final Iterator<Object> iterator;
    private final IPredicate predicate;
    private Boolean hasNext = false, hasNextEvaluated = false, hasNextPresent = false;
    private Object next;

    public ObjectTakeIterator(final Iterator<Object> iterator, final IPredicate predicate) {
        this.iterator = iterator;
        this.predicate = predicate;
    }

    public Boolean hasNext() {
        if (hasNextEvaluated) { return hasNext; }
        hasNext = iterator.hasNext();
        hasNextEvaluated = true;
        if (hasNext) { hasNextPresent = testNext(); }
        return hasNext;
    }

    public Object next() {
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
