/**
 * @see FilterIterator
 * @see TakeIterator
 * @see ZipIterator
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc')
private class IteratorsTest {
    private static final List<Object> INTS = new List<Object>{ 1, 2, 3, 4, 5 };

    /**
     * @see BaseIterator
     */
    @IsTest
    private static void base() {
        // Given
        BaseIterator iterator = new ConcatIterator(new List<Iterable<Object>>{ INTS }, Integer.class);
        // When
        Boolean hasNext = iterator.hasNext();
        Boolean hasNext1 = iterator.hasNext();
        List<Object> actual = StreamPipeline.toList(iterator);
        Exception exc;
        try {
            iterator.next();
        } catch (NoSuchElementException e) {
            exc = e;
        }
        // Then
        Assert.isTrue(hasNext);
        Assert.isTrue(hasNext1);
        Assert.areEqual(INTS, actual);
        Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
    }

    /**
     * @see ConcatIterator
     */
    @IsTest
    private static void concat() {
        // Given
        List<Iterable<Object>> input = new List<Iterable<Object>>{
            new List<Object>(),
            new List<Object>{ 1, 2 },
            new List<Object>(),
            new List<Object>{ 3 }
        };
        ConcatIterator iterator = new ConcatIterator(input, Integer.class);
        AsTestCommons.CountingIterable source = new AsTestCommons.CountingIterable(INTS);
        ConcatIterator lazyIterator = new ConcatIterator(new List<Iterable<Object>>{ source }, Integer.class);
        // When
        List<Object> actual = StreamPipeline.toList(iterator);
        Object actual1 = lazyIterator.next();
        Exception exc;
        try {
            iterator.next();
        } catch (NoSuchElementException e) {
            exc = e;
        }
        // Then
        Assert.areEqual(new List<Object>{ 1, 2, 3 }, actual);
        Assert.areEqual(1, actual1);
        Assert.areEqual(1, source.nextCalls, 'ConcatIterator consumed the next element eagerly');
        Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
    }

    /**
     * @see DistinctIterator
     */
    @IsTest
    private static void distinct() {
        // Given
        DistinctIterator iterator = new DistinctIterator(new List<Object>{ 1, 2, 1, 3, 2 }.iterator());
        DistinctIterator classifiedIterator = new DistinctIterator(
            new List<Object>{ 'a', 'A', 'b', 'B' }.iterator(),
            new AsTestCommons.ToUpperCaseFunction()
        );
        AsTestCommons.CountingFunction classifier = new AsTestCommons.CountingFunction();
        DistinctIterator lazyIterator = new DistinctIterator(INTS.iterator(), classifier);
        // When
        List<Object> actual = StreamPipeline.toList(iterator);
        List<Object> actual1 = StreamPipeline.toList(classifiedIterator);
        Object actual2 = lazyIterator.next();
        // Then
        Assert.areEqual(new List<Object>{ 1, 2, 3 }, actual);
        Assert.areEqual(new List<Object>{ 'a', 'b' }, actual1);
        Assert.areEqual(1, actual2);
        Assert.areEqual(1, classifier.calls, 'DistinctIterator evaluated the next element eagerly');
    }

    /**
     * @see DropIterator
     */
    @IsTest
    private static void drop() {
        // Given
        DropIterator iterator = new DropIterator(INTS.iterator(), new AsTestCommons.IsLessPredicate(4));
        DropIterator emptyIterator = new DropIterator(INTS.iterator(), Predicate.always(true));
        AsTestCommons.CountingIterable source = new AsTestCommons.CountingIterable(INTS);
        DropIterator lazyIterator = new DropIterator(source.iterator(), Predicate.always(false));
        // When
        List<Object> actual = StreamPipeline.toList(iterator);
        List<Object> actual1 = StreamPipeline.toList(emptyIterator);
        Object actual2 = lazyIterator.next();
        // Then
        Assert.areEqual(new List<Object>{ 4, 5 }, actual);
        Assert.areEqual(new List<Object>(), actual1);
        Assert.areEqual(1, actual2);
        Assert.areEqual(1, source.nextCalls, 'DropIterator consumed the next element eagerly');
    }

    /**
     * @see FilterIterator
     */
    @IsTest
    private static void filter() {
        // Given
        FilterIterator iterator = new FilterIterator(
            INTS.iterator(),
            EnumerableSupport.isIn(new List<Object>{ 2, 4 })
        );
        AsTestCommons.CountingPredicate predicate = new AsTestCommons.CountingPredicate();
        FilterIterator lazyIterator = new FilterIterator(INTS.iterator(), predicate);
        // When
        List<Object> actual = StreamPipeline.toList(iterator);
        Object actual1 = lazyIterator.next();
        Exception exc;
        try {
            iterator.next();
        } catch (NoSuchElementException e) {
            exc = e;
        }
        // Then
        Assert.areEqual(new List<Object>{ 2, 4 }, actual);
        Assert.areEqual(1, actual1);
        Assert.areEqual(1, predicate.calls, 'FilterIterator evaluated the next element eagerly');
        Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
    }

    /**
     * @see FlatMapIterator
     */
    @IsTest
    private static void flatMap() {
        // Given
        List<Object> input = new List<Object>{ new List<Object>{ 1, 2 }, null, new List<Object>{ 3 } };
        List<Object> deepInput = new List<Object>{
            new List<Object>{ new List<Object>{ 1, 2 }, 3 },
            null,
            4
        };
        FlatMapIterator iterator = new FlatMapIterator(input.iterator(), Function.identity());
        FlatMapIterator deepIterator = new FlatMapIterator(deepInput.iterator(), Function.identity(), 2);
        FlatMapIterator invalidIterator = new FlatMapIterator(
            new List<Object>{ 1 }.iterator(),
            Function.identity()
        );
        List<Object> lazyInput = new List<Object>{ new List<Object>{ 1 }, new List<Object>{ 2 } };
        AsTestCommons.CountingFunction mapper = new AsTestCommons.CountingFunction();
        FlatMapIterator lazyIterator = new FlatMapIterator(lazyInput.iterator(), mapper);
        // When
        List<Object> actual = StreamPipeline.toList(iterator);
        List<Object> actual1 = StreamPipeline.toList(deepIterator);
        Object actual2 = lazyIterator.next();
        Exception exc;
        try {
            invalidIterator.next();
        } catch (InvalidStateException e) {
            exc = e;
        }
        // Then
        Assert.areEqual(new List<Object>{ 1, 2, 3 }, actual);
        Assert.areEqual(new List<Object>{ 1, 2, 3, null, 4 }, actual1);
        Assert.areEqual(1, actual2);
        Assert.areEqual(1, mapper.calls, 'FlatMapIterator mapped the next element eagerly');
        Assert.areEqual(InvalidStateException.class.getName(), exc.getTypeName());
    }

    /**
     * @see ForEachIterator
     */
    @IsTest
    private static void forEach() {
        // Given
        AsTestCommons.RecordingConsumer consumer = new AsTestCommons.RecordingConsumer();
        ForEachIterator iterator = new ForEachIterator(INTS.iterator(), consumer);
        AsTestCommons.CountingIterable source = new AsTestCommons.CountingIterable(INTS);
        AsTestCommons.RecordingConsumer lazyConsumer = new AsTestCommons.RecordingConsumer();
        ForEachIterator lazyIterator = new ForEachIterator(source.iterator(), lazyConsumer);
        // When
        List<Object> actual = StreamPipeline.toList(iterator);
        Object actual1 = lazyIterator.next();
        Exception exc;
        try {
            iterator.next();
        } catch (NoSuchElementException e) {
            exc = e;
        }
        // Then
        Assert.areEqual(INTS, actual);
        Assert.areEqual(INTS, consumer.values);
        Assert.areEqual(1, actual1);
        Assert.areEqual(1, source.nextCalls);
        Assert.areEqual(new List<Object>{ 1 }, lazyConsumer.values);
        Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
    }

    /**
     * @see IntRangeIterator
     */
    @IsTest
    private static void intRange() {
        // Given
        IntRangeIterator iterator = new IntRangeIterator(1, 3);
        IntRangeIterator emptyIterator = new IntRangeIterator(3, 1);
        Integer maxInt = 2147483647;
        IntRangeIterator maxIterator = new IntRangeIterator(maxInt - 1, maxInt);
        // When
        List<Integer> actual = new List<Integer>();
        while (iterator.hasNext()) {
            actual.add(iterator.next());
        }
        List<Integer> actual1 = new List<Integer>{ maxIterator.next(), maxIterator.next() };
        Exception exc;
        Exception exc1;
        try {
            iterator.next();
        } catch (NoSuchElementException e) {
            exc = e;
        }
        try {
            emptyIterator.next();
        } catch (NoSuchElementException e) {
            exc1 = e;
        }
        // Then
        Assert.areEqual(new List<Integer>{ 1, 2, 3 }, actual);
        Assert.areEqual(new List<Integer>{ maxInt - 1, maxInt }, actual1);
        Assert.isFalse(maxIterator.hasNext());
        Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        Assert.areEqual(NoSuchElementException.class.getName(), exc1.getTypeName());
    }

    /**
     * @see LimitIterator
     */
    @IsTest
    private static void lim() {
        // Given
        LimitIterator iterator = new LimitIterator(INTS.iterator(), 3);
        LimitIterator emptyIterator = new LimitIterator(INTS.iterator(), 0);
        AsTestCommons.CountingIterable source = new AsTestCommons.CountingIterable(INTS);
        LimitIterator lazyIterator = new LimitIterator(source.iterator(), 3);
        // When
        List<Object> actual = StreamPipeline.toList(iterator);
        List<Object> actual1 = StreamPipeline.toList(emptyIterator);
        Object actual2 = lazyIterator.next();
        Exception exc;
        Exception exc1;
        try {
            iterator.next();
        } catch (NoSuchElementException e) {
            exc = e;
        }
        try {
            new LimitIterator(INTS.iterator(), -1);
        } catch (IllegalArgumentException e) {
            exc1 = e;
        }
        // Then
        Assert.areEqual(new List<Object>{ 1, 2, 3 }, actual);
        Assert.areEqual(new List<Object>(), actual1);
        Assert.areEqual(1, actual2);
        Assert.areEqual(1, source.nextCalls);
        Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
    }

    /**
     * @see LongRangeIterator
     */
    @IsTest
    private static void longRange() {
        // Given
        LongRangeIterator iterator = new LongRangeIterator(1L, 3L);
        LongRangeIterator emptyIterator = new LongRangeIterator(3L, 1L);
        Long maxLong = 9223372036854775807L;
        LongRangeIterator maxIterator = new LongRangeIterator(maxLong - 1, maxLong);
        // When
        List<Long> actual = new List<Long>();
        while (iterator.hasNext()) {
            actual.add(iterator.next());
        }
        List<Long> actual1 = new List<Long>{ maxIterator.next(), maxIterator.next() };
        Exception exc;
        Exception exc1;
        try {
            iterator.next();
        } catch (NoSuchElementException e) {
            exc = e;
        }
        try {
            emptyIterator.next();
        } catch (NoSuchElementException e) {
            exc1 = e;
        }
        // Then
        Assert.areEqual(new List<Long>{ 1L, 2L, 3L }, actual);
        Assert.areEqual(new List<Long>{ maxLong - 1, maxLong }, actual1);
        Assert.isFalse(maxIterator.hasNext());
        Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        Assert.areEqual(NoSuchElementException.class.getName(), exc1.getTypeName());
    }

    /**
     * @see MapIterator
     */
    @IsTest
    private static void mapValues() {
        // Given
        MapIterator iterator = new MapIterator(INTS.iterator(), new AsTestCommons.IntToString());
        AsTestCommons.CountingIterable source = new AsTestCommons.CountingIterable(INTS);
        AsTestCommons.CountingFunction mapper = new AsTestCommons.CountingFunction();
        MapIterator lazyIterator = new MapIterator(source.iterator(), mapper);
        // When
        List<Object> actual = StreamPipeline.toList(iterator);
        Object actual1 = lazyIterator.next();
        Exception exc;
        try {
            iterator.next();
        } catch (NoSuchElementException e) {
            exc = e;
        }
        // Then
        Assert.areEqual(new List<Object>{ '1', '2', '3', '4', '5' }, actual);
        Assert.areEqual(1, actual1);
        Assert.areEqual(1, source.nextCalls);
        Assert.areEqual(1, mapper.calls);
        Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
    }

    /**
     * @see ReduceGenerator
     */
    @IsTest
    private static void reduce() {
        // Given
        AsTestCommons.CountingOperator operator = new AsTestCommons.CountingOperator(
            new AsTestCommons.AddIntOp(1)
        );
        ReduceGenerator iterator = new ReduceGenerator(1, operator);
        // When
        List<Object> actual = new List<Object>();
        for (Integer i = 0; i < 4; i++) {
            actual.add(iterator.next());
        }
        // Then
        Assert.areEqual(new List<Object>{ 1, 2, 3, 4 }, actual);
        Assert.areEqual(4, operator.calls);
        Assert.isTrue(iterator.hasNext());
    }

    /**
     * @see SkipIterator
     */
    @IsTest
    private static void skip() {
        // Given
        SkipIterator iterator = new SkipIterator(INTS.iterator(), 2);
        SkipIterator emptyIterator = new SkipIterator(INTS.iterator(), 10);
        AsTestCommons.CountingIterable source = new AsTestCommons.CountingIterable(INTS);
        SkipIterator lazyIterator = new SkipIterator(source.iterator(), 2);
        // When
        List<Object> actual = StreamPipeline.toList(iterator);
        List<Object> actual1 = StreamPipeline.toList(emptyIterator);
        Object actual2 = lazyIterator.next();
        Exception exc;
        Exception exc1;
        try {
            iterator.next();
        } catch (NoSuchElementException e) {
            exc = e;
        }
        try {
            new SkipIterator(INTS.iterator(), -1);
        } catch (IllegalArgumentException e) {
            exc1 = e;
        }
        // Then
        Assert.areEqual(new List<Object>{ 3, 4, 5 }, actual);
        Assert.areEqual(new List<Object>(), actual1);
        Assert.areEqual(3, actual2);
        Assert.areEqual(3, source.nextCalls);
        Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
    }

    /**
     * @see SortIterator
     */
    @IsTest
    private static void sort() {
        // Given
        List<Object> input = new List<Object>{ 3, 1, 2 };
        SortIterator iterator = new SortIterator(input.iterator(), Comparer.defaultOrder());
        SortIterator reverseIterator = new SortIterator(input.iterator(), Comparer.reverseOrder());
        AsTestCommons.CountingIterable source = new AsTestCommons.CountingIterable(input);
        SortIterator bufferingIterator = new SortIterator(source.iterator(), Comparer.defaultOrder());
        // When
        List<Object> actual = StreamPipeline.toList(iterator);
        List<Object> actual1 = StreamPipeline.toList(reverseIterator);
        Object actual2 = bufferingIterator.next();
        // Then
        Assert.areEqual(new List<Object>{ 1, 2, 3 }, actual);
        Assert.areEqual(new List<Object>{ 3, 2, 1 }, actual1);
        Assert.areEqual(new List<Object>{ 3, 1, 2 }, input, Label.AS_ErrorMessage_InputMutated);
        Assert.areEqual(1, actual2);
        Assert.areEqual(3, source.nextCalls);
    }

    /**
     * @see SupplierGenerator
     */
    @IsTest
    private static void supplier() {
        // Given
        AsTestCommons.CountingSupplier supplier = new AsTestCommons.CountingSupplier(
            new AsTestCommons.IncrementSupplier(1, 2)
        );
        SupplierGenerator iterator = new SupplierGenerator(supplier);
        // When
        List<Object> actual = new List<Object>();
        for (Integer i = 0; i < 3; i++) {
            actual.add(iterator.next());
        }
        // Then
        Assert.areEqual(new List<Object>{ 1, 3, 5 }, actual);
        Assert.areEqual(3, supplier.calls);
        Assert.isTrue(iterator.hasNext());
    }

    /**
     * @see TakeIterator
     */
    @IsTest
    private static void take() {
        // Given
        TakeIterator iterator = new TakeIterator(INTS.iterator(), new AsTestCommons.IsLessPredicate(4));
        AsTestCommons.CountingPredicate predicate = new AsTestCommons.CountingPredicate();
        TakeIterator lazyIterator = new TakeIterator(INTS.iterator(), predicate);
        // When
        List<Object> actual = StreamPipeline.toList(iterator);
        Object actual1 = lazyIterator.next();
        Exception exc;
        try {
            iterator.next();
        } catch (NoSuchElementException e) {
            exc = e;
        }
        // Then
        Assert.areEqual(new List<Object>{ 1, 2, 3 }, actual);
        Assert.areEqual(1, actual1);
        Assert.areEqual(1, predicate.calls, 'TakeIterator evaluated the next element eagerly');
        Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
    }

    /**
     * @see ZipIterator
     */
    @IsTest
    private static void zip() {
        // Given
        List<Object> left = new List<Object>{ 1, 2, 3 };
        List<Object> right = new List<Object>{ 10, 20 };
        List<Object> filteredRight = new List<Object>{ 1, 4, 3 };
        ZipIterator iterator = new ZipIterator(left, right, new AsTestCommons.SumIntBiOperator());
        ZipIterator filteredIterator = new ZipIterator(
            left,
            filteredRight,
            new AsTestCommons.AreNotEqual(),
            new AsTestCommons.SumIntBiOperator()
        );
        AsTestCommons.CountingBiOperator combiner = new AsTestCommons.CountingBiOperator(
            new AsTestCommons.SumIntBiOperator()
        );
        ZipIterator lazyIterator = new ZipIterator(INTS, INTS, combiner);
        // When
        List<Object> actual = StreamPipeline.toList(iterator);
        List<Object> actual1 = StreamPipeline.toList(filteredIterator);
        Object actual2 = lazyIterator.next();
        Exception exc;
        try {
            iterator.next();
        } catch (NoSuchElementException e) {
            exc = e;
        }
        // Then
        Assert.areEqual(new List<Object>{ 11, 22 }, actual);
        Assert.areEqual(new List<Object>{ 6 }, actual1);
        Assert.areEqual(2, actual2);
        Assert.areEqual(1, combiner.calls, 'ZipIterator combined the next pair eagerly');
        Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
    }
}
