/**
 * @see IntEnumerable
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveAsserts, PMD.ApexUnitTestClassShouldHaveRunAs')
private class IntEnumerableTest {

    @IsTest
    private static void coverage() {
        // Given
        List<Integer> input = new List<Integer>();
        TestIntEnumerable enumerable = new TestIntEnumerable();
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
        enumerable.mapToLong(null);
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
    private class TestIntEnumerable extends IntEnumerable {
        public override Iterator<Integer> iterator() { return null; }
        public override IntEnumerable append(Iterable<Integer> iterable) { return this; }
        public override IntEnumerable prepend(Iterable<Integer> iterable) { return this; }
        public override IntEnumerable distinct() { return this; }
        public override IntEnumerable filter(IPredicate predicate) { return this; }
        public override IntEnumerable take(IPredicate predicate) { return this; }
        public override IntEnumerable drop(IPredicate predicate) { return this; }
        public override IntEnumerable mapTo(IOperator mapper) { return this; }
        public override LongEnumerable mapToLong(IFunction mapper) { return null; }
        public override DoubleEnumerable mapToDouble(IFunction mapper) { return null; }
        public override SObjectEnumerable mapToSObject(IFunction mapper) { return null; }
        public override ObjectEnumerable mapToObject(IFunction mapper) { return null; }
        public override IntEnumerable flatMapTo(IFunction mapper) { return this; }
        public override IntEnumerable forEach(IConsumer consumer) { return this; }
        public override IntEnumerable sort() { return this; }
        public override IntEnumerable sort(SortOrder order) { return this; }
        public override IntEnumerable lim(Integer lim) { return this; }
        public override IntEnumerable skip(Integer n) { return this; }
        public override Integer reduce(Integer identity, IBiOperator accumulator) { return null; }
        public override Optional reduce(IBiOperator operator) { return null; }
        public override Object collect(ICollector collector) { return null; }
        public override Optional find(IPredicate predicate) { return null; }
        public override Boolean every(IPredicate predicate) { return null; }
        public override Boolean some(IPredicate predicate) { return false; }
        public override Integer sum() { return null; }
        public override Optional avg() { return null; }
        public override Integer count() { return null; }
        public override Boolean isEmpty() { return null; }
        public override List<Integer> toList() { return null; }
        public override Set<Integer> toSet() { return null; }
    }

}
