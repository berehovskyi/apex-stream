/**
 * @author O. Berehovskyi>
 */
public class LongRangeIterator implements Iterator<Long> {

    private final Long endInclusive;
    private Long current;
    private Boolean hasNext;

    public LongRangeIterator(final Long startInclusive, final Long endInclusive) {
        this.endInclusive = endInclusive;
        current = startInclusive;
        hasNext = current <= endInclusive;
    }

    public Boolean hasNext() {
        return hasNext;
    }

    public Long next() {
        if (current >= endInclusive) {
            hasNext = false;
            return endInclusive;
        }
        return current++;
    }

}
