/**
 * @see EnumerableSupport
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexAssertionsShouldIncludeMessage, PMD.ApexUnitTestClassShouldHaveRunAs')
private class EnumerableSupportTest {

    private static final List<Boolean> BOOLS = AsTestData.generateBools();
    private static final List<Id> IDS = AsTestData.generateIds();
    private static final List<Blob> BLOBS = AsTestData.generateBlobs();
    private static final List<Date> DATES = AsTestData.generateDates();
    private static final List<Datetime> DATETIMES = AsTestData.generateDatetimes();
    private static final List<Time> TIMES = AsTestData.generateTimes();
    private static final List<Integer> INTS = AsTestData.generateInts();
    private static final List<Object> INTS1 = AsTestData.generateInts1();
    private static final List<Long> LONGS = AsTestData.generateLongs();
    private static final List<Object> LONGS1 = AsTestData.generateLongs1();
    private static final List<Double> DOUBLES = AsTestData.generateDoubles();
    private static final List<Object> DOUBLES1 = AsTestData.generateDoubles1();
    private static final List<String> STRINGS = AsTestData.generateStrings();
    private static final List<Object> CONTACTS = AsTestData.generateContacts1();
    private static final List<Comparable> COMPARABLES = AsTestData.generateComparables();
    private static final List<AsPerson> PEOPLE = AsTestData.generatePersons();
    private static final List<Object> MIX = AsTestData.generateMix();

    /**
     * @see EnumerableSupport.min
     */
    @IsTest
    @SuppressWarnings('PMD.OneDeclarationPerLine')
    static void min() {
        // When
        BiOperator min = EnumerableSupport.min();
        IBiOperator min1 = EnumerableSupport.min();
        // Then
        for (Integer i = 0, size = INTS.size(); i < size; i++) {
            Integer d = INTS[i];
            Integer src = 5;
            Assert.areEqual(Math.min(src, d), min.apply(src, d));
            Assert.areEqual(Math.min(src, d), min1.apply(src, d));
        }
        for (Integer i = 0, size = LONGS.size(); i < size; i++) {
            Long d = LONGS[i];
            Long src = 5L;
            Assert.areEqual(Math.min(src, d), min.apply(src, d));
            Assert.areEqual(Math.min(src, d), min1.apply(src, d));
        }
        for (Integer i = 0, size = DOUBLES.size(); i < size; i++) {
            Double d = DOUBLES[i];
            Double src = 5.0;
            Assert.areEqual(Math.min(src, d), min.apply(src, d));
            Assert.areEqual(Math.min(src, d), min1.apply(src, d));
        }
    }

    /**
     * @see EnumerableSupport.max
     */
    @IsTest
    @SuppressWarnings('PMD.OneDeclarationPerLine')
    static void max() {
        // When
        BiOperator max = EnumerableSupport.max();
        IBiOperator max1 = EnumerableSupport.max();
        // Then
        for (Integer i = 0, size = INTS.size(); i < size; i++) {
            Integer d = INTS[i];
            Integer src = 5;
            Assert.areEqual(Math.max(src, d), max.apply(src, d));
            Assert.areEqual(Math.max(src, d), max1.apply(src, d));
        }
        for (Integer i = 0, size = LONGS.size(); i < size; i++) {
            Long d = LONGS[i];
            Long src = 5L;
            Assert.areEqual(Math.max(src, d), max.apply(src, d));
            Assert.areEqual(Math.max(src, d), max1.apply(src, d));
        }
        for (Integer i = 0, size = DOUBLES.size(); i < size; i++) {
            Double d = DOUBLES[i];
            Double src = 5.0;
            Assert.areEqual(Math.max(src, d), max.apply(src, d));
            Assert.areEqual(Math.max(src, d), max1.apply(src, d));
        }
    }

    /**
     * @see EnumerableSupport.toList
     */
    @IsTest
    static void toList() {
        // When
        List<Boolean> actual = (List<Boolean>) AsTestCommons.collect(BOOLS, EnumerableSupport.toList().cast(List<Boolean>.class));
        List<Id> actual1 = (List<Id>) AsTestCommons.collect(IDS, EnumerableSupport.toList().cast(List<Id>.class));
        List<String> actual2 = (List<String>) AsTestCommons.collect(STRINGS, EnumerableSupport.toList().cast(List<String>.class));
        List<Blob> actual3 = (List<Blob>) AsTestCommons.collect(BLOBS, EnumerableSupport.toList().cast(List<Blob>.class));
        List<Date> actual4 = (List<Date>) AsTestCommons.collect(DATES, EnumerableSupport.toList().cast(List<Date>.class));
        List<Datetime> actual5 = (List<Datetime>) AsTestCommons.collect(DATETIMES, EnumerableSupport.toList().cast(List<Datetime>.class));
        List<Time> actual6 = (List<Time>) AsTestCommons.collect(TIMES, EnumerableSupport.toList().cast(List<Time>.class));
        List<Integer> actual7 = (List<Integer>) AsTestCommons.collect(INTS1, EnumerableSupport.toList().cast(List<Integer>.class));
        List<Long> actual8 = (List<Long>) AsTestCommons.collect(LONGS1, EnumerableSupport.toList().cast(List<Long>.class));
        List<Double> actual9 = (List<Double>) AsTestCommons.collect(DOUBLES1, EnumerableSupport.toList().cast(List<Double>.class));
        List<Contact> actual10 = (List<Contact>) AsTestCommons.collect(CONTACTS, EnumerableSupport.toList().cast(List<SObject>.class));
        List<Object> actual11 = (List<Object>) AsTestCommons.collect(MIX, EnumerableSupport.toList());
        List<AsPerson> actual12 = (List<AsPerson>) AsTestCommons.collect(PEOPLE, EnumerableSupport.toList().cast(List<AsPerson>.class));
        List<Comparable> actual13 = (List<Comparable>) AsTestCommons.collect(COMPARABLES, EnumerableSupport.toList().cast(List<Comparable>.class));
        List<String> actual14 = (List<String>) AsTestCommons.collect(STRINGS, EnumerableSupport.toList(new AsTestCommons.ToUpperCaseFunction()).cast(List<String>.class));
        List<String> actual15 = (List<String>) AsTestCommons.collect(IDS, EnumerableSupport.toList(String.class));
        // Then
        List<String> expected = new List<String>();
        for (String s : STRINGS) {
            expected.add(s.toUpperCase());
        }
        List<String> expected1 = new List<String>();
        for (Object o : IDS) {
            expected1.add((String) o);
        }
        Assert.areEqual(BOOLS, actual);
        Assert.areEqual(IDS, actual1);
        Assert.areEqual(STRINGS, actual2);
        Assert.areEqual(BLOBS, actual3);
        Assert.areEqual(DATES, actual4);
        Assert.areEqual(DATETIMES, actual5);
        Assert.areEqual(TIMES, actual6);
        Assert.areEqual(INTS1, actual7);
        Assert.areEqual(LONGS1, actual8);
        Assert.areEqual(DOUBLES1, actual9);
        Assert.areEqual(CONTACTS, actual10);
        Assert.areEqual(MIX, actual11);
        Assert.areEqual(PEOPLE, actual12);
        Assert.areEqual(COMPARABLES, actual13);
        Assert.areEqual(expected, actual14);
        Assert.areEqual(expected1, actual15);
    }

    /**
     * @see EnumerableSupport.averagingDouble
     * @see EnumerableSupport.summingDouble
     */
    @IsTest
    static void doubleCollectors() {
        // Given
        IFunction probabilityFunction = new AsTestCommons.GetProbabilityFunction();
        // When
        Double actual = (Double) AsTestCommons.collect(PEOPLE, EnumerableSupport.summingDouble(probabilityFunction));
        Double actual1 = (Double) AsTestCommons.collect(PEOPLE, EnumerableSupport.averagingDouble(probabilityFunction));
        // Then
        Double expected = (
            PEOPLE[0].getProbability() + PEOPLE[1].getProbability() + PEOPLE[2].getProbability() + PEOPLE[3].getProbability()
        );
        Assert.areEqual(expected, actual);
        Double expected1 = expected / (Double) PEOPLE.size();
        Assert.areEqual(expected1, actual1);
    }

    /**
     * @see EnumerableSupport.isEqual
     */
    @IsTest
    static void isEqual() {
        // Given
        Integer value1 = 4;
        // When
        Predicate equal4Predicate = EnumerableSupport.isEqual(value1);
        IPredicate equal4Predicate1 = EnumerableSupport.isEqual(value1);
        Predicate equal4Predicate2 = EnumerableSupport.isEqual(Function.identity(), Function.constant(value1));
        IPredicate equal4Predicate3 = EnumerableSupport.isEqual(Function.identity(), Function.constant(value1));
        // Then
        for (Integer i : INTS) {
            Assert.areEqual(i == value1, equal4Predicate.test(i));
            Assert.areEqual(i == value1, equal4Predicate1.test(i));
            Assert.areEqual(i == value1, equal4Predicate2.test(i));
            Assert.areEqual(i == value1, equal4Predicate3.test(i));
        }
        for (Object o : MIX) {
            Assert.areEqual(o == value1, equal4Predicate.test(o));
            Assert.areEqual(o == value1, equal4Predicate1.test(o));
            Assert.areEqual(o == value1, equal4Predicate2.test(o));
            Assert.areEqual(o == value1, equal4Predicate3.test(o));
        }
    }

    /**
     * @see EnumerableSupport.isIn
     */
    @IsTest
    static void isIn() {
        // Given
        List<Object> subList = new List<Object>{ 5, null, 10 };
        // When
        Predicate inInput1Predicate = EnumerableSupport.isIn(subList);
        IPredicate inInput1Predicate1 = EnumerableSupport.isIn(subList);
        // Then
        for (Integer i : INTS) {
            Assert.areEqual(subList.contains(i), inInput1Predicate.test(i));
            Assert.areEqual(subList.contains(i), inInput1Predicate1.test(i));
        }
        for (Object o : MIX) {
            Assert.areEqual(subList.contains(o), inInput1Predicate.test(o));
            Assert.areEqual(subList.contains(o), inInput1Predicate1.test(o));
        }
    }

    /**
     * @see EnumerableSupport.isNull
     */
    @IsTest
    static void isNull() {
        // When
        Predicate isNullPredicate = EnumerableSupport.isNull();
        IPredicate isNullPredicate1 = EnumerableSupport.isNull();
        // Then
        for (Integer i : INTS) {
            Assert.areEqual(i == null, isNullPredicate.test(i));
            Assert.areEqual(i == null, isNullPredicate1.test(i));
        }
        for (Object o : MIX) {
            Assert.areEqual(o == null, isNullPredicate.test(o));
            Assert.areEqual(o == null, isNullPredicate1.test(o));
        }
    }

    /**
     * @see EnumerableSupport.isNotNull
     */
    @IsTest
    static void isNotNull() {
        // When
        Predicate isNullPredicate = EnumerableSupport.isNotNull();
        IPredicate isNullPredicate1 = EnumerableSupport.isNotNull();
        // Then
        for (Integer i : INTS) {
            Assert.areEqual(i != null, isNullPredicate.test(i));
            Assert.areEqual(i != null, isNullPredicate1.test(i));
        }
        for (Object o : MIX) {
            Assert.areEqual(o != null, isNullPredicate.test(o));
            Assert.areEqual(o != null, isNullPredicate1.test(o));
        }
    }

}
