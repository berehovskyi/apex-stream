/**
 * @description Manages evaluation of enumerable pipelines.
 * <p><strong>Note: </strong></p>
 * <p>This is an internal class and should not be referenced outside of this package.</p>
 *
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

    public static List<Object> toList(final Iterable<Object> src, final Type elementType) {
        Validate.notNull(src);
        Validate.notNull(elementType);
        final List<Object> result = (List<Object>) Type.forName('List<' + elementType + '>').newInstance();
        for (Object o : src) {
            result.add(o);
        }
        return result;
    }

    public static Set<Object> toObjectSet(final Iterable<Object> src, final IFunction mapper) {
        Validate.notNull(src);
        Validate.notNull(mapper);
        final Set<Object> result = new Set<Object>();
        for (Object o : src) {
            result.add(mapper.apply(o));
        }
        return result;
    }

    private class ObjectComparator implements System.Comparator<Object> {
        private final IComparer comp;
        private ObjectComparator(IComparer comp) { Validate.notNull(comp); this.comp = comp; }
        public Integer compare(Object o1, Object o2) { return comp.compare(o1, o2); }
    }

}
