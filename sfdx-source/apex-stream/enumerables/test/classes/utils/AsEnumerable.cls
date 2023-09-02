/**
 * @description
 * @author Oleh Berehovskyi
 */
@IsTest
public class AsEnumerable {
    
    public static ObjectEnumerable of(List<Object> objects) {
        return new TestObjectEnumerable(objects);
    }
    
    private class TestObjectEnumerable extends ObjectEnumerable {
        private final List<Object> source;
        public TestObjectEnumerable(List<Object> objects) { this.source = objects; }
        public override Iterator<Object> iterator() {
            return null;
        }
        public override ObjectEnumerable append(Iterable<Object> iterable) {
            return null;
        }
        public override ObjectEnumerable prepend(Iterable<Object> iterable) {
            return null;
        }
        public override ObjectEnumerable distinct() {
            return null;
        }
        public override ObjectEnumerable distinct(IFunction classifier) {
            return null;
        }
        public override ObjectEnumerable filter(IPredicate predicate) {
            return null;
        }
        public override ObjectEnumerable take(IPredicate predicate) {
            return null;
        }
        public override ObjectEnumerable drop(IPredicate predicate) {
            return null;
        }
        public override ObjectEnumerable mapTo(IOperator mapper) {
            return null;
        }
        public override IntEnumerable mapToInt(IFunction mapper) {
            return null;
        }
        public override LongEnumerable mapToLong(IFunction mapper) {
            return null;
        }
        public override DoubleEnumerable mapToDouble(IFunction mapper) {
            return null;
        }
        public override SObjectEnumerable mapToSObject(IFunction mapper) {
            return null;
        }
        public override ObjectEnumerable flatMapTo(IFunction mapper) {
            return null;
        }
        public override IntEnumerable flatMapToInt(IFunction mapper) {
            return null;
        }
        public override LongEnumerable flatMapToLong(IFunction mapper) {
            return null;
        }
        public override DoubleEnumerable flatMapToDouble(IFunction mapper) {
            return null;
        }
        public override SObjectEnumerable flatMapToSObject(IFunction mapper) {
            return null;
        }
        public override ObjectEnumerable forEach(IConsumer consumer) {
            return null;
        }
        public override ObjectEnumerable sort() {
            return null;
        }
        public override ObjectEnumerable sort(IComparer comparer) {
            return null;
        }
        public override ObjectEnumerable lim(Integer lim) {
            return null;
        }
        public override ObjectEnumerable skip(Integer n) {
            return null;
        }
        public override Object reduce(Object identity, IBiOperator accumulator) {
            return null;
        }
        public override Optional reduce(IBiOperator accumulator) {
            return null;
        }
        public override Object collect(ICollector collector) {
            final Object container = collector.supplier().get();
            final IBiConsumer accumulator = collector.accumulator();
            final IFunction finisher = collector.finisher();
            for (Integer i = 0, size = source.size(); i < size; i++) {
                accumulator.accept(container, source[i]);
            }
            return finisher == null ? container : finisher.apply(container);
        }
        public override Optional find(IPredicate predicate) {
            return null;
        }
        public override Boolean every(IPredicate predicate) {
            return true;
        }
        public override Boolean some(IPredicate predicate) {
            return true;
        }
        public override Integer count() {
            return 0;
        }
        public override Boolean isEmpty() {
            return true;
        }
        public override List<Object> toList() {
            return null;
        }
        public override Set<Object> toSet() {
            return null;
        }
    }

}
