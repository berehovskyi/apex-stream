/**
 * @see Sequence
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class SequenceTest {

    private static final List<Integer> INTS = AsTestData.generateInts();
    private static final List<Long> LONGS = AsTestData.generateLongs();
    private static final List<Double> DOUBLES = AsTestData.generateDoubles();
    private static final List<Account> ACCOUNTS = AsTestData.generateAccounts();
    private static final List<AsPerson> PEOPLE = AsTestData.generatePersons();
    private static final List<String> STRINGS = AsTestData.generateStrings();
    private static final List<Comparable> COMPARABLES = AsTestData.generateComparables();
    
    static {
        new Sequence();
    }

    /**
     * @see Sequence.of
     */
    @IsTest
    static void of() {
        // When
        IIntEnumerable stream0 = Sequence.of(INTS);
        ILongEnumerable stream1 = Sequence.of(LONGS);
        IDoubleEnumerable stream2 = Sequence.of(DOUBLES);
        ISObjectEnumerable stream3 = Sequence.of(ACCOUNTS);
        IObjectEnumerable stream4 = Sequence.of(PEOPLE);
        IObjectEnumerable stream5 = Sequence.of(STRINGS);
        IObjectEnumerable stream6 = Sequence.of(COMPARABLES);
        IIntEnumerable stream7 = Sequence.of(new Set<Integer>(INTS));
        ILongEnumerable stream8 = Sequence.of(new Set<Long>(LONGS));
        IDoubleEnumerable stream9 = Sequence.of(new Set<Double>(DOUBLES));
        ISObjectEnumerable stream10 = Sequence.of(new Set<SObject>{ ACCOUNTS[0] });
        IObjectEnumerable stream11 = Sequence.of(new Set<Object>{ PEOPLE[0] });
        IObjectEnumerable stream12 = Sequence.of(new Set<Object>{ STRINGS[0] });
        IObjectEnumerable stream13 = Sequence.of(new Set<Object>{ COMPARABLES[0] });
        // Then
        Assert.isTrue(stream0 instanceof IntSequence);
        Assert.isTrue(stream1 instanceof LongSequence);
        Assert.isTrue(stream2 instanceof DoubleSequence);
        Assert.isTrue(stream3 instanceof SObjectSequence);
        Assert.isTrue(stream4 instanceof ObjectSequence);
        Assert.isTrue(stream5 instanceof ObjectSequence);
        Assert.isTrue(stream6 instanceof ObjectSequence);
        Assert.isTrue(stream7 instanceof IntSequence);
        Assert.isTrue(stream8 instanceof LongSequence);
        Assert.isTrue(stream9 instanceof DoubleSequence);
        Assert.isTrue(stream10 instanceof SObjectSequence);
        Assert.isTrue(stream11 instanceof ObjectSequence);
        Assert.isTrue(stream12 instanceof ObjectSequence);
        Assert.isTrue(stream13 instanceof ObjectSequence);
    }

    /**
     * @see Sequence.ofNullable
     */
    @IsTest
    static void ofNullable() {
        // When
        IIntEnumerable stream0 = Sequence.ofNullable(INTS);
        ILongEnumerable stream1 = Sequence.ofNullable(LONGS);
        IDoubleEnumerable stream2 = Sequence.ofNullable(DOUBLES);
        ISObjectEnumerable stream3 = Sequence.ofNullable(ACCOUNTS);
        IObjectEnumerable stream4 = Sequence.ofNullable(PEOPLE);
        IObjectEnumerable stream5 = Sequence.ofNullable(STRINGS);
        IObjectEnumerable stream6 = Sequence.ofNullable(COMPARABLES);
        IIntEnumerable stream7 = Sequence.ofNullable(new Set<Integer>(INTS));
        ILongEnumerable stream8 = Sequence.ofNullable(new Set<Long>(LONGS));
        IDoubleEnumerable stream9 = Sequence.ofNullable(new Set<Double>(DOUBLES));
        ISObjectEnumerable stream10 = Sequence.ofNullable(new Set<SObject>{ ACCOUNTS[0] });
        IObjectEnumerable stream11 = Sequence.ofNullable(new Set<Object>{ PEOPLE[0] });
        IObjectEnumerable stream12 = Sequence.ofNullable(new Set<Object>{ STRINGS[0] });
        IObjectEnumerable stream13 = Sequence.ofNullable(new Set<Object>{ COMPARABLES[0] });
        // Then
        Assert.isTrue(stream0 instanceof IntSequence);
        Assert.isTrue(stream1 instanceof LongSequence);
        Assert.isTrue(stream2 instanceof DoubleSequence);
        Assert.isTrue(stream3 instanceof SObjectSequence);
        Assert.isTrue(stream4 instanceof ObjectSequence);
        Assert.isTrue(stream5 instanceof ObjectSequence);
        Assert.isTrue(stream6 instanceof ObjectSequence);
        Assert.isTrue(stream7 instanceof IntSequence);
        Assert.isTrue(stream8 instanceof LongSequence);
        Assert.isTrue(stream9 instanceof DoubleSequence);
        Assert.isTrue(stream10 instanceof SObjectSequence);
        Assert.isTrue(stream11 instanceof ObjectSequence);
        Assert.isTrue(stream12 instanceof ObjectSequence);
        Assert.isTrue(stream13 instanceof ObjectSequence);
    }

}
