/**
 * @see Collectors
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class CollectorTest {

    private static final List<Boolean> BOOLS = IterTestUtilsExt.generateBools();
    private static final List<Id> IDS = IterTestUtils.generateIds();
    private static final List<Blob> BLOBS = IterTestUtils.generateBlobs();
    private static final List<Date> DATES = IterTestUtils.generateDates();
    private static final List<Datetime> DATETIMES = IterTestUtils.generateDatetimes();
    private static final List<Time> TIMES = IterTestUtils.generateTimes();
    private static final List<Object> INTS = IterTestUtils.generateInts1();
    private static final List<Object> LONGS = IterTestUtilsExt.generateLongs1();
    private static final List<Object> DOUBLES = IterTestUtils.generateDoubles1();
    private static final List<String> STRINGS = IterTestUtilsExt.generateStrings1();
    private static final List<Object> CONTACTS = IterTestUtilsExt.generateContacts1();
    private static final List<Object> ATTACHMENTS = IterTestUtilsExt.generateAttachments();
    private static final List<Object> EVENTS = IterTestUtilsExt.generateEvents();
    private static final List<Object> SLOTS = IterTestUtilsExt.generateHours();
    private static final List<Object> ACCOUNTS = IterTestUtils.generateAccounts1();
    private static final List<Comparable> COMPARABLES = IterTestUtils.generateComparables();
    private static final List<IterTestUtils.Person> PEOPLE = IterTestUtils.generatePersons();
    private static final List<Object> MIX = IterTestUtilsExt.generateMix();

    static {
        // Invoke private constructors for coverage
        new Collectors();
        new CollectorBaseFunctions();
        new MapObjectConsumers();
        new ListObjectConsumers();
        new SetObjectConsumers();
        new BiConsumers();
        new CollectorFunctions();
        new CollectorSuppliers();
        new DatetimeToLongFunctions();
        new IntToLongFunctions();
        new StringToLongFunctions();
    }

    /**
     * @see Collectors.toList
     */
    @IsTest
    static void toList() {
        // When
        List<Boolean> actual = (List<Boolean>) Stream.of(BOOLS).collect(Collectors.toList().cast(List<Boolean>.class));
        List<Id> actual1 = (List<Id>) Stream.of(IDS).collect(Collectors.toList().cast(List<Id>.class));
        List<String> actual2 = (List<String>) Stream.of(STRINGS).collect(Collectors.toList().cast(List<String>.class));
        List<Blob> actual3 = (List<Blob>) Stream.of(BLOBS).collect(Collectors.toList().cast(List<Blob>.class));
        List<Date> actual4 = (List<Date>) Stream.of(DATES).collect(Collectors.toList().cast(List<Date>.class));
        List<Datetime> actual5 = (List<Datetime>) Stream.of(DATETIMES).collect(Collectors.toList().cast(List<Datetime>.class));
        List<Time> actual6 = (List<Time>) Stream.of(TIMES).collect(Collectors.toList().cast(List<Time>.class));
        List<Integer> actual7 = (List<Integer>) Stream.of(INTS).collect(Collectors.toList().cast(List<Integer>.class));
        List<Long> actual8 = (List<Long>) Stream.of(LONGS).collect(Collectors.toList().cast(List<Long>.class));
        List<Double> actual9 = (List<Double>) Stream.of(DOUBLES).collect(Collectors.toList().cast(List<Double>.class));
        List<Contact> actual10 = (List<Contact>) Stream.of(CONTACTS).collect(Collectors.toList().cast(List<SObject>.class));
        List<Object> actual11 = (List<Object>) Stream.of(MIX).collect(Collectors.toList());
        List<Comparable> actual12 = (List<Comparable>) Stream.of(COMPARABLES).collect(Collectors.toList().cast(List<Comparable>.class));
        List<String> actual13 = (List<String>) Stream.of(STRINGS).collect(Collectors.toList(StringFunctions.toUpperCase()).cast(List<String>.class));
        // Then
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
        Assert.areEqual(COMPARABLES, actual12);
        Assert.areEqual(new List<String>{
                STRINGS[0].toUpperCase(),
                STRINGS[1].toUpperCase(),
                STRINGS[2].toUpperCase(),
                STRINGS[3].toUpperCase(),
                STRINGS[4].toUpperCase()
        }, actual13);
    }

    /**
     * @see Collectors.toSet
     */
    @IsTest
    static void toSet() {
        // When
        Set<Boolean> actual = (Set<Boolean>) Stream.of(BOOLS).collect(Collectors.toBoolSet());
        Set<Id> actual1 = (Set<Id>) Stream.of(IDS).collect(Collectors.toIdSet());
        Set<String> actual2 = (Set<String>) Stream.of(STRINGS).collect(Collectors.toStringSet());
        Set<Blob> actual3 = (Set<Blob>) Stream.of(BLOBS).collect(Collectors.toBlobSet());
        Set<Date> actual4 = (Set<Date>) Stream.of(DATES).collect(Collectors.toDateSet());
        Set<Datetime> actual5 = (Set<Datetime>) Stream.of(DATETIMES).collect(Collectors.toDatetimeSet());
        Set<Time> actual6 = (Set<Time>) Stream.of(TIMES).collect(Collectors.toTimeSet());
        Set<Integer> actual7 = (Set<Integer>) Stream.of(INTS).collect(Collectors.toIntSet());
        Set<Long> actual8 = (Set<Long>) Stream.of(LONGS).collect(Collectors.toLongSet());
        Set<Double> actual9 = (Set<Double>) Stream.of(DOUBLES).collect(Collectors.toDoubleSet());
        Set<SObject> actual10 = (Set<SObject>) Stream.of(CONTACTS).collect(Collectors.toSObjectSet());
        Set<Object> actual11 = (Set<Object>) Stream.of(MIX).collect(Collectors.toSet());
        Set<Object> actual12 = (Set<Object>) Stream.of(COMPARABLES).collect(Collectors.toSet());
        // Then
        Assert.areEqual(new Set<Boolean>(BOOLS), actual);
        Assert.areEqual(new Set<Id>(IDS), actual1);
        Assert.areEqual(new Set<String>(STRINGS), actual2);
        Assert.areEqual(new Set<Blob>(BLOBS), actual3);
        Assert.areEqual(new Set<Date>(DATES), actual4);
        Assert.areEqual(new Set<Datetime>(DATETIMES), actual5);
        Assert.areEqual(new Set<Time>(TIMES), actual6);
        Assert.areEqual(new Set<Integer>{ (Integer) INTS[0], (Integer) INTS[1], (Integer) INTS[2], (Integer) INTS[3], (Integer) INTS[4] }, actual7);
        Assert.areEqual(new Set<Long>{ (Long) LONGS[0], (Long) LONGS[1], (Long) LONGS[2], (Long) LONGS[3], (Long) LONGS[4] }, actual8);
        Assert.areEqual(new Set<Double>{ (Double) DOUBLES[0], (Double) DOUBLES[1], (Double) DOUBLES[2], (Double) DOUBLES[3], (Double) DOUBLES[4] }, actual9);
        Assert.areEqual(new Set<SObject>{ (SObject) CONTACTS[0], (SObject) CONTACTS[1], (SObject) CONTACTS[2], (SObject) CONTACTS[3], (SObject) CONTACTS[4] }, actual10);
        Assert.areEqual(new Set<Object>(MIX), actual11);
        Assert.areEqual(new Set<Object>{ (Object) COMPARABLES[0], (Object) COMPARABLES[1], (Object) COMPARABLES[2], (Object) COMPARABLES[3] }, actual12);
    }

    /**
     * @see Collectors.toByBoolMap
     */
    @IsTest
    static void toByBoolMap() {
        // Given
        List<Object> input = new List<Object>{ PEOPLE[0], PEOPLE[1] };
        IFunction isActiveFunction = new IterTestUtils.GetActiveFunction();
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Boolean, Comparable> actual = (Map<Boolean, Comparable>) Stream.of(input).collect(Collectors.toByBoolMap(isActiveFunction).cast(Map<Boolean, Comparable>.class));
        Map<Boolean, String> actual1 = (Map<Boolean, String>) Stream.of(input).collect(Collectors.toByBoolMap(isActiveFunction, nameFunction).cast(Map<Boolean, String>.class));
        Map<Boolean, String> actual2 = (Map<Boolean, String>) Stream.of(PEOPLE).collect(Collectors.toByBoolMap(isActiveFunction, nameFunction, right).cast(Map<Boolean, String>.class));
        // Then
        Map<Boolean, Comparable> expected = new Map<Boolean, Comparable>{ true => PEOPLE[0], false => PEOPLE[1] };
        Assert.areEqual(expected, actual);
        Map<Boolean, String> expected1 = new Map<Boolean, String>{ true => PEOPLE[0].getName(), false => PEOPLE[1].getName() };
        Assert.areEqual(expected1, actual1);
        Map<Boolean, String> expected2 = new Map<Boolean, String>{ true => PEOPLE[3].getName(), false => PEOPLE[2].getName() };
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see Collectors.toByIdMap
     */
    @IsTest
    static void toByIdMap() {
        // Given
        List<Object> input = new List<Object>(CONTACTS);
        input.add(input[0]);
        input.add(input[1]);
        IFunction idFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Id));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName));
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Id, Contact> actual = (Map<Id, Contact>) Stream.of(CONTACTS).collect(Collectors.toByIdMap(idFunction).cast(Map<Id, Contact>.class));
        Map<Id, String> actual1 = (Map<Id, String>) Stream.of(CONTACTS).collect(Collectors.toByIdMap(idFunction, nameFunction).cast(Map<Id, String>.class));
        Map<Id, String> actual2 = (Map<Id, String>) Stream.of(input).collect(Collectors.toByIdMap(idFunction, nameFunction, right).cast(Map<Id, String>.class));
        // Then
        Map<Id, Contact> expected = new Map<Id, Contact>{
                ((Contact) CONTACTS[0]).Id => (Contact) CONTACTS[0],
                ((Contact) CONTACTS[1]).Id => (Contact) CONTACTS[1],
                ((Contact) CONTACTS[2]).Id => (Contact) CONTACTS[2],
                ((Contact) CONTACTS[3]).Id => (Contact) CONTACTS[3],
                ((Contact) CONTACTS[4]).Id => (Contact) CONTACTS[4]
        };
        Assert.areEqual(expected, actual);
        Map<Id, String> expected1 = new Map<Id, String>{
                ((Contact) CONTACTS[0]).Id => ((Contact) CONTACTS[0]).LastName,
                ((Contact) CONTACTS[1]).Id => ((Contact) CONTACTS[1]).LastName,
                ((Contact) CONTACTS[2]).Id => ((Contact) CONTACTS[2]).LastName,
                ((Contact) CONTACTS[3]).Id => ((Contact) CONTACTS[3]).LastName,
                ((Contact) CONTACTS[4]).Id => ((Contact) CONTACTS[4]).LastName
        };
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
    }

    /**
     * @see Collectors.toByStringMap
     */
    @IsTest
    static void toByStringMap() {
        // Given
        List<Object> input = new List<Object>();
        input.addAll(PEOPLE);
        input.add(input[0]);
        input.add(input[1]);
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        IFunction ageFunction = new IterTestUtils.GetAgeFunction();
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<String, Comparable> actual = (Map<String, Comparable>) Stream.of(PEOPLE).collect(Collectors.toByStringMap(nameFunction).cast(Map<String, Comparable>.class));
        Map<String, Integer> actual1 = (Map<String, Integer>) Stream.of(PEOPLE).collect(Collectors.toByStringMap(nameFunction, ageFunction).cast(Map<String, Integer>.class));
        Map<String, Integer> actual2 = (Map<String, Integer>) Stream.of(input).collect(Collectors.toByStringMap(nameFunction, ageFunction, right).cast(Map<String, Integer>.class));
        // Then
        Map<String, Comparable> expected = new Map<String, Comparable>{
                PEOPLE[0].getName() => PEOPLE[0],
                PEOPLE[1].getName() => PEOPLE[1],
                PEOPLE[2].getName() => PEOPLE[2],
                PEOPLE[3].getName() => PEOPLE[3]
        };
        Assert.areEqual(expected, actual);
        Map<String, Integer> expected1 = new Map<String, Integer>{
                PEOPLE[0].getName() => PEOPLE[0].getAge(),
                PEOPLE[1].getName() => PEOPLE[1].getAge(),
                PEOPLE[2].getName() => PEOPLE[2].getAge(),
                PEOPLE[3].getName() => PEOPLE[3].getAge()
        };
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
    }

    /**
     * @see Collectors.toByBlobMap
     */
    @IsTest
    static void toByBlobMap() {
        // Given
        List<Object> input = new List<Object>(ATTACHMENTS);
        input.add(input[0]);
        input.add(input[1]);
        IFunction bodyFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Attachment.Body));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Attachment.Name));
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Blob, Attachment> actual = (Map<Blob, Attachment>) Stream.of(ATTACHMENTS).collect(Collectors.toByBlobMap(bodyFunction).cast(Map<Blob, Attachment>.class));
        Map<Blob, String> actual1 = (Map<Blob, String>) Stream.of(ATTACHMENTS).collect(Collectors.toByBlobMap(bodyFunction, nameFunction).cast(Map<Blob, String>.class));
        Map<Blob, String> actual2 = (Map<Blob, String>) Stream.of(input).collect(Collectors.toByBlobMap(bodyFunction, nameFunction, right).cast(Map<Blob, String>.class));
        // Then
        Map<Blob, Attachment> expected = new Map<Blob, Attachment>{
                ((Attachment) ATTACHMENTS[0]).Body => (Attachment) ATTACHMENTS[0],
                ((Attachment) ATTACHMENTS[1]).Body => (Attachment) ATTACHMENTS[1],
                ((Attachment) ATTACHMENTS[2]).Body => (Attachment) ATTACHMENTS[2],
                ((Attachment) ATTACHMENTS[3]).Body => (Attachment) ATTACHMENTS[3],
                ((Attachment) ATTACHMENTS[4]).Body => (Attachment) ATTACHMENTS[4],
                ((Attachment) ATTACHMENTS[5]).Body => (Attachment) ATTACHMENTS[5]
        };
        Assert.areEqual(expected, actual);
        Map<Blob, String> expected1 = new Map<Blob, String>{
                ((Attachment) ATTACHMENTS[0]).Body => ((Attachment) ATTACHMENTS[0]).Name,
                ((Attachment) ATTACHMENTS[1]).Body => ((Attachment) ATTACHMENTS[1]).Name,
                ((Attachment) ATTACHMENTS[2]).Body => ((Attachment) ATTACHMENTS[2]).Name,
                ((Attachment) ATTACHMENTS[3]).Body => ((Attachment) ATTACHMENTS[3]).Name,
                ((Attachment) ATTACHMENTS[4]).Body => ((Attachment) ATTACHMENTS[4]).Name,
                ((Attachment) ATTACHMENTS[5]).Body => ((Attachment) ATTACHMENTS[5]).Name
        };
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
    }

    /**
     * @see Collectors.toByDateMap
     */
    @IsTest
    static void toByDateMap() {
        // Given
        List<Object> input = new List<Object>(CONTACTS);
        input.add(input[0]);
        input.add(input[1]);
        IFunction birthdayFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Birthdate));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName));
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Date, Contact> actual = (Map<Date, Contact>) Stream.of(CONTACTS).collect(Collectors.toByDateMap(birthdayFunction).cast(Map<Date, Contact>.class));
        Map<Date, String> actual1 = (Map<Date, String>) Stream.of(CONTACTS).collect(Collectors.toByDateMap(birthdayFunction, nameFunction).cast(Map<Date, String>.class));
        Map<Date, String> actual2 = (Map<Date, String>) Stream.of(input).collect(Collectors.toByDateMap(birthdayFunction, nameFunction, right).cast(Map<Date, String>.class));
        // Then
        Map<Date, Contact> expected = new Map<Date, Contact>{
                ((Contact) CONTACTS[0]).Birthdate => (Contact) CONTACTS[0],
                ((Contact) CONTACTS[1]).Birthdate => (Contact) CONTACTS[1],
                ((Contact) CONTACTS[2]).Birthdate => (Contact) CONTACTS[2],
                ((Contact) CONTACTS[3]).Birthdate => (Contact) CONTACTS[3],
                ((Contact) CONTACTS[4]).Birthdate => (Contact) CONTACTS[4]
        };
        Assert.areEqual(expected, actual);
        Map<Date, String> expected1 = new Map<Date, String>{
                ((Contact) CONTACTS[0]).Birthdate => ((Contact) CONTACTS[0]).LastName,
                ((Contact) CONTACTS[1]).Birthdate => ((Contact) CONTACTS[1]).LastName,
                ((Contact) CONTACTS[2]).Birthdate => ((Contact) CONTACTS[2]).LastName,
                ((Contact) CONTACTS[3]).Birthdate => ((Contact) CONTACTS[3]).LastName,
                ((Contact) CONTACTS[4]).Birthdate => ((Contact) CONTACTS[4]).LastName
        };
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
    }

    /**
     * @see Collectors.toByDatetimeMap
     */
    @IsTest
    static void toByDatetimeMap() {
        // Given
        List<Object> input = new List<Object>(EVENTS);
        input.add(input[0]);
        input.add(input[1]);
        IFunction activityFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Event.ActivityDateTime));
        IFunction descFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Event.Description));
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Datetime, Event> actual = (Map<Datetime, Event>) Stream.of(EVENTS).collect(Collectors.toByDatetimeMap(activityFunction).cast(Map<Datetime, Event>.class));
        Map<Datetime, String> actual1 = (Map<Datetime, String>) Stream.of(EVENTS).collect(Collectors.toByDatetimeMap(activityFunction, descFunction).cast(Map<Datetime, String>.class));
        Map<Datetime, String> actual2 = (Map<Datetime, String>) Stream.of(input).collect(Collectors.toByDatetimeMap(activityFunction, descFunction, right).cast(Map<Datetime, String>.class));
        // Then
        Map<Datetime, Event> expected = new Map<Datetime, Event>{
                ((Event) EVENTS[0]).ActivityDateTime => (Event) EVENTS[0],
                ((Event) EVENTS[1]).ActivityDateTime => (Event) EVENTS[1],
                ((Event) EVENTS[2]).ActivityDateTime => (Event) EVENTS[2],
                ((Event) EVENTS[3]).ActivityDateTime => (Event) EVENTS[3],
                ((Event) EVENTS[4]).ActivityDateTime => (Event) EVENTS[4]
        };
        Assert.areEqual(expected, actual);
        Map<Datetime, String> expected1 = new Map<Datetime, String>{
                ((Event) EVENTS[0]).ActivityDateTime => ((Event) EVENTS[0]).Description,
                ((Event) EVENTS[1]).ActivityDateTime => ((Event) EVENTS[1]).Description,
                ((Event) EVENTS[2]).ActivityDateTime => ((Event) EVENTS[2]).Description,
                ((Event) EVENTS[3]).ActivityDateTime => ((Event) EVENTS[3]).Description,
                ((Event) EVENTS[4]).ActivityDateTime => ((Event) EVENTS[4]).Description
        };
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
    }

    /**
     * @see Collectors.toByTimeMap
     */
    @IsTest
    static void toByTimeMap() {
        // Given
        List<Object> input = new List<Object>(SLOTS);
        input.add(input[0]);
        input.add(input[1]);
        IFunction endTimeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.BusinessHours.MondayEndTime));
        IFunction startTimeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.BusinessHours.MondayStartTime));
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Time, BusinessHours> actual = (Map<Time, BusinessHours>) Stream.of(SLOTS).collect(Collectors.toByTimeMap(startTimeFunction).cast(Map<Time, BusinessHours>.class));
        Map<Time, Time> actual1 = (Map<Time, Time>) Stream.of(SLOTS).collect(Collectors.toByTimeMap(startTimeFunction, endTimeFunction).cast(Map<Time, Time>.class));
        Map<Time, Time> actual2 = (Map<Time, Time>) Stream.of(input).collect(Collectors.toByTimeMap(startTimeFunction, endTimeFunction, right).cast(Map<Time, Time>.class));

        // Then
        Map<Time, BusinessHours> expected = new Map<Time, BusinessHours>{
                ((BusinessHours) SLOTS[0]).MondayStartTime => (BusinessHours) SLOTS[0],
                ((BusinessHours) SLOTS[1]).MondayStartTime => (BusinessHours) SLOTS[1],
                ((BusinessHours) SLOTS[2]).MondayStartTime => (BusinessHours) SLOTS[2],
                ((BusinessHours) SLOTS[3]).MondayStartTime => (BusinessHours) SLOTS[3],
                ((BusinessHours) SLOTS[4]).MondayStartTime => (BusinessHours) SLOTS[4]
        };
        Assert.areEqual(expected, actual);
        Map<Time, Time> expected1 = new Map<Time, Time>{
                ((BusinessHours) SLOTS[0]).MondayStartTime => ((BusinessHours) SLOTS[0]).MondayEndTime,
                ((BusinessHours) SLOTS[1]).MondayStartTime => ((BusinessHours) SLOTS[1]).MondayEndTime,
                ((BusinessHours) SLOTS[2]).MondayStartTime => ((BusinessHours) SLOTS[2]).MondayEndTime,
                ((BusinessHours) SLOTS[3]).MondayStartTime => ((BusinessHours) SLOTS[3]).MondayEndTime,
                ((BusinessHours) SLOTS[4]).MondayStartTime => ((BusinessHours) SLOTS[4]).MondayEndTime
        };
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
    }

    /**
     * @see Collectors.toByIntMap
     */
    @IsTest
    static void toByIntMap() {
        // Given
        List<Object> input = new List<Object>();
        input.addAll(PEOPLE);
        input.add(input[0]);
        input.add(input[1]);
        IToIntFunction ageFunction = new IterTestUtils.GetAgeAsIntFunction();
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Integer, Comparable> actual = (Map<Integer, Comparable>) Stream.of(PEOPLE).collect(Collectors.toByIntMap(ageFunction).cast(Map<Integer, Comparable>.class));
        Map<Integer, String> actual1 = (Map<Integer, String>) Stream.of(PEOPLE).collect(Collectors.toByIntMap(ageFunction, nameFunction).cast(Map<Integer, String>.class));
        Map<Integer, String> actual2 = (Map<Integer, String>) Stream.of(input).collect(Collectors.toByIntMap(ageFunction, nameFunction, right).cast(Map<Integer, String>.class));
        // Then
        Map<Integer, Object> expected = new Map<Integer, Object>{
                PEOPLE[0].getAge() => PEOPLE[0],
                PEOPLE[1].getAge() => PEOPLE[1],
                PEOPLE[2].getAge() => PEOPLE[2],
                PEOPLE[3].getAge() => PEOPLE[3]
        };
        Assert.areEqual(expected, actual);
        Map<Integer, String> expected1 = new Map<Integer, String>{
                PEOPLE[0].getAge() => PEOPLE[0].getName(),
                PEOPLE[1].getAge() => PEOPLE[1].getName(),
                PEOPLE[2].getAge() => PEOPLE[2].getName(),
                PEOPLE[3].getAge() => PEOPLE[3].getName()
        };
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
    }

    /**
     * @see Collectors.toByLongMap
     */
    @IsTest
    static void toByLongMap() {
        // Given
        List<Object> input = new List<Object>();
        input.addAll(PEOPLE);
        input.add(input[0]);
        input.add(input[1]);
        IToLongFunction idFunction = new IterTestUtils.GetIdAsLongFunction();
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Long, Comparable> actual = (Map<Long, Comparable>) Stream.of(PEOPLE).collect(Collectors.toByLongMap(idFunction).cast(Map<Long, Comparable>.class));
        Map<Long, String> actual1 = (Map<Long, String>) Stream.of(PEOPLE).collect(Collectors.toByLongMap(idFunction, nameFunction).cast(Map<Long, String>.class));
        Map<Long, String> actual2 = (Map<Long, String>) Stream.of(input).collect(Collectors.toByLongMap(idFunction, nameFunction, right).cast(Map<Long, String>.class));
        // Then
        Map<Long, Object> expected = new Map<Long, Object>{
                PEOPLE[0].getAutoId() => PEOPLE[0],
                PEOPLE[1].getAutoId() => PEOPLE[1],
                PEOPLE[2].getAutoId() => PEOPLE[2],
                PEOPLE[3].getAutoId() => PEOPLE[3]
        };
        Assert.areEqual(expected, actual);
        Map<Long, String> expected1 = new Map<Long, String>{
                PEOPLE[0].getAutoId() => PEOPLE[0].getName(),
                PEOPLE[1].getAutoId() => PEOPLE[1].getName(),
                PEOPLE[2].getAutoId() => PEOPLE[2].getName(),
                PEOPLE[3].getAutoId() => PEOPLE[3].getName()
        };
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
    }

    /**
     * @see Collectors.toByDoubleMap
     */
    @IsTest
    static void toByDoubleMap() {
        // Given
        List<Object> input = new List<Object>();
        input.addAll(PEOPLE);
        input.add(input[0]);
        input.add(input[1]);
        IToDoubleFunction probFunction = new IterTestUtils.GetProbabilityAsDoubleFunction();
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Double, Comparable> actual = (Map<Double, Comparable>) Stream.of(PEOPLE).collect(Collectors.toByDoubleMap(probFunction).cast(Map<Double, Comparable>.class));
        Map<Double, String> actual1 = (Map<Double, String>) Stream.of(PEOPLE).collect(Collectors.toByDoubleMap(probFunction, nameFunction).cast(Map<Double, String>.class));
        Map<Double, String> actual2 = (Map<Double, String>) Stream.of(input).collect(Collectors.toByDoubleMap(probFunction, nameFunction, right).cast(Map<Double, String>.class));
        // Then
        Map<Double, Object> expected = new Map<Double, Object>{
                PEOPLE[0].getProbability() => PEOPLE[0],
                PEOPLE[1].getProbability() => PEOPLE[1],
                PEOPLE[2].getProbability() => PEOPLE[2],
                PEOPLE[3].getProbability() => PEOPLE[3]
        };
        Assert.areEqual(expected, actual);
        Map<Double, String> expected1 = new Map<Double, String>{
                PEOPLE[0].getProbability() => PEOPLE[0].getName(),
                PEOPLE[1].getProbability() => PEOPLE[1].getName(),
                PEOPLE[2].getProbability() => PEOPLE[2].getName(),
                PEOPLE[3].getProbability() => PEOPLE[3].getName()
        };
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
    }

    /**
     * @see Collectors.toMap
     */
    @IsTest
    static void toMap() {
        // Given
        List<Object> input = new List<Object>();
        input.addAll(PEOPLE);
        input.add(input[0]);
        input.add(input[1]);
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        IFunction ageFunction = new IterTestUtils.GetAgeFunction();
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Object, Comparable> actual = (Map<Object, Comparable>) Stream.of(PEOPLE).collect(Collectors.toMap(nameFunction).cast(Map<Object, Comparable>.class));
        Map<Object, Integer> actual1 = (Map<Object, Integer>) Stream.of(PEOPLE).collect(Collectors.toMap(nameFunction, ageFunction).cast(Map<Object, Integer>.class));
        Map<Object, Integer> actual2 = (Map<Object, Integer>) Stream.of(input).collect(Collectors.toMap(nameFunction, ageFunction, right).cast(Map<Object, Integer>.class));
        // Then
        Map<Object, Comparable> expected = new Map<Object, Comparable>{
                PEOPLE[0].getName() => PEOPLE[0],
                PEOPLE[1].getName() => PEOPLE[1],
                PEOPLE[2].getName() => PEOPLE[2],
                PEOPLE[3].getName() => PEOPLE[3]
        };
        Assert.areEqual(expected, actual);
        Map<Object, Integer> expected1 = new Map<Object, Integer>{
                PEOPLE[0].getName() => PEOPLE[0].getAge(),
                PEOPLE[1].getName() => PEOPLE[1].getAge(),
                PEOPLE[2].getName() => PEOPLE[2].getAge(),
                PEOPLE[3].getName() => PEOPLE[3].getAge()
        };
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
    }

    /**
     * @see Collectors.groupingByBool
     */
    @IsTest
    static void groupingByBool() {
        // Given
        IterTestUtils.Person luke = new IterTestUtils.Person('Luke', 15, Date.newInstance(2005, 2, 3), 4L, false);
        IterTestUtils.Person richard = new IterTestUtils.Person('Richard', 30, Date.newInstance(1990, 2, 3), 5L, true);
        List<Object> input = new List<Object>();
        input.addAll(PEOPLE);
        input.add(luke);
        input.add(richard);
        IFunction isActiveFunction = new IterTestUtils.GetActiveFunction();
        IFunction isAdultFunction = new IterTestUtils.IsAdultFunction();
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        // When
        Map<Boolean, List<Comparable>> actual = (Map<Boolean, List<Comparable>>) Stream.of(input).collect(Collectors.groupingByBool(isActiveFunction).cast(Map<Boolean, List<Comparable>>.class));
        Map<Boolean, List<String>> actual1 = (Map<Boolean, List<String>>) Stream.of(input).collect(Collectors.groupingByBool(isActiveFunction, Collectors.toList(nameFunction)).cast(Map<Boolean, List<String>>.class));
        Map<Boolean, Map<Boolean, List<Comparable>>> actual2 = (Map<Boolean, Map<Boolean, List<Comparable>>>) Stream.of(input).collect(Collectors.groupingByBool(isActiveFunction, Collectors.groupingByBool(isAdultFunction)).cast(Map<Boolean, Map<Boolean, List<Comparable>>>.class));
        // Then
        Map<Boolean, List<Comparable>> expected = new Map<Boolean, List<Comparable>>{
                true => new List<Comparable>{ PEOPLE[0], PEOPLE[3], richard },
                false => new List<Comparable>{ PEOPLE[1], PEOPLE[2], luke }
        };
        Assert.areEqual(expected, actual);
        Map<Boolean, List<String>> expected1 = new Map<Boolean, List<String>>{
                true => new List<String>{ PEOPLE[0].getName(), PEOPLE[3].getName(), richard.getName() },
                false => new List<String>{ PEOPLE[1].getName(), PEOPLE[2].getName(), luke.getName() }
        };
        Assert.areEqual(expected1, actual1);
        Map<Boolean, Map<Boolean, List<Comparable>>> expected2 = new Map<Boolean, Map<Boolean, List<Comparable>>>{
                true => new Map<Boolean, List<Comparable>>{ true => new List<Comparable>{ PEOPLE[0], PEOPLE[3], richard } },
                false => new Map<Boolean, List<Comparable>>{ true => new List<Comparable>{ PEOPLE[1] }, false => new List<Comparable>{ PEOPLE[2], luke } }
        };
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see Collectors.groupingById
     */
    @IsTest
    static void groupingById() {
        // Given
        IFunction departmentFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Department));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName));
        IFunction accIdFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.AccountId));
        // When
        Map<Id, List<Contact>> actual = (Map<Id, List<Contact>>) Stream.of(CONTACTS).collect(Collectors.groupingById(accIdFunction).cast(Map<Id, List<Contact>>.class));
        Map<Id, List<String>> actual1 = (Map<Id, List<String>>) Stream.of(CONTACTS).collect(Collectors.groupingById(accIdFunction, Collectors.toList(nameFunction)).cast(Map<Id, List<String>>.class));
        Map<Id, Map<String, List<Contact>>> actual2 = (Map<Id, Map<String, List<Contact>>>) Stream.of(CONTACTS).collect(Collectors.groupingById(accIdFunction, Collectors.groupingByString(departmentFunction)).cast(Map<Id, Map<String, List<Contact>>>.class));
        // Then
        Map<Id, List<SObject>> expected = new Map<Id, List<SObject>>{
                ((Contact) CONTACTS[0]).AccountId => new List<Contact>{ (Contact) CONTACTS[0], (Contact) CONTACTS[2], (Contact) CONTACTS[4] },
                ((Contact) CONTACTS[1]).AccountId => new List<Contact>{ (Contact) CONTACTS[1], (Contact) CONTACTS[3] }
        };
        Assert.areEqual(expected, actual);
        Map<Id, List<String>> expected1 = new Map<Id, List<String>>{
                ((Contact) CONTACTS[0]).AccountId => new List<String>{ ((Contact) CONTACTS[0]).LastName, ((Contact) CONTACTS[2]).LastName, ((Contact) CONTACTS[4]).LastName },
                ((Contact) CONTACTS[1]).AccountId => new List<String>{ ((Contact) CONTACTS[1]).LastName, ((Contact) CONTACTS[3]).LastName }
        };
        Assert.areEqual(expected1, actual1);
        Map<Id, Map<String, List<Contact>>> expected2 = new Map<Id, Map<String, List<Contact>>>{
                ((Contact) CONTACTS[0]).AccountId => new Map<String, List<Contact>>{
                        IterTestUtils.CONSTS.HR => new List<Contact>{ (Contact) CONTACTS[0], (Contact) CONTACTS[2] },
                        IterTestUtils.CONSTS.FINANCE => new List<Contact>{ (Contact) CONTACTS[4] }
                },
                ((Contact) CONTACTS[1]).AccountId => new Map<String, List<Contact>>{
                        IterTestUtils.CONSTS.HR => new List<Contact>{ (Contact) CONTACTS[1] },
                        IterTestUtils.CONSTS.FINANCE => new List<Contact>{ (Contact) CONTACTS[3] }
                }
        };
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByString
     */
    @IsTest
    static void groupingByString() {
        // Given
        IFunction departmentFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Department));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName));
        IFunction accIdFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.AccountId));
        // When
        Map<String, List<Contact>> actual = (Map<String, List<Contact>>) Stream.of(CONTACTS).collect(Collectors.groupingByString(departmentFunction).cast(Map<String, List<Contact>>.class));
        Map<String, List<String>> actual1 = (Map<String, List<String>>) Stream.of(CONTACTS).collect(Collectors.groupingByString(departmentFunction, Collectors.toList(nameFunction)).cast(Map<String, List<String>>.class));
        Map<String, Map<Id, List<Contact>>> actual2 = (Map<String, Map<Id, List<Contact>>>) Stream.of(CONTACTS).collect(Collectors.groupingByString(departmentFunction, Collectors.groupingById(accIdFunction)).cast(Map<String, Map<Id, List<Contact>>>.class));
        // Then
        Map<String, List<SObject>> expected = new Map<String, List<SObject>>{
                ((Contact) CONTACTS[0]).Department => new List<Contact>{ (Contact) CONTACTS[0], (Contact) CONTACTS[1], (Contact) CONTACTS[2] },
                ((Contact) CONTACTS[3]).Department => new List<Contact>{ (Contact) CONTACTS[3], (Contact) CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Map<String, List<String>> expected1 = new Map<String, List<String>>{
                ((Contact) CONTACTS[0]).Department => new List<String>{ ((Contact) CONTACTS[0]).LastName, ((Contact) CONTACTS[1]).LastName, ((Contact) CONTACTS[2]).LastName },
                ((Contact) CONTACTS[3]).Department => new List<String>{ ((Contact) CONTACTS[3]).LastName, ((Contact) CONTACTS[4]).LastName }
        };
        Assert.areEqual(expected1, actual1);
        Map<String, Map<Id, List<Contact>>> expected2 = new Map<String, Map<Id, List<Contact>>>{
                ((Contact) CONTACTS[0]).Department => new Map<Id, List<Contact>>{
                        ((Contact) CONTACTS[0]).AccountId => new List<Contact>{ (Contact) CONTACTS[0], (Contact) CONTACTS[2] },
                        ((Contact) CONTACTS[1]).AccountId => new List<Contact>{ (Contact) CONTACTS[1] }
                },
                ((Contact) CONTACTS[3]).Department => new Map<Id, List<Contact>>{
                        ((Contact) CONTACTS[0]).AccountId => new List<Contact>{ (Contact) CONTACTS[4] },
                        ((Contact) CONTACTS[1]).AccountId => new List<Contact>{ (Contact) CONTACTS[3] }
                }
        };
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByBlob
     */
    @IsTest
    static void groupingByBlob() {
        // Given
        ((Attachment) ATTACHMENTS[2]).Body = ((Attachment) ATTACHMENTS[0]).Body;
        ((Attachment) ATTACHMENTS[3]).Body = ((Attachment) ATTACHMENTS[1]).Body;
        ((Attachment) ATTACHMENTS[4]).Body = ((Attachment) ATTACHMENTS[0]).Body;
        ((Attachment) ATTACHMENTS[5]).Body = ((Attachment) ATTACHMENTS[1]).Body;
        IFunction keyMapper = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Attachment.Body));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Attachment.Name));
        IFunction contentTypeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Attachment.ContentType));
        Collector downstream = Collectors.toList(nameFunction);
        // When
        Map<Blob, List<SObject>> actual = (Map<Blob, List<SObject>>) Stream.of(ATTACHMENTS).collect(Collectors.groupingByBlob(keyMapper).cast(Map<Blob, List<SObject>>.class));
        Map<Blob, Object> actual1 = (Map<Blob, Object>) Stream.of(ATTACHMENTS).collect(Collectors.groupingByBlob(keyMapper, downstream));
        Map<Blob, Object> actual2 = (Map<Blob, Object>) Stream.of(ATTACHMENTS).collect(Collectors.groupingByBlob(keyMapper, Collectors.groupingByString(contentTypeFunction, downstream)));
        // Then
        Map<Blob, List<Attachment>> expected = new Map<Blob, List<Attachment>>{
                ((Attachment) ATTACHMENTS[0]).Body => new List<Attachment>{ (Attachment) ATTACHMENTS[0], (Attachment) ATTACHMENTS[2], (Attachment) ATTACHMENTS[4] },
                ((Attachment) ATTACHMENTS[1]).Body => new List<Attachment>{ (Attachment) ATTACHMENTS[1], (Attachment) ATTACHMENTS[3], (Attachment) ATTACHMENTS[5] }
        };
        Assert.areEqual(expected, actual);
        Map<Blob, List<String>> expected1 = new Map<Blob, List<String>>{
                ((Attachment) ATTACHMENTS[0]).Body => new List<String>{ ((Attachment) ATTACHMENTS[0]).Name, ((Attachment) ATTACHMENTS[2]).Name, ((Attachment) ATTACHMENTS[4]).Name },
                ((Attachment) ATTACHMENTS[1]).Body => new List<String>{ ((Attachment) ATTACHMENTS[1]).Name, ((Attachment) ATTACHMENTS[3]).Name, ((Attachment) ATTACHMENTS[5]).Name }
        };
        Assert.areEqual(expected1, actual1);
        Map<Blob, Map<String, List<String>>> expected2 = new Map<Blob, Map<String, List<String>>>{
                ((Attachment) ATTACHMENTS[0]).Body => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.DOC => new List<String>{ ((Attachment) ATTACHMENTS[0]).Name, ((Attachment) ATTACHMENTS[2]).Name },
                        IterTestUtils.CONSTS.PDF => new List<String>{ ((Attachment) ATTACHMENTS[4]).Name }
                },
                ((Attachment) ATTACHMENTS[1]).Body => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.DOC => new List<String>{ ((Attachment) ATTACHMENTS[1]).Name },
                        IterTestUtils.CONSTS.PDF => new List<String>{ ((Attachment) ATTACHMENTS[3]).Name, ((Attachment) ATTACHMENTS[5]).Name }
                }
        };
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByDate
     */
    @IsTest
    static void groupingByDate() {
        // Given
        ((Contact) CONTACTS[2]).Birthdate = ((Contact) CONTACTS[0]).Birthdate;
        ((Contact) CONTACTS[3]).Birthdate = ((Contact) CONTACTS[1]).Birthdate;
        ((Contact) CONTACTS[4]).Birthdate = ((Contact) CONTACTS[0]).Birthdate;
        IFunction keyMapper = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Birthdate));
        IFunction lastNameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName));
        IFunction departmentFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Department));
        Collector downstream = Collectors.toList(lastNameFunction);
        // When
        Map<Date, List<SObject>> actual = (Map<Date, List<SObject>>) Stream.of(CONTACTS).collect(Collectors.groupingByDate(keyMapper).cast(Map<Date, List<SObject>>.class));
        Map<Date, Object> actual1 = (Map<Date, Object>) Stream.of(CONTACTS).collect(Collectors.groupingByDate(keyMapper, downstream));
        Map<Date, Object> actual2 = (Map<Date, Object>) Stream.of(CONTACTS).collect(Collectors.groupingByDate(keyMapper, Collectors.groupingByString(departmentFunction, downstream)));
        // Then
        Map<Date, List<Contact>> expected = new Map<Date, List<Contact>>{
                ((Contact) CONTACTS[0]).Birthdate => new List<Contact>{ (Contact) CONTACTS[0], (Contact) CONTACTS[2], (Contact) CONTACTS[4] },
                ((Contact) CONTACTS[1]).Birthdate => new List<Contact>{ (Contact) CONTACTS[1], (Contact) CONTACTS[3] }
        };
        Assert.areEqual(expected, actual);
        Map<Date, List<String>> expected1 = new Map<Date, List<String>>{
                ((Contact) CONTACTS[0]).Birthdate => new List<String>{ ((Contact) CONTACTS[0]).LastName, ((Contact) CONTACTS[2]).LastName, ((Contact) CONTACTS[4]).LastName },
                ((Contact) CONTACTS[1]).Birthdate => new List<String>{ ((Contact) CONTACTS[1]).LastName, ((Contact) CONTACTS[3]).LastName }
        };
        Assert.areEqual(expected1, actual1);
        Map<Date, Map<String, List<String>>> expected2 = new Map<Date, Map<String, List<String>>>{
                ((Contact) CONTACTS[0]).Birthdate => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.HR => new List<String>{ ((Contact) CONTACTS[0]).LastName, ((Contact) CONTACTS[2]).LastName },
                        IterTestUtils.CONSTS.FINANCE => new List<String>{ ((Contact) CONTACTS[4]).LastName }
                },
                ((Contact) CONTACTS[1]).Birthdate => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.HR => new List<String>{ ((Contact) CONTACTS[1]).LastName },
                        IterTestUtils.CONSTS.FINANCE => new List<String>{ ((Contact) CONTACTS[3]).LastName }
                }
        };
        Assert.areEqual(expected2, actual2);
    }

    /**
    * @see Collectors.groupingByDatetime
    */
    @IsTest
    static void groupingByDatetime() {
        // Given
        ((Event) EVENTS[2]).ActivityDateTime = ((Event) EVENTS[0]).ActivityDateTime;
        ((Event) EVENTS[3]).ActivityDateTime = ((Event) EVENTS[1]).ActivityDateTime;
        ((Event) EVENTS[4]).ActivityDateTime = ((Event) EVENTS[0]).ActivityDateTime;
        IFunction keyMapper = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Event.ActivityDateTime));
        IFunction descriptionFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Event.Description));
        IFunction typeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Event.Type));
        Collector downstream = Collectors.toList(descriptionFunction);
        // When
        Map<Datetime, List<SObject>> actual = (Map<Datetime, List<SObject>>) Stream.of(EVENTS).collect(Collectors.groupingByDatetime(keyMapper).cast(Map<Datetime, List<SObject>>.class));
        Map<Datetime, Object> actual1 = (Map<Datetime, Object>) Stream.of(EVENTS).collect(Collectors.groupingByDatetime(keyMapper, downstream));
        Map<Datetime, Object> actual2 = (Map<Datetime, Object>) Stream.of(EVENTS).collect(Collectors.groupingByDatetime(keyMapper, Collectors.groupingByString(typeFunction, downstream)));
        // Then
        Map<Datetime, List<Event>> expected = new Map<Datetime, List<Event>>{
                ((Event) EVENTS[0]).ActivityDateTime => new List<Event>{ (Event) EVENTS[0], (Event) EVENTS[2], (Event) EVENTS[4] },
                ((Event) EVENTS[1]).ActivityDateTime => new List<Event>{ (Event) EVENTS[1], (Event) EVENTS[3] }
        };
        Assert.areEqual(expected, actual);
        Map<Datetime, List<String>> expected1 = new Map<Datetime, List<String>>{
                ((Event) EVENTS[0]).ActivityDateTime => new List<String>{ ((Event) EVENTS[0]).Description, ((Event) EVENTS[2]).Description, ((Event) EVENTS[4]).Description },
                ((Event) EVENTS[1]).ActivityDateTime => new List<String>{ ((Event) EVENTS[1]).Description, ((Event) EVENTS[3]).Description }
        };
        Assert.areEqual(expected1, actual1);
        Map<Datetime, Map<String, List<String>>> expected2 = new Map<Datetime, Map<String, List<String>>>{
                ((Event) EVENTS[0]).ActivityDateTime => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CALL => new List<String>{ ((Event) EVENTS[0]).Description, ((Event) EVENTS[2]).Description },
                        IterTestUtils.CONSTS.EMAIL => new List<String>{ ((Event) EVENTS[4]).Description }
                },
                ((Event) EVENTS[1]).ActivityDateTime => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CALL => new List<String>{ ((Event) EVENTS[1]).Description },
                        IterTestUtils.CONSTS.EMAIL => new List<String>{ ((Event) EVENTS[3]).Description }
                }
        };
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByTime
     */
    @IsTest
    static void groupingByTime() {
        // Given
        ((BusinessHours) SLOTS[2]).MondayStartTime = ((BusinessHours) SLOTS[0]).MondayStartTime;
        ((BusinessHours) SLOTS[3]).MondayStartTime = ((BusinessHours) SLOTS[1]).MondayStartTime;
        ((BusinessHours) SLOTS[4]).MondayStartTime = ((BusinessHours) SLOTS[0]).MondayStartTime;
        IFunction keyMapper = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.BusinessHours.MondayStartTime));
        IFunction idFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.BusinessHours.Id));
        IFunction typeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.BusinessHours.Name));
        Collector downstream = Collectors.toList(idFunction);
        // When
        Map<Time, List<SObject>> actual = (Map<Time, List<SObject>>) Stream.of(SLOTS).collect(Collectors.groupingByTime(keyMapper).cast(Map<Time, List<SObject>>.class));
        Map<Time, Object> actual1 = (Map<Time, Object>) Stream.of(SLOTS).collect(Collectors.groupingByTime(keyMapper, downstream));
        Map<Time, Object> actual2 = (Map<Time, Object>) Stream.of(SLOTS).collect(Collectors.groupingByTime(keyMapper, Collectors.groupingByString(typeFunction, downstream)));
        // Then
        Map<Time, List<BusinessHours>> expected = new Map<Time, List<BusinessHours>>{
                ((BusinessHours) SLOTS[0]).MondayStartTime => new List<BusinessHours>{ (BusinessHours) SLOTS[0], (BusinessHours) SLOTS[2], (BusinessHours) SLOTS[4] },
                ((BusinessHours) SLOTS[1]).MondayStartTime => new List<BusinessHours>{ (BusinessHours) SLOTS[1], (BusinessHours) SLOTS[3] }
        };
        Assert.areEqual(expected, actual);
        Map<Time, List<Id>> expected1 = new Map<Time, List<Id>>{
                ((BusinessHours) SLOTS[0]).MondayStartTime => new List<String>{ ((BusinessHours) SLOTS[0]).Id, ((BusinessHours) SLOTS[2]).Id, ((BusinessHours) SLOTS[4]).Id },
                ((BusinessHours) SLOTS[1]).MondayStartTime => new List<String>{ ((BusinessHours) SLOTS[1]).Id, ((BusinessHours) SLOTS[3]).Id }
        };
        Assert.areEqual(expected1, actual1);
        Map<Time, Map<String, List<Id>>> expected2 = new Map<Time, Map<String, List<Id>>>{
                ((BusinessHours) SLOTS[0]).MondayStartTime => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.NORMAL => new List<String>{ ((BusinessHours) SLOTS[0]).Id, ((BusinessHours) SLOTS[2]).Id },
                        IterTestUtils.CONSTS.EXTENDED => new List<String>{ ((BusinessHours) SLOTS[4]).Id }
                },
                ((BusinessHours) SLOTS[1]).MondayStartTime => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.NORMAL => new List<String>{ ((BusinessHours) SLOTS[1]).Id },
                        IterTestUtils.CONSTS.EXTENDED => new List<String>{ ((BusinessHours) SLOTS[3]).Id }
                }
        };
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByInt
     */
    @IsTest
    static void groupingByInt() {
        // Given
        ((Account) ACCOUNTS[2]).NumberOfEmployees = ((Account) ACCOUNTS[0]).NumberOfEmployees;
        ((Account) ACCOUNTS[3]).NumberOfEmployees = ((Account) ACCOUNTS[1]).NumberOfEmployees;
        ((Account) ACCOUNTS[4]).NumberOfEmployees = ((Account) ACCOUNTS[0]).NumberOfEmployees;
        IToIntFunction keyMapper = ToIntFunction.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Name));
        IFunction typeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Type));
        Collector downstream = Collectors.toList(nameFunction);
        // When
        Map<Integer, List<SObject>> actual = (Map<Integer, List<SObject>>) Stream.of(ACCOUNTS).collect(Collectors.groupingByInt(keyMapper).cast(Map<Integer, List<SObject>>.class));
        Map<Integer, Object> actual1 = (Map<Integer, Object>) Stream.of(ACCOUNTS).collect(Collectors.groupingByInt(keyMapper, downstream));
        Map<Integer, Object> actual2 = (Map<Integer, Object>) Stream.of(ACCOUNTS).collect(Collectors.groupingByInt(keyMapper, Collectors.groupingByString(typeFunction, downstream)));
        // Then
        Map<Integer, List<Account>> expected = new Map<Integer, List<Account>>{
                ((Account) ACCOUNTS[0]).NumberOfEmployees => new List<Account>{ (Account) ACCOUNTS[0], (Account) ACCOUNTS[2], (Account) ACCOUNTS[4] },
                ((Account) ACCOUNTS[1]).NumberOfEmployees => new List<Account>{ (Account) ACCOUNTS[1], (Account) ACCOUNTS[3] }
        };
        Assert.areEqual(expected, actual);
        Map<Integer, List<String>> expected1 = new Map<Integer, List<String>>{
                ((Account) ACCOUNTS[0]).NumberOfEmployees => new List<String>{ ((Account) ACCOUNTS[0]).Name, ((Account) ACCOUNTS[2]).Name, ((Account) ACCOUNTS[4]).Name },
                ((Account) ACCOUNTS[1]).NumberOfEmployees => new List<String>{ ((Account) ACCOUNTS[1]).Name, ((Account) ACCOUNTS[3]).Name }
        };
        Assert.areEqual(expected1, actual1);
        Map<Integer, Map<String, List<String>>> expected2 = new Map<Integer, Map<String, List<String>>>{
                ((Account) ACCOUNTS[0]).NumberOfEmployees => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CUSTOMER => new List<String>{ ((Account) ACCOUNTS[0]).Name, ((Account) ACCOUNTS[2]).Name },
                        IterTestUtils.CONSTS.PARTNER => new List<String>{ ((Account) ACCOUNTS[4]).Name }
                },
                ((Account) ACCOUNTS[1]).NumberOfEmployees => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CUSTOMER => new List<String>{ ((Account) ACCOUNTS[1]).Name },
                        IterTestUtils.CONSTS.PARTNER => new List<String>{ ((Account) ACCOUNTS[3]).Name }
                }
        };
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByLong
     */
    @IsTest
    static void groupingByLong() {
        // Given
        ((Account) ACCOUNTS[2]).NumberOfEmployees = ((Account) ACCOUNTS[0]).NumberOfEmployees;
        ((Account) ACCOUNTS[3]).NumberOfEmployees = ((Account) ACCOUNTS[1]).NumberOfEmployees;
        ((Account) ACCOUNTS[4]).NumberOfEmployees = ((Account) ACCOUNTS[0]).NumberOfEmployees;
        IToLongFunction keyMapper = ToLongFunction.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Name));
        IFunction typeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Type));
        Collector downstream = Collectors.toList(nameFunction);
        // When
        Map<Long, List<SObject>> actual = (Map<Long, List<SObject>>) Stream.of(ACCOUNTS).collect(Collectors.groupingByLong(keyMapper).cast(Map<Long, List<SObject>>.class));
        Map<Long, Object> actual1 = (Map<Long, Object>) Stream.of(ACCOUNTS).collect(Collectors.groupingByLong(keyMapper, downstream));
        Map<Long, Object> actual2 = (Map<Long, Object>) Stream.of(ACCOUNTS).collect(Collectors.groupingByLong(keyMapper, Collectors.groupingByString(typeFunction, downstream)));
        // Then
        Map<Long, List<Account>> expected = new Map<Long, List<Account>>{
                ((Account) ACCOUNTS[0]).NumberOfEmployees => new List<Account>{ (Account) ACCOUNTS[0], (Account) ACCOUNTS[2], (Account) ACCOUNTS[4] },
                ((Account) ACCOUNTS[1]).NumberOfEmployees => new List<Account>{ (Account) ACCOUNTS[1], (Account) ACCOUNTS[3] }
        };
        Assert.areEqual(expected, actual);
        Map<Long, List<String>> expected1 = new Map<Long, List<String>>{
                ((Account) ACCOUNTS[0]).NumberOfEmployees => new List<String>{ ((Account) ACCOUNTS[0]).Name, ((Account) ACCOUNTS[2]).Name, ((Account) ACCOUNTS[4]).Name },
                ((Account) ACCOUNTS[1]).NumberOfEmployees => new List<String>{ ((Account) ACCOUNTS[1]).Name, ((Account) ACCOUNTS[3]).Name }
        };
        Assert.areEqual(expected1, actual1);
        Map<Long, Map<String, List<String>>> expected2 = new Map<Long, Map<String, List<String>>>{
                ((Account) ACCOUNTS[0]).NumberOfEmployees => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CUSTOMER => new List<String>{ ((Account) ACCOUNTS[0]).Name, ((Account) ACCOUNTS[2]).Name },
                        IterTestUtils.CONSTS.PARTNER => new List<String>{ ((Account) ACCOUNTS[4]).Name }
                },
                ((Account) ACCOUNTS[1]).NumberOfEmployees => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CUSTOMER => new List<String>{ ((Account) ACCOUNTS[1]).Name },
                        IterTestUtils.CONSTS.PARTNER => new List<String>{ ((Account) ACCOUNTS[3]).Name }
                }
        };
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByDouble
     */
    @IsTest
    static void groupingByDouble() {
        // Given
        ((Account) ACCOUNTS[2]).BillingLatitude = ((Account) ACCOUNTS[0]).BillingLatitude;
        ((Account) ACCOUNTS[3]).BillingLatitude = ((Account) ACCOUNTS[1]).BillingLatitude;
        ((Account) ACCOUNTS[4]).BillingLatitude = ((Account) ACCOUNTS[0]).BillingLatitude;
        IToDoubleFunction keyMapper = ToDoubleFunction.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.BillingLatitude));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Name));
        IFunction typeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Type));
        Collector downstream = Collectors.toList(nameFunction);
        // When
        Map<Double, List<SObject>> actual = (Map<Double, List<SObject>>) Stream.of(ACCOUNTS).collect(Collectors.groupingByDouble(keyMapper).cast(Map<Double, List<SObject>>.class));
        Map<Double, Object> actual1 = (Map<Double, Object>) Stream.of(ACCOUNTS).collect(Collectors.groupingByDouble(keyMapper, downstream));
        Map<Double, Object> actual2 = (Map<Double, Object>) Stream.of(ACCOUNTS).collect(Collectors.groupingByDouble(keyMapper, Collectors.groupingByString(typeFunction, downstream)));
        // Then
        Map<Double, List<Account>> expected = new Map<Double, List<Account>>{
                ((Account) ACCOUNTS[0]).BillingLatitude => new List<Account>{ (Account) ACCOUNTS[0], (Account) ACCOUNTS[2], (Account) ACCOUNTS[4] },
                ((Account) ACCOUNTS[1]).BillingLatitude => new List<Account>{ (Account) ACCOUNTS[1], (Account) ACCOUNTS[3] }
        };
        Assert.areEqual(expected, actual);
        Map<Double, List<String>> expected1 = new Map<Double, List<String>>{
                ((Account) ACCOUNTS[0]).BillingLatitude => new List<String>{ ((Account) ACCOUNTS[0]).Name, ((Account) ACCOUNTS[2]).Name, ((Account) ACCOUNTS[4]).Name },
                ((Account) ACCOUNTS[1]).BillingLatitude => new List<String>{ ((Account) ACCOUNTS[1]).Name, ((Account) ACCOUNTS[3]).Name }
        };
        Assert.areEqual(expected1, actual1);
        Map<Double, Map<String, List<String>>> expected2 = new Map<Double, Map<String, List<String>>>{
                ((Account) ACCOUNTS[0]).BillingLatitude => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CUSTOMER => new List<String>{ ((Account) ACCOUNTS[0]).Name, ((Account) ACCOUNTS[2]).Name },
                        IterTestUtils.CONSTS.PARTNER => new List<String>{ ((Account) ACCOUNTS[4]).Name }
                },
                ((Account) ACCOUNTS[1]).BillingLatitude => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CUSTOMER => new List<String>{ ((Account) ACCOUNTS[1]).Name },
                        IterTestUtils.CONSTS.PARTNER => new List<String>{ ((Account) ACCOUNTS[3]).Name }
                }
        };
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see Collectors.groupingBy
     */
    @IsTest
    static void groupingBy() {
        // Given
        IFunction departmentFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Department));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName));
        IFunction accIdFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.AccountId));
        // When
        Map<Object, List<Contact>> actual = (Map<Object, List<Contact>>) Stream.of(CONTACTS).collect(Collectors.groupingBy(departmentFunction).cast(Map<Object, List<Contact>>.class));
        Map<Object, List<String>> actual1 = (Map<Object, List<String>>) Stream.of(CONTACTS).collect(Collectors.groupingBy(departmentFunction, Collectors.toList(nameFunction)).cast(Map<Object, List<String>>.class));
        Map<Object, Map<Id, List<Contact>>> actual2 = (Map<Object, Map<Id, List<Contact>>>) Stream.of(CONTACTS).collect(Collectors.groupingBy(departmentFunction, Collectors.groupingById(accIdFunction)).cast(Map<Object, Map<Id, List<Contact>>>.class));
        // Then
        Map<Object, List<SObject>> expected = new Map<Object, List<SObject>>{
                ((Contact) CONTACTS[0]).Department => new List<Contact>{ (Contact) CONTACTS[0], (Contact) CONTACTS[1], (Contact) CONTACTS[2] },
                ((Contact) CONTACTS[3]).Department => new List<Contact>{ (Contact) CONTACTS[3], (Contact) CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Map<Object, List<String>> expected1 = new Map<Object, List<String>>{
                ((Contact) CONTACTS[0]).Department => new List<String>{ ((Contact) CONTACTS[0]).LastName, ((Contact) CONTACTS[1]).LastName, ((Contact) CONTACTS[2]).LastName },
                ((Contact) CONTACTS[3]).Department => new List<String>{ ((Contact) CONTACTS[3]).LastName, ((Contact) CONTACTS[4]).LastName }
        };
        Assert.areEqual(expected1, actual1);
        Map<Object, Map<Id, List<Contact>>> expected2 = new Map<Object, Map<Id, List<Contact>>>{
                ((Contact) CONTACTS[0]).Department => new Map<Id, List<Contact>>{
                        ((Contact) CONTACTS[0]).AccountId => new List<Contact>{ (Contact) CONTACTS[0], (Contact) CONTACTS[2] },
                        ((Contact) CONTACTS[1]).AccountId => new List<Contact>{ (Contact) CONTACTS[1] }
                },
                ((Contact) CONTACTS[3]).Department => new Map<Id, List<Contact>>{
                        ((Contact) CONTACTS[0]).AccountId => new List<Contact>{ (Contact) CONTACTS[4] },
                        ((Contact) CONTACTS[1]).AccountId => new List<Contact>{ (Contact) CONTACTS[3] }
                }
        };
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see Collectors.partitioningBy
     */
    @IsTest
    static void partitioningBy() {
        // Given
        IPredicate predicate = Predicate.compose(ToSObjectFunctions.asSObject(), SObjectPredicates.isEqual(IterTestUtils.CONSTS.Contact.Department, IterTestUtils.CONSTS.HR));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName));
        IFunction accIdFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.AccountId));
        // When
        Map<Boolean, List<Contact>> actual = (Map<Boolean, List<Contact>>) Stream.of(CONTACTS).collect(Collectors.partitioningBy(predicate).cast(Map<Boolean, List<Contact>>.class));
        Map<Boolean, List<String>> actual1 = (Map<Boolean, List<String>>) Stream.of(CONTACTS).collect(Collectors.partitioningBy(predicate, Collectors.toList(nameFunction)).cast(Map<Boolean, List<String>>.class));
        Map<Boolean, Map<Id, List<Contact>>> actual2 = (Map<Boolean, Map<Id, List<Contact>>>) Stream.of(CONTACTS).collect(Collectors.partitioningBy(predicate, Collectors.groupingById(accIdFunction)).cast(Map<Boolean, Map<Id, List<Contact>>>.class));
        // Then
        Map<Boolean, List<SObject>> expected = new Map<Boolean, List<SObject>>{
                true => new List<Contact>{ (Contact) CONTACTS[0], (Contact) CONTACTS[1], (Contact) CONTACTS[2] },
                false => new List<Contact>{ (Contact) CONTACTS[3], (Contact) CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Map<Boolean, List<String>> expected1 = new Map<Boolean, List<String>>{
                true => new List<String>{ ((Contact) CONTACTS[0]).LastName, ((Contact) CONTACTS[1]).LastName, ((Contact) CONTACTS[2]).LastName },
                false => new List<String>{ ((Contact) CONTACTS[3]).LastName, ((Contact) CONTACTS[4]).LastName }
        };
        Assert.areEqual(expected1, actual1);
        Map<Boolean, Map<Id, List<Contact>>> expected2 = new Map<Boolean, Map<Id, List<Contact>>>{
                true => new Map<Id, List<Contact>>{
                        ((Contact) CONTACTS[0]).AccountId => new List<Contact>{ (Contact) CONTACTS[0], (Contact) CONTACTS[2] },
                        ((Contact) CONTACTS[1]).AccountId => new List<Contact>{ (Contact) CONTACTS[1] }
                },
                false => new Map<Id, List<Contact>>{
                        ((Contact) CONTACTS[0]).AccountId => new List<Contact>{ (Contact) CONTACTS[4] },
                        ((Contact) CONTACTS[1]).AccountId => new List<Contact>{ (Contact) CONTACTS[3] }
                }
        };
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see SObjectCollectors.joining
     */
    @IsTest
    static void joining() {
        // Given
        String delimiter = ';';
        String prefix = 'prefix';
        String suffix = 'suffix';
        // When
        Object actual = Stream.of(STRINGS).collect(Collectors.joining());
        Object actual1 = Stream.of(STRINGS).collect(Collectors.joining(delimiter));
        String actual2 = (String) Stream.of(STRINGS).collect(Collectors.joining(delimiter, prefix, suffix));
        // Then
        String expected = STRINGS[0] + STRINGS[1] + STRINGS[2] + STRINGS[3] + STRINGS[4];
        Assert.areEqual(expected, actual);
        String expected1 =
                                      STRINGS[0]
                        + delimiter + STRINGS[1]
                        + delimiter + STRINGS[2]
                        + delimiter + STRINGS[3]
                        + delimiter + STRINGS[4];
        Assert.areEqual(expected1, actual1);
        String expected2 = prefix +
                                      STRINGS[0]
                        + delimiter + STRINGS[1]
                        + delimiter + STRINGS[2]
                        + delimiter + STRINGS[3]
                        + delimiter + STRINGS[4]
                + suffix;
        Assert.areEqual(expected2, actual2);
    }

    /**
     * @see Collectors.averagingInt
     * @see Collectors.counting
     * @see Collectors.summingInt
     */
    @IsTest
    static void intCollectors() {
        // Given
        IToIntFunction ageFunction = new IterTestUtils.GetAgeAsIntFunction();
        // When
        Integer actual = (Integer) Stream.of(PEOPLE).collect(Collectors.counting());
        Integer actual1 = (Integer) Stream.of(PEOPLE).collect(Collectors.summingInt(ageFunction));
        Double actual2 = (Double) Stream.of(PEOPLE).collect(Collectors.averagingInt(ageFunction));
        // Then
        Assert.areEqual(PEOPLE.size(), actual);
        Integer expected = (
                PEOPLE[0].getAge() + PEOPLE[1].getAge() + PEOPLE[2].getAge() + PEOPLE[3].getAge()
        );
        Assert.areEqual(expected, actual1);
        Double expected1 = expected / (Double) PEOPLE.size();
        Assert.areEqual(expected1, actual2);
    }

    /**
     * @see Collectors.averagingLong
     * @see Collectors.summingLong
     */
    @IsTest
    static void longCollectors() {
        // Given
        IToLongFunction ageFunction = new IterTestUtils.GetIdAsLongFunction();
        // When
        Long actual = (Long) Stream.of(PEOPLE).collect(Collectors.summingLong(ageFunction));
        Double actual1 = (Double) Stream.of(PEOPLE).collect(Collectors.averagingLong(ageFunction));
        // Then
        Long expected = (
                PEOPLE[0].getAutoId() + PEOPLE[1].getAutoId() + PEOPLE[2].getAutoId() + PEOPLE[3].getAutoId()
        );
        Assert.areEqual(expected, actual);
        Double expected1 = expected / (Double) PEOPLE.size();
        Assert.areEqual(expected1, actual1);
    }

    /**
     * @see Collectors.averagingDouble
     * @see Collectors.summingDouble
     */
    @IsTest
    static void doubleCollectors() {
        // Given
        IToDoubleFunction probabilityFunction = new IterTestUtils.GetProbabilityAsDoubleFunction();
        // When
        Double actual = (Double) Stream.of(PEOPLE).collect(Collectors.summingDouble(probabilityFunction));
        Double actual1 = (Double) Stream.of(PEOPLE).collect(Collectors.averagingDouble(probabilityFunction));
        // Then
        Double expected = (
                PEOPLE[0].getProbability() + PEOPLE[1].getProbability() + PEOPLE[2].getProbability() + PEOPLE[3].getProbability()
        );
        Assert.areEqual(expected, actual);
        Double expected1 = expected / (Double) PEOPLE.size();
        Assert.areEqual(expected1, actual1);
    }

    /**
     * @see Collectors.filtering
     */
    @IsTest
    static void filtering() {
        // Given
        IPredicate predicate = new IterTestUtils.IsAdultPredicate();
        IFunction keyMapper = new IterTestUtils.GetActiveFunction();
        // When
        List<Comparable> actual = (List<Comparable>) Stream.of(PEOPLE).collect(Collectors.filtering(predicate).cast(List<Comparable>.class));
        Map<Boolean, List<Comparable>> actual1 = (Map<Boolean, List<Comparable>>) Stream.of(PEOPLE).collect(Collectors.groupingByBool(keyMapper, Collectors.filtering(predicate)).cast(Map<Boolean, List<Comparable>>.class));
        // Then
        List<Comparable> expected = new List<Comparable>{ PEOPLE[0], PEOPLE[1], PEOPLE[3] };
        Assert.areEqual(expected, actual);
        Map<Boolean, List<Comparable>> expected1 = new Map<Boolean, List<Comparable>>{
                true => new List<Comparable>{ PEOPLE[0], PEOPLE[3] },
                false => new List<Comparable>{ PEOPLE[1]  }
        };
        Assert.areEqual(expected1, actual1);
    }

    /**
     * @see Collectors.mapping
     */
    @IsTest
    static void mapping() {
        // Given
        IFunction mapper = new IterTestUtils.GetNameFunction();
        IFunction keyMapper = new IterTestUtils.GetActiveFunction();
        // When
        List<String> actual = (List<String>) Stream.of(PEOPLE).collect(Collectors.mapping(mapper).cast(List<String>.class));
        Map<Boolean, List<String>> actual1 = (Map<Boolean, List<String>>) Stream.of(PEOPLE)
                .collect(Collectors.groupingByBool(keyMapper, Collectors.mapping(mapper)).cast(Map<Boolean, List<String>>.class));
        // Then
        List<String> expected = new List<String>{
                PEOPLE[0].getName(),
                PEOPLE[1].getName(),
                PEOPLE[2].getName(),
                PEOPLE[3].getName()
        };
        Assert.areEqual(expected, actual);
        Map<Boolean, List<String>> expected1 = new Map<Boolean, List<String>>{
                true => new List<String>{
                        PEOPLE[0].getName(),
                        PEOPLE[3].getName()
                },
                false => new List<String>{
                        PEOPLE[1].getName(),
                        PEOPLE[2].getName()
                }
        };
        Assert.areEqual(expected1, actual1);
    }

    /**
     * @see Collectors.flatMapping
     */
    @IsTest
    static void flatMapping() {
        // Given
        List<List<String>> input = new List<List<String>>{
                new List<String>{},
                null,
                new List<String>{ 'foo' },
                new List<String>{ 'bar', 'baz' }
        };
        // When
        List<String> actual = (List<String>) ObjectStream.of(input).collect(Collectors.flatMapping(Function.identity()).cast(List<String>.class));
        // Then
        List<String> expected = new List<String>{ 'foo', 'bar', 'baz' };
        Assert.areEqual(expected, actual);
    }

    /**
     * @see Collectors.reducing
     */
    @IsTest
    static void reducing() {
        // Given
        IBinaryOperator accumulator = BinaryOperator.maxBy(Comparator.comparingInt(new IterTestUtils.GetAgeAsIntFunction()));
        IFunction keyMapper = new IterTestUtils.GetActiveFunction();
        // When
        Optional actual = (Optional) Stream.of(PEOPLE).collect(Collectors.reducing(accumulator));
        Comparable actual1 = (Comparable) Stream.of(PEOPLE).collect(Collectors.reducing(new IterTestUtils.Person('seed', 0, Date.newInstance(2014, 2, 3), 4L, true), Function.identity(), accumulator));
        Comparable actual2 = (Comparable) Stream.of(PEOPLE).collect(Collectors.reducing(new IterTestUtils.Person('seed', 0, Date.newInstance(2014, 2, 3), 4L, true), accumulator));
        Map<Boolean, Object> actual3 = (Map<Boolean, Object>) Stream.of(PEOPLE).collect(Collectors.groupingByBool(keyMapper, Collectors.reducing(accumulator)));
        // Then
        Assert.areEqual(PEOPLE[1], actual.get());
        Assert.areEqual(PEOPLE[1], actual1);
        Assert.areEqual(PEOPLE[1], actual2);
        Map<Boolean, Optional> expected1 = new Map<Boolean, Optional>{
                true => Optional.of(PEOPLE[0]),
                false => Optional.of(PEOPLE[1])
        };
        Assert.areEqual(expected1, actual3);
    }

    /**
     * @see Collectors.maximizing
     * @see Collectors.minimizing
     */
    @IsTest
    static void optimizing() {
        // Given
        IComparator ageComparator = Comparator.comparingInt(new IterTestUtils.GetAgeAsIntFunction());
        IFunction keyMapper = new IterTestUtils.GetActiveFunction();
        // When
        Optional actual = (Optional) Stream.of(PEOPLE).collect(Collectors.maximizing(ageComparator));
        Map<Boolean, Object> actual1 = (Map<Boolean, Object>) Stream.of(PEOPLE).collect(Collectors.groupingByBool(keyMapper, Collectors.minimizing(ageComparator)));
        // Then
        Assert.areEqual(PEOPLE[1], actual.get());
        Map<Boolean, Optional> expected1 = new Map<Boolean, Optional>{
                true => Optional.of(PEOPLE[3]),
                false => Optional.of(PEOPLE[2])
        };
        Assert.areEqual(expected1, actual1);
    }

}
