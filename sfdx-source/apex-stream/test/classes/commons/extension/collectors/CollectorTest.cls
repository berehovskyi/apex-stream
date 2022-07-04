/**
 * @see Collectors
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class CollectorTest {

    private static List<Boolean> bools = IterTestUtilsExt.generateBools();
    private static List<Id> ids = IterTestUtils.generateIds();
    private static List<Blob> blobs = IterTestUtils.generateBlobs();
    private static List<Date> dates = IterTestUtils.generateDates();
    private static List<Datetime> datetimes = IterTestUtils.generateDatetimes();
    private static List<Time> times = IterTestUtils.generateTimes();
    private static List<Object> ints = IterTestUtils.generateInts1();
    private static List<Object> longs = IterTestUtilsExt.generateLongs1();
    private static List<Object> doubles = IterTestUtils.generateDoubles1();
    private static List<String> strings = IterTestUtilsExt.generateStrings1();
    private static List<Object> contacts = IterTestUtilsExt.generateContacts1();
    private static List<Object> attachments = IterTestUtilsExt.generateAttachments();
    private static List<Object> events = IterTestUtilsExt.generateEvents();
    private static List<Object> slots = IterTestUtilsExt.generateTimeSlots();
    private static List<Object> accounts = IterTestUtils.generateAccounts1();
    private static List<Comparable> comparables = IterTestUtils.generateComparables();
    private static List<IterTestUtils.Person> persons = IterTestUtils.generatePersons();
    private static List<Object> mix = IterTestUtilsExt.generateMix();

    /**
     * @see Collectors.toList
     */
    @IsTest
    static void toList() {
        // When
        // Invoke private constructors for coverage
        new Collectors();
        new CollectorBaseFunctions();
        new MapObjectConsumers();
        new ListObjectConsumers();
        new SetObjectConsumers();
        new BiConsumers();
        new StringSuppliers();
        new CollectorFunctions();
        new CollectorSuppliers();
        new DatetimeToLongFunctions();
        new IntToLongFunctions();
        new StringToLongFunctions();
        List<Boolean> actual = (List<Boolean>) Stream.of(bools).collect(Collectors.toList().cast(List<Boolean>.class));
        List<Id> actual1 = (List<Id>) Stream.of(ids).collect(Collectors.toList().cast(List<Id>.class));
        List<String> actual2 = (List<String>) Stream.of(strings).collect(Collectors.toList().cast(List<String>.class));
        List<Blob> actual3 = (List<Blob>) Stream.of(blobs).collect(Collectors.toList().cast(List<Blob>.class));
        List<Date> actual4 = (List<Date>) Stream.of(dates).collect(Collectors.toList().cast(List<Date>.class));
        List<Datetime> actual5 = (List<Datetime>) Stream.of(datetimes).collect(Collectors.toList().cast(List<Datetime>.class));
        List<Time> actual6 = (List<Time>) Stream.of(times).collect(Collectors.toList().cast(List<Time>.class));
        List<Integer> actual7 = (List<Integer>) Stream.of(ints).collect(Collectors.toList().cast(List<Integer>.class));
        List<Long> actual8 = (List<Long>) Stream.of(longs).collect(Collectors.toList().cast(List<Long>.class));
        List<Double> actual9 = (List<Double>) Stream.of(doubles).collect(Collectors.toList().cast(List<Double>.class));
        List<Contact> actual10 = (List<Contact>) Stream.of(contacts).collect(Collectors.toList().cast(List<SObject>.class));
        List<Object> actual11 = (List<Object>) Stream.of(mix).collect(Collectors.toList());
        List<Comparable> actual12 = (List<Comparable>) Stream.of(comparables).collect(Collectors.toList().cast(List<Comparable>.class));
        List<String> actual13 = (List<String>) Stream.of(strings).collect(Collectors.toList(StringFunctions.toUpperCase()).cast(List<String>.class));
        // Then
        Validate.assertEquals(bools, actual);
        Validate.assertEquals(ids, actual1);
        Validate.assertEquals(strings, actual2);
        Validate.assertEquals(blobs, actual3);
        Validate.assertEquals(dates, actual4);
        Validate.assertEquals(datetimes, actual5);
        Validate.assertEquals(times, actual6);
        Validate.assertEquals(ints, actual7);
        Validate.assertEquals(longs, actual8);
        Validate.assertEquals(doubles, actual9);
        Validate.assertEquals(contacts, actual10);
        Validate.assertEquals(mix, actual11);
        Validate.assertEquals(comparables, actual12);
        Validate.assertEquals(new List<String>{
                strings[0].toUpperCase(),
                strings[1].toUpperCase(),
                strings[2].toUpperCase(),
                strings[3].toUpperCase(),
                strings[4].toUpperCase()
        }, actual13);
    }

    /**
     * @see Collectors.toSet
     */
    @IsTest
    static void toSet() {
        // When
        Set<Boolean> actual = (Set<Boolean>) Stream.of(bools).collect(Collectors.toBoolSet());
        Set<Id> actual1 = (Set<Id>) Stream.of(ids).collect(Collectors.toIdSet());
        Set<String> actual2 = (Set<String>) Stream.of(strings).collect(Collectors.toStringSet());
        Set<Blob> actual3 = (Set<Blob>) Stream.of(blobs).collect(Collectors.toBlobSet());
        Set<Date> actual4 = (Set<Date>) Stream.of(dates).collect(Collectors.toDateSet());
        Set<Datetime> actual5 = (Set<Datetime>) Stream.of(datetimes).collect(Collectors.toDatetimeSet());
        Set<Time> actual6 = (Set<Time>) Stream.of(times).collect(Collectors.toTimeSet());
        Set<Integer> actual7 = (Set<Integer>) Stream.of(ints).collect(Collectors.toIntSet());
        Set<Long> actual8 = (Set<Long>) Stream.of(longs).collect(Collectors.toLongSet());
        Set<Double> actual9 = (Set<Double>) Stream.of(doubles).collect(Collectors.toDoubleSet());
        Set<SObject> actual10 = (Set<SObject>) Stream.of(contacts).collect(Collectors.toSObjectSet());
        Set<Object> actual11 = (Set<Object>) Stream.of(mix).collect(Collectors.toSet());
        Set<Object> actual12 = (Set<Object>) Stream.of(comparables).collect(Collectors.toSet());
        // Then
        Validate.assertEquals(new Set<Boolean>(bools), actual);
        Validate.assertEquals(new Set<Id>(ids), actual1);
        Validate.assertEquals(new Set<String>(strings), actual2);
        Validate.assertEquals(new Set<Blob>(blobs), actual3);
        Validate.assertEquals(new Set<Date>(dates), actual4);
        Validate.assertEquals(new Set<Datetime>(datetimes), actual5);
        Validate.assertEquals(new Set<Time>(times), actual6);
        Validate.assertEquals(new Set<Integer>{ (Integer) ints[0], (Integer) ints[1], (Integer) ints[2], (Integer) ints[3], (Integer) ints[4] }, actual7);
        Validate.assertEquals(new Set<Long>{ (Long) longs[0], (Long) longs[1], (Long) longs[2], (Long) longs[3], (Long) longs[4] }, actual8);
        Validate.assertEquals(new Set<Double>{ (Double) doubles[0], (Double) doubles[1], (Double) doubles[2], (Double) doubles[3], (Double) doubles[4] }, actual9);
        Validate.assertEquals(new Set<SObject>{ (SObject) contacts[0], (SObject) contacts[1], (SObject) contacts[2], (SObject) contacts[3], (SObject) contacts[4] }, actual10);
        Validate.assertEquals(new Set<Object>(mix), actual11);
        Validate.assertEquals(new Set<Object>{ (Object) comparables[0], (Object) comparables[1], (Object) comparables[2], (Object) comparables[3] }, actual12);
    }

    /**
     * @see Collectors.toByBoolMap
     */
    @IsTest
    static void toByBoolMap() {
        // Given
        List<Object> input = new List<Object>{ persons[0], persons[1] };
        IFunction isActiveFunction = new IterTestUtils.GetActiveFunction();
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Boolean, Comparable> actual = (Map<Boolean, Comparable>) Stream.of(input).collect(Collectors.toByBoolMap(isActiveFunction).cast(Map<Boolean, Comparable>.class));
        Map<Boolean, String> actual1 = (Map<Boolean, String>) Stream.of(input).collect(Collectors.toByBoolMap(isActiveFunction, nameFunction).cast(Map<Boolean, String>.class));
        Map<Boolean, String> actual2 = (Map<Boolean, String>) Stream.of(persons).collect(Collectors.toByBoolMap(isActiveFunction, nameFunction, right).cast(Map<Boolean, String>.class));
        // Then
        Map<Boolean, Comparable> expected = new Map<Boolean, Comparable>{ true => persons[0], false => persons[1] };
        Validate.assertEquals(expected, actual);
        Map<Boolean, String> expected1 = new Map<Boolean, String>{ true => persons[0].getName(), false => persons[1].getName() };
        Validate.assertEquals(expected1, actual1);
        Map<Boolean, String> expected2 = new Map<Boolean, String>{ true => persons[3].getName(), false => persons[2].getName() };
        Validate.assertEquals(expected2, actual2);
    }

    /**
     * @see Collectors.toByIdMap
     */
    @IsTest
    static void toByIdMap() {
        // Given
        List<Object> input = new List<Object>(contacts);
        input.add(input[0]);
        input.add(input[1]);
        IFunction idFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Id));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName));
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Id, Contact> actual = (Map<Id, Contact>) Stream.of(contacts).collect(Collectors.toByIdMap(idFunction).cast(Map<Id, Contact>.class));
        Map<Id, String> actual1 = (Map<Id, String>) Stream.of(contacts).collect(Collectors.toByIdMap(idFunction, nameFunction).cast(Map<Id, String>.class));
        Map<Id, String> actual2 = (Map<Id, String>) Stream.of(input).collect(Collectors.toByIdMap(idFunction, nameFunction, right).cast(Map<Id, String>.class));
        // Then
        Map<Id, Contact> expected = new Map<Id, Contact>{
                ((Contact) contacts[0]).Id => (Contact) contacts[0],
                ((Contact) contacts[1]).Id => (Contact) contacts[1],
                ((Contact) contacts[2]).Id => (Contact) contacts[2],
                ((Contact) contacts[3]).Id => (Contact) contacts[3],
                ((Contact) contacts[4]).Id => (Contact) contacts[4]
        };
        Validate.assertEquals(expected, actual);
        Map<Id, String> expected1 = new Map<Id, String>{
                ((Contact) contacts[0]).Id => ((Contact) contacts[0]).LastName,
                ((Contact) contacts[1]).Id => ((Contact) contacts[1]).LastName,
                ((Contact) contacts[2]).Id => ((Contact) contacts[2]).LastName,
                ((Contact) contacts[3]).Id => ((Contact) contacts[3]).LastName,
                ((Contact) contacts[4]).Id => ((Contact) contacts[4]).LastName
        };
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
    }

    /**
     * @see Collectors.toByStringMap
     */
    @IsTest
    static void toByStringMap() {
        // Given
        List<Object> input = new List<Object>();
        input.addAll(persons);
        input.add(input[0]);
        input.add(input[1]);
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        IFunction ageFunction = new IterTestUtils.GetAgeFunction();
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<String, Comparable> actual = (Map<String, Comparable>) Stream.of(persons).collect(Collectors.toByStringMap(nameFunction).cast(Map<String, Comparable>.class));
        Map<String, Integer> actual1 = (Map<String, Integer>) Stream.of(persons).collect(Collectors.toByStringMap(nameFunction, ageFunction).cast(Map<String, Integer>.class));
        Map<String, Integer> actual2 = (Map<String, Integer>) Stream.of(input).collect(Collectors.toByStringMap(nameFunction, ageFunction, right).cast(Map<String, Integer>.class));
        // Then
        Map<String, Comparable> expected = new Map<String, Comparable>{
                persons[0].getName() => persons[0],
                persons[1].getName() => persons[1],
                persons[2].getName() => persons[2],
                persons[3].getName() => persons[3]
        };
        Validate.assertEquals(expected, actual);
        Map<String, Integer> expected1 = new Map<String, Integer>{
                persons[0].getName() => persons[0].getAge(),
                persons[1].getName() => persons[1].getAge(),
                persons[2].getName() => persons[2].getAge(),
                persons[3].getName() => persons[3].getAge()
        };
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
    }

    /**
     * @see Collectors.toByBlobMap
     */
    @IsTest
    static void toByBlobMap() {
        // Given
        List<Object> input = new List<Object>(attachments);
        input.add(input[0]);
        input.add(input[1]);
        IFunction bodyFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Attachment.Body));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Attachment.Name));
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Blob, Attachment> actual = (Map<Blob, Attachment>) Stream.of(attachments).collect(Collectors.toByBlobMap(bodyFunction).cast(Map<Blob, Attachment>.class));
        Map<Blob, String> actual1 = (Map<Blob, String>) Stream.of(attachments).collect(Collectors.toByBlobMap(bodyFunction, nameFunction).cast(Map<Blob, String>.class));
        Map<Blob, String> actual2 = (Map<Blob, String>) Stream.of(input).collect(Collectors.toByBlobMap(bodyFunction, nameFunction, right).cast(Map<Blob, String>.class));
        // Then
        Map<Blob, Attachment> expected = new Map<Blob, Attachment>{
                ((Attachment) attachments[0]).Body => (Attachment) attachments[0],
                ((Attachment) attachments[1]).Body => (Attachment) attachments[1],
                ((Attachment) attachments[2]).Body => (Attachment) attachments[2],
                ((Attachment) attachments[3]).Body => (Attachment) attachments[3],
                ((Attachment) attachments[4]).Body => (Attachment) attachments[4],
                ((Attachment) attachments[5]).Body => (Attachment) attachments[5]
        };
        Validate.assertEquals(expected, actual);
        Map<Blob, String> expected1 = new Map<Blob, String>{
                ((Attachment) attachments[0]).Body => ((Attachment) attachments[0]).Name,
                ((Attachment) attachments[1]).Body => ((Attachment) attachments[1]).Name,
                ((Attachment) attachments[2]).Body => ((Attachment) attachments[2]).Name,
                ((Attachment) attachments[3]).Body => ((Attachment) attachments[3]).Name,
                ((Attachment) attachments[4]).Body => ((Attachment) attachments[4]).Name,
                ((Attachment) attachments[5]).Body => ((Attachment) attachments[5]).Name
        };
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
    }

    /**
     * @see Collectors.toByDateMap
     */
    @IsTest
    static void toByDateMap() {
        // Given
        List<Object> input = new List<Object>(contacts);
        input.add(input[0]);
        input.add(input[1]);
        IFunction birthdayFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Birthdate));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName));
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Date, Contact> actual = (Map<Date, Contact>) Stream.of(contacts).collect(Collectors.toByDateMap(birthdayFunction).cast(Map<Date, Contact>.class));
        Map<Date, String> actual1 = (Map<Date, String>) Stream.of(contacts).collect(Collectors.toByDateMap(birthdayFunction, nameFunction).cast(Map<Date, String>.class));
        Map<Date, String> actual2 = (Map<Date, String>) Stream.of(input).collect(Collectors.toByDateMap(birthdayFunction, nameFunction, right).cast(Map<Date, String>.class));
        // Then
        Map<Date, Contact> expected = new Map<Date, Contact>{
                ((Contact) contacts[0]).Birthdate => (Contact) contacts[0],
                ((Contact) contacts[1]).Birthdate => (Contact) contacts[1],
                ((Contact) contacts[2]).Birthdate => (Contact) contacts[2],
                ((Contact) contacts[3]).Birthdate => (Contact) contacts[3],
                ((Contact) contacts[4]).Birthdate => (Contact) contacts[4]
        };
        Validate.assertEquals(expected, actual);
        Map<Date, String> expected1 = new Map<Date, String>{
                ((Contact) contacts[0]).Birthdate => ((Contact) contacts[0]).LastName,
                ((Contact) contacts[1]).Birthdate => ((Contact) contacts[1]).LastName,
                ((Contact) contacts[2]).Birthdate => ((Contact) contacts[2]).LastName,
                ((Contact) contacts[3]).Birthdate => ((Contact) contacts[3]).LastName,
                ((Contact) contacts[4]).Birthdate => ((Contact) contacts[4]).LastName
        };
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
    }

    /**
     * @see Collectors.toByDatetimeMap
     */
    @IsTest
    static void toByDatetimeMap() {
        // Given
        List<Object> input = new List<Object>(events);
        input.add(input[0]);
        input.add(input[1]);
        IFunction activityFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Event.ActivityDateTime));
        IFunction descFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Event.Description));
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Datetime, Event> actual = (Map<Datetime, Event>) Stream.of(events).collect(Collectors.toByDatetimeMap(activityFunction).cast(Map<Datetime, Event>.class));
        Map<Datetime, String> actual1 = (Map<Datetime, String>) Stream.of(events).collect(Collectors.toByDatetimeMap(activityFunction, descFunction).cast(Map<Datetime, String>.class));
        Map<Datetime, String> actual2 = (Map<Datetime, String>) Stream.of(input).collect(Collectors.toByDatetimeMap(activityFunction, descFunction, right).cast(Map<Datetime, String>.class));
        // Then
        Map<Datetime, Event> expected = new Map<Datetime, Event>{
                ((Event) events[0]).ActivityDateTime => (Event) events[0],
                ((Event) events[1]).ActivityDateTime => (Event) events[1],
                ((Event) events[2]).ActivityDateTime => (Event) events[2],
                ((Event) events[3]).ActivityDateTime => (Event) events[3],
                ((Event) events[4]).ActivityDateTime => (Event) events[4]
        };
        Validate.assertEquals(expected, actual);
        Map<Datetime, String> expected1 = new Map<Datetime, String>{
                ((Event) events[0]).ActivityDateTime => ((Event) events[0]).Description,
                ((Event) events[1]).ActivityDateTime => ((Event) events[1]).Description,
                ((Event) events[2]).ActivityDateTime => ((Event) events[2]).Description,
                ((Event) events[3]).ActivityDateTime => ((Event) events[3]).Description,
                ((Event) events[4]).ActivityDateTime => ((Event) events[4]).Description
        };
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
    }

    /**
     * @see Collectors.toByTimeMap
     */
    @IsTest
    static void toByTimeMap() {
        // Given
        List<Object> input = new List<Object>(slots);
        input.add(input[0]);
        input.add(input[1]);
        IFunction endTimeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.TimeSlot.EndTime));
        IFunction startTimeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.TimeSlot.StartTime));
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Time, TimeSlot> actual = (Map<Time, TimeSlot>) Stream.of(slots).collect(Collectors.toByTimeMap(startTimeFunction).cast(Map<Time, TimeSlot>.class));
        Map<Time, Time> actual1 = (Map<Time, Time>) Stream.of(slots).collect(Collectors.toByTimeMap(startTimeFunction, endTimeFunction).cast(Map<Time, Time>.class));
        Map<Time, Time> actual2 = (Map<Time, Time>) Stream.of(input).collect(Collectors.toByTimeMap(startTimeFunction, endTimeFunction, right).cast(Map<Time, Time>.class));

        // Then
        Map<Time, TimeSlot> expected = new Map<Time, TimeSlot>{
                ((TimeSlot) slots[0]).StartTime => (TimeSlot) slots[0],
                ((TimeSlot) slots[1]).StartTime => (TimeSlot) slots[1],
                ((TimeSlot) slots[2]).StartTime => (TimeSlot) slots[2],
                ((TimeSlot) slots[3]).StartTime => (TimeSlot) slots[3],
                ((TimeSlot) slots[4]).StartTime => (TimeSlot) slots[4]
        };
        Validate.assertEquals(expected, actual);
        Map<Time, Time> expected1 = new Map<Time, Time>{
                ((TimeSlot) slots[0]).StartTime => ((TimeSlot) slots[0]).EndTime,
                ((TimeSlot) slots[1]).StartTime => ((TimeSlot) slots[1]).EndTime,
                ((TimeSlot) slots[2]).StartTime => ((TimeSlot) slots[2]).EndTime,
                ((TimeSlot) slots[3]).StartTime => ((TimeSlot) slots[3]).EndTime,
                ((TimeSlot) slots[4]).StartTime => ((TimeSlot) slots[4]).EndTime
        };
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
    }

    /**
     * @see Collectors.toByIntMap
     */
    @IsTest
    static void toByIntMap() {
        // Given
        List<Object> input = new List<Object>();
        input.addAll(persons);
        input.add(input[0]);
        input.add(input[1]);
        IToIntFunction ageFunction = new IterTestUtils.GetAgeAsIntFunction();
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Integer, Comparable> actual = (Map<Integer, Comparable>) Stream.of(persons).collect(Collectors.toByIntMap(ageFunction).cast(Map<Integer, Comparable>.class));
        Map<Integer, String> actual1 = (Map<Integer, String>) Stream.of(persons).collect(Collectors.toByIntMap(ageFunction, nameFunction).cast(Map<Integer, String>.class));
        Map<Integer, String> actual2 = (Map<Integer, String>) Stream.of(input).collect(Collectors.toByIntMap(ageFunction, nameFunction, right).cast(Map<Integer, String>.class));
        // Then
        Map<Integer, Object> expected = new Map<Integer, Object>{
                persons[0].getAge() => persons[0],
                persons[1].getAge() => persons[1],
                persons[2].getAge() => persons[2],
                persons[3].getAge() => persons[3]
        };
        Validate.assertEquals(expected, actual);
        Map<Integer, String> expected1 = new Map<Integer, String>{
                persons[0].getAge() => persons[0].getName(),
                persons[1].getAge() => persons[1].getName(),
                persons[2].getAge() => persons[2].getName(),
                persons[3].getAge() => persons[3].getName()
        };
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
    }

    /**
     * @see Collectors.toByLongMap
     */
    @IsTest
    static void toByLongMap() {
        // Given
        List<Object> input = new List<Object>();
        input.addAll(persons);
        input.add(input[0]);
        input.add(input[1]);
        IToLongFunction idFunction = new IterTestUtils.GetIdAsLongFunction();
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Long, Comparable> actual = (Map<Long, Comparable>) Stream.of(persons).collect(Collectors.toByLongMap(idFunction).cast(Map<Long, Comparable>.class));
        Map<Long, String> actual1 = (Map<Long, String>) Stream.of(persons).collect(Collectors.toByLongMap(idFunction, nameFunction).cast(Map<Long, String>.class));
        Map<Long, String> actual2 = (Map<Long, String>) Stream.of(input).collect(Collectors.toByLongMap(idFunction, nameFunction, right).cast(Map<Long, String>.class));
        // Then
        Map<Long, Object> expected = new Map<Long, Object>{
                persons[0].getAutoId() => persons[0],
                persons[1].getAutoId() => persons[1],
                persons[2].getAutoId() => persons[2],
                persons[3].getAutoId() => persons[3]
        };
        Validate.assertEquals(expected, actual);
        Map<Long, String> expected1 = new Map<Long, String>{
                persons[0].getAutoId() => persons[0].getName(),
                persons[1].getAutoId() => persons[1].getName(),
                persons[2].getAutoId() => persons[2].getName(),
                persons[3].getAutoId() => persons[3].getName()
        };
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
    }

    /**
     * @see Collectors.toByDoubleMap
     */
    @IsTest
    static void toByDoubleMap() {
        // Given
        List<Object> input = new List<Object>();
        input.addAll(persons);
        input.add(input[0]);
        input.add(input[1]);
        IToDoubleFunction probFunction = new IterTestUtils.GetProbabilityAsDoubleFunction();
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Double, Comparable> actual = (Map<Double, Comparable>) Stream.of(persons).collect(Collectors.toByDoubleMap(probFunction).cast(Map<Double, Comparable>.class));
        Map<Double, String> actual1 = (Map<Double, String>) Stream.of(persons).collect(Collectors.toByDoubleMap(probFunction, nameFunction).cast(Map<Double, String>.class));
        Map<Double, String> actual2 = (Map<Double, String>) Stream.of(input).collect(Collectors.toByDoubleMap(probFunction, nameFunction, right).cast(Map<Double, String>.class));
        // Then
        Map<Double, Object> expected = new Map<Double, Object>{
                persons[0].getProbability() => persons[0],
                persons[1].getProbability() => persons[1],
                persons[2].getProbability() => persons[2],
                persons[3].getProbability() => persons[3]
        };
        Validate.assertEquals(expected, actual);
        Map<Double, String> expected1 = new Map<Double, String>{
                persons[0].getProbability() => persons[0].getName(),
                persons[1].getProbability() => persons[1].getName(),
                persons[2].getProbability() => persons[2].getName(),
                persons[3].getProbability() => persons[3].getName()
        };
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
    }

    /**
     * @see Collectors.toMap
     */
    @IsTest
    static void toMap() {
        // Given
        List<Object> input = new List<Object>();
        input.addAll(persons);
        input.add(input[0]);
        input.add(input[1]);
        IFunction nameFunction = new IterTestUtils.GetNameFunction();
        IFunction ageFunction = new IterTestUtils.GetAgeFunction();
        IBinaryOperator right = BinaryOperator.right();
        // When
        Map<Object, Comparable> actual = (Map<Object, Comparable>) Stream.of(persons).collect(Collectors.toMap(nameFunction).cast(Map<Object, Comparable>.class));
        Map<Object, Integer> actual1 = (Map<Object, Integer>) Stream.of(persons).collect(Collectors.toMap(nameFunction, ageFunction).cast(Map<Object, Integer>.class));
        Map<Object, Integer> actual2 = (Map<Object, Integer>) Stream.of(input).collect(Collectors.toMap(nameFunction, ageFunction, right).cast(Map<Object, Integer>.class));
        // Then
        Map<Object, Comparable> expected = new Map<Object, Comparable>{
                persons[0].getName() => persons[0],
                persons[1].getName() => persons[1],
                persons[2].getName() => persons[2],
                persons[3].getName() => persons[3]
        };
        Validate.assertEquals(expected, actual);
        Map<Object, Integer> expected1 = new Map<Object, Integer>{
                persons[0].getName() => persons[0].getAge(),
                persons[1].getName() => persons[1].getAge(),
                persons[2].getName() => persons[2].getAge(),
                persons[3].getName() => persons[3].getAge()
        };
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
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
        input.addAll(persons);
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
                true => new List<Comparable>{ persons[0], persons[3], richard },
                false => new List<Comparable>{ persons[1], persons[2], luke }
        };
        Validate.assertEquals(expected, actual);
        Map<Boolean, List<String>> expected1 = new Map<Boolean, List<String>>{
                true => new List<String>{ persons[0].getName(), persons[3].getName(), richard.getName() },
                false => new List<String>{ persons[1].getName(), persons[2].getName(), luke.getName() }
        };
        Validate.assertEquals(expected1, actual1);
        Map<Boolean, Map<Boolean, List<Comparable>>> expected2 = new Map<Boolean, Map<Boolean, List<Comparable>>>{
                true => new Map<Boolean, List<Comparable>>{ true => new List<Comparable>{ persons[0], persons[3], richard } },
                false => new Map<Boolean, List<Comparable>>{ true => new List<Comparable>{ persons[1] }, false => new List<Comparable>{ persons[2], luke } }
        };
        Validate.assertEquals(expected2, actual2);
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
        Map<Id, List<Contact>> actual = (Map<Id, List<Contact>>) Stream.of(contacts).collect(Collectors.groupingById(accIdFunction).cast(Map<Id, List<Contact>>.class));
        Map<Id, List<String>> actual1 = (Map<Id, List<String>>) Stream.of(contacts).collect(Collectors.groupingById(accIdFunction, Collectors.toList(nameFunction)).cast(Map<Id, List<String>>.class));
        Map<Id, Map<String, List<Contact>>> actual2 = (Map<Id, Map<String, List<Contact>>>) Stream.of(contacts).collect(Collectors.groupingById(accIdFunction, Collectors.groupingByString(departmentFunction)).cast(Map<Id, Map<String, List<Contact>>>.class));
        // Then
        Map<Id, List<SObject>> expected = new Map<Id, List<SObject>>{
                ((Contact) contacts[0]).AccountId => new List<Contact>{ (Contact) contacts[0], (Contact) contacts[2], (Contact) contacts[4] },
                ((Contact) contacts[1]).AccountId => new List<Contact>{ (Contact) contacts[1], (Contact) contacts[3] }
        };
        Validate.assertEquals(expected, actual);
        Map<Id, List<String>> expected1 = new Map<Id, List<String>>{
                ((Contact) contacts[0]).AccountId => new List<String>{ ((Contact) contacts[0]).LastName, ((Contact) contacts[2]).LastName, ((Contact) contacts[4]).LastName },
                ((Contact) contacts[1]).AccountId => new List<String>{ ((Contact) contacts[1]).LastName, ((Contact) contacts[3]).LastName }
        };
        Validate.assertEquals(expected1, actual1);
        Map<Id, Map<String, List<Contact>>> expected2 = new Map<Id, Map<String, List<Contact>>>{
                ((Contact) contacts[0]).AccountId => new Map<String, List<Contact>>{
                        IterTestUtils.CONSTS.HR => new List<Contact>{ (Contact) contacts[0], (Contact) contacts[2] },
                        IterTestUtils.CONSTS.FINANCE => new List<Contact>{ (Contact) contacts[4] }
                },
                ((Contact) contacts[1]).AccountId => new Map<String, List<Contact>>{
                        IterTestUtils.CONSTS.HR => new List<Contact>{ (Contact) contacts[1] },
                        IterTestUtils.CONSTS.FINANCE => new List<Contact>{ (Contact) contacts[3] }
                }
        };
        Validate.assertEquals(expected2, actual2);
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
        Map<String, List<Contact>> actual = (Map<String, List<Contact>>) Stream.of(contacts).collect(Collectors.groupingByString(departmentFunction).cast(Map<String, List<Contact>>.class));
        Map<String, List<String>> actual1 = (Map<String, List<String>>) Stream.of(contacts).collect(Collectors.groupingByString(departmentFunction, Collectors.toList(nameFunction)).cast(Map<String, List<String>>.class));
        Map<String, Map<Id, List<Contact>>> actual2 = (Map<String, Map<Id, List<Contact>>>) Stream.of(contacts).collect(Collectors.groupingByString(departmentFunction, Collectors.groupingById(accIdFunction)).cast(Map<String, Map<Id, List<Contact>>>.class));
        // Then
        Map<String, List<SObject>> expected = new Map<String, List<SObject>>{
                ((Contact) contacts[0]).Department => new List<Contact>{ (Contact) contacts[0], (Contact) contacts[1], (Contact) contacts[2] },
                ((Contact) contacts[3]).Department => new List<Contact>{ (Contact) contacts[3], (Contact) contacts[4] }
        };
        Validate.assertEquals(expected, actual);
        Map<String, List<String>> expected1 = new Map<String, List<String>>{
                ((Contact) contacts[0]).Department => new List<String>{ ((Contact) contacts[0]).LastName, ((Contact) contacts[1]).LastName, ((Contact) contacts[2]).LastName },
                ((Contact) contacts[3]).Department => new List<String>{ ((Contact) contacts[3]).LastName, ((Contact) contacts[4]).LastName }
        };
        Validate.assertEquals(expected1, actual1);
        Map<String, Map<Id, List<Contact>>> expected2 = new Map<String, Map<Id, List<Contact>>>{
                ((Contact) contacts[0]).Department => new Map<Id, List<Contact>>{
                        ((Contact) contacts[0]).AccountId => new List<Contact>{ (Contact) contacts[0], (Contact) contacts[2] },
                        ((Contact) contacts[1]).AccountId => new List<Contact>{ (Contact) contacts[1] }
                },
                ((Contact) contacts[3]).Department => new Map<Id, List<Contact>>{
                        ((Contact) contacts[0]).AccountId => new List<Contact>{ (Contact) contacts[4] },
                        ((Contact) contacts[1]).AccountId => new List<Contact>{ (Contact) contacts[3] }
                }
        };
        Validate.assertEquals(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByBlob
     */
    @IsTest
    static void groupingByBlob() {
        // Given
        ((Attachment) attachments[2]).Body = ((Attachment) attachments[0]).Body;
        ((Attachment) attachments[3]).Body = ((Attachment) attachments[1]).Body;
        ((Attachment) attachments[4]).Body = ((Attachment) attachments[0]).Body;
        ((Attachment) attachments[5]).Body = ((Attachment) attachments[1]).Body;
        IFunction keyMapper = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Attachment.Body));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Attachment.Name));
        IFunction contentTypeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Attachment.ContentType));
        Collector downstream = Collectors.toList(nameFunction);
        // When
        Map<Blob, List<SObject>> actual = (Map<Blob, List<SObject>>) Stream.of(attachments).collect(Collectors.groupingByBlob(keyMapper).cast(Map<Blob, List<SObject>>.class));
        Map<Blob, Object> actual1 = (Map<Blob, Object>) Stream.of(attachments).collect(Collectors.groupingByBlob(keyMapper, downstream));
        Map<Blob, Object> actual2 = (Map<Blob, Object>) Stream.of(attachments).collect(Collectors.groupingByBlob(keyMapper, Collectors.groupingByString(contentTypeFunction, downstream)));
        // Then
        Map<Blob, List<Attachment>> expected = new Map<Blob, List<Attachment>>{
                ((Attachment) attachments[0]).Body => new List<Attachment>{ (Attachment) attachments[0], (Attachment) attachments[2], (Attachment) attachments[4] },
                ((Attachment) attachments[1]).Body => new List<Attachment>{ (Attachment) attachments[1], (Attachment) attachments[3], (Attachment) attachments[5] }
        };
        Validate.assertEquals(expected, actual);
        Map<Blob, List<String>> expected1 = new Map<Blob, List<String>>{
                ((Attachment) attachments[0]).Body => new List<String>{ ((Attachment) attachments[0]).Name, ((Attachment) attachments[2]).Name, ((Attachment) attachments[4]).Name },
                ((Attachment) attachments[1]).Body => new List<String>{ ((Attachment) attachments[1]).Name, ((Attachment) attachments[3]).Name, ((Attachment) attachments[5]).Name }
        };
        Validate.assertEquals(expected1, actual1);
        Map<Blob, Map<String, List<String>>> expected2 = new Map<Blob, Map<String, List<String>>>{
                ((Attachment) attachments[0]).Body => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.DOC => new List<String>{ ((Attachment) attachments[0]).Name, ((Attachment) attachments[2]).Name },
                        IterTestUtils.CONSTS.PDF => new List<String>{ ((Attachment) attachments[4]).Name }
                },
                ((Attachment) attachments[1]).Body => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.DOC => new List<String>{ ((Attachment) attachments[1]).Name },
                        IterTestUtils.CONSTS.PDF => new List<String>{ ((Attachment) attachments[3]).Name, ((Attachment) attachments[5]).Name }
                }
        };
        Validate.assertEquals(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByDate
     */
    @IsTest
    static void groupingByDate() {
        // Given
        ((Contact) contacts[2]).Birthdate = ((Contact) contacts[0]).Birthdate;
        ((Contact) contacts[3]).Birthdate = ((Contact) contacts[1]).Birthdate;
        ((Contact) contacts[4]).Birthdate = ((Contact) contacts[0]).Birthdate;
        IFunction keyMapper = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Birthdate));
        IFunction lastNameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName));
        IFunction departmentFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Department));
        Collector downstream = Collectors.toList(lastNameFunction);
        // When
        Map<Date, List<SObject>> actual = (Map<Date, List<SObject>>) Stream.of(contacts).collect(Collectors.groupingByDate(keyMapper).cast(Map<Date, List<SObject>>.class));
        Map<Date, Object> actual1 = (Map<Date, Object>) Stream.of(contacts).collect(Collectors.groupingByDate(keyMapper, downstream));
        Map<Date, Object> actual2 = (Map<Date, Object>) Stream.of(contacts).collect(Collectors.groupingByDate(keyMapper, Collectors.groupingByString(departmentFunction, downstream)));
        // Then
        Map<Date, List<Contact>> expected = new Map<Date, List<Contact>>{
                ((Contact) contacts[0]).Birthdate => new List<Contact>{ (Contact) contacts[0], (Contact) contacts[2], (Contact) contacts[4] },
                ((Contact) contacts[1]).Birthdate => new List<Contact>{ (Contact) contacts[1], (Contact) contacts[3] }
        };
        Validate.assertEquals(expected, actual);
        Map<Date, List<String>> expected1 = new Map<Date, List<String>>{
                ((Contact) contacts[0]).Birthdate => new List<String>{ ((Contact) contacts[0]).LastName, ((Contact) contacts[2]).LastName, ((Contact) contacts[4]).LastName },
                ((Contact) contacts[1]).Birthdate => new List<String>{ ((Contact) contacts[1]).LastName, ((Contact) contacts[3]).LastName }
        };
        Validate.assertEquals(expected1, actual1);
        Map<Date, Map<String, List<String>>> expected2 = new Map<Date, Map<String, List<String>>>{
                ((Contact) contacts[0]).Birthdate => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.HR => new List<String>{ ((Contact) contacts[0]).LastName, ((Contact) contacts[2]).LastName },
                        IterTestUtils.CONSTS.FINANCE => new List<String>{ ((Contact) contacts[4]).LastName }
                },
                ((Contact) contacts[1]).Birthdate => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.HR => new List<String>{ ((Contact) contacts[1]).LastName },
                        IterTestUtils.CONSTS.FINANCE => new List<String>{ ((Contact) contacts[3]).LastName }
                }
        };
        Validate.assertEquals(expected2, actual2);
    }

    /**
    * @see Collectors.groupingByDatetime
    */
    @IsTest
    static void groupingByDatetime() {
        // Given
        ((Event) events[2]).ActivityDateTime = ((Event) events[0]).ActivityDateTime;
        ((Event) events[3]).ActivityDateTime = ((Event) events[1]).ActivityDateTime;
        ((Event) events[4]).ActivityDateTime = ((Event) events[0]).ActivityDateTime;
        IFunction keyMapper = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Event.ActivityDateTime));
        IFunction descriptionFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Event.Description));
        IFunction typeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Event.Type));
        Collector downstream = Collectors.toList(descriptionFunction);
        // When
        Map<Datetime, List<SObject>> actual = (Map<Datetime, List<SObject>>) Stream.of(events).collect(Collectors.groupingByDatetime(keyMapper).cast(Map<Datetime, List<SObject>>.class));
        Map<Datetime, Object> actual1 = (Map<Datetime, Object>) Stream.of(events).collect(Collectors.groupingByDatetime(keyMapper, downstream));
        Map<Datetime, Object> actual2 = (Map<Datetime, Object>) Stream.of(events).collect(Collectors.groupingByDatetime(keyMapper, Collectors.groupingByString(typeFunction, downstream)));
        // Then
        Map<Datetime, List<Event>> expected = new Map<Datetime, List<Event>>{
                ((Event) events[0]).ActivityDateTime => new List<Event>{ (Event) events[0], (Event) events[2], (Event) events[4] },
                ((Event) events[1]).ActivityDateTime => new List<Event>{ (Event) events[1], (Event) events[3] }
        };
        Validate.assertEquals(expected, actual);
        Map<Datetime, List<String>> expected1 = new Map<Datetime, List<String>>{
                ((Event) events[0]).ActivityDateTime => new List<String>{ ((Event) events[0]).Description, ((Event) events[2]).Description, ((Event) events[4]).Description },
                ((Event) events[1]).ActivityDateTime => new List<String>{ ((Event) events[1]).Description, ((Event) events[3]).Description }
        };
        Validate.assertEquals(expected1, actual1);
        Map<Datetime, Map<String, List<String>>> expected2 = new Map<Datetime, Map<String, List<String>>>{
                ((Event) events[0]).ActivityDateTime => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CALL => new List<String>{ ((Event) events[0]).Description, ((Event) events[2]).Description },
                        IterTestUtils.CONSTS.EMAIL => new List<String>{ ((Event) events[4]).Description }
                },
                ((Event) events[1]).ActivityDateTime => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CALL => new List<String>{ ((Event) events[1]).Description },
                        IterTestUtils.CONSTS.EMAIL => new List<String>{ ((Event) events[3]).Description }
                }
        };
        Validate.assertEquals(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByTime
     */
    @IsTest
    static void groupingByTime() {
        // Given
        ((TimeSlot) slots[2]).StartTime = ((TimeSlot) slots[0]).StartTime;
        ((TimeSlot) slots[3]).StartTime = ((TimeSlot) slots[1]).StartTime;
        ((TimeSlot) slots[4]).StartTime = ((TimeSlot) slots[0]).StartTime;
        IFunction keyMapper = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.TimeSlot.StartTime));
        IFunction idFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.TimeSlot.Id));
        IFunction typeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.TimeSlot.Type));
        Collector downstream = Collectors.toList(idFunction);
        // When
        Map<Time, List<SObject>> actual = (Map<Time, List<SObject>>) Stream.of(slots).collect(Collectors.groupingByTime(keyMapper).cast(Map<Time, List<SObject>>.class));
        Map<Time, Object> actual1 = (Map<Time, Object>) Stream.of(slots).collect(Collectors.groupingByTime(keyMapper, downstream));
        Map<Time, Object> actual2 = (Map<Time, Object>) Stream.of(slots).collect(Collectors.groupingByTime(keyMapper, Collectors.groupingByString(typeFunction, downstream)));
        // Then
        Map<Time, List<TimeSlot>> expected = new Map<Time, List<TimeSlot>>{
                ((TimeSlot) slots[0]).StartTime => new List<TimeSlot>{ (TimeSlot) slots[0], (TimeSlot) slots[2], (TimeSlot) slots[4] },
                ((TimeSlot) slots[1]).StartTime => new List<TimeSlot>{ (TimeSlot) slots[1], (TimeSlot) slots[3] }
        };
        Validate.assertEquals(expected, actual);
        Map<Time, List<Id>> expected1 = new Map<Time, List<Id>>{
                ((TimeSlot) slots[0]).StartTime => new List<String>{ ((TimeSlot) slots[0]).Id, ((TimeSlot) slots[2]).Id, ((TimeSlot) slots[4]).Id },
                ((TimeSlot) slots[1]).StartTime => new List<String>{ ((TimeSlot) slots[1]).Id, ((TimeSlot) slots[3]).Id }
        };
        Validate.assertEquals(expected1, actual1);
        Map<Time, Map<String, List<Id>>> expected2 = new Map<Time, Map<String, List<Id>>>{
                ((TimeSlot) slots[0]).StartTime => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.NORMAL => new List<String>{ ((TimeSlot) slots[0]).Id, ((TimeSlot) slots[2]).Id },
                        IterTestUtils.CONSTS.EXTENDED => new List<String>{ ((TimeSlot) slots[4]).Id }
                },
                ((TimeSlot) slots[1]).StartTime => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.NORMAL => new List<String>{ ((TimeSlot) slots[1]).Id },
                        IterTestUtils.CONSTS.EXTENDED => new List<String>{ ((TimeSlot) slots[3]).Id }
                }
        };
        Validate.assertEquals(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByInt
     */
    @IsTest
    static void groupingByInt() {
        // Given
        ((Account) accounts[2]).NumberOfEmployees = ((Account) accounts[0]).NumberOfEmployees;
        ((Account) accounts[3]).NumberOfEmployees = ((Account) accounts[1]).NumberOfEmployees;
        ((Account) accounts[4]).NumberOfEmployees = ((Account) accounts[0]).NumberOfEmployees;
        IToIntFunction keyMapper = ToIntFunction.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Name));
        IFunction typeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Type));
        Collector downstream = Collectors.toList(nameFunction);
        // When
        Map<Integer, List<SObject>> actual = (Map<Integer, List<SObject>>) Stream.of(accounts).collect(Collectors.groupingByInt(keyMapper).cast(Map<Integer, List<SObject>>.class));
        Map<Integer, Object> actual1 = (Map<Integer, Object>) Stream.of(accounts).collect(Collectors.groupingByInt(keyMapper, downstream));
        Map<Integer, Object> actual2 = (Map<Integer, Object>) Stream.of(accounts).collect(Collectors.groupingByInt(keyMapper, Collectors.groupingByString(typeFunction, downstream)));
        // Then
        Map<Integer, List<Account>> expected = new Map<Integer, List<Account>>{
                ((Account) accounts[0]).NumberOfEmployees => new List<Account>{ (Account) accounts[0], (Account) accounts[2], (Account) accounts[4] },
                ((Account) accounts[1]).NumberOfEmployees => new List<Account>{ (Account) accounts[1], (Account) accounts[3] }
        };
        Validate.assertEquals(expected, actual);
        Map<Integer, List<String>> expected1 = new Map<Integer, List<String>>{
                ((Account) accounts[0]).NumberOfEmployees => new List<String>{ ((Account) accounts[0]).Name, ((Account) accounts[2]).Name, ((Account) accounts[4]).Name },
                ((Account) accounts[1]).NumberOfEmployees => new List<String>{ ((Account) accounts[1]).Name, ((Account) accounts[3]).Name }
        };
        Validate.assertEquals(expected1, actual1);
        Map<Integer, Map<String, List<String>>> expected2 = new Map<Integer, Map<String, List<String>>>{
                ((Account) accounts[0]).NumberOfEmployees => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CUSTOMER => new List<String>{ ((Account) accounts[0]).Name, ((Account) accounts[2]).Name },
                        IterTestUtils.CONSTS.PARTNER => new List<String>{ ((Account) accounts[4]).Name }
                },
                ((Account) accounts[1]).NumberOfEmployees => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CUSTOMER => new List<String>{ ((Account) accounts[1]).Name },
                        IterTestUtils.CONSTS.PARTNER => new List<String>{ ((Account) accounts[3]).Name }
                }
        };
        Validate.assertEquals(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByLong
     */
    @IsTest
    static void groupingByLong() {
        // Given
        ((Account) accounts[2]).NumberOfEmployees = ((Account) accounts[0]).NumberOfEmployees;
        ((Account) accounts[3]).NumberOfEmployees = ((Account) accounts[1]).NumberOfEmployees;
        ((Account) accounts[4]).NumberOfEmployees = ((Account) accounts[0]).NumberOfEmployees;
        IToLongFunction keyMapper = ToLongFunction.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Name));
        IFunction typeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Type));
        Collector downstream = Collectors.toList(nameFunction);
        // When
        Map<Long, List<SObject>> actual = (Map<Long, List<SObject>>) Stream.of(accounts).collect(Collectors.groupingByLong(keyMapper).cast(Map<Long, List<SObject>>.class));
        Map<Long, Object> actual1 = (Map<Long, Object>) Stream.of(accounts).collect(Collectors.groupingByLong(keyMapper, downstream));
        Map<Long, Object> actual2 = (Map<Long, Object>) Stream.of(accounts).collect(Collectors.groupingByLong(keyMapper, Collectors.groupingByString(typeFunction, downstream)));
        // Then
        Map<Long, List<Account>> expected = new Map<Long, List<Account>>{
                ((Account) accounts[0]).NumberOfEmployees => new List<Account>{ (Account) accounts[0], (Account) accounts[2], (Account) accounts[4] },
                ((Account) accounts[1]).NumberOfEmployees => new List<Account>{ (Account) accounts[1], (Account) accounts[3] }
        };
        Validate.assertEquals(expected, actual);
        Map<Long, List<String>> expected1 = new Map<Long, List<String>>{
                ((Account) accounts[0]).NumberOfEmployees => new List<String>{ ((Account) accounts[0]).Name, ((Account) accounts[2]).Name, ((Account) accounts[4]).Name },
                ((Account) accounts[1]).NumberOfEmployees => new List<String>{ ((Account) accounts[1]).Name, ((Account) accounts[3]).Name }
        };
        Validate.assertEquals(expected1, actual1);
        Map<Long, Map<String, List<String>>> expected2 = new Map<Long, Map<String, List<String>>>{
                ((Account) accounts[0]).NumberOfEmployees => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CUSTOMER => new List<String>{ ((Account) accounts[0]).Name, ((Account) accounts[2]).Name },
                        IterTestUtils.CONSTS.PARTNER => new List<String>{ ((Account) accounts[4]).Name }
                },
                ((Account) accounts[1]).NumberOfEmployees => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CUSTOMER => new List<String>{ ((Account) accounts[1]).Name },
                        IterTestUtils.CONSTS.PARTNER => new List<String>{ ((Account) accounts[3]).Name }
                }
        };
        Validate.assertEquals(expected2, actual2);
    }

    /**
     * @see Collectors.groupingByDouble
     */
    @IsTest
    static void groupingByDouble() {
        // Given
        ((Account) accounts[2]).BillingLatitude = ((Account) accounts[0]).BillingLatitude;
        ((Account) accounts[3]).BillingLatitude = ((Account) accounts[1]).BillingLatitude;
        ((Account) accounts[4]).BillingLatitude = ((Account) accounts[0]).BillingLatitude;
        IToDoubleFunction keyMapper = ToDoubleFunction.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.BillingLatitude));
        IFunction nameFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Name));
        IFunction typeFunction = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Type));
        Collector downstream = Collectors.toList(nameFunction);
        // When
        Map<Double, List<SObject>> actual = (Map<Double, List<SObject>>) Stream.of(accounts).collect(Collectors.groupingByDouble(keyMapper).cast(Map<Double, List<SObject>>.class));
        Map<Double, Object> actual1 = (Map<Double, Object>) Stream.of(accounts).collect(Collectors.groupingByDouble(keyMapper, downstream));
        Map<Double, Object> actual2 = (Map<Double, Object>) Stream.of(accounts).collect(Collectors.groupingByDouble(keyMapper, Collectors.groupingByString(typeFunction, downstream)));
        // Then
        Map<Double, List<Account>> expected = new Map<Double, List<Account>>{
                ((Account) accounts[0]).BillingLatitude => new List<Account>{ (Account) accounts[0], (Account) accounts[2], (Account) accounts[4] },
                ((Account) accounts[1]).BillingLatitude => new List<Account>{ (Account) accounts[1], (Account) accounts[3] }
        };
        Validate.assertEquals(expected, actual);
        Map<Double, List<String>> expected1 = new Map<Double, List<String>>{
                ((Account) accounts[0]).BillingLatitude => new List<String>{ ((Account) accounts[0]).Name, ((Account) accounts[2]).Name, ((Account) accounts[4]).Name },
                ((Account) accounts[1]).BillingLatitude => new List<String>{ ((Account) accounts[1]).Name, ((Account) accounts[3]).Name }
        };
        Validate.assertEquals(expected1, actual1);
        Map<Double, Map<String, List<String>>> expected2 = new Map<Double, Map<String, List<String>>>{
                ((Account) accounts[0]).BillingLatitude => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CUSTOMER => new List<String>{ ((Account) accounts[0]).Name, ((Account) accounts[2]).Name },
                        IterTestUtils.CONSTS.PARTNER => new List<String>{ ((Account) accounts[4]).Name }
                },
                ((Account) accounts[1]).BillingLatitude => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.CUSTOMER => new List<String>{ ((Account) accounts[1]).Name },
                        IterTestUtils.CONSTS.PARTNER => new List<String>{ ((Account) accounts[3]).Name }
                }
        };
        Validate.assertEquals(expected2, actual2);
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
        Map<Object, List<Contact>> actual = (Map<Object, List<Contact>>) Stream.of(contacts).collect(Collectors.groupingBy(departmentFunction).cast(Map<Object, List<Contact>>.class));
        Map<Object, List<String>> actual1 = (Map<Object, List<String>>) Stream.of(contacts).collect(Collectors.groupingBy(departmentFunction, Collectors.toList(nameFunction)).cast(Map<Object, List<String>>.class));
        Map<Object, Map<Id, List<Contact>>> actual2 = (Map<Object, Map<Id, List<Contact>>>) Stream.of(contacts).collect(Collectors.groupingBy(departmentFunction, Collectors.groupingById(accIdFunction)).cast(Map<Object, Map<Id, List<Contact>>>.class));
        // Then
        Map<Object, List<SObject>> expected = new Map<Object, List<SObject>>{
                ((Contact) contacts[0]).Department => new List<Contact>{ (Contact) contacts[0], (Contact) contacts[1], (Contact) contacts[2] },
                ((Contact) contacts[3]).Department => new List<Contact>{ (Contact) contacts[3], (Contact) contacts[4] }
        };
        Validate.assertEquals(expected, actual);
        Map<Object, List<String>> expected1 = new Map<Object, List<String>>{
                ((Contact) contacts[0]).Department => new List<String>{ ((Contact) contacts[0]).LastName, ((Contact) contacts[1]).LastName, ((Contact) contacts[2]).LastName },
                ((Contact) contacts[3]).Department => new List<String>{ ((Contact) contacts[3]).LastName, ((Contact) contacts[4]).LastName }
        };
        Validate.assertEquals(expected1, actual1);
        Map<Object, Map<Id, List<Contact>>> expected2 = new Map<Object, Map<Id, List<Contact>>>{
                ((Contact) contacts[0]).Department => new Map<Id, List<Contact>>{
                        ((Contact) contacts[0]).AccountId => new List<Contact>{ (Contact) contacts[0], (Contact) contacts[2] },
                        ((Contact) contacts[1]).AccountId => new List<Contact>{ (Contact) contacts[1] }
                },
                ((Contact) contacts[3]).Department => new Map<Id, List<Contact>>{
                        ((Contact) contacts[0]).AccountId => new List<Contact>{ (Contact) contacts[4] },
                        ((Contact) contacts[1]).AccountId => new List<Contact>{ (Contact) contacts[3] }
                }
        };
        Validate.assertEquals(expected2, actual2);
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
        Map<Boolean, List<Contact>> actual = (Map<Boolean, List<Contact>>) Stream.of(contacts).collect(Collectors.partitioningBy(predicate).cast(Map<Boolean, List<Contact>>.class));
        Map<Boolean, List<String>> actual1 = (Map<Boolean, List<String>>) Stream.of(contacts).collect(Collectors.partitioningBy(predicate, Collectors.toList(nameFunction)).cast(Map<Boolean, List<String>>.class));
        Map<Boolean, Map<Id, List<Contact>>> actual2 = (Map<Boolean, Map<Id, List<Contact>>>) Stream.of(contacts).collect(Collectors.partitioningBy(predicate, Collectors.groupingById(accIdFunction)).cast(Map<Boolean, Map<Id, List<Contact>>>.class));
        // Then
        Map<Boolean, List<SObject>> expected = new Map<Boolean, List<SObject>>{
                true => new List<Contact>{ (Contact) contacts[0], (Contact) contacts[1], (Contact) contacts[2] },
                false => new List<Contact>{ (Contact) contacts[3], (Contact) contacts[4] }
        };
        Validate.assertEquals(expected, actual);
        Map<Boolean, List<String>> expected1 = new Map<Boolean, List<String>>{
                true => new List<String>{ ((Contact) contacts[0]).LastName, ((Contact) contacts[1]).LastName, ((Contact) contacts[2]).LastName },
                false => new List<String>{ ((Contact) contacts[3]).LastName, ((Contact) contacts[4]).LastName }
        };
        Validate.assertEquals(expected1, actual1);
        Map<Boolean, Map<Id, List<Contact>>> expected2 = new Map<Boolean, Map<Id, List<Contact>>>{
                true => new Map<Id, List<Contact>>{
                        ((Contact) contacts[0]).AccountId => new List<Contact>{ (Contact) contacts[0], (Contact) contacts[2] },
                        ((Contact) contacts[1]).AccountId => new List<Contact>{ (Contact) contacts[1] }
                },
                false => new Map<Id, List<Contact>>{
                        ((Contact) contacts[0]).AccountId => new List<Contact>{ (Contact) contacts[4] },
                        ((Contact) contacts[1]).AccountId => new List<Contact>{ (Contact) contacts[3] }
                }
        };
        Validate.assertEquals(expected2, actual2);
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
        Object actual = Stream.of(strings).collect(Collectors.joining());
        Object actual1 = Stream.of(strings).collect(Collectors.joining(delimiter));
        String actual2 = (String) Stream.of(strings).collect(Collectors.joining(delimiter, prefix, suffix));
        // Then
        String expected = strings[0] + strings[1] + strings[2] + strings[3] + strings[4];
        Validate.assertEquals(expected, actual);
        String expected1 =
                                      strings[0]
                        + delimiter + strings[1]
                        + delimiter + strings[2]
                        + delimiter + strings[3]
                        + delimiter + strings[4];
        Validate.assertEquals(expected1, actual1);
        String expected2 = prefix +
                                      strings[0]
                        + delimiter + strings[1]
                        + delimiter + strings[2]
                        + delimiter + strings[3]
                        + delimiter + strings[4]
                + suffix;
        Validate.assertEquals(expected2, actual2);
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
        Integer actual = (Integer) Stream.of(persons).collect(Collectors.counting());
        Integer actual1 = (Integer) Stream.of(persons).collect(Collectors.summingInt(ageFunction));
        Double actual2 = (Double) Stream.of(persons).collect(Collectors.averagingInt(ageFunction));
        // Then
        Validate.assertEquals(persons.size(), actual);
        Integer expected = (
                persons[0].getAge() + persons[1].getAge() + persons[2].getAge() + persons[3].getAge()
        );
        Validate.assertEquals(expected, actual1);
        Double expected1 = expected / (Double) persons.size();
        Validate.assertEquals(expected1, actual2);
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
        Long actual = (Long) Stream.of(persons).collect(Collectors.summingLong(ageFunction));
        Double actual1 = (Double) Stream.of(persons).collect(Collectors.averagingLong(ageFunction));
        // Then
        Long expected = (
                persons[0].getAutoId() + persons[1].getAutoId() + persons[2].getAutoId() + persons[3].getAutoId()
        );
        Validate.assertEquals(expected, actual);
        Double expected1 = expected / (Double) persons.size();
        Validate.assertEquals(expected1, actual1);
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
        Double actual = (Double) Stream.of(persons).collect(Collectors.summingDouble(probabilityFunction));
        Double actual1 = (Double) Stream.of(persons).collect(Collectors.averagingDouble(probabilityFunction));
        // Then
        Double expected = (
                persons[0].getProbability() + persons[1].getProbability() + persons[2].getProbability() + persons[3].getProbability()
        );
        Validate.assertEquals(expected, actual);
        Double expected1 = expected / (Double) persons.size();
        Validate.assertEquals(expected1, actual1);
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
        List<Comparable> actual = (List<Comparable>) Stream.of(persons).collect(Collectors.filtering(predicate).cast(List<Comparable>.class));
        Map<Boolean, List<Comparable>> actual1 = (Map<Boolean, List<Comparable>>) Stream.of(persons).collect(Collectors.groupingByBool(keyMapper, Collectors.filtering(predicate)).cast(Map<Boolean, List<Comparable>>.class));
        // Then
        List<Comparable> expected = new List<Comparable>{ persons[0], persons[1], persons[3] };
        Validate.assertEquals(expected, actual);
        Map<Boolean, List<Comparable>> expected1 = new Map<Boolean, List<Comparable>>{
                true => new List<Comparable>{ persons[0], persons[3] },
                false => new List<Comparable>{ persons[1]  }
        };
        Validate.assertEquals(expected1, actual1);
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
        List<String> actual = (List<String>) Stream.of(persons).collect(Collectors.mapping(mapper).cast(List<String>.class));
        Map<Boolean, List<String>> actual1 = (Map<Boolean, List<String>>) Stream.of(persons)
                .collect(Collectors.groupingByBool(keyMapper, Collectors.mapping(mapper)).cast(Map<Boolean, List<String>>.class));
        // Then
        List<String> expected = new List<String>{
                persons[0].getName(),
                persons[1].getName(),
                persons[2].getName(),
                persons[3].getName()
        };
        Validate.assertEquals(expected, actual);
        Map<Boolean, List<String>> expected1 = new Map<Boolean, List<String>>{
                true => new List<String>{
                        persons[0].getName(),
                        persons[3].getName()
                },
                false => new List<String>{
                        persons[1].getName(),
                        persons[2].getName()
                }
        };
        Validate.assertEquals(expected1, actual1);
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
        Validate.assertEquals(expected, actual);
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
        Optional actual = (Optional) Stream.of(persons).collect(Collectors.reducing(accumulator));
        Comparable actual1 = (Comparable) Stream.of(persons).collect(Collectors.reducing(new IterTestUtils.Person('seed', 0, Date.newInstance(2014, 2, 3), 4L, true), Function.identity(), accumulator));
        Comparable actual2 = (Comparable) Stream.of(persons).collect(Collectors.reducing(new IterTestUtils.Person('seed', 0, Date.newInstance(2014, 2, 3), 4L, true), accumulator));
        Map<Boolean, Object> actual3 = (Map<Boolean, Object>) Stream.of(persons).collect(Collectors.groupingByBool(keyMapper, Collectors.reducing(accumulator)));
        // Then
        Validate.assertEquals(persons[1], actual.get());
        Validate.assertEquals(persons[1], actual1);
        Validate.assertEquals(persons[1], actual2);
        Map<Boolean, Optional> expected1 = new Map<Boolean, Optional>{
                true => Optional.of(persons[0]),
                false => Optional.of(persons[1])
        };
        Validate.assertEquals(expected1, actual3);
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
        Optional actual = (Optional) Stream.of(persons).collect(Collectors.maximizing(ageComparator));
        Map<Boolean, Object> actual1 = (Map<Boolean, Object>) Stream.of(persons).collect(Collectors.groupingByBool(keyMapper, Collectors.minimizing(ageComparator)));
        // Then
        Validate.assertEquals(persons[1], actual.get());
        Map<Boolean, Optional> expected1 = new Map<Boolean, Optional>{
                true => Optional.of(persons[3]),
                false => Optional.of(persons[2])
        };
        Validate.assertEquals(expected1, actual1);
    }

}
