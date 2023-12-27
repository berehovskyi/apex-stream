/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class ConcatIterator extends BaseIterator {

    private final List<Iterator<Object>> iterators;
    private final Integer count;
    private Integer index = 0;

    public ConcatIterator(final List<Iterable<Object>> iterables, final Type elementType) {
        Validate.noNullElements(iterables);
        Validate.notNull(elementType);
        final List<Iterator<Object>> iterators = (List<Iterator<Object>>)
            Type.forName('List<Iterator<' + elementType + '>>').newInstance();
        final Iterator<Iterable<Object>> iterator = iterables.iterator();
        while (iterator.hasNext()) {
            iterators.add(iterator.next().iterator());
        }
        this.iterators = iterators;
        count = this.iterators.size();
    }

    protected override void computeNext() {
        while (index < count) {
            final Iterator<Object> iterator = iterators[index];
            if (iterator.hasNext()) {
                next = iterator.next();
                hasNext = true;
                return;
            }
            index++;
        }
        hasNext = false;
    }

}
