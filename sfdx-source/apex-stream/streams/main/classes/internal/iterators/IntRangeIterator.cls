/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class IntRangeIterator implements Iterator<Integer> {

    private final Integer endInclusive;
    private Integer current;
    private Boolean hasNext;

    public IntRangeIterator(final Integer startInclusive, final Integer endInclusive) {
        this.endInclusive = endInclusive;
        current = startInclusive;
        hasNext = current <= endInclusive;
    }

    public Boolean hasNext() {
        return hasNext;
    }

    public Integer next() {
        if (current >= endInclusive) {
            hasNext = false;
            return endInclusive;
        }
        return current++;
    }

}
