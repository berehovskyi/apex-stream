/**
 * @author O. Berehovskyi>
 */
public virtual inherited sharing class SObjectSortIterator extends SObjectBaseIterator {

    private final Iterator<SObject> iterator;
    private final ISObjectComparator comparator;
    private Iterator<SObject> sortIterator;

    public SObjectSortIterator(final Iterator<SObject> iterator, final ISObjectComparator comparator) {
        this.iterator = iterator;
        this.comparator = comparator;
    }

    protected override void computeNext() {
        if (!isInit) { sortIterator = Lists.sort(Iterators.toSObjectList(iterator), comparator).iterator(); }
        hasNext = sortIterator.hasNext();
        if (hasNext) { next = sortIterator.next(); }
    }

}
