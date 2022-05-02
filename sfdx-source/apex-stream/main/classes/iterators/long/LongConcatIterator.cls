/**
 * @author O. Berehovskyi>
 */
public class LongConcatIterator extends LongBaseIterator {

    private final List<Iterator<Long>> iterators;
    private final Integer count;
    private Integer index = 0;

    public LongConcatIterator(final List<Iterator<Long>> iterators) {
        this.iterators = iterators;
        count = iterators.size();
    }

    protected override void computeNext() {
        while (index < count) {
            final Iterator<Long> iterator = iterators[index];
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
