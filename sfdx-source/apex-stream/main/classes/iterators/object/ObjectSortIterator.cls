/**
 * @author O. Berehovskyi>
 */
public virtual inherited sharing class ObjectSortIterator extends ObjectBaseIterator {

    private final Iterator<Object> iterator;
    private final IComparator comparator;
    private Iterator<Object> sortIterator;

    public ObjectSortIterator(final Iterator<Object> iterator, final IComparator comparator) {
        this.iterator = iterator;
        this.comparator = comparator;
    }

    protected override void computeNext() {
        if (!isInit) { sortIterator = Lists.sort(Iterators.toObjectList(iterator), comparator).iterator(); }
        hasNext = sortIterator.hasNext();
        if (hasNext) { next = sortIterator.next(); }
    }

}
