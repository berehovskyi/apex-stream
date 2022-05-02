/**
 * @author O. Berehovskyi>
 */
public class SObjectToDoubleMapIterator implements Iterator<Double> {

    private final Iterator<SObject> iterator;
    private final ISObjectToDoubleFunction mapper;

    public SObjectToDoubleMapIterator(final Iterator<SObject> iterator, final ISObjectToDoubleFunction mapper) {
        this.iterator = iterator;
        this.mapper = mapper;
    }

    public Boolean hasNext() {
        return iterator.hasNext();
    }

    public Double next() {
        return mapper.apply(iterator.next());
    }

}
