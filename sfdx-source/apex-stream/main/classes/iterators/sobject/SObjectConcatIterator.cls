/**
 * @author O. Berehovskyi>
 */
public class SObjectConcatIterator extends SObjectBaseIterator {

    private final List<Iterator<SObject>> iterators;
    private final Integer count;
    private Integer index = 0;

    public SObjectConcatIterator(final List<Iterator<SObject>> iterators) {
        this.iterators = iterators;
        count = iterators.size();
    }

    protected override void computeNext() {
        while (index < count) {
            final Iterator<SObject> iterator = iterators[index];
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
