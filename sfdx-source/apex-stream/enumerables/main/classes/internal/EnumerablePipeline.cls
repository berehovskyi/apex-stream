/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class EnumerablePipeline {

    public static List<Object> sort(final List<Object> objects, final IComparer comparer) {
        Validate.notNull(objects);
        final List<Object> result = objects.clone();
        result.sort(new ObjectComparator(comparer));
        return result;
    }

    public static List<Object> toList(final Iterable<Object> iterable) {
        return toList(iterable, Object.class);
    }

    public static List<Object> toList(final Iterable<Object> iterable, final Type elementType) {
        Validate.notNull(iterable);
        Validate.notNull(elementType);
        final List<Object> result = (List<Object>) Type.forName('List<' + elementType + '>').newInstance();
        final Iterator<Object> iterator = iterable.iterator();
        while (iterator.hasNext()) {
            result.add(iterator.next());
        }
        return result;
    }

    public static Set<Object> toObjectSet(final Iterable<Object> iterable, final IFunction mapper) {
        Validate.notNull(iterable);
        Validate.notNull(mapper);
        final Set<Object> result = new Set<Object>();
        final Iterator<Object> iterator = iterable.iterator();
        while (iterator.hasNext()) {
            result.add(mapper.apply(iterator.next()));
        }
        return result;
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

    private class ObjectComparator implements Comparator<Object> {
        private final IComparer comp;
        private ObjectComparator(IComparer comp) { Validate.notNull(comp); this.comp = comp; }
        public Integer compare(Object o1, Object o2) { return comp.compare(o1, o2); }
    }

}
