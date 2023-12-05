/**
 * @see DoubleEnumerable
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@TestVisible
private class DoubleEnumerableTest {

    @IsTest
    @SuppressWarnings('PMD.ApexUnitTestClassShouldHaveAsserts')
    private static void coverage() {
        // Given
        List<Double> input = new List<Double>();
        TestDoubleEnumerable enumerable = new TestDoubleEnumerable();
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
        enumerable.mapToLong(null);
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

    @TestVisible
    @SuppressWarnings('PMD.ExcessivePublicCount')
    private class TestDoubleEnumerable extends DoubleEnumerable {
        public override Iterator<Double> iterator() { return null; }
        public override DoubleEnumerable append(Iterable<Double> iterable) { return this; }
        public override DoubleEnumerable prepend(Iterable<Double> iterable) { return this; }
        public override DoubleEnumerable distinct() { return this; }
        public override DoubleEnumerable filter(IPredicate predicate) { return this; }
        public override DoubleEnumerable take(IPredicate predicate) { return this; }
        public override DoubleEnumerable drop(IPredicate predicate) { return this; }
        public override DoubleEnumerable mapTo(IOperator mapper) { return this; }
        public override IntEnumerable mapToInt(IFunction mapper) { return null; }
        public override LongEnumerable mapToLong(IFunction mapper) { return null; }
        public override SObjectEnumerable mapToSObject(IFunction mapper) { return null; }
        public override ObjectEnumerable mapToObject(IFunction mapper) { return null; }
        public override DoubleEnumerable flatMapTo(IFunction mapper) { return this; }
        public override DoubleEnumerable forEach(IConsumer consumer) { return this; }
        public override DoubleEnumerable sort() { return this; }
        public override DoubleEnumerable sort(SortOrder order) { return this; }
        public override DoubleEnumerable lim(Integer lim) { return this; }
        public override DoubleEnumerable skip(Integer n) { return this; }
        public override Double reduce(Double identity, IBiOperator accumulator) { return null; }
        public override Optional reduce(IBiOperator operator) { return null; }
        public override Object collect(ICollector collector) { return null; }
        public override Optional find(IPredicate predicate) { return null; }
        public override Boolean every(IPredicate predicate) { return null; }
        public override Boolean some(IPredicate predicate) { return false; }
        public override Integer count() { return null; }
        public override Boolean isEmpty() { return null; }
        public override List<Double> toList() { return null; }
        public override Set<Double> toSet() { return null; }
    }

}
