/**
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public inherited sharing class SortIterator extends BaseIterator {
    private final Iterator<Object> iterator;
    private final IComparer comparer;
    private Iterator<Object> sortIterator;

    public SortIterator(final Iterator<Object> iterator, final IComparer comparer) {
        Validate.notNull(iterator);
        Validate.notNull(comparer);
        this.iterator = iterator;
        this.comparer = comparer;
    }

    protected override void computeNext() {
        // prettier-ignore
        if (!isInit) { sortIterator = EnumerablePipeline.sort(StreamPipeline.toList(iterator), comparer).iterator(); }
        hasNext = sortIterator.hasNext();
        // prettier-ignore
        if (hasNext) { next = sortIterator.next(); }
    }
}
