/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class LongRangeIterator implements Iterator<Long> {

    private final Long endInclusive;
    private Long current;
    private Boolean hasNext;

    public LongRangeIterator(final Long startInclusive, final Long endInclusive) {
        Validate.notNull(startInclusive);
        Validate.notNull(endInclusive);
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
