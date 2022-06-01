/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class IntConcatIterator extends IntBaseIterator {

    private final List<Iterator<Integer>> iterators;
    private final Integer count;
    private Integer index = 0;

    public IntConcatIterator(final List<Iterator<Integer>> iterators) {
        this.iterators = iterators;
        count = iterators.size();
    }

    protected override void computeNext() {
        while (index < count) {
            final Iterator<Integer> iterator = iterators[index];
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
