/**
 * @see ObjectEnumerable
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
private class ObjectEnumerableTest {

    @IsTest
    @SuppressWarnings('PMD.ApexUnitTestClassShouldHaveAsserts')
    private static void coverage() {
        // Given
        List<Object> input = new List<Object>();
        TestObjectEnumerable enumerable = new TestObjectEnumerable();
        // When
        enumerable.union(input);
        enumerable.union(input, Function.identity());
        enumerable.intersect(input);
        enumerable.intersect(input, Function.identity());
        enumerable.except(input);
        enumerable.except(input, Function.identity());
        enumerable.withoutNulls();
        enumerable.none(null);
        enumerable.max(Comparer.defaultOrder());
        enumerable.min(Comparer.defaultOrder());
        enumerable.toList(Object.class);
        enumerable.iterator();
        enumerable.append(null);
        enumerable.prepend(null);
        enumerable.distinct();
        enumerable.distinct(null);
        enumerable.filter(null);
        enumerable.take(null);
        enumerable.drop(null);
        enumerable.mapTo(null);
        enumerable.mapToInt(null);
        enumerable.mapToLong(null);
        enumerable.mapToDouble(null);
        enumerable.mapToSObject(null);
        enumerable.flatMapTo(null);
        enumerable.flatMapToInt(null);
        enumerable.flatMapToLong(null);
        enumerable.flatMapToDouble(null);
        enumerable.flatMapToSObject(null);
        enumerable.forEach(null);
        enumerable.sort();
        enumerable.sort(SortOrder.ASCENDING);
        enumerable.sort((IComparer) null);
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
    private class TestObjectEnumerable extends ObjectEnumerable {
        public override Iterator<Object> iterator() { return null; }
        public override ObjectEnumerable append(Iterable<Object> iterable) { return this; }
        public override ObjectEnumerable prepend(Iterable<Object> iterable) { return this; }
        public override ObjectEnumerable distinct() { return this; }
        public override ObjectEnumerable distinct(IFunction classifier) { return this; }
        public override ObjectEnumerable filter(IPredicate predicate) { return this; }
        public override ObjectEnumerable take(IPredicate predicate) { return this; }
        public override ObjectEnumerable drop(IPredicate predicate) { return this; }
        public override ObjectEnumerable mapTo(IOperator mapper) { return this; }
        public override IntEnumerable mapToInt(IFunction mapper) { return null; }
        public override LongEnumerable mapToLong(IFunction mapper) { return null; }
        public override DoubleEnumerable mapToDouble(IFunction mapper) { return null; }
        public override SObjectEnumerable mapToSObject(IFunction mapper) { return null; }
        public override ObjectEnumerable flatMapTo(IFunction mapper) { return this; }
        public override IntEnumerable flatMapToInt(IFunction mapper) { return null; }
        public override LongEnumerable flatMapToLong(IFunction mapper) { return null; }
        public override DoubleEnumerable flatMapToDouble(IFunction mapper) { return null; }
        public override SObjectEnumerable flatMapToSObject(IFunction mapper) { return null; }
        public override ObjectEnumerable forEach(IConsumer consumer) { return this; }
        public override ObjectEnumerable sort() { return this; }
        public override ObjectEnumerable sort(IComparer comparer) { return this; }
        public override ObjectEnumerable lim(Integer lim) { return this; }
        public override ObjectEnumerable skip(Integer n) { return this; }
        public override Object reduce(Object identity, IBiOperator accumulator) { return null; }
        public override Optional reduce(IBiOperator accumulator) { return null; }
        public override Object collect(ICollector collector) { return null; }
        public override Optional find(IPredicate predicate) { return null; }
        public override Boolean every(IPredicate predicate) { return null; }
        public override Boolean some(IPredicate predicate) { return false; }
        public override Integer count() { return null; }
        public override Boolean isEmpty() { return null; }
        public override List<Object> toList() { return null; }
        public override Set<Object> toSet() { return null; }
    }

}
