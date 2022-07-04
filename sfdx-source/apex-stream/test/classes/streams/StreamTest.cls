/**
 * @see Stream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class StreamTest {

    private static List<Integer> ints = IterTestUtils.generateInts();
    private static List<Long> longs = IterTestUtils.generateLongs();
    private static List<Double> doubles = IterTestUtils.generateDoubles();
    private static List<Account> accounts = IterTestUtils.generateAccounts();
    private static List<IterTestUtils.Person> people = IterTestUtils.generatePersons();
    private static List<String> strings = IterTestUtils.generateStrings();
    private static List<Comparable> comparables = IterTestUtils.generateComparables();

    /**
     * @see Stream.of
     */
    @IsTest
    static void of() {
        // When
        new Stream();
        IIntIterable stream0 = Stream.of(ints);
        ILongIterable stream1 = Stream.of(longs);
        IDoubleIterable stream2 = Stream.of(doubles);
        ISObjectIterable stream3 = Stream.of(accounts);
        IObjectIterable stream4 = Stream.of(people);
        IObjectIterable stream5 = Stream.of(strings);
        IObjectIterable stream6 = Stream.of(comparables);
        IIntIterable stream7 = Stream.of(new Set<Integer>(ints));
        ILongIterable stream8 = Stream.of(new Set<Long>(longs));
        IDoubleIterable stream9 = Stream.of(new Set<Double>(doubles));
        ISObjectIterable stream10 = Stream.of(new Set<SObject>{ accounts[0] });
        IObjectIterable stream11 = Stream.of(new Set<Object>{ people[0] });
        IObjectIterable stream12 = Stream.of(new Set<Object>{ strings[0] });
        IObjectIterable stream13 = Stream.of(new Set<Object>{ comparables[0] });
        // Then
        Validate.assert(stream0 instanceof IntStream);
        Validate.assert(stream1 instanceof LongStream);
        Validate.assert(stream2 instanceof DoubleStream);
        Validate.assert(stream3 instanceof SObjectStream);
        Validate.assert(stream4 instanceof ObjectStream);
        Validate.assert(stream5 instanceof ObjectStream);
        Validate.assert(stream6 instanceof ObjectStream);
        Validate.assert(stream7 instanceof IntStream);
        Validate.assert(stream8 instanceof LongStream);
        Validate.assert(stream9 instanceof DoubleStream);
        Validate.assert(stream10 instanceof SObjectStream);
        Validate.assert(stream11 instanceof ObjectStream);
        Validate.assert(stream12 instanceof ObjectStream);
        Validate.assert(stream13 instanceof ObjectStream);
    }
    /**
     * @see Stream.ofNullable
     */
    @IsTest
    static void ofNullable() {
        // When
        IIntIterable stream0 = Stream.ofNullable(ints);
        ILongIterable stream1 = Stream.ofNullable(longs);
        IDoubleIterable stream2 = Stream.ofNullable(doubles);
        ISObjectIterable stream3 = Stream.ofNullable(accounts);
        IObjectIterable stream4 = Stream.ofNullable(people);
        IObjectIterable stream5 = Stream.ofNullable(strings);
        IObjectIterable stream6 = Stream.ofNullable(comparables);
        IIntIterable stream7 = Stream.ofNullable(new Set<Integer>(ints));
        ILongIterable stream8 = Stream.ofNullable(new Set<Long>(longs));
        IDoubleIterable stream9 = Stream.ofNullable(new Set<Double>(doubles));
        ISObjectIterable stream10 = Stream.ofNullable(new Set<SObject>{ accounts[0] });
        IObjectIterable stream11 = Stream.ofNullable(new Set<Object>{ people[0] });
        IObjectIterable stream12 = Stream.ofNullable(new Set<Object>{ strings[0] });
        IObjectIterable stream13 = Stream.ofNullable(new Set<Object>{ comparables[0] });
        // Then
        Validate.assert(stream0 instanceof IntStream);
        Validate.assert(stream1 instanceof LongStream);
        Validate.assert(stream2 instanceof DoubleStream);
        Validate.assert(stream3 instanceof SObjectStream);
        Validate.assert(stream4 instanceof ObjectStream);
        Validate.assert(stream5 instanceof ObjectStream);
        Validate.assert(stream6 instanceof ObjectStream);
        Validate.assert(stream7 instanceof IntStream);
        Validate.assert(stream8 instanceof LongStream);
        Validate.assert(stream9 instanceof DoubleStream);
        Validate.assert(stream10 instanceof SObjectStream);
        Validate.assert(stream11 instanceof ObjectStream);
        Validate.assert(stream12 instanceof ObjectStream);
        Validate.assert(stream13 instanceof ObjectStream);
    }

    /**
     * @see Stream.generate
     */
    @IsTest
    static void generate() {
        // When
        IIntIterable stream0 = Stream.generate(IntSuppliers.increment());
        ILongIterable stream1 = Stream.generate(LongSuppliers.increment());
        IDoubleIterable stream2 = Stream.generate(DoubleSuppliers.random());
        ISObjectIterable stream3 = Stream.generate(SObjectSupplier.of(Account.SObjectType));
        IObjectIterable stream4 = Stream.generate(StringSuppliers.uuid());
        IObjectIterable stream5 = Stream.generate(Supplier.of(List<String>.class));
        // Then
        Validate.assert(stream0 instanceof IntStream);
        Validate.assert(stream1 instanceof LongStream);
        Validate.assert(stream2 instanceof DoubleStream);
        Validate.assert(stream3 instanceof SObjectStream);
        Validate.assert(stream4 instanceof ObjectStream);
        Validate.assert(stream5 instanceof ObjectStream);
    }

    /**
     * @see Stream.iterate
     */
    @IsTest
    static void iterate() {
        // When
        IIntIterable stream0 = Stream.iterate(0, new IterTestUtils.AddIntOp(1));
        ILongIterable stream1 = Stream.iterate(0L, new IterTestUtils.AddLongOp(1));
        IDoubleIterable stream2 = Stream.iterate((Double) 0.0, new IterTestUtils.AddDoubleOp(1));
        ISObjectIterable stream3 = Stream.iterate(new Account(), SObjectUnaryOperator.identity());
        IObjectIterable stream4 = Stream.iterate('', UnaryOperator.constant('a'));
        IIntIterable stream5 = Stream.iterate(0, IntPredicates.isLess(10), new IterTestUtils.AddIntOp(1));
        ILongIterable stream6 = Stream.iterate(0L, LongPredicates.isLess(10L), new IterTestUtils.AddLongOp(1));
        IDoubleIterable stream7 = Stream.iterate((Double) 0.0, DoublePredicates.isLess((Double) 10.0), new IterTestUtils.AddDoubleOp(1));
        ISObjectIterable stream8 = Stream.iterate(new Account(), SObjectPredicates.isSet(Account.Name), SObjectUnaryOperator.identity());
        IObjectIterable stream9 = Stream.iterate('', Predicates.isLess('aaaaaa'), UnaryOperator.constant('a'));
        // Then
        Validate.assert(stream0 instanceof IntStream);
        Validate.assert(stream1 instanceof LongStream);
        Validate.assert(stream2 instanceof DoubleStream);
        Validate.assert(stream3 instanceof SObjectStream);
        Validate.assert(stream4 instanceof ObjectStream);
        Validate.assert(stream5 instanceof IntStream);
        Validate.assert(stream6 instanceof LongStream);
        Validate.assert(stream7 instanceof DoubleStream);
        Validate.assert(stream8 instanceof SObjectStream);
        Validate.assert(stream9 instanceof ObjectStream);
    }

    /**
     * @see Stream.concat
     */
    @IsTest
    static void concat() {
        // When
        IIntIterable stream0 = Stream.concat(Stream.of(ints), Stream.of(ints));
        ILongIterable stream1 = Stream.concat(Stream.of(longs), Stream.of(longs));
        IDoubleIterable stream2 = Stream.concat(Stream.of(doubles), Stream.of(doubles));
        ISObjectIterable stream3 = Stream.concat(Stream.of(accounts), Stream.of(accounts));
        IObjectIterable stream4 = Stream.concat(Stream.of(people), Stream.of(people));
        IObjectIterable stream5 = Stream.concat(Stream.of(strings), Stream.of(strings));
        IObjectIterable stream6 = Stream.concat(Stream.of(comparables), Stream.of(comparables));
        IIntIterable stream7 = Stream.concat(new List<IIntIterable>{ Stream.of(ints), Stream.of(ints) });
        ILongIterable stream8 = Stream.concat(new List<ILongIterable>{ Stream.of(longs), Stream.of(longs) });
        IDoubleIterable stream9 = Stream.concat(new List<IDoubleIterable>{ Stream.of(doubles), Stream.of(doubles) });
        ISObjectIterable stream10 = Stream.concat(new List<ISObjectIterable>{ Stream.of(accounts), Stream.of(accounts) });
        IObjectIterable stream11 = Stream.concat(new List<IObjectIterable>{ Stream.of(people), Stream.of(people) });
        IObjectIterable stream12 = Stream.concat(new List<IObjectIterable>{ Stream.of(strings), Stream.of(strings) });
        IObjectIterable stream13 = Stream.concat(new List<IObjectIterable>{ Stream.of(comparables), Stream.of(comparables) });
        // Then
        Validate.assert(stream0 instanceof IntStream);
        Validate.assert(stream1 instanceof LongStream);
        Validate.assert(stream2 instanceof DoubleStream);
        Validate.assert(stream3 instanceof SObjectStream);
        Validate.assert(stream4 instanceof ObjectStream);
        Validate.assert(stream5 instanceof ObjectStream);
        Validate.assert(stream6 instanceof ObjectStream);
        Validate.assert(stream7 instanceof IntStream);
        Validate.assert(stream8 instanceof LongStream);
        Validate.assert(stream9 instanceof DoubleStream);
        Validate.assert(stream10 instanceof SObjectStream);
        Validate.assert(stream11 instanceof ObjectStream);
        Validate.assert(stream12 instanceof ObjectStream);
        Validate.assert(stream13 instanceof ObjectStream);
    }

    /**
     * @see Stream.zip
     */
    @IsTest
    static void zip() {
        // When
        IIntIterable stream0 = Stream.zip(Stream.of(ints), Stream.of(ints), IntBinaryOperators.max());
        ILongIterable stream1 = Stream.zip(Stream.of(longs), Stream.of(longs), LongBinaryOperators.max());
        IDoubleIterable stream2 = Stream.zip(Stream.of(doubles), Stream.of(doubles), DoubleBinaryOperators.max());
        ISObjectIterable stream3 = Stream.zip(Stream.of(accounts), Stream.of(accounts), SObjectBinaryOperator.maxBy(SObjectComparator.comparing(Account.NumberOfEmployees)));
        ISObjectIterable stream4 = Stream.zip(Stream.of(accounts), Stream.of(accounts), SObjectBiPredicates.areEqual(), SObjectBinaryOperator.maxBy(SObjectComparator.comparing(Account.NumberOfEmployees)));
        IObjectIterable stream5 = Stream.zip(Stream.of(strings), Stream.of(strings), new IterTestUtils.Concat());
        IObjectIterable stream6 = Stream.zip(Stream.of(strings), Stream.of(strings), new IterTestUtils.AreNotEqual(), new IterTestUtils.Concat());
        // Then
        Validate.assert(stream0 instanceof IntStream);
        Validate.assert(stream1 instanceof LongStream);
        Validate.assert(stream2 instanceof DoubleStream);
        Validate.assert(stream3 instanceof SObjectStream);
        Validate.assert(stream4 instanceof SObjectStream);
        Validate.assert(stream5 instanceof ObjectStream);
        Validate.assert(stream6 instanceof ObjectStream);
    }

}
