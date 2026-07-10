/**
 * @description Manages evaluation of enumerable pipelines.
 * <p><strong>Note: </strong></p>
 * <p>This is an internal class and should not be referenced outside of this package.</p>
 *
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public inherited sharing class EnumerablePipeline {
    public static List<Object> sort(final List<Object> source, final IComparer comparer) {
        AfSupport.notNull(source);
        final List<Object> result = source.clone();
        result.sort(comparer);
        return result;
    }

    public static List<Object> toList(final Iterable<Object> source) {
        return toList(source, Object.class);
    }

    public static List<Object> toList(final Iterable<Object> source, final Type elementType) {
        AfSupport.notNull(source);
        AfSupport.notNull(elementType);
        final List<Object> result = (List<Object>) Type.forName('List<' + elementType + '>').newInstance();
        for (Object o : source) {
            result.add(o);
        }
        return result;
    }

    public static Set<Object> toObjectSet(final Iterable<Object> source, final IFunction mapper) {
        AfSupport.notNull(source);
        AfSupport.notNull(mapper);
        final Set<Object> result = new Set<Object>();
        for (Object o : source) {
            result.add(mapper.apply(o));
        }
        return result;
    }
}
