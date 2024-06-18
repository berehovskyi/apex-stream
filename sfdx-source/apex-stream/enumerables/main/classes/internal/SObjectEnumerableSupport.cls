/**
 * @description Utility methods for and manipulating SObject enumerables.
 *
 * @author Oleh Berehovskyi
 */
public inherited sharing class SObjectEnumerableSupport {

    public static Consumer set(final String fieldName, final IFunction mapper) {
        return new SetFieldConsumer(fieldName, mapper);
    }

    public static Consumer set(final SObjectField field, final IFunction mapper) {
        return new SetField(field, mapper);
    }

    public static Consumer set(final String fieldName, final Object value) {
        return set(fieldName, Function.constant(value));
    }

    public static Consumer set(final SObjectField field, final Object value) {
        return set(field, Function.constant(value));
    }

    public static Function get(final String fieldName) {
        return new GetFunction(fieldName);
    }

    public static Function get(final SObjectField field) {
        return new GetByFieldFunction(field);
    }

    public static Function getSObjects(final String fieldName) {
        return new GetSObjectsFunction(fieldName);
    }

    public static Function getSObjects(final SObjectField field) {
        final String relationshipField = findRelationshipField(field);
        // Since UnexpectedException is thrown if SObject doesn't have
        // related sObjects returned using SObjectField navigation such as
        // acc.getSObjects(Contact.AccountId)
        return getSObjects(relationshipField);
    }

    public static Operator getSObject(final String fieldName) {
        return new GetSObjectOperator(fieldName);
    }

    public static Operator getSObject(final SObjectField field) {
        return new GetSObjectFieldOperator(field);
    }

    public static Predicate isEqual(final String fieldName, final Object value) {
        return EnumerableSupport.isEqual(get(fieldName), Function.constant(value));
    }

    public static Predicate isEqual(final SObjectField field, final Object value) {
        return EnumerableSupport.isEqual(get(field), Function.constant(value));
    }

    public static String findRelationshipField(final SObjectField field) {
        final List<SObjectType> referenceTo = field.getDescribe().getReferenceTo();
        Validate.isTrue(!referenceTo.isEmpty(), Label.AF_ErrorMessage_NotReferenceField, new List<Object>{ field });
        String result;
        for (ChildRelationship relationship : referenceTo[0].getDescribe().getChildRelationships()) {
            if (relationship.getField() == field) {
                result = relationship.getRelationshipName();
                break;
            }
        }
        Validate.isNotNull(result);
        return result;
    }

    private abstract class SObjectPathConsumer extends Consumer {
        protected final IOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathConsumer(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            operator = getSObject(fieldName.substringBeforeLast('.'));
        }
    }

    private class SetFieldName extends Consumer {
        private final String fieldName;
        private final IFunction mapper;
        private SetFieldName(String fieldName, IFunction mapper) {
            this.fieldName = fieldName;
            this.mapper = mapper;
        }
        public override void accept(Object obj) { ((SObject) obj).put(fieldName, mapper.apply(((SObject) obj))); }
    }

    private class SetFieldPath extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetFieldPath(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply((SObject) obj)).put(xRefFieldName, mapper.apply(((SObject) obj)));
        }
    }

    private class SetFieldPathSafe extends SObjectPathConsumer {
        private final IFunction mapper;
        private SetFieldPathSafe(String fieldName, IFunction mapper) {
            super(fieldName);
            this.mapper = mapper;
        }
        public override void accept(Object obj) {
            ((SObject) operator.apply((SObject) obj))?.put(xRefFieldName, mapper.apply((SObject) obj));
        }
    }

    private class SetField extends Consumer {
        private final SObjectField field;
        private final IFunction mapper;
        private SetField(SObjectField field, IFunction mapper) {
            Validate.notNull(field);
            Validate.notNull(mapper);
            this.field = field;
            this.mapper = mapper;
        }
        public override void accept(Object obj) { ((SObject) obj).put(field, mapper.apply((SObject) obj)); }
    }

    private class SetFieldConsumer extends Consumer {
        private final IConsumer consumer;
        private SetFieldConsumer(String fieldName, IFunction mapper) {
            Validate.notBlank(fieldName);
            Validate.notNull(mapper);
            if (!fieldName.contains('.')) { consumer = new SetFieldName(fieldName, mapper); }
            else if (fieldName.substringBeforeLast('.').endsWith('?')) {
                consumer = new SetFieldPathSafe(fieldName, mapper);
            } else { consumer = new SetFieldPath(fieldName, mapper); }
        }
        public override void accept(Object obj) { consumer.accept((SObject) obj); }
    }

    private abstract class SObjectPathFunction extends Function {
        protected final IOperator operator;
        protected final String xRefFieldName;
        protected SObjectPathFunction(String fieldName) {
            xRefFieldName = fieldName.substringAfterLast('.');
            operator = getSObject(fieldName.substringBeforeLast('.'));
        }
    }

    private class GetFieldNameFunction extends Function {
        private final String fieldName;
        private GetFieldNameFunction(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object obj) { return ((SObject) obj).get(fieldName); }
    }

    private class GetFieldPathFunction extends SObjectPathFunction {
        private GetFieldPathFunction(String fieldName) { super(fieldName); }
        public override Object apply(Object obj) {
            return ((SObject) operator.apply((SObject) obj)).get(xRefFieldName);
        }
    }

    private class GetFieldPathSafeFunction extends SObjectPathFunction {
        private GetFieldPathSafeFunction(String fieldName) { super(fieldName); }
        public override Object apply(Object obj) {
            return ((SObject) operator.apply((SObject) obj))?.get(xRefFieldName);
        }
    }

    private class GetFunction extends Function {
        private final IFunction mapper;
        private GetFunction(String fieldName) {
            Validate.notBlank(fieldName);
            if (!fieldName.contains('.')) {
                mapper = new GetFieldNameFunction(fieldName);
            } else if (fieldName.substringBeforeLast('.').endsWith('?')) {
                mapper = new GetFieldPathSafeFunction(fieldName);
            } else { mapper = new GetFieldPathFunction(fieldName); }
        }
        public override Object apply(Object obj) { return mapper.apply((SObject) obj); }
    }

    private class GetByFieldFunction extends Function {
        private final SObjectField field;
        private GetByFieldFunction(SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }
        public override Object apply(Object obj) { return ((SObject) obj).get(field); }
    }

    private class GetSObjectsFieldNameFunction extends Function {
        private final String fieldName;
        private GetSObjectsFieldNameFunction(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object obj) { return ((SObject) obj).getSObjects(fieldName); }
    }

    private class GetSObjectsFieldPathFunction extends SObjectPathFunction {
        private GetSObjectsFieldPathFunction(String fieldName) { super(fieldName); }
        public override Object apply(Object obj) {
            return ((SObject) operator.apply((SObject) obj)).getSObjects(xRefFieldName);
        }
    }

    private class GetSObjectsFieldPathSafeFunction extends SObjectPathFunction {
        private GetSObjectsFieldPathSafeFunction(String fieldName) { super(fieldName); }
        public override Object apply(Object obj) {
            return ((SObject) operator.apply((SObject) obj))?.getSObjects(xRefFieldName);
        }
    }

    private class GetSObjectsFunction extends Function {
        private final IFunction mapper;
        private GetSObjectsFunction(String fieldName) {
            Validate.notBlank(fieldName);
            if (!fieldName.contains('.')) { mapper = new GetSObjectsFieldNameFunction(fieldName); }
            else if (fieldName.substringBeforeLast('.').endsWith('?')) {
                mapper = new GetSObjectsFieldPathSafeFunction(fieldName);
            } else { mapper = new GetSObjectsFieldPathFunction(fieldName); }
        }
        public override Object apply(Object obj) { return mapper.apply((SObject) obj); }
    }

    private class GetSObjectFieldNameOperator extends Operator {
        private final String fieldName;
        private GetSObjectFieldNameOperator(String fieldName) { this.fieldName = fieldName; }
        public override Object apply(Object obj) { return ((SObject) obj).getSObject(fieldName); }
    }

    private class GetSObjectFieldPathSafeOperator extends Operator {
        private final List<String> path;
        private GetSObjectFieldPathSafeOperator(String fieldName) { path = fieldName.split('\\.'); }
        public override Object apply(Object obj) { return getSObject((SObject) obj, 0); }
        private SObject getSObject(SObject sObj, Integer i) {
            if (i >= path.size()) { return sObj; }
            String fieldName = path[i];
            Boolean isSafeNavigation = fieldName.endsWith('?'); // Safe Navigation
            if (isSafeNavigation) { fieldName = fieldName.removeEnd('?'); }
            sObj = sObj.getSObject(fieldName);
            if (isSafeNavigation && sObj == null) { return null; }
            return getSObject(sObj, ++i);
        }
    }

    private class GetSObjectOperator extends Operator {
        private final IFunction mapper;
        private GetSObjectOperator(String fieldName) {
            Validate.notBlank(fieldName);
            if (!fieldName.containsAny('?.')) { mapper = new GetSObjectFieldNameOperator(fieldName); }
            else { mapper = new GetSObjectFieldPathSafeOperator(fieldName); }
        }
        public override Object apply(Object obj) { return mapper.apply((SObject) obj); }
    }

    private class GetSObjectFieldOperator extends Operator {
        private final SObjectField field;
        private GetSObjectFieldOperator(SObjectField field) {
            Validate.notNull(field);
            this.field = field;
        }
        public override Object apply(Object obj) { return ((SObject) obj).getSObject(field); }
    }

}
