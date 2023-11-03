/**
 * @author Oleh Berehovskyi
 */
public inherited sharing class EnumerablePipeline {

    public static List<Object> sort(final List<Object> objects, final IComparer comparer) {
        Validate.notNull(objects);
        Validate.notNull(comparer);
        final List<ObjectComparable> comparables = wrap(objects, comparer);
        comparables.sort();
        return unwrap(comparables, objects);
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

    private static List<ObjectComparable> wrap(final List<Object> objects, final IComparer comparer) {
        final List<ObjectComparable> comparables = new List<ObjectComparable>();
        for (Integer i = 0, size = objects.size(); i < size; i++) {
            comparables.add(new ObjectComparable(objects[i], comparer));
        }
        return comparables;
    }

    private static List<Object> unwrap(final List<ObjectComparable> comparables, final List<Object> objects) {
        final List<Object> results = objects.clone();
        results.clear(); // To keep it possible to cast the result
        for (Integer i = 0, size = comparables.size(); i < size; i++) {
            results.add(comparables[i].o);
        }
        return results;
    }

    private class ObjectComparable implements Comparable {
        public final Object o;
        private final IComparer comparer;
        private ObjectComparable(Object o, IComparer comparer) {
            this.o = o;
            this.comparer = comparer;
        }
        public Integer compareTo(Object that) { return comparer.compare(o, ((ObjectComparable) that).o); }
    }

}
