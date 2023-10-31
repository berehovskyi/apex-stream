/**
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@TestVisible
@SuppressWarnings('PMD.ExcessivePublicCount, PMD.CognitiveComplexity')
private class AfTestCommons {

    public static SObject deepClone(SObject sObj) {
        return sObj.clone(true, true, true, true);
    }
    public static Object deepClone(Object objects, Type t) {
        return JSON.deserialize(JSON.serialize(objects, false), t);
    }
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

    public class GetFieldFunction extends Function {
        private final String fieldName;
        public GetFieldFunction(String fieldName) { this.fieldName = fieldName; }
        public GetFieldFunction(SObjectField field) { this.fieldName = String.valueOf(field); }
        public override Object apply(Object o) { return ((SObject) o).get(fieldName); }
    }
    public class SetNameConsumer extends Consumer {
        private final String name;
        public SetNameConsumer(String name) { this.name = name; }
        public override void accept(Object o) { ((AfPerson) o).setName(name); }
    }
    public class SetActiveConsumer extends Consumer {
        private final Boolean isActive;
        public SetActiveConsumer(Boolean isActive) { this.isActive = isActive; }
        public override void accept(Object o) { ((AfPerson) o).setActive(isActive); }
    }
    public class GetIdFunction extends Function {
        public override Object apply(Object o) { return ((AfPerson) o).getAutoId(); }
    }
    public class GetNameFunction extends Function {
        public override Object apply(Object o) { return ((AfPerson) o).getName(); }
    }
    public class GetAgeFunction extends Function {
        public override Object apply(Object o) { return ((AfPerson) o).getAge(); }
    }
    public class GetProbabilityFunction extends Function {
        public override Object apply(Object o) { return ((AfPerson) o).getProbability(); }
    }
    public class GetActiveFunction extends Function {
        public override Object apply(Object o) { return ((AfPerson) o).isActive(); }
    }
    public class IsActivePredicate extends Predicate {
        public override Boolean test(Object o) { return ((AfPerson) o).isActive(); }
    }
    public class IsAdultFunction extends Function {
        public override Object apply(Object o) { return ((AfPerson) o).getAge() >= 18; }
    }
    public class IsAdultPredicate extends Predicate {
        public override Boolean test(Object o) { return ((AfPerson) o).getAge() >= 18; }
    }
    public class IsNameChangedPredicate extends Predicate {
        private final String oldName;
        public IsNameChangedPredicate(String oldName) {
            this.oldName = oldName;
        }
        public override Boolean test(Object o) {
            AfPerson person = (AfPerson) o;
            return person.getName() != oldName;
        }
    }
    public class SetFromRightBiConsumer extends BiConsumer {
        public final SObjectField targetField;
        public final SObjectField srcField;
        public SetFromRightBiConsumer(SObjectField targetField, SObjectField srcFieldName) {
            this.targetField = targetField;
            this.srcField = srcFieldName;
        }
        public override void accept(Object o1, Object o2) {
            ((SObject) o2).put(targetField, ((SObject) o1).get(srcField));
        }
    }
    public class SetFieldBiConsumer extends BiConsumer {
        public final String targetFieldName;
        public final IFunction mapper;
        public SetFieldBiConsumer(String targetFieldName, IFunction mapper) {
            this.targetFieldName = targetFieldName;
            this.mapper = mapper;
        }
        public SetFieldBiConsumer(String targetFieldName, Object value) {
            this(targetFieldName, Function.constant(value));
        }
        public override void accept(Object o1, Object o2) {
            ((SObject) o2).put(targetFieldName, mapper.apply(o1));
        }
    }
    public class SetNameFromRight extends BiConsumer {
        public override void accept(Object o1, Object o2) {
            AfPerson person1 = (AfPerson) o1;
            AfPerson person2 = (AfPerson) o2;
            person1.setName(person2.getName());
        }
    }
    public class SetAgeFromLeft extends BiConsumer {
        public override void accept(Object o1, Object o2) {
            AfPerson person1 = (AfPerson) o1;
            AfPerson person2 = (AfPerson) o2;
            person2.setAge(person1.getAge());
        }
    }
    public class IsGreaterBiPredicate extends BiPredicate {
        public final SObjectField field;
        public IsGreaterBiPredicate(SObjectField field) { this.field = field; }
        public override Boolean test(Object o1, Object o2) {
            return Comparer.compareObjects(((SObject) o1).get(field), ((SObject) o2).get(field)) == 1;
        }
    }
    public class AreEqualBiPredicate extends BiPredicate {
        public final SObjectField field;
        public AreEqualBiPredicate(SObjectField field) { this.field = field; }
        public override Boolean test(Object o1, Object o2) {
            return Comparer.compareObjects(((SObject) o1).get(field), ((SObject) o2).get(field)) == 0;
        }
    }
    public class AddToListBiConsumer extends BiConsumer {
        public final IFunction mapper;
        public AddToListBiConsumer(IFunction mapper) { this.mapper = mapper; }
        public override void accept(Object o1, Object o2) {
            ((List<Object>) o1).add(mapper.apply(o2));
        }
    }
    public class PutToObjectsByStringMapBiConsumer extends BiConsumer {
        private final IFunction classifier;
        public PutToObjectsByStringMapBiConsumer(ICollector downstream, IFunction classifier) {
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
    public class SumIntFieldReducer extends BiOperator {
        private final String fieldName;
        public SumIntFieldReducer(String fieldName) { this.fieldName = fieldName.contains('.') ? fieldName.substringAfter('.') : fieldName; }
        public override Object apply(Object seed, Object sObj) {
            ((SObject) seed).put(fieldName, (Integer) ((SObject) seed).get(fieldName) + (Integer) ((SObject) sObj).get(fieldName));
            return seed;
        }
    }
    public class GroupByStringFinisherFunction extends Function {
        private final IFunction finisher;
        public GroupByStringFinisherFunction(IFunction finisher) { this.finisher = finisher; }
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<String, Object> m = ((Map<String, Object>) o);
            for (String k : m.keySet()) {
                m.put(k, finisher.apply(m.get(k)));
            }
            return m;
        }
    }
    public class SetFieldConsumer extends Consumer {
        private final String fieldName;
        private final IFunction mapper;
        public SetFieldConsumer(String fieldName, IFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public SetFieldConsumer(SObjectField field, IFunction mapper) { this(String.valueOf(field), mapper); }
        public SetFieldConsumer(SObjectField field, Object o) { this(String.valueOf(field), Function.constant(o)); }
        public override void accept(Object obj) { ((SObject) obj).put(fieldName, this.mapper.apply(((SObject) obj))); }
    }
    public class SetFieldOperator extends Operator {
        private final String fieldName;
        private final IFunction mapper;
        public SetFieldOperator(String fieldName, IFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public SetFieldOperator(SObjectField field, IFunction mapper) { this(String.valueOf(field), mapper); }
        public SetFieldOperator(String fieldName, Object o) { this(fieldName, Function.constant(o)); }
        public SetFieldOperator(SObjectField field, Object o) { this(String.valueOf(field), Function.constant(o)); }
        public override Object apply(Object obj) {
            ((SObject) obj).put(fieldName, this.mapper.apply(((SObject) obj)));
            return obj;
        }
    }
    public class IdSupplier extends Supplier {
        private Integer i = 0;
        private final String keyPrefix;
        private final String placeholder = '000000000000';
        public IdSupplier(SObjectType sObjectType) { this.keyPrefix = sObjectType.getDescribe().getKeyPrefix(); }
        public override Object get() {
            return Id.valueOf(
                keyPrefix
                + placeholder.substring(0, 12 - String.valueOf(i).length())
                + i++
            );
        }
    }
    public class GetSObjectOperator extends Operator {
        private final SObjectField field;
        public GetSObjectOperator(SObjectField field) { this.field = field; }
        public override Object apply(Object o) { return ((SObject) o).getSObject(field); }
    }
    public class HasSObjectsPredicate extends Predicate {
        private final String fieldName;
        public HasSObjectsPredicate(String fieldName) { this.fieldName = fieldName; }
        public override Boolean test(Object o) { return ((SObject) o).getSObjects(fieldName) != null; }
    }
    public class Capitalize extends Function {
        public override Object apply(Object o) { return ((String) o).capitalize(); }
    }
    public class Abbreviate extends Function {
        private final Integer maxWidth;
        public Abbreviate(Integer maxWidth) { this.maxWidth = maxWidth; }
        public override Object apply(Object o) { return ((String) o).abbreviate(maxWidth); }
    }
    public class AddIntOperator extends Operator {
        private final Integer i;
        public AddIntOperator(Integer i) { this.i = i; }
        public override Object apply(Object o) { return ((Integer) o) + i; }
    }
    public class MultiplyIntOperator extends Operator {
        private final Integer i;
        public MultiplyIntOperator(Integer i) { this.i = i; }
        public override Object apply(Object o) { return ((Integer) o) * i; }
    }
    public class TestAccountOperator extends Operator {
        private Integer i = 0;
        public override Object apply(Object sObj) {
            return new Account(
                Name = 'Test' + i,
                NumberOfEmployees = 100 * i++
            );
        }
    }
    public virtual class ComparerPredicate extends Predicate {
        private final IFunction left;
        private final IFunction right;
        private final IComparer comp = Comparer.defaultOrder();
        private final Integer comparisonResult;
        public ComparerPredicate(
            IFunction left,
            IFunction right,
            Integer comparisonResult
        ) {
            this.left = left;
            this.right = right;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(Object obj) {
            return comp.compare(left.apply(obj), right.apply(obj)) == comparisonResult;
        }
    }
    public class IsGreaterPredicate extends ComparerPredicate {
        public IsGreaterPredicate(IFunction left, IFunction right) { super(left, right, 1); }
        public IsGreaterPredicate(SObjectField left, IFunction right) { this(new GetFieldFunction(left), right); }
        public IsGreaterPredicate(SObjectField left, Object right) {
            this(new GetFieldFunction(left), Function.constant(right));
        }
    }
    public class IsEqualPredicate extends ComparerPredicate {
        public IsEqualPredicate(IFunction left, IFunction right) { super(left, right, 0); }
        public IsEqualPredicate(SObjectField left, IFunction right) { this(new GetFieldFunction(left), right); }
        public IsEqualPredicate(SObjectField left, Object right) {
            this(new GetFieldFunction(left), Function.constant(right));
        }
    }
    public class ComparerBiPredicate extends BiPredicate {
        private final IFunction left;
        private final IFunction right;
        private final IComparer comp = Comparer.defaultOrder();
        private final Integer comparisonResult;
        public ComparerBiPredicate(IFunction left, IFunction right, Integer comparisonResult) {
            this.left = left;
            this.right = right;
            this.comparisonResult = comparisonResult;
        }
        public ComparerBiPredicate(IFunction function, Integer comparisonResult) {
            this(function, function, comparisonResult);
        }
        public override Boolean test(Object o1, Object o2) {
            return comp.compare(left.apply(o1), right.apply(o2)) == comparisonResult;
        }
    }
    public class StartsWith extends Predicate {
        private final String prefix;
        public StartsWith(String prefix){ this.prefix = prefix; }
        public override Boolean test(Object o) { return ((String) o).startsWith(prefix); }
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
    public class DoNothingRunnable implements IRunnable {
        public void run() {}
    }

}
