/**
 * @see SObjectEnumerable
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectEnumerableTest {

    @IsTest
    @SuppressWarnings('PMD.ApexUnitTestClassShouldHaveAsserts, PMD.NcssMethodCount')
    private static void coverage() {
        // Given
        List<SObject> input = new List<SObject>();
        String fieldName = AsTestConsts.NAME;
        SObjectField field = AsTestConsts.Account.Name;
        String relFieldName = AsTestConsts.ACCOUNT_ID;
        SObjectField relField = AsTestConsts.Contact.AccountId;
        TestSObjectEnumerable enumerable = new TestSObjectEnumerable();
        // When
        enumerable.union(input);
        enumerable.union(input, Function.identity());
        enumerable.union(input, fieldName);
        enumerable.union(input, field);
        enumerable.intersect(input);
        enumerable.intersect(input, Function.identity());
        enumerable.intersect(input, fieldName);
        enumerable.intersect(input, field);
        enumerable.except(input);
        enumerable.except(input, Function.identity());
        enumerable.except(input, fieldName);
        enumerable.except(input, field);
        enumerable.withoutNulls();
        enumerable.none(null);
        enumerable.none(fieldName, null);
        enumerable.none(field, null);
        enumerable.max(Comparer.defaultOrder());
        enumerable.max(fieldName);
        enumerable.max(field);
        enumerable.min(Comparer.defaultOrder());
        enumerable.min(fieldName);
        enumerable.min(field);
        enumerable.sum(Function.identity());
        enumerable.sum(fieldName);
        enumerable.sum(field);
        enumerable.avg(Function.identity());
        enumerable.avg(fieldName);
        enumerable.avg(field);
        enumerable.toList(Function.identity());
        enumerable.toList(fieldName);
        enumerable.toList(field);
        enumerable.toList(fieldName, Object.class);
        enumerable.toList(field, Object.class);
        enumerable.iterator();
        enumerable.append(null);
        enumerable.prepend(null);
        enumerable.distinct();
        enumerable.distinct((IFunction) null);
        enumerable.distinct(Function.identity());
        enumerable.distinct(fieldName);
        enumerable.distinct(field);
        enumerable.filter(null);
        enumerable.filter(fieldName, null);
        enumerable.filter(field, null);
        enumerable.take(null);
        enumerable.take(fieldName, null);
        enumerable.take(field, null);
        enumerable.drop(null);
        enumerable.drop(fieldName, null);
        enumerable.drop(field, null);
        enumerable.mapTo((IOperator) null);
        enumerable.mapTo(fieldName);
        enumerable.mapTo(field);
        enumerable.mapToInt((IFunction) null);
        enumerable.mapToInt(fieldName);
        enumerable.mapToInt(field);
        enumerable.mapToLong((IFunction) null);
        enumerable.mapToLong(fieldName);
        enumerable.mapToLong(field);
        enumerable.mapToDouble((IFunction) null);
        enumerable.mapToDouble(fieldName);
        enumerable.mapToDouble(field);
        enumerable.mapToObject((IFunction) null);
        enumerable.mapToObject(fieldName);
        enumerable.mapToObject(field);
        enumerable.flatMapTo((IFunction) null);
        enumerable.flatMapTo(relFieldName);
        enumerable.flatMapTo(relField);
        enumerable.flatMapToInt(null);
        enumerable.flatMapToLong(null);
        enumerable.flatMapToDouble(null);
        enumerable.flatMapToObject(null);
        enumerable.forEach(null);
        enumerable.forEach(fieldName, null);
        enumerable.forEach(field, null);
        enumerable.sort();
        enumerable.sort(SortOrder.ASCENDING);
        enumerable.sort((IComparer) null);
        enumerable.sort(fieldName);
        enumerable.sort(field);
        enumerable.sort(fieldName, SortOrder.ASCENDING);
        enumerable.sort(field, SortOrder.ASCENDING);
        enumerable.lim(null);
        enumerable.skip(null);
        enumerable.reduce(null, null);
        enumerable.reduce(null);
        enumerable.collect(null);
        enumerable.find(null);
        enumerable.find(fieldName, null);
        enumerable.find(field, null);
        enumerable.every(null);
        enumerable.every(fieldName, null);
        enumerable.every(field, null);
        enumerable.some(null);
        enumerable.some(fieldName, null);
        enumerable.some(field, null);
        enumerable.count();
        enumerable.isEmpty();
        enumerable.toList();
        enumerable.toList(Function.identity());
        enumerable.toList(fieldName);
        enumerable.toList(field);
        enumerable.toList(Function.identity(), Object.class);
        enumerable.toList(fieldName, Object.class);
        enumerable.toList(field, Object.class);
        enumerable.toSet();
        enumerable.toSet(Function.identity());
        enumerable.toSet(fieldName);
        enumerable.toSet(field);
        enumerable.toIdSet();
        enumerable.toIdSet(Function.identity());
        enumerable.toIdSet(fieldName);
        enumerable.toIdSet(field);
        enumerable.toStringSet(Function.identity());
        enumerable.toStringSet(fieldName);
        enumerable.toStringSet(field);
        enumerable.toMap();
        enumerable.toByIdMap(Function.identity(), Object.class);
        enumerable.toByIdMap(fieldName, Object.class);
        enumerable.toByIdMap(field, Object.class);
        enumerable.toByStringMap(Function.identity(), Object.class);
        enumerable.toByStringMap(fieldName, Object.class);
        enumerable.toByStringMap(field, Object.class);
        enumerable.groupById(Function.identity());
        enumerable.groupById(fieldName);
        enumerable.groupById(field);
        enumerable.groupByString(Function.identity());
        enumerable.groupByString(fieldName);
        enumerable.groupByString(field);
        enumerable.partition(Predicate.always(true));
        enumerable.partition(fieldName, null);
        enumerable.partition(field, null);
    }

    @SuppressWarnings('PMD.ExcessivePublicCount')
    private class TestSObjectEnumerable extends SObjectEnumerable {
        public override Iterator<SObject> iterator() { return null; }
        public override SObjectEnumerable append(Iterable<SObject> iterable) { return this; }
        public override SObjectEnumerable prepend(Iterable<SObject> iterable) { return this; }
        public override SObjectEnumerable distinct() { return this; }
        public override SObjectEnumerable distinct(IFunction classifier) { return this; }
        public override SObjectEnumerable filter(IPredicate predicate) { return this; }
        public override SObjectEnumerable take(IPredicate predicate) { return this; }
        public override SObjectEnumerable drop(IPredicate predicate) { return this; }
        public override SObjectEnumerable mapTo(IOperator mapper) { return this; }
        public override IntEnumerable mapToInt(IFunction mapper) { return null; }
        public override LongEnumerable mapToLong(IFunction mapper) { return null; }
        public override DoubleEnumerable mapToDouble(IFunction mapper) { return new DoubleEnumerableTest.TestDoubleEnumerable(); }
        public override ObjectEnumerable mapToObject(IFunction mapper) { return null; }
        public override SObjectEnumerable flatMapTo(IFunction mapper) { return this; }
        public override IntEnumerable flatMapToInt(IFunction mapper) { return null; }
        public override LongEnumerable flatMapToLong(IFunction mapper) { return null; }
        public override DoubleEnumerable flatMapToDouble(IFunction mapper) { return null; }
        public override ObjectEnumerable flatMapToObject(IFunction mapper) { return null; }
        public override SObjectEnumerable forEach(IConsumer consumer) { return this; }
        public override SObjectEnumerable sort() { return this; }
        public override SObjectEnumerable sort(IComparer comparer) { return this; }
        public override SObjectEnumerable lim(Integer lim) { return this; }
        public override SObjectEnumerable skip(Integer n) { return this; }
        public override SObject reduce(SObject identity, IBiOperator accumulator) { return null; }
        public override Optional reduce(IBiOperator accumulator) { return null; }
        public override Object collect(ICollector collector) { return null; }
        public override Optional find(IPredicate predicate) { return null; }
        public override Boolean every(IPredicate predicate) { return null; }
        public override Boolean some(IPredicate predicate) { return false; }
        public override Integer count() { return null; }
        public override Boolean isEmpty() { return null; }
        public override List<SObject> toList() { return null; }
        public override List<Object> toList(IFunction mapper, Type elementType) { return null; }
        public override Set<SObject> toSet() { return null; }
        public override Set<Object> toSet(IFunction mapper) { return null; }
        public override Set<Id> toIdSet(IFunction mapper) { return null; }
        public override Set<String> toStringSet(IFunction mapper) { return null; }
        public override Map<Id, SObject> toMap() { return null; }
        public override Map<Id, SObject> toByIdMap(IFunction keyMapper, Type valueType) { return null; }
        public override Map<String, SObject> toByStringMap(IFunction keyMapper, Type valueType) { return null; }
        public override Map<Id, List<SObject>> groupById(IFunction keyMapper) { return null; }
        public override Map<String, List<SObject>> groupByString(IFunction keyMapper) { return null; }
        public override Map<Boolean, List<SObject>> partition(IPredicate predicate) { return null; }
    }

}
