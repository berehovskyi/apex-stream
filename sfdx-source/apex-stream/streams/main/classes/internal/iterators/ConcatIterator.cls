/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class ConcatIterator extends BaseIterator {

    private final List<Iterator<Object>> iterators;
    private final Integer count;
    private Integer index = 0;

    public ConcatIterator(final List<Iterator<Object>> iterators) {
        this.iterators = iterators;
        count = iterators.size();
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
