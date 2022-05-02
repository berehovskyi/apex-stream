/**
 * @author O. Berehovskyi>
 */
public class SObjectZipBiPredicateIterator implements Iterator<SObject> {

    private final Iterator<SObject> iterator1;
    private final Iterator<SObject> iterator2;
    private final ISObjectBiPredicate predicate;
    private final ISObjectBinaryOperator combiner;
    private Boolean hasNext = false, hasNextEvaluated = false;
    private SObject next1;
    private SObject next2;

    public SObjectZipBiPredicateIterator(
            final Iterator<SObject> iterator1,
            final Iterator<SObject> iterator2,
            final ISObjectBiPredicate predicate,
            final ISObjectBinaryOperator combiner
    ) {
        this.iterator1 = iterator1;
        this.iterator2 = iterator2;
        this.predicate = predicate;
        this.combiner = combiner;
    }

    public Boolean hasNext() {
        if (!hasNextEvaluated) {
            computeNext();
            hasNextEvaluated = true;
        }
        return hasNext;
    }

    public SObject next() {
        if (!hasNextEvaluated) { hasNext = hasNext(); }
        if (!hasNext) { throw new NoSuchElementException(); }
        hasNextEvaluated = false;
        return combiner.apply(next1, next2);
    }

    private void computeNext() {
        while (iterator1.hasNext() && iterator2.hasNext()) {
            next1 = iterator1.next();
            next2 = iterator2.next();
            if (predicate.test(next1, next2)) {
                hasNext = true;
                return;
            }
        }
        hasNext = false;
    }

}
