/**
 * @author O. Berehovskyi>
 */
public class DoubleConcatIterator extends DoubleBaseIterator {

    private final List<Iterator<Double>> iterators;
    private final Integer count;
    private Integer index = 0;

    public DoubleConcatIterator(final List<Iterator<Double>> iterators) {
        this.iterators = iterators;
        count = iterators.size();
    }

    protected override void computeNext() {
        while (index < count) {
            final Iterator<Double> iterator = iterators[index];
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
