/**
 * @description Manages evaluation of sequence pipelines.
 * <p><strong>Note: </strong></p>
 * <p>This is an internal class and should not be referenced outside of this package.</p>
 *
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc, PMD.OneDeclarationPerLine')
public inherited sharing class SequencePipeline {
    public static List<Integer> rangeInt(final Integer fromInt, final Integer toInt) {
        AfSupport.notNull(fromInt);
        AfSupport.notNull(toInt);
        final List<Integer> result = new List<Integer>();
        for (Integer i = fromInt; i <= toInt; i++) {
            result.add(i);
        }
        return result;
    }

    public static List<Long> rangeLong(final Long fromLong, final Long toLong) {
        AfSupport.notNull(fromLong);
        AfSupport.notNull(toLong);
        final List<Long> result = new List<Long>();
        for (Long i = fromLong; i <= toLong; i++) {
            result.add(i);
        }
        return result;
    }

    public static List<Object> concat(final List<Iterable<Object>> iterables, final List<Object> result) {
        AfSupport.noNullElements(iterables);
        AfSupport.noNullElements(result);
        for (Integer i = 0, size = iterables.size(); i < size; i++) {
            result.addAll(EnumerablePipeline.toList(iterables[i]));
        }
        return result;
    }

    public static List<Object> zip(
        final Iterable<Object> iterable1,
        final Iterable<Object> iterable2,
        final IBiOperator combiner,
        final List<Object> result
    ) {
        AfSupport.notNull(iterable1);
        AfSupport.notNull(iterable2);
        AfSupport.notNull(combiner);
        AfSupport.notNull(result);
        final List<Object> left = EnumerablePipeline.toList(iterable1);
        final List<Object> right = EnumerablePipeline.toList(iterable2);
        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
            result.add(combiner.apply(left[i], right[i]));
        }
        return result;
    }

    public static List<Object> zip(
        final Iterable<Object> iterable1,
        final Iterable<Object> iterable2,
        final IBiPredicate predicate,
        final IBiOperator combiner,
        final List<Object> result
    ) {
        AfSupport.notNull(iterable1);
        AfSupport.notNull(iterable2);
        AfSupport.notNull(predicate);
        AfSupport.notNull(combiner);
        AfSupport.notNull(result);
        final List<Object> left = EnumerablePipeline.toList(iterable1);
        final List<Object> right = EnumerablePipeline.toList(iterable2);
        for (Integer i = 0, size = Math.min(left.size(), right.size()); i < size; i++) {
            if (predicate.test(left[i], right[i])) {
                result.add(combiner.apply(left[i], right[i]));
            }
        }
        return result;
    }

    public static List<Object> filter(
        final List<Object> source,
        final IPredicate predicate,
        final List<Object> result
    ) {
        AfSupport.notNull(source);
        AfSupport.notNull(predicate);
        AfSupport.notNull(result);
        for (Integer i = 0, size = source.size(); i < size; i++) {
            final Object element = source[i];
            if (predicate.test(element)) {
                result.add(element);
            }
        }
        return result;
    }

    public static List<Object> take(final List<Object> source, final IPredicate predicate, final List<Object> result) {
        AfSupport.notNull(source);
        AfSupport.notNull(predicate);
        AfSupport.notNull(result);
        for (Integer i = 0, size = source.size(); i < size; i++) {
            final Object element = source[i];
            if (predicate.test(element)) {
                result.add(element);
            } else {
                break;
            }
        }
        return result;
    }

    public static List<Object> drop(final List<Object> source, final IPredicate predicate, final List<Object> result) {
        AfSupport.notNull(source);
        AfSupport.notNull(predicate);
        AfSupport.notNull(result);
        Boolean drop = true;
        for (Integer i = 0, size = source.size(); i < size; i++) {
            final Object element = source[i];
            if (!predicate.test(element) || !drop) {
                result.add(element);
                drop = false;
            }
        }
        return result;
    }

    public static List<Object> mapTo(final List<Object> source, final IFunction mapper, final List<Object> result) {
        AfSupport.notNull(source);
        AfSupport.notNull(mapper);
        AfSupport.notNull(result);
        for (Integer i = 0, size = source.size(); i < size; i++) {
            result.add(mapper.apply(source[i]));
        }
        return result;
    }

    public static List<Object> flatMapTo(final List<Object> source, final IFunction mapper, final List<Object> result) {
        return flatMapTo(source, mapper, result, 1);
    }

    public static List<Object> flatMapTo(
        final List<Object> source,
        final IFunction mapper,
        final List<Object> result,
        final Integer depth
    ) {
        return flat(source, mapper, result, depth, false);
    }

    public static List<Object> flat(
        final List<Object> source,
        final IFunction mapper,
        final List<Object> result,
        final Integer depth,
        final Boolean wrapNonIterables
    ) {
        AfSupport.notNull(source);
        AfSupport.notNull(mapper);
        AfSupport.notNull(result);
        AfSupport.notNull(depth);
        AfSupport.notNull(wrapNonIterables);
        AfSupport.positive(depth, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ depth });
        for (Integer i = 0, size = source.size(); i < size; i++) {
            addFlattened(result, mapper.apply(source[i]), depth, wrapNonIterables);
        }
        return result;
    }

    public static void forEach(final List<Object> source, final IConsumer consumer) {
        AfSupport.notNull(source);
        AfSupport.notNull(consumer);
        for (Integer i = 0, size = source.size(); i < size; i++) {
            consumer.accept(source[i]);
        }
    }

    public static List<Object> distinct(final List<Object> source, final List<Object> result) {
        AfSupport.notNull(source);
        AfSupport.notNull(result);
        final Set<Object> sorted = new Set<Object>(source);
        result.addAll(sorted);
        return result;
    }

    public static List<Object> distinct(
        final List<Object> source,
        final IFunction classifier,
        final List<Object> result
    ) {
        AfSupport.notNull(source);
        AfSupport.notNull(classifier);
        AfSupport.notNull(result);
        final Set<Object> classifierResults = new Set<Object>();
        for (Integer i = 0, size = source.size(); i < size; i++) {
            if (classifierResults.add(classifier.apply(source[i]))) {
                result.add(source[i]);
            }
        }
        return result;
    }

    public static List<Object> sort(final List<Object> source) {
        AfSupport.notNull(source);
        final List<Object> clone = source.clone();
        clone.sort();
        return clone;
    }

    public static List<Object> sort(final List<Object> source, final SortOrder order) {
        return sort(source, Comparer.defaultOrder().order(order));
    }

    public static List<Object> sort(final List<Object> source, final IComparer comparer) {
        return EnumerablePipeline.sort(source, comparer);
    }

    public static List<Object> lim(final List<Object> source, final Integer lim, final List<Object> result) {
        AfSupport.notNull(source);
        AfSupport.notNull(lim);
        AfSupport.notNull(result);
        AfSupport.isTrue(lim >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ lim });
        // prettier-ignore
        if (lim == 0) { return result; }
        // prettier-ignore
        if (lim >= source.size()) { return source; }
        for (Integer i = 0; i < lim; i++) {
            result.add(source[i]);
        }
        return result;
    }

    public static List<Object> skip(final List<Object> source, final Integer n, final List<Object> result) {
        AfSupport.notNull(source);
        AfSupport.notNull(n);
        AfSupport.notNull(result);
        AfSupport.isTrue(n >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ n });
        // prettier-ignore
        if (n == 0) { return source; }
        // prettier-ignore
        if (n >= source.size()) { return result; }
        for (Integer i = 0, size = source.size(); i < size; i++) {
            // prettier-ignore
            if (i >= n) { result.add(source[i]); }
        }
        return result;
    }

    public static Object fold(final List<Object> source, final Object identity, final IBiOperator accumulator) {
        AfSupport.notNull(source);
        AfSupport.notNull(accumulator);
        Object result = identity;
        for (Integer i = 0, size = source.size(); i < size; i++) {
            result = accumulator.apply(result, source[i]);
        }
        return result;
    }

    public static Object reduce(final List<Object> source, final IBiOperator accumulator) {
        AfSupport.notNull(source);
        AfSupport.notNull(accumulator);
        Object result;
        for (Integer i = 0, size = source.size(); i < size; i++) {
            result = i == 0 ? source[i] : accumulator.apply(result, source[i]);
        }
        return result;
    }

    public static Object collect(final List<Object> source, final ICollector collector) {
        AfSupport.notNull(source);
        AfSupport.notNull(collector);
        final Object container = collector.supplier().get();
        final IBiConsumer accumulator = collector.accumulator();
        final IFunction finisher = collector.finisher();
        for (Integer i = 0, size = source.size(); i < size; i++) {
            accumulator.accept(container, source[i]);
        }
        return finisher == null ? container : finisher.apply(container);
    }

    public static Object find(final List<Object> source, final IPredicate predicate) {
        AfSupport.notNull(source);
        AfSupport.notNull(predicate);
        for (Integer i = 0, size = source.size(); i < size; i++) {
            // prettier-ignore
            if (predicate.test(source[i])) { return source[i]; }
        }
        return null;
    }

    public static Boolean match(final List<Object> source, final IPredicate predicate, final Integer kind) {
        AfSupport.notNull(source);
        AfSupport.notNull(predicate);
        AfSupport.notNull(kind);
        AfSupport.isTrue(kind == 0 || kind == 1);
        final Boolean isSome = (kind == 0); // some
        final Boolean isEvery = (kind == 1); // every
        for (Integer i = 0, size = source.size(); i < size; i++) {
            final Boolean isMatched = predicate.test(source[i]);
            // prettier-ignore
            if (isMatched ^ isEvery) { return isSome && isMatched; }
        }
        return !isSome;
    }

    public static Object avgInt(final List<Integer> source, final Boolean doAvg) {
        Integer sum = 0;
        Integer i = 0;
        for (Integer size = source.size(); i < size; i++) {
            sum += source[i];
        }
        // prettier-ignore
        if (doAvg) { return i == 0 ? null : (Double) sum / i; }
        return i == 0 ? null : sum;
    }

    public static Object avgLong(final List<Long> source, final Boolean doAvg) {
        Long sum = 0;
        Integer i = 0;
        for (Integer size = source.size(); i < size; i++) {
            sum += source[i];
        }
        // prettier-ignore
        if (doAvg) { return i == 0 ? null : (Double) sum / i; }
        return i == 0 ? null : sum;
    }

    public static List<Object> toList(final List<Object> source, final IFunction mapper, final Type elementType) {
        AfSupport.notNull(source);
        AfSupport.notNull(mapper);
        AfSupport.notNull(elementType);
        final List<Object> result = (List<Object>) Type.forName('List<' + elementType + '>').newInstance();
        for (Integer i = 0, size = source.size(); i < size; i++) {
            result.add(mapper.apply(source[i]));
        }
        return result;
    }

    public static Set<Id> toIdSet(final List<Object> source, final IFunction mapper) {
        AfSupport.notNull(source);
        AfSupport.notNull(mapper);
        final Set<Id> result = new Set<Id>();
        for (Integer i = 0, size = source.size(); i < size; i++) {
            result.add((Id) mapper.apply(source[i]));
        }
        return result;
    }

    public static Set<String> toStringSet(final List<Object> source, final IFunction mapper) {
        AfSupport.notNull(source);
        AfSupport.notNull(mapper);
        final Set<String> result = new Set<String>();
        for (Integer i = 0, size = source.size(); i < size; i++) {
            result.add((String) mapper.apply(source[i]));
        }
        return result;
    }

    public static Set<Object> toObjectSet(final List<Object> source, final IFunction mapper) {
        AfSupport.notNull(source);
        AfSupport.notNull(mapper);
        final Set<Object> result = new Set<Object>();
        for (Integer i = 0, size = source.size(); i < size; i++) {
            result.add(mapper.apply(source[i]));
        }
        return result;
    }

    public static Map<Id, Object> toByIdMap(
        final List<Object> source,
        final IFunction keyMapper,
        final Type valueType
    ) {
        AfSupport.notNull(source);
        AfSupport.notNull(keyMapper);
        AfSupport.notNull(valueType);
        final Map<Id, Object> result = (Map<Id, Object>) Type.forName('Map<Id, ' + valueType + '>').newInstance();
        for (Integer i = 0, size = source.size(); i < size; i++) {
            final Object v = source[i];
            final Id k = (Id) keyMapper.apply(v);
            AfSupport.state(
                !result.containsKey(k),
                Label.AS_ErrorMessage_DuplicateKey,
                new List<Object>{ k, result.get(k), v }
            );
            result.put(k, v);
        }
        return result;
    }

    public static Map<String, Object> toByStringMap(
        final List<Object> source,
        final IFunction keyMapper,
        final Type valueType
    ) {
        AfSupport.notNull(source);
        AfSupport.notNull(keyMapper);
        AfSupport.notNull(valueType);
        final Map<String, Object> result = (Map<String, Object>) Type.forName('Map<String, ' + valueType + '>')
            .newInstance();
        for (Integer i = 0, size = source.size(); i < size; i++) {
            final Object v = source[i];
            final String k = (String) keyMapper.apply(v);
            AfSupport.state(
                !result.containsKey(k),
                Label.AS_ErrorMessage_DuplicateKey,
                new List<Object>{ k, result.get(k), v }
            );
            result.put(k, v);
        }
        return result;
    }

    public static Map<Id, List<Object>> groupById(
        final List<Object> source,
        final IFunction keyMapper,
        final Type listElementType
    ) {
        AfSupport.notNull(source);
        AfSupport.notNull(keyMapper);
        final Map<Id, List<Object>> result = (Map<Id, List<Object>>) Type.forName(
                'Map<Id, List<' + listElementType + '>>'
            )
            .newInstance();
        for (Integer i = 0, size = source.size(); i < size; i++) {
            final Object v = source[i];
            final Id k = (Id) keyMapper.apply(v);
            List<Object> container = result.get(k);
            if (!result.containsKey(k)) {
                container = (List<Object>) Type.forName('List<' + listElementType + '>').newInstance();
                result.put(k, container);
            }
            container.add(v);
        }
        return result;
    }

    public static Map<String, List<Object>> groupByString(
        final List<Object> source,
        final IFunction keyMapper,
        final Type listElementType
    ) {
        AfSupport.notNull(source);
        AfSupport.notNull(keyMapper);
        final Map<String, List<Object>> result = (Map<String, List<Object>>) Type.forName(
                'Map<String, List<' + listElementType + '>>'
            )
            .newInstance();
        for (Integer i = 0, size = source.size(); i < size; i++) {
            final Object v = source[i];
            final String k = (String) keyMapper.apply(v);
            List<Object> container = result.get(k);
            if (!result.containsKey(k)) {
                container = (List<Object>) Type.forName('List<' + listElementType + '>').newInstance();
                result.put(k, container);
            }
            container.add(v);
        }
        return result;
    }

    public static Map<Boolean, List<Object>> partition(
        final List<Object> source,
        final IPredicate predicate,
        final Type listElementType
    ) {
        AfSupport.notNull(source);
        AfSupport.notNull(predicate);
        AfSupport.notNull(listElementType);
        final Map<Boolean, List<Object>> result = (Map<Boolean, List<Object>>) Type.forName(
                'Map<Boolean, List<' + listElementType + '>>'
            )
            .newInstance();
        result.put(true, (List<Object>) Type.forName('List<' + listElementType + '>').newInstance());
        result.put(false, (List<Object>) Type.forName('List<' + listElementType + '>').newInstance());
        for (Integer i = 0, size = source.size(); i < size; i++) {
            final Object o = source[i];
            result.get(predicate.test(o)).add(o);
        }
        return result;
    }

    private static void addFlattened(
        final List<Object> result,
        final Object value,
        final Integer depth,
        final Boolean wrapNonIterables
    ) {
        if (depth == 0) {
            result.add(value);
            return;
        }
        if (value == null) {
            if (wrapNonIterables) {
                result.add(null);
            }
            return;
        }
        if (value instanceof Iterable<Object>) {
            final Iterable<Object> iterable = (Iterable<Object>) value;
            for (Object o : iterable) {
                addFlattened(result, o, depth - 1, wrapNonIterables);
            }
            return;
        }
        if (wrapNonIterables) {
            result.add(value);
            return;
        }
        throw new InvalidStateException('Mapped value must implement Iterable<Object>');
    }
}
