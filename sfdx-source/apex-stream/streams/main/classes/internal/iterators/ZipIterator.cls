/**
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public inherited sharing class ZipIterator extends BaseIterator {
    private final Iterator<Object> iterator1;
    private final Iterator<Object> iterator2;
    private final IBiPredicate predicate;
    private final IBiOperator combiner;

    public ZipIterator(final Iterable<Object> iterable1, final Iterable<Object> iterable2, final IBiOperator combiner) {
        Validate.notNull(iterable1);
        Validate.notNull(iterable2);
        Validate.notNull(combiner);
        this.iterator1 = iterable1.iterator();
        this.iterator2 = iterable2.iterator();
        this.combiner = combiner;
    }

    public ZipIterator(
        final Iterable<Object> iterable1,
        final Iterable<Object> iterable2,
        final IBiPredicate predicate,
        final IBiOperator combiner
    ) {
        Validate.notNull(iterable1);
        Validate.notNull(iterable2);
        Validate.notNull(predicate);
        Validate.notNull(combiner);
        this.iterator1 = iterable1.iterator();
        this.iterator2 = iterable2.iterator();
        this.predicate = predicate;
        this.combiner = combiner;
    }

    protected override void computeNext() {
        while (iterator1.hasNext() && iterator2.hasNext()) {
            final Object next1 = iterator1.next();
            final Object next2 = iterator2.next();
            if (predicate == null || predicate.test(next1, next2)) {
                next = combiner.apply(next1, next2);
                hasNext = true;
                return;
            }
        }
        hasNext = false;
    }
}
