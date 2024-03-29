/**
 * @see BaseCollectors
 * @see BaseCollectorFunctions
 * @see BaseListObjectConsumers
 * @see BaseCollectorSuppliers
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class BaseCollectorsTest {

    private static final List<Boolean> BOOLS = AsTestData.generateBools();
    private static final List<Id> IDS = AsTestData.generateIds();
    private static final List<Blob> BLOBS = AsTestData.generateBlobs();
    private static final List<Date> DATES = AsTestData.generateDates();
    private static final List<Datetime> DATETIMES = AsTestData.generateDatetimes();
    private static final List<Time> TIMES = AsTestData.generateTimes();
    private static final List<Object> INTS = AsTestData.generateInts1();
    private static final List<Object> LONGS = AsTestData.generateLongs1();
    private static final List<Object> DOUBLES = AsTestData.generateDoubles1();
    private static final List<String> STRINGS = AsTestData.generateStrings();
    private static final List<Object> CONTACTS = AsTestData.generateContacts1();
    private static final List<Comparable> COMPARABLES = AsTestData.generateComparables();
    private static final List<AsPerson> PEOPLE = AsTestData.generatePersons();
    private static final List<Object> MIX = AsTestData.generateMix();

    static {
        new BaseCollectors();
        new BaseCollectorFunctions();
        new BaseListObjectConsumers();
        new BaseCollectorSuppliers();
    }

    /**
     * @see BaseCollectors.toList
     */
    @IsTest
    static void toList() {
        // When
        String lastName = 'LastName';
        List<Boolean> actual = (List<Boolean>) AsTestCommons.collect(BOOLS, BaseCollectors.toList().cast(List<Boolean>.class));
        List<Id> actual1 = (List<Id>) AsTestCommons.collect(IDS, BaseCollectors.toList().cast(List<Id>.class));
        List<String> actual2 = (List<String>) AsTestCommons.collect(STRINGS, BaseCollectors.toList().cast(List<String>.class));
        List<Blob> actual3 = (List<Blob>) AsTestCommons.collect(BLOBS, BaseCollectors.toList().cast(List<Blob>.class));
        List<Date> actual4 = (List<Date>) AsTestCommons.collect(DATES, BaseCollectors.toList().cast(List<Date>.class));
        List<Datetime> actual5 = (List<Datetime>) AsTestCommons.collect(DATETIMES, BaseCollectors.toList().cast(List<Datetime>.class));
        List<Time> actual6 = (List<Time>) AsTestCommons.collect(TIMES, BaseCollectors.toList().cast(List<Time>.class));
        List<Integer> actual7 = (List<Integer>) AsTestCommons.collect(INTS, BaseCollectors.toList().cast(List<Integer>.class));
        List<Long> actual8 = (List<Long>) AsTestCommons.collect(LONGS, BaseCollectors.toList().cast(List<Long>.class));
        List<Double> actual9 = (List<Double>) AsTestCommons.collect(DOUBLES, BaseCollectors.toList().cast(List<Double>.class));
        List<Contact> actual10 = (List<Contact>) AsTestCommons.collect(CONTACTS, BaseCollectors.toList().cast(List<SObject>.class));
        List<Object> actual11 = (List<Object>) AsTestCommons.collect(MIX, BaseCollectors.toList());
        List<AsPerson> actual12 = (List<AsPerson>) AsTestCommons.collect(PEOPLE, BaseCollectors.toList().cast(List<AsPerson>.class));
        List<Comparable> actual13 = (List<Comparable>) AsTestCommons.collect(COMPARABLES, BaseCollectors.toList().cast(List<Comparable>.class));
        List<String> actual14 = (List<String>) AsTestCommons.collect(STRINGS, BaseCollectors.toList(new AsTestCommons.ToUpperCaseFunction()).cast(List<String>.class));
        List<String> actual15 = (List<String>) AsTestCommons.collect(CONTACTS, BaseCollectors.toList(BaseSObjectFunctions.get(lastName)).cast(List<String>.class));
        // Then
        List<String> expected = new List<String>();
        for (String s : STRINGS) {
            expected.add(s.toUpperCase());
        }
        List<String> expected1 = new List<String>();
        for (Object sObj : CONTACTS) {
            expected1.add((String) ((SObject) sObj).get(lastName));
        }
        Assert.areEqual(BOOLS, actual);
        Assert.areEqual(IDS, actual1);
        Assert.areEqual(STRINGS, actual2);
        Assert.areEqual(BLOBS, actual3);
        Assert.areEqual(DATES, actual4);
        Assert.areEqual(DATETIMES, actual5);
        Assert.areEqual(TIMES, actual6);
        Assert.areEqual(INTS, actual7);
        Assert.areEqual(LONGS, actual8);
        Assert.areEqual(DOUBLES, actual9);
        Assert.areEqual(CONTACTS, actual10);
        Assert.areEqual(MIX, actual11);
        Assert.areEqual(PEOPLE, actual12);
        Assert.areEqual(COMPARABLES, actual13);
        Assert.areEqual(expected, actual14);
        Assert.areEqual(expected1, actual15);
    }

}
