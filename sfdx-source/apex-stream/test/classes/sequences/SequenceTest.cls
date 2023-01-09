/**
 * @see Sequence
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SequenceTest {

    private static final List<Integer> INTS = IterTestUtils.generateInts();
    private static final List<Long> LONGS = IterTestUtils.generateLongs();
    private static final List<Double> DOUBLES = IterTestUtils.generateDoubles();
    private static final List<Account> ACCOUNTS = IterTestUtils.generateAccounts();
    private static final List<IterTestUtils.Person> PEOPLE = IterTestUtils.generatePersons();
    private static final List<String> STRINGS = IterTestUtils.generateStrings();
    private static final List<Comparable> COMPARABLES = IterTestUtils.generateComparables();

    /**
     * @see Sequence.of
     */
    @IsTest
    static void of() {
        // When
        new Sequence();
        IIntIterable stream0 = Sequence.of(INTS);
        ILongIterable stream1 = Sequence.of(LONGS);
        IDoubleIterable stream2 = Sequence.of(DOUBLES);
        ISObjectIterable stream3 = Sequence.of(ACCOUNTS);
        IObjectIterable stream4 = Sequence.of(PEOPLE);
        IObjectIterable stream5 = Sequence.of(STRINGS);
        IObjectIterable stream6 = Sequence.of(COMPARABLES);
        IIntIterable stream7 = Sequence.of(new Set<Integer>(INTS));
        ILongIterable stream8 = Sequence.of(new Set<Long>(LONGS));
        IDoubleIterable stream9 = Sequence.of(new Set<Double>(DOUBLES));
        ISObjectIterable stream10 = Sequence.of(new Set<SObject>{ ACCOUNTS[0] });
        IObjectIterable stream11 = Sequence.of(new Set<Object>{ PEOPLE[0] });
        IObjectIterable stream12 = Sequence.of(new Set<Object>{ STRINGS[0] });
        IObjectIterable stream13 = Sequence.of(new Set<Object>{ COMPARABLES[0] });
        // Then
        Validate.assert(stream0 instanceof IntSequence);
        Validate.assert(stream1 instanceof LongSequence);
        Validate.assert(stream2 instanceof DoubleSequence);
        Validate.assert(stream3 instanceof SObjectSequence);
        Validate.assert(stream4 instanceof ObjectSequence);
        Validate.assert(stream5 instanceof ObjectSequence);
        Validate.assert(stream6 instanceof ObjectSequence);
        Validate.assert(stream7 instanceof IntSequence);
        Validate.assert(stream8 instanceof LongSequence);
        Validate.assert(stream9 instanceof DoubleSequence);
        Validate.assert(stream10 instanceof SObjectSequence);
        Validate.assert(stream11 instanceof ObjectSequence);
        Validate.assert(stream12 instanceof ObjectSequence);
        Validate.assert(stream13 instanceof ObjectSequence);
    }
    /**
     * @see Sequence.ofNullable
     */
    @IsTest
    static void ofNullable() {
        // When
        IIntIterable stream0 = Sequence.ofNullable(INTS);
        ILongIterable stream1 = Sequence.ofNullable(LONGS);
        IDoubleIterable stream2 = Sequence.ofNullable(DOUBLES);
        ISObjectIterable stream3 = Sequence.ofNullable(ACCOUNTS);
        IObjectIterable stream4 = Sequence.ofNullable(PEOPLE);
        IObjectIterable stream5 = Sequence.ofNullable(STRINGS);
        IObjectIterable stream6 = Sequence.ofNullable(COMPARABLES);
        IIntIterable stream7 = Sequence.ofNullable(new Set<Integer>(INTS));
        ILongIterable stream8 = Sequence.ofNullable(new Set<Long>(LONGS));
        IDoubleIterable stream9 = Sequence.ofNullable(new Set<Double>(DOUBLES));
        ISObjectIterable stream10 = Sequence.ofNullable(new Set<SObject>{ ACCOUNTS[0] });
        IObjectIterable stream11 = Sequence.ofNullable(new Set<Object>{ PEOPLE[0] });
        IObjectIterable stream12 = Sequence.ofNullable(new Set<Object>{ STRINGS[0] });
        IObjectIterable stream13 = Sequence.ofNullable(new Set<Object>{ COMPARABLES[0] });
        // Then
        Validate.assert(stream0 instanceof IntSequence);
        Validate.assert(stream1 instanceof LongSequence);
        Validate.assert(stream2 instanceof DoubleSequence);
        Validate.assert(stream3 instanceof SObjectSequence);
        Validate.assert(stream4 instanceof ObjectSequence);
        Validate.assert(stream5 instanceof ObjectSequence);
        Validate.assert(stream6 instanceof ObjectSequence);
        Validate.assert(stream7 instanceof IntSequence);
        Validate.assert(stream8 instanceof LongSequence);
        Validate.assert(stream9 instanceof DoubleSequence);
        Validate.assert(stream10 instanceof SObjectSequence);
        Validate.assert(stream11 instanceof ObjectSequence);
        Validate.assert(stream12 instanceof ObjectSequence);
        Validate.assert(stream13 instanceof ObjectSequence);
    }

    /**
     * @see Sequence.concat
     */
    @IsTest
    static void concat() {
        // When
        IIntIterable stream0 = Sequence.concat(Sequence.of(INTS), Sequence.of(INTS));
        ILongIterable stream1 = Sequence.concat(Sequence.of(LONGS), Sequence.of(LONGS));
        IDoubleIterable stream2 = Sequence.concat(Sequence.of(DOUBLES), Sequence.of(DOUBLES));
        ISObjectIterable stream3 = Sequence.concat(Sequence.of(ACCOUNTS), Sequence.of(ACCOUNTS));
        IObjectIterable stream4 = Sequence.concat(Sequence.of(PEOPLE), Sequence.of(PEOPLE));
        IObjectIterable stream5 = Sequence.concat(Sequence.of(STRINGS), Sequence.of(STRINGS));
        IObjectIterable stream6 = Sequence.concat(Sequence.of(COMPARABLES), Sequence.of(COMPARABLES));
        IIntIterable stream7 = Sequence.concat(new List<IIntIterable>{ Sequence.of(INTS), Sequence.of(INTS) });
        ILongIterable stream8 = Sequence.concat(new List<ILongIterable>{ Sequence.of(LONGS), Sequence.of(LONGS) });
        IDoubleIterable stream9 = Sequence.concat(new List<IDoubleIterable>{ Sequence.of(DOUBLES), Sequence.of(DOUBLES) });
        ISObjectIterable stream10 = Sequence.concat(new List<ISObjectIterable>{ Sequence.of(ACCOUNTS), Sequence.of(ACCOUNTS) });
        IObjectIterable stream11 = Sequence.concat(new List<IObjectIterable>{ Sequence.of(PEOPLE), Sequence.of(PEOPLE) });
        IObjectIterable stream12 = Sequence.concat(new List<IObjectIterable>{ Sequence.of(STRINGS), Sequence.of(STRINGS) });
        IObjectIterable stream13 = Sequence.concat(new List<IObjectIterable>{ Sequence.of(COMPARABLES), Sequence.of(COMPARABLES) });
        // Then
        Validate.assert(stream0 instanceof IntSequence);
        Validate.assert(stream1 instanceof LongSequence);
        Validate.assert(stream2 instanceof DoubleSequence);
        Validate.assert(stream3 instanceof SObjectSequence);
        Validate.assert(stream4 instanceof ObjectSequence);
        Validate.assert(stream5 instanceof ObjectSequence);
        Validate.assert(stream6 instanceof ObjectSequence);
        Validate.assert(stream7 instanceof IntSequence);
        Validate.assert(stream8 instanceof LongSequence);
        Validate.assert(stream9 instanceof DoubleSequence);
        Validate.assert(stream10 instanceof SObjectSequence);
        Validate.assert(stream11 instanceof ObjectSequence);
        Validate.assert(stream12 instanceof ObjectSequence);
        Validate.assert(stream13 instanceof ObjectSequence);
    }

    /**
     * @see Sequence.zip
     */
    @IsTest
    static void zip() {
        // When
        IIntIterable stream0 = Sequence.zip(Sequence.of(INTS), Sequence.of(INTS), IntBinaryOperators.max());
        ILongIterable stream1 = Sequence.zip(Sequence.of(LONGS), Sequence.of(LONGS), LongBinaryOperators.max());
        IDoubleIterable stream2 = Sequence.zip(Sequence.of(DOUBLES), Sequence.of(DOUBLES), DoubleBinaryOperators.max());
        ISObjectIterable stream3 = Sequence.zip(Sequence.of(ACCOUNTS), Sequence.of(ACCOUNTS), SObjectBinaryOperator.maxBy(SObjectComparator.comparing(Account.NumberOfEmployees)));
        ISObjectIterable stream4 = Sequence.zip(Sequence.of(ACCOUNTS), Sequence.of(ACCOUNTS), SObjectBiPredicates.areEqual(), SObjectBinaryOperator.maxBy(SObjectComparator.comparing(Account.NumberOfEmployees)));
        IObjectIterable stream5 = Sequence.zip(Sequence.of(STRINGS), Sequence.of(STRINGS), new IterTestUtils.Concat());
        IObjectIterable stream6 = Sequence.zip(Sequence.of(STRINGS), Sequence.of(STRINGS), new IterTestUtils.AreNotEqual(), new IterTestUtils.Concat());
        // Then
        Validate.assert(stream0 instanceof IntSequence);
        Validate.assert(stream1 instanceof LongSequence);
        Validate.assert(stream2 instanceof DoubleSequence);
        Validate.assert(stream3 instanceof SObjectSequence);
        Validate.assert(stream4 instanceof SObjectSequence);
        Validate.assert(stream5 instanceof ObjectSequence);
        Validate.assert(stream6 instanceof ObjectSequence);
    }

}
