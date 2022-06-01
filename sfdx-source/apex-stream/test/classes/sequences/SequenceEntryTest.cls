/**
 * @author Oleh Berehovskyi
 * @see Sequence
 */
@IsTest(IsParallel = true)
private class SequenceEntryTest {

    private static List<Integer> ints = IterTestUtils.generateInts();
    private static List<Long> longs = IterTestUtils.generateLongs();
    private static List<Double> doubles = IterTestUtils.generateDoubles();
    private static List<Account> accounts = IterTestUtils.generateAccounts();
    private static List<IterTestUtils.Person> people = IterTestUtils.generatePersons();
    private static List<String> strings = IterTestUtils.generateStrings();
    private static List<Comparable> comparables = IterTestUtils.generateComparables();

    /**
     * @see Sequence.of
     */
    @IsTest
    static void of() {
        // When
        IIntIterable stream0 = Sequence.of(ints);
        ILongIterable stream1 = Sequence.of(longs);
        IDoubleIterable stream2 = Sequence.of(doubles);
        ISObjectIterable stream3 = Sequence.of(accounts);
        IObjectIterable stream4 = Sequence.of(people);
        IObjectIterable stream5 = Sequence.of(strings);
        IObjectIterable stream6 = Sequence.of(comparables);
        IIntIterable stream7 = Sequence.of(new Set<Integer>(ints));
        ILongIterable stream8 = Sequence.of(new Set<Long>(longs));
        IDoubleIterable stream9 = Sequence.of(new Set<Double>(doubles));
        ISObjectIterable stream10 = Sequence.of(new Set<SObject>{ accounts[0] });
        IObjectIterable stream11 = Sequence.of(new Set<Object>{ people[0] });
        IObjectIterable stream12 = Sequence.of(new Set<Object>{ strings[0] });
        IObjectIterable stream13 = Sequence.of(new Set<Object>{ comparables[0] });
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
        IIntIterable stream0 = Sequence.ofNullable(ints);
        ILongIterable stream1 = Sequence.ofNullable(longs);
        IDoubleIterable stream2 = Sequence.ofNullable(doubles);
        ISObjectIterable stream3 = Sequence.ofNullable(accounts);
        IObjectIterable stream4 = Sequence.ofNullable(people);
        IObjectIterable stream5 = Sequence.ofNullable(strings);
        IObjectIterable stream6 = Sequence.ofNullable(comparables);
        IIntIterable stream7 = Sequence.ofNullable(new Set<Integer>(ints));
        ILongIterable stream8 = Sequence.ofNullable(new Set<Long>(longs));
        IDoubleIterable stream9 = Sequence.ofNullable(new Set<Double>(doubles));
        ISObjectIterable stream10 = Sequence.ofNullable(new Set<SObject>{ accounts[0] });
        IObjectIterable stream11 = Sequence.ofNullable(new Set<Object>{ people[0] });
        IObjectIterable stream12 = Sequence.ofNullable(new Set<Object>{ strings[0] });
        IObjectIterable stream13 = Sequence.ofNullable(new Set<Object>{ comparables[0] });
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
        IIntIterable stream0 = Sequence.concat(Sequence.of(ints), Sequence.of(ints));
        ILongIterable stream1 = Sequence.concat(Sequence.of(longs), Sequence.of(longs));
        IDoubleIterable stream2 = Sequence.concat(Sequence.of(doubles), Sequence.of(doubles));
        ISObjectIterable stream3 = Sequence.concat(Sequence.of(accounts), Sequence.of(accounts));
        IObjectIterable stream4 = Sequence.concat(Sequence.of(people), Sequence.of(people));
        IObjectIterable stream5 = Sequence.concat(Sequence.of(strings), Sequence.of(strings));
        IObjectIterable stream6 = Sequence.concat(Sequence.of(comparables), Sequence.of(comparables));
        IIntIterable stream7 = Sequence.concat(new List<IIntIterable>{ Sequence.of(ints), Sequence.of(ints) });
        ILongIterable stream8 = Sequence.concat(new List<ILongIterable>{ Sequence.of(longs), Sequence.of(longs) });
        IDoubleIterable stream9 = Sequence.concat(new List<IDoubleIterable>{ Sequence.of(doubles), Sequence.of(doubles) });
        ISObjectIterable stream10 = Sequence.concat(new List<ISObjectIterable>{ Sequence.of(accounts), Sequence.of(accounts) });
        IObjectIterable stream11 = Sequence.concat(new List<IObjectIterable>{ Sequence.of(people), Sequence.of(people) });
        IObjectIterable stream12 = Sequence.concat(new List<IObjectIterable>{ Sequence.of(strings), Sequence.of(strings) });
        IObjectIterable stream13 = Sequence.concat(new List<IObjectIterable>{ Sequence.of(comparables), Sequence.of(comparables) });
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
        IIntIterable stream0 = Sequence.zip(Sequence.of(ints), Sequence.of(ints), IntBinaryOperator.max());
        ILongIterable stream1 = Sequence.zip(Sequence.of(longs), Sequence.of(longs), LongBinaryOperator.max());
        IDoubleIterable stream2 = Sequence.zip(Sequence.of(doubles), Sequence.of(doubles), DoubleBinaryOperator.max());
        ISObjectIterable stream3 = Sequence.zip(Sequence.of(accounts), Sequence.of(accounts), SObjectBinaryOperator.maxBy(SObjectComparator.comparing(Account.NumberOfEmployees)));
        ISObjectIterable stream4 = Sequence.zip(Sequence.of(accounts), Sequence.of(accounts), SObjectBiPredicate.areEqual(), SObjectBinaryOperator.maxBy(SObjectComparator.comparing(Account.NumberOfEmployees)));
        IObjectIterable stream5 = Sequence.zip(Sequence.of(strings), Sequence.of(strings), StringBinaryOperator.concat());
        IObjectIterable stream6 = Sequence.zip(Sequence.of(strings), Sequence.of(strings), BiPredicate.areNotEqual(), StringBinaryOperator.concat());
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
