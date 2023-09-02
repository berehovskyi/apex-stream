/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class ZipIterator implements Iterator<Object> {

    private final Iterator<Object> iterator1;
    private final Iterator<Object> iterator2;
    private final IBiPredicate predicate;
    private final IBiOperator combiner;
    private final Boolean take;
    private Boolean hasNext = false, hasNextEvaluated = false;
    private Object next1;
    private Object next2;

    public ZipIterator(
        final Iterator<Object> iterator1,
        final Iterator<Object> iterator2,
        final IBiPredicate predicate,
        final IBiOperator combiner
    ) {
        this.iterator1 = iterator1;
        this.iterator2 = iterator2;
        this.predicate = predicate;
        this.combiner = combiner;
        this.take = predicate == null;
    }

    public Boolean hasNext() {
        if (!hasNextEvaluated) {
            computeNext();
            hasNextEvaluated = true;
        }
        return hasNext;
    }

    public Object next() {
        if (!hasNextEvaluated) { hasNext = hasNext(); }
        if (!hasNext) { throw new NoSuchElementException(); }
        hasNextEvaluated = false;
        return combiner.apply(next1, next2);
    }

    private void computeNext() {
        while (iterator1.hasNext() && iterator2.hasNext()) {
            next1 = iterator1.next();
            next2 = iterator2.next();
            if (take || predicate.test(next1, next2)) {
                hasNext = true;
                return;
            }
        }
        hasNext = false;
    }

}
