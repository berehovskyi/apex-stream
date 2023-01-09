/**
 * @see Stream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class StreamTest {

    private static final List<Integer> INTS = IterTestUtils.generateInts();
    private static final List<Long> LONGS = IterTestUtils.generateLongs();
    private static final List<Double> DOUBLES = IterTestUtils.generateDoubles();
    private static final List<Account> ACCOUNTS = IterTestUtils.generateAccounts();
    private static final List<IterTestUtils.Person> PEOPLE = IterTestUtils.generatePersons();
    private static final List<String> STRINGS = IterTestUtils.generateStrings();
    private static final List<Comparable> COMPARABLES = IterTestUtils.generateComparables();

    /**
     * @see Stream.of
     */
    @IsTest
    static void of() {
        // When
        new Stream();
        IIntIterable stream0 = Stream.of(INTS);
        ILongIterable stream1 = Stream.of(LONGS);
        IDoubleIterable stream2 = Stream.of(DOUBLES);
        ISObjectIterable stream3 = Stream.of(ACCOUNTS);
        IObjectIterable stream4 = Stream.of(PEOPLE);
        IObjectIterable stream5 = Stream.of(STRINGS);
        IObjectIterable stream6 = Stream.of(COMPARABLES);
        IIntIterable stream7 = Stream.of(new Set<Integer>(INTS));
        ILongIterable stream8 = Stream.of(new Set<Long>(LONGS));
        IDoubleIterable stream9 = Stream.of(new Set<Double>(DOUBLES));
        ISObjectIterable stream10 = Stream.of(new Set<SObject>{ ACCOUNTS[0] });
        IObjectIterable stream11 = Stream.of(new Set<Object>{ PEOPLE[0] });
        IObjectIterable stream12 = Stream.of(new Set<Object>{ STRINGS[0] });
        IObjectIterable stream13 = Stream.of(new Set<Object>{ COMPARABLES[0] });
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
        IIntIterable stream0 = Stream.ofNullable(INTS);
        ILongIterable stream1 = Stream.ofNullable(LONGS);
        IDoubleIterable stream2 = Stream.ofNullable(DOUBLES);
        ISObjectIterable stream3 = Stream.ofNullable(ACCOUNTS);
        IObjectIterable stream4 = Stream.ofNullable(PEOPLE);
        IObjectIterable stream5 = Stream.ofNullable(STRINGS);
        IObjectIterable stream6 = Stream.ofNullable(COMPARABLES);
        IIntIterable stream7 = Stream.ofNullable(new Set<Integer>(INTS));
        ILongIterable stream8 = Stream.ofNullable(new Set<Long>(LONGS));
        IDoubleIterable stream9 = Stream.ofNullable(new Set<Double>(DOUBLES));
        ISObjectIterable stream10 = Stream.ofNullable(new Set<SObject>{ ACCOUNTS[0] });
        IObjectIterable stream11 = Stream.ofNullable(new Set<Object>{ PEOPLE[0] });
        IObjectIterable stream12 = Stream.ofNullable(new Set<Object>{ STRINGS[0] });
        IObjectIterable stream13 = Stream.ofNullable(new Set<Object>{ COMPARABLES[0] });
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
        IIntIterable stream0 = Stream.concat(Stream.of(INTS), Stream.of(INTS));
        ILongIterable stream1 = Stream.concat(Stream.of(LONGS), Stream.of(LONGS));
        IDoubleIterable stream2 = Stream.concat(Stream.of(DOUBLES), Stream.of(DOUBLES));
        ISObjectIterable stream3 = Stream.concat(Stream.of(ACCOUNTS), Stream.of(ACCOUNTS));
        IObjectIterable stream4 = Stream.concat(Stream.of(PEOPLE), Stream.of(PEOPLE));
        IObjectIterable stream5 = Stream.concat(Stream.of(STRINGS), Stream.of(STRINGS));
        IObjectIterable stream6 = Stream.concat(Stream.of(COMPARABLES), Stream.of(COMPARABLES));
        IIntIterable stream7 = Stream.concat(new List<IIntIterable>{ Stream.of(INTS), Stream.of(INTS) });
        ILongIterable stream8 = Stream.concat(new List<ILongIterable>{ Stream.of(LONGS), Stream.of(LONGS) });
        IDoubleIterable stream9 = Stream.concat(new List<IDoubleIterable>{ Stream.of(DOUBLES), Stream.of(DOUBLES) });
        ISObjectIterable stream10 = Stream.concat(new List<ISObjectIterable>{ Stream.of(ACCOUNTS), Stream.of(ACCOUNTS) });
        IObjectIterable stream11 = Stream.concat(new List<IObjectIterable>{ Stream.of(PEOPLE), Stream.of(PEOPLE) });
        IObjectIterable stream12 = Stream.concat(new List<IObjectIterable>{ Stream.of(STRINGS), Stream.of(STRINGS) });
        IObjectIterable stream13 = Stream.concat(new List<IObjectIterable>{ Stream.of(COMPARABLES), Stream.of(COMPARABLES) });
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
        IIntIterable stream0 = Stream.zip(Stream.of(INTS), Stream.of(INTS), IntBinaryOperators.max());
        ILongIterable stream1 = Stream.zip(Stream.of(LONGS), Stream.of(LONGS), LongBinaryOperators.max());
        IDoubleIterable stream2 = Stream.zip(Stream.of(DOUBLES), Stream.of(DOUBLES), DoubleBinaryOperators.max());
        ISObjectIterable stream3 = Stream.zip(Stream.of(ACCOUNTS), Stream.of(ACCOUNTS), SObjectBinaryOperator.maxBy(SObjectComparator.comparing(Account.NumberOfEmployees)));
        ISObjectIterable stream4 = Stream.zip(Stream.of(ACCOUNTS), Stream.of(ACCOUNTS), SObjectBiPredicates.areEqual(), SObjectBinaryOperator.maxBy(SObjectComparator.comparing(Account.NumberOfEmployees)));
        IObjectIterable stream5 = Stream.zip(Stream.of(STRINGS), Stream.of(STRINGS), new IterTestUtils.Concat());
        IObjectIterable stream6 = Stream.zip(Stream.of(STRINGS), Stream.of(STRINGS), new IterTestUtils.AreNotEqual(), new IterTestUtils.Concat());
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
