/**
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@TestVisible
@SuppressWarnings('PMD.ExcessivePublicCount, PMD.CognitiveComplexity')
private class AsTestCommons {

    public static SObject deepClone(SObject sObj) {
        return sObj.clone(true, true, true, true);
    }
    public static List<SObject> deepClone(List<SObject> sObjs) {
        return sObjs.deepClone(true, true, true);
    }
    public static List<Object> deepClone(List<Object> objects) {
        return (List<Object>) JSON.deserializeUntyped(JSON.serialize(objects, false));
    }
    public static List<Object> deepClone(List<Object> objects, Type t) {
        return (List<Object>) JSON.deserialize(JSON.serialize(objects, false), t);
    }
    public static Object deepClone(Object objects, Type t) {
        return JSON.deserialize(JSON.serialize(objects, false), t);
    }
    @SuppressWarnings('PMD.OneDeclarationPerLine')
    public static Object collect(final List<Object> source, final ICollector collector) {
        Validate.notNull(source);
        Validate.notNull(collector);
        final Object container = collector.supplier().get();
        final IBiConsumer accumulator = collector.accumulator();
        final IFunction finisher = collector.finisher();
        for (Integer i = 0, size = source.size(); i < size; i++) {
            accumulator.accept(container, source[i]);
        }
        return finisher == null ? container : finisher.apply(container);
    }

    public class ToUpperCaseFunction extends Function {
        public override Object apply(Object o) { return ((String) o).toUpperCase(); }
    }
    public class CreateAccountFromInts extends Function {
        public override Object apply(Object i) { return new Account(NumberOfEmployees = Math.abs((Integer) i)); }
    }
    public class CreateAccountFromLongs extends Function {
        public override Object apply(Object i) { return new Account(NumberOfEmployees = (Integer) Math.abs((Long) i)); }
    }
    public class CreateAccountFromDoubles extends Function {
        public override Object apply(Object d) { return new Account(AnnualRevenue = Math.abs((Double) d)); }
    }
    public class Abbreviate extends Function {
        private final Integer maxWidth;
        public Abbreviate(Integer maxWidth) { this.maxWidth = maxWidth; }
        public override Object apply(Object o) { return ((String) o).abbreviate(maxWidth); }
    }
    public class IntToString extends Function {
        public override Object apply(Object i) { return String.valueOf(i); }
    }
    public class LongToString extends Function {
        public override Object apply(Object l) { return String.valueOf(l); }
    }
    public class DoubleToString extends Function {
        public override Object apply(Object d) { return String.valueOf(d); }
    }
    public class DoubleInt extends Function {
        public override Object apply(Object d) { return new List<Integer>{ ((Integer) d) * 2 }; }
    }
    public class DoubleLong extends Function {
        public override Object apply(Object d) { return new List<Long>{ ((Long) d) * 2 }; }
    }
    public class DoubleDouble extends Function {
        public override Object apply(Object d) { return new List<Double>{ ((Double) d) * 2 }; }
    }
    public class IntValueOf extends Function {
        public override Object apply(Object o) { return Integer.valueOf(o); }
    }
    public class LongValueOf extends Function {
        public override Object apply(Object o) { return Long.valueOf((String) o); }
    }
    public class RoundToInt extends Function {
        public override Object apply(Object x) { return Math.round((Double) x); }
    }
    public class LongValueOfInt extends Function {
        public override Object apply(Object o) { return ((Long) o)?.intValue(); }
    }
    public class RoundToLong extends Function {
        public override Object apply(Object x) { return Math.roundToLong((Double) x); }
    }
    public class DoubleValueOf extends Function {
        public override Object apply(Object o) { return Double.valueOf(o); }
    }
    public class Length extends Function {
        public override Object apply(Object o) { return ((String) o).length(); }
    }
    public class ConvertToUser extends Function {
        public override Object apply(Object o) {
            AsPerson person = (AsPerson) o;
            return new User(
                LastName = person.getName(),
                IsActive = person.isActive()
            );
        }
    }
    public class GetIdFunction extends Function {
        public override Object apply(Object o) { return ((AsPerson) o).getAutoId(); }
    }
    public class GetNameFunction extends Function {
        public override Object apply(Object o) { return ((AsPerson) o).getName(); }
    }
    public class GetAgeFunction extends Function {
        public override Object apply(Object o) { return ((AsPerson) o).getAge(); }
    }
    public class GetProbabilityFunction extends Function {
        public override Object apply(Object o) { return ((AsPerson) o).getProbability(); }
    }
    public class GetActiveFunction extends Function {
        public override Object apply(Object o) { return ((AsPerson) o).isActive(); }
    }
    public class IsAdultFunction extends Function {
        public override Object apply(Object o) { return ((AsPerson) o).getAge() >= 18; }
    }
    public class GetFieldsLength extends Function {
        private final IFunction iterableMapper;
        private final IFunction valueMapper;
        public GetFieldsLength(String relationshipFieldName, String fieldName) {
            iterableMapper = SObjectEnumerableSupport.getSObjects(relationshipFieldName);
            valueMapper = SObjectEnumerableSupport.get(fieldName);
        }
        public override Object apply(Object sObj) {
            List<SObject> children = (List<SObject>) iterableMapper.apply((SObject) sObj);
            List<Integer> results = new List<Integer>();
            if (children != null) {
                for (SObject child : children) {
                    results.add(((String) valueMapper.apply(child)).length());
                }
            }
            return results;
        }
    }
    public class GetDoublePair extends Function {
        private final IFunction mapper1;
        private final IFunction mapper2;
        public GetDoublePair(String fieldName1, String fieldName2) {
            mapper1 = SObjectEnumerableSupport.get(fieldName1);
            mapper2 = SObjectEnumerableSupport.get(fieldName2);
        }
        public override Object apply(Object sObj) {
            return new List<Double>{ (Double) mapper1.apply((SObject) sObj), (Double) mapper2.apply((SObject) sObj) };
        }
    }
    public class GetPair extends Function {
        private final IFunction mapper1;
        private final IFunction mapper2;
        public GetPair(String fieldName1, String fieldName2) {
            mapper1 = SObjectEnumerableSupport.get(fieldName1);
            mapper2 = SObjectEnumerableSupport.get(fieldName2);
        }
        public override Object apply(Object sObj) {
            return new List<Object>{ mapper1.apply((SObject) sObj), mapper2.apply((SObject) sObj) };
        }
    }
    public class GroupByIdFinisher extends Function {
        private final IFunction finisher;
        public GroupByIdFinisher(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Id, Object> m = ((Map<Id, Object>) o);
            for (Id k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }
    public class GroupByStringFinisher extends Function {
        private final IFunction finisher;
        public GroupByStringFinisher(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<String, Object> m = ((Map<String, Object>) o);
            for (String k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }

    public class Capitalize extends Operator {
        public override Object apply(Object o) { return ((String) o).capitalize(); }
    }
    public class SetSObjectsByFieldNameOperator extends Operator {
        private final String placeholder = '\'{\'"totalSize": {0}, "done": true, "records": {1}\'}\'';
        private final String fieldName;
        private final IFunction mapper;
        public SetSObjectsByFieldNameOperator(String fieldName, IFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public SetSObjectsByFieldNameOperator(SObjectField field, IFunction mapper) {
            this.fieldName = findChildRelationshipName(field);
            this.mapper = mapper;
        }
        public override Object apply(Object o) {
            SObject sObj = ((SObject) o);
            final Map<String, Object> rawRecord = new Map<String, Object>(sObj.getPopulatedFieldsAsMap());
            final List<SObject> children = (List<SObject>) mapper.apply(sObj);
            if (children == null || children.isEmpty()) {
                rawRecord.keySet().remove(fieldName);
            } else {
                final List<Object> arguments = new List<Object>{ children.size(), JSON.serialize(children) };
                final String fake = String.format(placeholder, arguments);
                rawRecord.put(fieldName, JSON.deserializeUntyped(fake));
            }
            return JSON.deserialize(
                JSON.serialize(rawRecord),
                Type.forName(sObj.getSObjectType().getDescribe().getName())
            );
        }
        private String findChildRelationshipName(final SObjectField field) {
            final List<SObjectType> referenceTo = field.getDescribe().getReferenceTo();
            Validate.isTrue(!referenceTo.isEmpty(), Label.AF_ErrorMessage_NotReferenceField, new List<Object>{ field });
            String result;
            for (ChildRelationship relationship : referenceTo[0].getDescribe().getChildRelationships()) {
                if (relationship.getField() == field) {
                    result = relationship.getRelationshipName();
                    break;
                }
            }
            return result;
        }
    }
    public class AddLongOp extends Operator {
        private final Long l;
        public AddLongOp(Long l) { this.l = l; }
        public override Object apply(Object j) { return (Long) j + l; }
    }
    public class MultiplyLongOp extends Operator {
        private final Long l;
        public MultiplyLongOp(Long l) { this.l = l; }
        public override Object apply(Object j) { return (Long) j * l; }
    }
    public class AddIntOp extends Operator {
        private final Integer i;
        public AddIntOp(Integer i) { this.i = i; }
        public override Object apply(Object j) { return (Integer) j + i; }
    }
    public class MultiplyIntOp extends Operator {
        private final Integer i;
        public MultiplyIntOp(Integer i) { this.i = i; }
        public override Object apply(Object j) { return (Integer) j * i; }
    }
    public class AddDoubleOp extends Operator {
        private final Double d;
        public AddDoubleOp(Double d) { this.d = d; }
        public override Object apply(Object j) { return (Double) j + d; }
    }
    public class MultiplyDoubleOp extends Operator {
        private final Double d;
        public MultiplyDoubleOp(Double d) { this.d = d; }
        public override Object apply(Object j) { return (Double) j * d; }
    }
    public class TestAccountOperator extends Operator {
        private Integer i = 0;
        public override Object apply(Object sObj) {
            Account seed = (Account) sObj;
            return new Account(
                Name = seed.Name + i,
                NumberOfEmployees = seed.NumberOfEmployees + 100 * i++
            );
        }
    }

    public class IsGreaterPredicate extends ComparisonPredicate {
        public IsGreaterPredicate(IFunction left, IFunction right) { super(left, right, 1); }
        public IsGreaterPredicate(Object value) { super(value, 1); }
    }
    public class IsLessPredicate extends ComparisonPredicate {
        public IsLessPredicate(IFunction left, IFunction right) { super(left, right, -1); }
        public IsLessPredicate(Object value) { super(value, -1); }
    }
    public class IsEvenPredicate extends Predicate {
        public override Boolean test(Object l) { return Math.mod((Long) l, 2) == 0; }
    }
    public class IsInstanceOfStringPredicate extends Predicate {
        public override Boolean test(Object o) { return o instanceof String; }
    }
    public class IsInstanceOfIntPredicate extends Predicate {
        public override Boolean test(Object o) { return o instanceof Integer; }
    }
    public class IsInstanceOfComparablePredicate extends Predicate {
        public override Boolean test(Object o) { return o instanceof Comparable; }
    }
    public class StartsWithPredicate extends Predicate {
        private final String prefix;
        public StartsWithPredicate(String prefix){ this.prefix = prefix; }
        public override Boolean test(Object o) { return ((String) o).startsWith(prefix); }
    }
    public class IsNotBlankPredicate extends Predicate {
        public override Boolean test(Object o) { return String.isNotBlank((String) o); }
    }

    public class DoNothingConsumer extends Consumer {
        @SuppressWarnings('PMD.EmptyStatementBlock')
        public override void accept(Object o) {}
    }
    public class SetNameConsumer extends Consumer {
        private final String name;
        public SetNameConsumer(String name) { this.name = name; }
        public override void accept(Object o) { ((AsPerson) o).setName(name); }
    }
    public class SetActiveConsumer extends Consumer {
        private final Boolean isActive;
        public SetActiveConsumer(Boolean isActive) { this.isActive = isActive; }
        public override void accept(Object o) { ((AsPerson) o).setActive(isActive); }
    }
    public class SetAutoId extends Consumer {
        private final Long autoId;
        public SetAutoId(Long autoId) { this.autoId = autoId; }
        public override void accept(Object o) { ((AsPerson) o).setAutoId(autoId); }
    }

    public class IdSupplier extends Supplier {
        private Integer i = 0;
        private final String keyPrefix;
        private final String placeholder = '000000000000';
        public IdSupplier(SObjectType sObjectType) {
            this.keyPrefix = sObjectType.getDescribe().getKeyPrefix();
        }
        public override Object get() {
            return Id.valueOf(
                keyPrefix
                + placeholder.substring(0, 12 - String.valueOf(i).length())
                + i++
            );
        }
    }
    public class SObjectSupplier extends Supplier {
        private final SObjectType sObjectType;
        public SObjectSupplier(SObjectType sObjectType) { this.sObjectType = sObjectType; }
        public override Object get() { return sObjectType.newSObject(); }
    }
    public class RandomDoubleSupplier extends Supplier {
        public override Object get() { return Math.random(); }
    }
    public class FibonacciSupplier extends Supplier {
        private Integer n0 = 0;
        private Integer n1 = 1;
        public override Object get() {
            Integer n2 = n0 + n1;
            n0 = n1;
            n1 = n2;
            return n0;
        }
    }
    public class IncrementSupplier extends Supplier {
        private Integer n0;
        private final Integer dn;
        public IncrementSupplier(Integer fromInt, Integer step) {
            n0 = fromInt;
            dn = step;
        }
        public override Object get() {
            Integer n1 = n0;
            n0 += dn;
            return n1;
        }
    }
    public class TestAccountSupplier extends Supplier {
        private Integer i = 0;
        public override Object get() {
            return new Account(
                Name = 'Test' + i,
                NumberOfEmployees = 100 * i++
            );
        }
    }

    public class SumIntBiOperator extends BiOperator {
        public override Object apply(Object o1, Object o2) { return (Integer) o1 + (Integer) o2; }
    }
    public class SumLongBiOperator extends BiOperator {
        public override Object apply(Object o1, Object o2) { return (Long) o1 + (Long) o2; }
    }
    public class SumDoubleBiOperator extends BiOperator {
        public override Object apply(Object o1, Object o2) { return (Double) o1 + (Double) o2; }
    }
    public class Concat extends BiOperator {
        public override Object apply(Object o1, Object o2) { return ((String) o1) + ((String) o2); }
    }
    public class AddToIdSet extends BiConsumer {
        private final IFunction mapper;
        public AddToIdSet() { this(Function.identity()); }
        public AddToIdSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<Id>) container).add((Id) mapper.apply(o)); }
    }
    public class AddToStringSet extends BiConsumer {
        private final IFunction mapper;
        public AddToStringSet() { this(Function.identity()); }
        public AddToStringSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<String>) container).add((String) mapper.apply(o)); }
    }
    public class AddToSObjectSet extends BiConsumer {
        private final IFunction mapper;
        public AddToSObjectSet() { this(Function.identity()); }
        public AddToSObjectSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<SObject>) container).add((SObject) mapper.apply(o)); }
    }
    public class AddToDoubleSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Double>) container).add((Double) o); }
    }
    public class AddToIntSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Integer>) container).add((Integer) o); }
    }
    public class AddToLongSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Long>) container).add((Long) o); }
    }
    public class AddToSet extends BiConsumer {
        private final IFunction mapper;
        public AddToSet() { this(Function.identity()); }
        public AddToSet(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object container, Object o) { ((Set<Object>) container).add(mapper.apply(o)); }
    }
    public class PutToObjectByIdMap extends BiConsumer {
        private final IFunction keyMapper;
        private final IFunction valueMapper;
        private final IBiOperator merger;
        public PutToObjectByIdMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<Id, Object> m = ((Map<Id, Object>) container);
            final Id key = (Id) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }
    public class PutToObjectByStringMap extends BiConsumer {
        private final IFunction keyMapper;
        private final IFunction valueMapper;
        private final IBiOperator merger;
        public PutToObjectByStringMap(IFunction keyMapper, IFunction valueMapper, IBiOperator merger) {
            this.keyMapper = keyMapper;
            this.valueMapper = valueMapper;
            this.merger = merger;
        }
        public override void accept(Object container, Object o) {
            final Map<String, Object> m = ((Map<String, Object>) container);
            final String key = (String) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }
    public class PutToObjectsByBoolMap extends BiConsumer {
        private final IFunction classifier;
        public PutToObjectsByBoolMap(ICollector downstream, IFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<Boolean, Object> m = (Map<Boolean, Object>) container;
            final Boolean key = (Boolean) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }
    public class PutToObjectsByIdMap extends BiConsumer {
        private final IFunction classifier;
        public PutToObjectsByIdMap(ICollector downstream, IFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<Id, Object> m = (Map<Id, Object>) container;
            final Id key = (Id) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }
    public class PutToObjectsByStringMap extends BiConsumer {
        private final IFunction classifier;
        public PutToObjectsByStringMap(ICollector downstream, IFunction classifier) {
            this.downstream = downstream;
            this.classifier = classifier;
        }
        public override void accept(Object container, Object o) {
            final Map<String, Object> m = (Map<String, Object>) container;
            final String key = (String) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    public class SetBiConsumer extends BiConsumer {
        private final String fieldName;
        private final IFunction mapper;
        public SetBiConsumer(String fieldName, IFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public SetBiConsumer(SObjectField field, IFunction mapper) { this(String.valueOf(field), mapper); }
        public override void accept(Object src, Object target) {
            ((SObject) target).put(fieldName, mapper.apply(src));
        }
    }

    public class ComparisonBiPredicate extends BiPredicate {
        private final IFunction left;
        private final IFunction right;
        private final IComparer comp = Comparer.defaultOrder();
        private final Integer comparisonResult;
        public ComparisonBiPredicate(IFunction left, IFunction right, Integer comparisonResult) {
            this.left = left;
            this.right = right;
            this.comparisonResult = comparisonResult;
        }
        public ComparisonBiPredicate(IFunction function, Integer comparisonResult) {
            this(function, function, comparisonResult);
        }
        public override Boolean test(Object o1, Object o2) {
            return comp.compare(left.apply(o1), right.apply(o2)) == comparisonResult;
        }
    }
    public class AreNotEqual extends BiPredicate {
        public override Boolean test(Object o1, Object o2) { return o1 != o2; }
    }

    public abstract class ComparisonPredicate extends Predicate {
        protected final Predicate predicate;
        protected ComparisonPredicate(IFunction left, IFunction right, Integer comparisonResult) {
            this.predicate = new EnumerableSupport.ComparerPredicate(left, right, Comparer.defaultOrder(), comparisonResult);
        }
        protected ComparisonPredicate(Object value, Integer comparisonResult) {
            this(Function.identity(), Function.constant(value), comparisonResult);
        }
        public override Boolean test(Object o) { return predicate.test(o); }
    }

    @SuppressWarnings('PMD.ExcessiveParameterList')
    private static Object mergeValue(
        final IBiOperator merger,
        final Object key,
        final Object oldValue,
        final Object newValue)
    {
        Validate.state(
            merger != null,
            Label.AS_ErrorMessage_DuplicateKey,
            new List<Object>{ key, oldValue, newValue }
        );
        return merger.apply(oldValue, newValue);
    }

}
