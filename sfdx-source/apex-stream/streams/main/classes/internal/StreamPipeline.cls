/**
 * @description
 * @author Oleh Berehovskyi
 */
public inherited sharing class StreamPipeline {

    public static Iterator<Integer> rangeInt(final Integer fromInt, final Integer toInt) {
        Validate.notNull(fromInt);
        Validate.notNull(toInt);
        return new IntRangeIterator(fromInt, toInt);
    }

    public static Iterator<Long> rangeLong(final Long fromLong, final Long toLong) {
        Validate.notNull(fromLong);
        Validate.notNull(toLong);
        return new LongRangeIterator(fromLong, toLong);
    }

    public static Iterator<Object> generate(final ISupplier supplier) {
        Validate.notNull(supplier);
        return new SupplierGenerator(supplier);
    }    
    
    public static Iterator<Object> iterate(final Object seed, final IOperator operator) {
        Validate.notNull(operator);
        return new ReduceGenerator(seed, operator);
    }

    public static Iterator<Object> concat(final List<Iterable<Object>> iterables, final Type elementType) {
        Validate.noNullElements(iterables);
        Validate.notNull(elementType);
        final List<Iterator<Object>> result = (List<Iterator<Object>>)
            Type.forName('List<Iterator<' + elementType + '>>').newInstance();
        final Iterator<Iterable<Object>> iterator = iterables.iterator();
        while (iterator.hasNext()) {
            final Iterable<Object> iterable = iterator.next();
            result.add(iterable.iterator());
        }
        return new ConcatIterator(result);
    }

    public static Iterator<Object> zip(
        final Iterable<Object> iterable1,
        final Iterable<Object> iterable2,
        final IBiOperator combiner
    ) {
        Validate.notNull(iterable1);
        Validate.notNull(iterable2);
        Validate.notNull(combiner);
        return new ZipIterator(iterable1.iterator(), iterable2.iterator(), null, combiner);
    }

    public static Iterator<Object> zip(
        final Iterable<Object> iterable1,
        final Iterable<Object> iterable2,
        final IBiPredicate predicate,
        final IBiOperator combiner
    ) {
        Validate.notNull(iterable1);
        Validate.notNull(iterable2);
        Validate.notNull(predicate);
        Validate.notNull(combiner);
        return new ZipIterator(iterable1.iterator(), iterable2.iterator(), predicate, combiner);
    }

    public static Iterator<Object> filter(final Iterator<Object> source, final IPredicate predicate) {
        Validate.notNull(source);
        Validate.notNull(predicate);
        return new FilterIterator(source, predicate);
    }

    public static Iterator<Object> take(final Iterator<Object> source, final IPredicate predicate) {
        Validate.notNull(source);
        Validate.notNull(predicate);
        return new TakeIterator(source, predicate);
    }

    public static Iterator<Object> drop(final Iterator<Object> source, final IPredicate predicate) {
        Validate.notNull(source);
        Validate.notNull(predicate);
        return new DropIterator(source, predicate);
    }

    public static Iterator<Object> mapTo(final Iterator<Object> source, final IFunction mapper) {
        Validate.notNull(source);
        Validate.notNull(mapper);
        return new MapIterator(source, mapper);
    }

    public static Iterator<Object> flatMapTo(final Iterator<Object> source, final IFunction mapper) {
        Validate.notNull(source);
        Validate.notNull(mapper);
        return new FlatMapIterator(source, mapper);
    }

    public static Iterator<Object> forEach(final Iterator<Object> source, final IConsumer consumer) {
        Validate.notNull(source);
        Validate.notNull(consumer);
        return new ForEachIterator(source, consumer);
    }

    public static Iterator<Object> distinct(final Iterator<Object> source) {
        Validate.notNull(source);
        return new DistinctIterator(source, null);
    }

    public static Iterator<Object> distinct(final Iterator<Object> source, final IFunction classifier) {
        Validate.notNull(source);
        Validate.notNull(classifier);
        return new DistinctIterator(source, classifier);
    }

    public static Iterator<Object> sort(final Iterator<Object> source) {
        Validate.notNull(source);
        final List<Object> clone = toList(source);
        clone.sort();
        return clone.iterator();
    }
    
    public static Iterator<Object> sort(final Iterator<Object> source, final SortOrder order) {
        Validate.notNull(order);
        return sort(source, Comparer.defaultOrder().order(order));
    }

    public static Iterator<Object> sort(final Iterator<Object> source, final IComparer comparer) {
        Validate.notNull(source);
        Validate.notNull(comparer);
        return new SortIterator(source, comparer);
    }

    public static Iterator<Object> lim(final Iterator<Object> source, final Integer lim) {
        Validate.notNull(source);
        Validate.notNull(lim);
        Validate.isTrue(lim >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ lim });
        return new LimitIterator(source, lim);
    }

    public static Iterator<Object> skip(final Iterator<Object> source, final Integer n) {
        Validate.notNull(source);
        Validate.notNull(n);
        Validate.isTrue(n >= 0, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ n });
        return new SkipIterator(source, n);
    }

    public static Object reduce(final Iterator<Object> source, final Object identity, final IBiOperator accumulator) {
        Validate.notNull(source);
        Validate.notNull(accumulator);
        Object result = identity;
        while (source.hasNext()) {
            result = accumulator.apply(result, source.next());
        }
        return result;
    }

    public static Object reduce(final Iterator<Object> source, final IBiOperator accumulator) {
        Validate.notNull(source);
        Validate.notNull(accumulator);
        Boolean found = false;
        Object result;
        while (source.hasNext()) {
            final Object value = source.next();
            if (!found) {
                found = true;
                result = value;
            } else {
                result = accumulator.apply(result, value);
            }
        }
        return found ? result : null;
    }

    public static Object collect(final Iterator<Object> source, final ICollector collector) {
        Validate.notNull(source);
        Validate.notNull(collector);
        final Object container = collector.supplier().get();
        final IBiConsumer accumulator = collector.accumulator();
        final IFunction finisher = collector.finisher();
        while (source.hasNext()) {
            accumulator.accept(container, source.next());
        }
        return finisher == null ? container : finisher.apply(container);
    }

    public static Object find(final Iterator<Object> source, final IPredicate predicate) {
        Validate.notNull(source);
        Validate.notNull(predicate);
        while (source.hasNext()) {
            final Object o = source.next();
            if (predicate.test(o)) {
                return o;
            }
        }
        return null;
    }

    public static Boolean match(final Iterator<Object> source, final IPredicate predicate, final Integer kind) {
        Validate.notNull(source);
        Validate.notNull(predicate);
        Validate.notNull(kind);
        Validate.isTrue(kind == 0 || kind == 1);
        final Boolean isSome = (kind == 0); // some
        final Boolean isEvery = (kind == 1); // every
        while (source.hasNext()) {
            final Boolean isMatched = predicate.test(source.next());
            if (isMatched ^ isEvery) {
                return isSome && isMatched;
            }
        }
        return !isSome;
    }

    public static Object avgInt(final Iterator<Integer> source, final Boolean doAvg) {
        Integer sum = 0;
        Integer i = 0;
        while (source.hasNext()) {
            sum += source.next();
            i++;
        }
        if (doAvg) {
            return i == 0 ? null : (Double) sum / i;
        }
        return i == 0 ? null : sum;
    }

    public static Object avgLong(final Iterator<Long> source, final Boolean doAvg) {
        Long sum = 0;
        Integer i = 0;
        while (source.hasNext()) {
            sum += source.next();
            i++;
        }
        if (doAvg) {
            return i == 0 ? null : (Double) sum / i;
        }
        return i == 0 ? null : sum;
    }

    public static Integer count(final Iterator<Object> source) {
        Integer count = 0;
        while (source.hasNext()) {
            source.next();
            count++;
        }
        return count;
    }

    public static Boolean isEmpty(final Iterator<Object> source) {
        return !source.hasNext();
    }

    public static List<Object> toList(final Iterator<Object> source) {
        return toList(source, Object.class);
    }

    public static List<Object> toList(final Iterator<Object> source, final Type elementType) {
        Validate.notNull(source);
        Validate.notNull(elementType);
        final List<Object> result = (List<Object>) Type.forName('List<' + elementType + '>').newInstance();
        while (source.hasNext()) {
            result.add(source.next());
        }
        return result;
    }

    public static List<Object> toList(final Iterator<Object> source, final IFunction mapper, final Type elementType) {
        Validate.notNull(source);
        Validate.notNull(mapper);
        Validate.notNull(elementType);
        final List<Object> result = (List<Object>) Type.forName('List<' + elementType + '>').newInstance();
        while (source.hasNext()) {
            result.add(mapper.apply(source.next()));
        }
        return result;
    }

    public static Set<Integer> toIntSet(final Iterator<Object> source) {
        Validate.notNull(source);
        final Set<Integer> result = new Set<Integer>();
        while (source.hasNext()) {
            result.add((Integer) source.next());
        }
        return result;
    }

    public static Set<Long> toLongSet(final Iterator<Object> source) {
        Validate.notNull(source);
        final Set<Long> result = new Set<Long>();
        while (source.hasNext()) {
            result.add((Long) source.next());
        }
        return result;
    }

    public static Set<Double> toDoubleSet(final Iterator<Object> source) {
        Validate.notNull(source);
        final Set<Double> result = new Set<Double>();
        while (source.hasNext()) {
            result.add((Double) source.next());
        }
        return result;
    }

    public static Set<SObject> toSObjectSet(final Iterator<Object> source) {
        Validate.notNull(source);
        final Set<SObject> result = new Set<SObject>();
        while (source.hasNext()) {
            result.add((SObject) source.next());
        }
        return result;
    }

    public static Set<Object> toObjectSet(final Iterator<Object> source) {
        Validate.notNull(source);
        final Set<Object> result = new Set<Object>();
        while (source.hasNext()) {
            result.add(source.next());
        }
        return result;
    }

    public static Set<Object> toObjectSet(final Iterator<Object> source, final IFunction mapper) {
        Validate.notNull(source);
        final Set<Object> result = new Set<Object>();
        while (source.hasNext()) {
            result.add(mapper.apply(source.next()));
        }
        return result;
    }

    public static Set<Id> toIdSet(final Iterator<Object> iterator, final IFunction mapper) {
        Validate.notNull(iterator);
        Validate.notNull(mapper);
        final Set<Id> result = new Set<Id>();
        while (iterator.hasNext()) {
            result.add((Id) mapper.apply(iterator.next()));
        }
        return result;
    }

    public static Set<String> toStringSet(final Iterator<Object> iterator, final IFunction mapper) {
        Validate.notNull(iterator);
        Validate.notNull(mapper);
        final Set<String> result = new Set<String>();
        while (iterator.hasNext()) {
            result.add((String) mapper.apply(iterator.next()));
        }
        return result;
    }

    public static Map<Id, Object> toByIdMap(
        final Iterator<Object> iterator,
        final IFunction keyMapper,
        final Type valueType
    ) {
        Validate.notNull(iterator);
        Validate.notNull(keyMapper);
        Validate.notNull(valueType);
        final Map<Id, Object> result = (Map<Id, Object>) Type.forName('Map<Id, ' + valueType + '>').newInstance();
        while (iterator.hasNext()) {
            final Object v = iterator.next();
            final Id k = (Id) keyMapper.apply(v);
            Validate.state(
                !result.containsKey(k),
                Label.AS_ErrorMessage_DuplicateKey,
                new List<Object>{ k, result.get(k), v }
            );
            result.put(k, v);
        }
        return result;
    }

    public static Map<String, Object> toByStringMap(
        final Iterator<Object> iterator,
        final IFunction keyMapper,
        final Type valueType
    ) {
        Validate.notNull(iterator);
        Validate.notNull(keyMapper);
        Validate.notNull(valueType);
        final Map<String, Object> result = (Map<String, Object>)
            Type.forName('Map<String, ' + valueType + '>').newInstance();
        while (iterator.hasNext()) {
            final Object v = iterator.next();
            final String k = (String) keyMapper.apply(v);
            Validate.state(
                !result.containsKey(k),
                Label.AS_ErrorMessage_DuplicateKey,
                new List<Object>{ k, result.get(k), v }
            );
            result.put(k, v);
        }
        return result;
    }

    public static Map<Id, List<Object>> groupById(
        final Iterator<Object> iterator,
        final IFunction keyMapper,
        final Type listElementType
    ) {
        Validate.notNull(iterator);
        Validate.notNull(keyMapper);
        final Map<Id, List<Object>> result = (Map<Id, List<Object>>)
            Type.forName('Map<Id, List<' + listElementType + '>>').newInstance();
        while (iterator.hasNext()) {
            final Object v = iterator.next();
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
        final Iterator<Object> iterator,
        final IFunction keyMapper,
        final Type listElementType
    ) {
        Validate.notNull(iterator);
        Validate.notNull(keyMapper);
        final Map<String, List<Object>> result = (Map<String, List<Object>>)
            Type.forName('Map<String, List<' + listElementType + '>>').newInstance();
        while (iterator.hasNext()) {
            final Object v = iterator.next();
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
        final Iterator<Object> iterator,
        final IPredicate predicate,
        final Type listElementType
    ) {
        Validate.notNull(iterator);
        Validate.notNull(predicate);
        final Map<Boolean, List<Object>> result = (Map<Boolean, List<Object>>)
            Type.forName('Map<Boolean, List<' + listElementType + '>>').newInstance();
        result.put(true, (List<Object>) Type.forName('List<' + listElementType + '>').newInstance());
        result.put(false, (List<Object>) Type.forName('List<' + listElementType + '>').newInstance());
        while (iterator.hasNext()) {
            final Object o = iterator.next();
            result.get(predicate.test(o)).add(o);
        }
        return result;
    }

}
