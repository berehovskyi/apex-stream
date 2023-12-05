/**
 * @see LongEnumerable
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongEnumerableTest {

    @IsTest
    @SuppressWarnings('PMD.ApexUnitTestClassShouldHaveAsserts')
    private static void coverage() {
        // Given
        List<Long> input = new List<Long>();
        TestLongEnumerable enumerable = new TestLongEnumerable();
        // When
        enumerable.union(input);
        enumerable.intersect(input);
        enumerable.except(input);
        enumerable.withoutNulls();
        enumerable.none(null);
        enumerable.max();
        enumerable.min();
        enumerable.sum();
        enumerable.avg();
        enumerable.iterator();
        enumerable.append(null);
        enumerable.prepend(null);
        enumerable.distinct();
        enumerable.filter(null);
        enumerable.take(null);
        enumerable.drop(null);
        enumerable.mapTo(null);
        enumerable.mapToInt(null);
        enumerable.mapToDouble(null);
        enumerable.mapToSObject(null);
        enumerable.mapToObject(null);
        enumerable.flatMapTo(null);
        enumerable.forEach(null);
        enumerable.sort();
        enumerable.sort(null);
        enumerable.lim(null);
        enumerable.skip(null);
        enumerable.reduce(null, null);
        enumerable.reduce(null);
        enumerable.collect(null);
        enumerable.find(null);
        enumerable.every(null);
        enumerable.some(null);
        enumerable.count();
        enumerable.isEmpty();
        enumerable.toList();
        enumerable.toSet();
    }

    @SuppressWarnings('PMD.ExcessivePublicCount')
    private class TestLongEnumerable extends LongEnumerable {
        public override Iterator<Long> iterator() { return null; }
        public override LongEnumerable append(Iterable<Long> iterable) { return this; }
        public override LongEnumerable prepend(Iterable<Long> iterable) { return this; }
        public override LongEnumerable distinct() { return this; }
        public override LongEnumerable filter(IPredicate predicate) { return this; }
        public override LongEnumerable take(IPredicate predicate) { return this; }
        public override LongEnumerable drop(IPredicate predicate) { return this; }
        public override LongEnumerable mapTo(IOperator mapper) { return this; }
        public override IntEnumerable mapToInt(IFunction mapper) { return null; }
        public override DoubleEnumerable mapToDouble(IFunction mapper) { return null; }
        public override SObjectEnumerable mapToSObject(IFunction mapper) { return null; }
        public override ObjectEnumerable mapToObject(IFunction mapper) { return null; }
        public override LongEnumerable flatMapTo(IFunction mapper) { return this; }
        public override LongEnumerable forEach(IConsumer consumer) { return this; }
        public override LongEnumerable sort() { return this; }
        public override LongEnumerable sort(SortOrder order) { return this; }
        public override LongEnumerable lim(Integer lim) { return this; }
        public override LongEnumerable skip(Integer n) { return this; }
        public override Long reduce(Long identity, IBiOperator accumulator) { return null; }
        public override Optional reduce(IBiOperator operator) { return null; }
        public override Object collect(ICollector collector) { return null; }
        public override Optional find(IPredicate predicate) { return null; }
        public override Boolean every(IPredicate predicate) { return null; }
        public override Boolean some(IPredicate predicate) { return false; }
        public override Long sum() { return null; }
        public override Optional avg() { return null; }
        public override Integer count() { return null; }
        public override Boolean isEmpty() { return null; }
        public override List<Long> toList() { return null; }
        public override Set<Long> toSet() { return null; }
    }

}
