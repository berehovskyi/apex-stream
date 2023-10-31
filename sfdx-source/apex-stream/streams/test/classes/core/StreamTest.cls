/**
 * @see Stream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class StreamTest {

    private static final List<Integer> INTS = AsTestData.generateInts();
    private static final List<Long> LONGS = AsTestData.generateLongs();
    private static final List<Double> DOUBLES = AsTestData.generateDoubles();
    private static final List<Account> ACCOUNTS = AsTestData.generateAccounts();
    private static final List<AsPerson> PEOPLE = AsTestData.generatePersons();
    private static final List<String> STRINGS = AsTestData.generateStrings();
    private static final List<Comparable> COMPARABLES = AsTestData.generateComparables();
    
    static {
        new Stream();
    }

    /**
     * @see Stream.of
     */
    @IsTest
    static void of() {
        // When
        IntEnumerable stream0 = Stream.of(INTS);
        LongEnumerable stream1 = Stream.of(LONGS);
        DoubleEnumerable stream2 = Stream.of(DOUBLES);
        SObjectEnumerable stream3 = Stream.of(ACCOUNTS);
        ObjectEnumerable stream4 = Stream.of(PEOPLE);
        ObjectEnumerable stream5 = Stream.of(STRINGS);
        ObjectEnumerable stream6 = Stream.of(COMPARABLES);
        IIntEnumerable stream7 = Stream.of(new Set<Integer>(INTS));
        ILongEnumerable stream8 = Stream.of(new Set<Long>(LONGS));
        IDoubleEnumerable stream9 = Stream.of(new Set<Double>(DOUBLES));
        ISObjectEnumerable stream10 = Stream.of(new Set<SObject>{ ACCOUNTS[0] });
        IObjectEnumerable stream11 = Stream.of(new Set<Object>{ PEOPLE[0] });
        IObjectEnumerable stream12 = Stream.of(new Set<Object>{ STRINGS[0] });
        IObjectEnumerable stream13 = Stream.of(new Set<Object>{ COMPARABLES[0] });
        // Then
        Assert.isTrue(stream0 instanceof IntStream);
        Assert.isTrue(stream1 instanceof LongStream);
        Assert.isTrue(stream2 instanceof DoubleStream);
        Assert.isTrue(stream3 instanceof SObjectStream);
        Assert.isTrue(stream4 instanceof ObjectStream);
        Assert.isTrue(stream5 instanceof ObjectStream);
        Assert.isTrue(stream6 instanceof ObjectStream);
        Assert.isTrue(stream7 instanceof IntStream);
        Assert.isTrue(stream8 instanceof LongStream);
        Assert.isTrue(stream9 instanceof DoubleStream);
        Assert.isTrue(stream10 instanceof SObjectStream);
        Assert.isTrue(stream11 instanceof ObjectStream);
        Assert.isTrue(stream12 instanceof ObjectStream);
        Assert.isTrue(stream13 instanceof ObjectStream);
    }
    /**
     * @see Stream.ofNullable
     */
    @IsTest
    static void ofNullable() {
        // When
        IntEnumerable stream0 = Stream.ofNullable(INTS);
        LongEnumerable stream1 = Stream.ofNullable(LONGS);
        DoubleEnumerable stream2 = Stream.ofNullable(DOUBLES);
        SObjectEnumerable stream3 = Stream.ofNullable(ACCOUNTS);
        ObjectEnumerable stream4 = Stream.ofNullable(PEOPLE);
        ObjectEnumerable stream5 = Stream.ofNullable(STRINGS);
        ObjectEnumerable stream6 = Stream.ofNullable(COMPARABLES);
        IIntEnumerable stream7 = Stream.ofNullable(new Set<Integer>(INTS));
        ILongEnumerable stream8 = Stream.ofNullable(new Set<Long>(LONGS));
        IDoubleEnumerable stream9 = Stream.ofNullable(new Set<Double>(DOUBLES));
        ISObjectEnumerable stream10 = Stream.ofNullable(new Set<SObject>{ ACCOUNTS[0] });
        IObjectEnumerable stream11 = Stream.ofNullable(new Set<Object>{ PEOPLE[0] });
        IObjectEnumerable stream12 = Stream.ofNullable(new Set<Object>{ STRINGS[0] });
        IObjectEnumerable stream13 = Stream.ofNullable(new Set<Object>{ COMPARABLES[0] });
        // Then
        Assert.isTrue(stream0 instanceof IntStream);
        Assert.isTrue(stream1 instanceof LongStream);
        Assert.isTrue(stream2 instanceof DoubleStream);
        Assert.isTrue(stream3 instanceof SObjectStream);
        Assert.isTrue(stream4 instanceof ObjectStream);
        Assert.isTrue(stream5 instanceof ObjectStream);
        Assert.isTrue(stream6 instanceof ObjectStream);
        Assert.isTrue(stream7 instanceof IntStream);
        Assert.isTrue(stream8 instanceof LongStream);
        Assert.isTrue(stream9 instanceof DoubleStream);
        Assert.isTrue(stream10 instanceof SObjectStream);
        Assert.isTrue(stream11 instanceof ObjectStream);
        Assert.isTrue(stream12 instanceof ObjectStream);
        Assert.isTrue(stream13 instanceof ObjectStream);
    }

//    /**
//     * @see Stream.generate
//     */
//    @IsTest
//    static void generate() {
//        // When
//        IIntEnumerable stream0 = Stream.generate(IntSuppliers.increment());
//        ILongEnumerable stream1 = Stream.generate(LongSuppliers.increment());
//        IDoubleEnumerable stream2 = Stream.generate(DoubleSuppliers.random());
//        ISObjectEnumerable stream3 = Stream.generate(SObjectSupplier.of(Account.SObjectType));
//        IEnumerable stream4 = Stream.generate(StringSuppliers.uuid());
//        IEnumerable stream5 = Stream.generate(Supplier.of(List<String>.class));
//        // Then
//        Assert.isTrue(stream0 instanceof IntStream);
//        Assert.isTrue(stream1 instanceof LongStream);
//        Assert.isTrue(stream2 instanceof DoubleStream);
//        Assert.isTrue(stream3 instanceof SObjectStream);
//        Assert.isTrue(stream4 instanceof ObjectStream);
//        Assert.isTrue(stream5 instanceof ObjectStream);
//    }

    /**
     * @see Stream.iterate
     */
    @IsTest
    static void iterate() {
        // When
        IntEnumerable stream0 = Stream.iterate(0, new AsTestCommons.AddIntOp(1));
        LongEnumerable stream1 = Stream.iterate(0L, new AsTestCommons.AddLongOp(1));
        DoubleEnumerable stream2 = Stream.iterate((Double) 0.0, new AsTestCommons.AddDoubleOp(1));
        SObjectEnumerable stream3 = Stream.iterate(new Account(), Operator.identity());
        ObjectEnumerable stream4 = Stream.iterate('', Operator.constant('a'));
        IIntEnumerable stream5 = Stream.iterate(0, new AsTestCommons.IsLessPredicate(10), new AsTestCommons.AddIntOp(1));
        ILongEnumerable stream6 = Stream.iterate(0L, new AsTestCommons.IsLessPredicate(10L), new AsTestCommons.AddLongOp(1));
        IDoubleEnumerable stream7 = Stream.iterate((Double) 0.0, new AsTestCommons.IsLessPredicate((Double) 10.0), new AsTestCommons.AddDoubleOp(1));
        ISObjectEnumerable stream8 = Stream.iterate(new Account(), new AsTestCommons.IsLessPredicate(BaseSObjectFunctions.get('Name'), Function.constant(null)), Operator.identity());
        IObjectEnumerable stream9 = Stream.iterate('', new AsTestCommons.IsLessPredicate('aaaaaa'), Operator.constant('a'));
        // Then
        Assert.isTrue(stream0 instanceof IntStream);
        Assert.isTrue(stream1 instanceof LongStream);
        Assert.isTrue(stream2 instanceof DoubleStream);
        Assert.isTrue(stream3 instanceof SObjectStream);
        Assert.isTrue(stream4 instanceof ObjectStream);
        Assert.isTrue(stream5 instanceof IntStream);
        Assert.isTrue(stream6 instanceof LongStream);
        Assert.isTrue(stream7 instanceof DoubleStream);
        Assert.isTrue(stream8 instanceof SObjectStream);
        Assert.isTrue(stream9 instanceof ObjectStream);
    }

//    /**
//     * @see Stream.concat
//     */
//    @IsTest
//    static void concat() {
//        // When
//        IIntEnumerable stream0 = Stream.concat(Stream.of(INTS), Stream.of(INTS));
//        ILongEnumerable stream1 = Stream.concat(Stream.of(LONGS), Stream.of(LONGS));
//        IDoubleEnumerable stream2 = Stream.concat(Stream.of(DOUBLES), Stream.of(DOUBLES));
//        ISObjectEnumerable stream3 = Stream.concat(Stream.of(ACCOUNTS), Stream.of(ACCOUNTS));
//        IEnumerable stream4 = Stream.concat(Stream.of(PEOPLE), Stream.of(PEOPLE));
//        IEnumerable stream5 = Stream.concat(Stream.of(STRINGS), Stream.of(STRINGS));
//        IEnumerable stream6 = Stream.concat(Stream.of(COMPARABLES), Stream.of(COMPARABLES));
//        IIntEnumerable stream7 = Stream.concat(new List<IIntEnumerable>{ Stream.of(INTS), Stream.of(INTS) });
//        ILongEnumerable stream8 = Stream.concat(new List<ILongEnumerable>{ Stream.of(LONGS), Stream.of(LONGS) });
//        IDoubleEnumerable stream9 = Stream.concat(new List<IDoubleEnumerable>{ Stream.of(DOUBLES), Stream.of(DOUBLES) });
//        ISObjectEnumerable stream10 = Stream.concat(new List<ISObjectEnumerable>{ Stream.of(ACCOUNTS), Stream.of(ACCOUNTS) });
//        IEnumerable stream11 = Stream.concat(new List<IEnumerable>{ Stream.of(PEOPLE), Stream.of(PEOPLE) });
//        IEnumerable stream12 = Stream.concat(new List<IEnumerable>{ Stream.of(STRINGS), Stream.of(STRINGS) });
//        IEnumerable stream13 = Stream.concat(new List<IEnumerable>{ Stream.of(COMPARABLES), Stream.of(COMPARABLES) });
//        // Then
//        Assert.isTrue(stream0 instanceof IntStream);
//        Assert.isTrue(stream1 instanceof LongStream);
//        Assert.isTrue(stream2 instanceof DoubleStream);
//        Assert.isTrue(stream3 instanceof SObjectStream);
//        Assert.isTrue(stream4 instanceof ObjectStream);
//        Assert.isTrue(stream5 instanceof ObjectStream);
//        Assert.isTrue(stream6 instanceof ObjectStream);
//        Assert.isTrue(stream7 instanceof IntStream);
//        Assert.isTrue(stream8 instanceof LongStream);
//        Assert.isTrue(stream9 instanceof DoubleStream);
//        Assert.isTrue(stream10 instanceof SObjectStream);
//        Assert.isTrue(stream11 instanceof ObjectStream);
//        Assert.isTrue(stream12 instanceof ObjectStream);
//        Assert.isTrue(stream13 instanceof ObjectStream);
//    }
//
//    /**
//     * @see Stream.zip
//     */
//    @IsTest
//    static void zip() {
//        // When
//        IIntEnumerable stream0 = Stream.zip(Stream.of(INTS), Stream.of(INTS), IntBiOperators.max());
//        ILongEnumerable stream1 = Stream.zip(Stream.of(LONGS), Stream.of(LONGS), LongBiOperators.max());
//        IDoubleEnumerable stream2 = Stream.zip(Stream.of(DOUBLES), Stream.of(DOUBLES), DoubleBiOperators.max());
//        ISObjectEnumerable stream3 = Stream.zip(Stream.of(ACCOUNTS), Stream.of(ACCOUNTS), SObjectBinaryOperator.maxBy(SObjectComparer.comparing(Account.NumberOfEmployees)));
//        ISObjectEnumerable stream4 = Stream.zip(Stream.of(ACCOUNTS), Stream.of(ACCOUNTS), SObjectBiPredicates.areEqual(), SObjectBinaryOperator.maxBy(SObjectComparer.comparing(Account.NumberOfEmployees)));
//        IEnumerable stream5 = Stream.zip(Stream.of(STRINGS), Stream.of(STRINGS), new IterTestUtils.Concat());
//        IEnumerable stream6 = Stream.zip(Stream.of(STRINGS), Stream.of(STRINGS), new IterTestUtils.AreNotEqual(), new IterTestUtils.Concat());
//        // Then
//        Assert.isTrue(stream0 instanceof IntStream);
//        Assert.isTrue(stream1 instanceof LongStream);
//        Assert.isTrue(stream2 instanceof DoubleStream);
//        Assert.isTrue(stream3 instanceof SObjectStream);
//        Assert.isTrue(stream4 instanceof SObjectStream);
//        Assert.isTrue(stream5 instanceof ObjectStream);
//        Assert.isTrue(stream6 instanceof ObjectStream);
//    }

}
