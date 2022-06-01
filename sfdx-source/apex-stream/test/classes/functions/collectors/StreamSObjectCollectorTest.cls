/**
 * @author Oleh Berehovskyi
 * @see SObjectCollector
 */
@IsTest(IsParallel = true)
private class StreamSObjectCollectorTest {

    private static List<Account> accounts;
    private static List<Contact> contacts;
    private static List<Attachment> attachments;
    private static List<Event> events;
    private static List<TimeSlot> slots;

    static {
        Account acc = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Acc', Type = 'Customer', NumberOfEmployees = 200, BillingLatitude = 45.45, BillingCountry = IterTestUtils.CONSTS.FRANCE);
        Account acc1 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Acc1', Type = 'Customer', NumberOfEmployees = 180, BillingLatitude = 20.45, BillingCountry = IterTestUtils.CONSTS.FRANCE);
        Account acc2 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'CTest Acc2', Type = 'Partner', NumberOfEmployees = 100, BillingLatitude = 45.50, BillingCountry = IterTestUtils.CONSTS.UK);
        Account acc3 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Acc3', Type = 'Partner', NumberOfEmployees = 0, BillingLatitude = 10.00, BillingCountry = IterTestUtils.CONSTS.UK);
        Account acc4 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'test Acc4', BillingLatitude = 28.15);
        Account acc5 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Fest Acc4', Type = 'Partner', NumberOfEmployees = 605, BillingLatitude = 50.45);
        Account acc6 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'BTest Acc6', Type = 'Competitor', NumberOfEmployees = 50, BillingLatitude = 17.40);
        Account acc7 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Acc7', Type = 'Competitor', NumberOfEmployees = 103, BillingLatitude = 63.80);
        Account acc8 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'ATest Acc8', Type = 'Competitor', NumberOfEmployees = 150, BillingLatitude = 80.15);
        Account acc9 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Parent Account', NumberOfEmployees = 1000, BillingLatitude = 57.00);
        accounts = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5, acc6, acc7, acc8, acc9 };

        Contact con = new Contact(Id = IterTestUtils.generateId(Contact.SObjectType), AccountId = acc.Id, FirstName = 'Test FirstName', LastName = 'Test Name',
                DoNotCall = true, HasOptedOutOfEmail = true, Birthdate = Date.newInstance(1990, 1, 1), OtherCountry = IterTestUtils.CONSTS.FRANCE, OtherCity = IterTestUtils.CONSTS.PARIS, Department = IterTestUtils.CONSTS.HR);
        Contact con1 = new Contact(Id = IterTestUtils.generateId(Contact.SObjectType), AccountId = acc1.Id, FirstName = 'Test FirstName1', LastName = 'Test Name1',
                DoNotCall = false, HasOptedOutOfEmail = true, Birthdate = Date.newInstance(1991, 2, 2), OtherCountry = IterTestUtils.CONSTS.FRANCE, OtherCity = IterTestUtils.CONSTS.LYON, Department = IterTestUtils.CONSTS.HR);
        Contact con2 = new Contact(Id = IterTestUtils.generateId(Contact.SObjectType), AccountId = acc2.Id, FirstName = 'Test FirstName2', LastName = 'Test Name2',
                DoNotCall = true, HasOptedOutOfEmail = true, Birthdate = Date.newInstance(1992, 3, 3), OtherCountry = IterTestUtils.CONSTS.UK, OtherCity = IterTestUtils.CONSTS.LONDON, Department = IterTestUtils.CONSTS.FINANCE);
        Contact con3 = new Contact(Id = IterTestUtils.generateId(Contact.SObjectType), AccountId = acc3.Id, FirstName = 'Test FirstName3', LastName = 'Test Name3',
                DoNotCall = false, HasOptedOutOfEmail = false, OtherCountry = IterTestUtils.CONSTS.UK, OtherCity = IterTestUtils.CONSTS.BRISTOL, Department = IterTestUtils.CONSTS.FINANCE);
        Contact con4 = new Contact(Id = IterTestUtils.generateId(Contact.SObjectType), AccountId = acc4.Id, FirstName = 'Test FirstName4', LastName = 'Test Name4',
                HasOptedOutOfEmail = false, Birthdate = Date.newInstance(1993, 4, 4));
        con.putSObject('Account', acc);
        con1.putSObject('Account', acc1);
        con2.putSObject('Account', acc2);
        con3.putSObject('Account', acc3);
        con4.putSObject('Account', acc4);
        contacts = new List<Contact>{ con, con1, con2, con3, con4 };

        Attachment att = new Attachment(Name = 'Test Att', ContentType = IterTestUtils.CONSTS.DOC, Body = Blob.valueOf('0'));
        Attachment att1 = new Attachment(Name = 'Test Att1', ContentType = IterTestUtils.CONSTS.DOC, Body = Blob.valueOf('1'));
        Attachment att2 = new Attachment(Name = 'Test Att2', ContentType = IterTestUtils.CONSTS.DOC, Body = Blob.valueOf('2'));
        Attachment att3 = new Attachment(Name = 'Test Att3', ContentType = IterTestUtils.CONSTS.PDF, Body = Blob.valueOf('3'));
        Attachment att4 = new Attachment(Name = 'Test Att4', ContentType = IterTestUtils.CONSTS.PDF, Body = Blob.valueOf('4'));
        Attachment att5 = new Attachment(Name = 'Test Att5');
        attachments = new List<Attachment>{ att, att1, att2, att3, att4, att5 };

        Event ev = new Event(Description = 'Test Name', ActivityDateTime = Datetime.newInstance(1990, 1, 1, 15, 0, 0), Type = IterTestUtils.CONSTS.CALL);
        Event ev1 = new Event(Description = 'Test Name1', ActivityDateTime = Datetime.newInstance(1991, 2, 2, 15, 0, 0), Type = IterTestUtils.CONSTS.CALL);
        Event ev2 = new Event(Description = 'Test Name2', ActivityDateTime = Datetime.newInstance(1992, 3, 3, 15, 0, 0), Type = IterTestUtils.CONSTS.EMAIL);
        Event ev3 = new Event(Type = IterTestUtils.CONSTS.EMAIL);
        Event ev4 = new Event(Description = 'Test Name3', ActivityDateTime = Datetime.newInstance(1993, 4, 4, 15, 0, 0));
        events = new List<Event>{ ev, ev1, ev2, ev3, ev4 };

        Time t0 = Time.newInstance(15, 0, 0, 0);
        Time t1 = Time.newInstance(16, 0, 0, 0);
        Time t2 = Time.newInstance(17, 0, 0, 0);
        Time t3 = Time.newInstance(18, 0, 0, 0);
        TimeSlot slot = new TimeSlot(StartTime = t0, EndTime = t0.addMinutes(15), Type = IterTestUtils.CONSTS.NORMAL);
        TimeSlot slot1 = new TimeSlot(StartTime = t1, EndTime = t1.addMinutes(15), Type = IterTestUtils.CONSTS.NORMAL);
        TimeSlot slot2 = new TimeSlot(StartTime = t2, EndTime = t2.addMinutes(15), Type = IterTestUtils.CONSTS.EXTENDED);
        TimeSlot slot3 = new TimeSlot(Type = IterTestUtils.CONSTS.EXTENDED);
        TimeSlot slot4 = new TimeSlot(StartTime = t3, EndTime = t3.addMinutes(15));
        slots = new List<TimeSlot>{ slot, slot1, slot2, slot3, slot4 };
    }

    /**
     * @see SObjectCollector.toList
     */
    @IsTest
    static void toList() {
        // Given
        ISObjectCollector toListCollector = SObjectCollector.toList();
        ISObjectCollector toNameListCollector = SObjectCollector.toList(SObjectFunction.get(IterTestUtils.CONSTS.NAME));
        ISObjectCollector toNameListCollector1 = SObjectCollector.toList(IterTestUtils.CONSTS.NAME).cast(List<String>.class);
        ISObjectCollector toNameListCollector2 = SObjectCollector.toList(IterTestUtils.CONSTS.Account.Name).cast(List<String>.class);
        // When
        List<Account> actual = (List<Account>) Stream.of(accounts).collect(toListCollector);
        List<Object> actual1 = (List<Object>) Stream.of(accounts).collect(toNameListCollector);
        List<String> actual2 = (List<String>) Stream.of(accounts).collect(toNameListCollector1);
        List<String> actual3 = (List<String>) Stream.of(accounts).collect(toNameListCollector2);
        // Then
        Validate.assertEquals(accounts, actual);
        List<String> expected = new List<String>{
                (String) accounts[0].get(IterTestUtils.CONSTS.NAME),
                (String) accounts[1].get(IterTestUtils.CONSTS.NAME),
                (String) accounts[2].get(IterTestUtils.CONSTS.NAME),
                (String) accounts[3].get(IterTestUtils.CONSTS.NAME),
                (String) accounts[4].get(IterTestUtils.CONSTS.NAME),
                (String) accounts[5].get(IterTestUtils.CONSTS.NAME),
                (String) accounts[6].get(IterTestUtils.CONSTS.NAME),
                (String) accounts[7].get(IterTestUtils.CONSTS.NAME),
                (String) accounts[8].get(IterTestUtils.CONSTS.NAME),
                (String) accounts[9].get(IterTestUtils.CONSTS.NAME)
        };
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
    }

    /**
     * @see SObjectCollector.toSet
     */
    @IsTest
    static void toSet() {
        // Given
        ISObjectCollector toSetCollector = SObjectCollector.toSet();
        // When
        Set<SObject> actual = (Set<SObject>) Stream.of(accounts).collect(toSetCollector);
        // Then
        Set<SObject> expected = new Set<SObject>{
                accounts[0],
                accounts[1],
                accounts[2],
                accounts[3],
                accounts[4],
                accounts[5],
                accounts[6],
                accounts[7],
                accounts[8],
                accounts[9]
        };
        Validate.assertEquals(expected, actual);
    }

    /**
     * @see SObjectCollector.toMap
     */
    @IsTest
    static void toMap() {
        // Given
        SObjectCollector toMapCollector = SObjectCollector.toMap();
        // When
        Map<Id, SObject> actual = (Map<Id, SObject>) Stream.of(accounts).collect(toMapCollector);
        Map<Id, Account> actual1 = (Map<Id, Account>) Stream.of(accounts).collect(toMapCollector.cast(Map<Id, Account>.class));
        // Then
        Validate.assertEquals(new Map<Id, Account>(accounts), actual);
        Validate.assertEquals(new Map<Id, Account>(accounts), actual1);
    }

    /**
     * @see SObjectCollector.toBoolSet
     */
    @IsTest
    static void toBoolSet() {
        // Given
        ISObjectCollector toBoolSetCollector = SObjectCollector.toBoolSet(SObjectFunction.get(IterTestUtils.CONSTS.DO_NOT_CALL));
        ISObjectCollector toBoolSetCollector1 = SObjectCollector.toBoolSet(IterTestUtils.CONSTS.DO_NOT_CALL);
        ISObjectCollector toBoolSetCollector2 = SObjectCollector.toBoolSet(IterTestUtils.CONSTS.Contact.DoNotCall);
        // When
        Set<Boolean> actual = (Set<Boolean>) Stream.of(contacts).collect(toBoolSetCollector);
        Set<Boolean> actual1 = (Set<Boolean>) Stream.of(contacts).collect(toBoolSetCollector1);
        Set<Boolean> actual2 = (Set<Boolean>) Stream.of(contacts).collect(toBoolSetCollector2);
        // Then
        Set<Boolean> expected = new Set<Boolean>{
                (Boolean) contacts[0].get(IterTestUtils.CONSTS.DO_NOT_CALL),
                (Boolean) contacts[1].get(IterTestUtils.CONSTS.DO_NOT_CALL),
                (Boolean) contacts[2].get(IterTestUtils.CONSTS.DO_NOT_CALL),
                (Boolean) contacts[3].get(IterTestUtils.CONSTS.DO_NOT_CALL),
                (Boolean) contacts[4].get(IterTestUtils.CONSTS.DO_NOT_CALL)
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
    }

    /**
     * @see SObjectCollector.toIdSet
     */
    @IsTest
    static void toIdSet() {
        // Given
        ISObjectCollector toIdSetCollector = SObjectCollector.toIdSet(SObjectFunction.get(IterTestUtils.CONSTS.ID));
        ISObjectCollector toIdSetCollector1 = SObjectCollector.toIdSet(IterTestUtils.CONSTS.ID);
        ISObjectCollector toIdSetCollector2 = SObjectCollector.toIdSet(IterTestUtils.CONSTS.Contact.Id);
        // When
        Set<Id> actual = (Set<Id>) Stream.of(contacts).collect(toIdSetCollector);
        Set<Id> actual1 = (Set<Id>) Stream.of(contacts).collect(toIdSetCollector1);
        Set<Id> actual2 = (Set<Id>) Stream.of(contacts).collect(toIdSetCollector2);
        // Then
        Set<Id> expected = new Set<Id>{
                (Id) contacts[0].get(IterTestUtils.CONSTS.ID),
                (Id) contacts[1].get(IterTestUtils.CONSTS.ID),
                (Id) contacts[2].get(IterTestUtils.CONSTS.ID),
                (Id) contacts[3].get(IterTestUtils.CONSTS.ID),
                (Id) contacts[4].get(IterTestUtils.CONSTS.ID)
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
    }

    /**
     * @see SObjectCollector.toStringSet
     */
    @IsTest
    static void toStringSet() {
        // Given
        ISObjectCollector toStringSetCollector = SObjectCollector.toStringSet(SObjectFunction.get(IterTestUtils.CONSTS.LAST_NAME));
        ISObjectCollector toStringSetCollector1 = SObjectCollector.toStringSet(IterTestUtils.CONSTS.LAST_NAME);
        ISObjectCollector toStringSetCollector2 = SObjectCollector.toStringSet(IterTestUtils.CONSTS.Contact.LastName);
        // When
        Set<String> actual = (Set<String>) Stream.of(contacts).collect(toStringSetCollector);
        Set<String> actual1 = (Set<String>) Stream.of(contacts).collect(toStringSetCollector1);
        Set<String> actual2 = (Set<String>) Stream.of(contacts).collect(toStringSetCollector2);
        // Then
        Set<String> expected = new Set<String>{
                (String) contacts[0].get(IterTestUtils.CONSTS.LAST_NAME),
                (String) contacts[1].get(IterTestUtils.CONSTS.LAST_NAME),
                (String) contacts[2].get(IterTestUtils.CONSTS.LAST_NAME),
                (String) contacts[3].get(IterTestUtils.CONSTS.LAST_NAME),
                (String) contacts[4].get(IterTestUtils.CONSTS.LAST_NAME)
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
    }

    /**
     * @see SObjectCollector.toBlobSet
     */
    @IsTest
    static void toBlobSet() {
        // Given
        ISObjectCollector toBlobSetCollector = SObjectCollector.toBlobSet(SObjectFunction.get(IterTestUtils.CONSTS.BODY));
        ISObjectCollector toBlobSetCollector1 = SObjectCollector.toBlobSet(IterTestUtils.CONSTS.BODY);
        ISObjectCollector toBlobSetCollector2 = SObjectCollector.toBlobSet(IterTestUtils.CONSTS.Attachment.Body);
        // When
        Set<Blob> actual = (Set<Blob>) Stream.of(attachments).collect(toBlobSetCollector);
        Set<Blob> actual1 = (Set<Blob>) Stream.of(attachments).collect(toBlobSetCollector1);
        Set<Blob> actual2 = (Set<Blob>) Stream.of(attachments).collect(toBlobSetCollector2);
        // Then
        Set<Blob> expected = new Set<Blob>{
                (Blob) attachments[0].get(IterTestUtils.CONSTS.BODY),
                (Blob) attachments[1].get(IterTestUtils.CONSTS.BODY),
                (Blob) attachments[2].get(IterTestUtils.CONSTS.BODY),
                (Blob) attachments[3].get(IterTestUtils.CONSTS.BODY),
                (Blob) attachments[4].get(IterTestUtils.CONSTS.BODY),
                (Blob) attachments[5].get(IterTestUtils.CONSTS.BODY)
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
    }

    /**
     * @see SObjectCollector.toDateSet
     */
    @IsTest
    static void toDateSet() {
        // Given
        ISObjectCollector toDateSetCollector = SObjectCollector.toDateSet(SObjectFunction.get(IterTestUtils.CONSTS.BIRTHDATE));
        ISObjectCollector toDateSetCollector1 = SObjectCollector.toDateSet(IterTestUtils.CONSTS.BIRTHDATE);
        ISObjectCollector toDateSetCollector2 = SObjectCollector.toDateSet(IterTestUtils.CONSTS.Contact.Birthdate);
        // When
        Set<Date> actual = (Set<Date>) Stream.of(contacts).collect(toDateSetCollector);
        Set<Date> actual1 = (Set<Date>) Stream.of(contacts).collect(toDateSetCollector1);
        Set<Date> actual2 = (Set<Date>) Stream.of(contacts).collect(toDateSetCollector2);
        // Then
        Set<Date> expected = new Set<Date>{
                (Date) contacts[0].get(IterTestUtils.CONSTS.BIRTHDATE),
                (Date) contacts[1].get(IterTestUtils.CONSTS.BIRTHDATE),
                (Date) contacts[2].get(IterTestUtils.CONSTS.BIRTHDATE),
                (Date) contacts[3].get(IterTestUtils.CONSTS.BIRTHDATE),
                (Date) contacts[4].get(IterTestUtils.CONSTS.BIRTHDATE)
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
    }

    /**
     * @see SObjectCollector.toDatetimeSet
     */
    @IsTest
    static void toDatetimeSet() {
        // Given
        ISObjectCollector toDatetimeSetCollector = SObjectCollector.toDatetimeSet(SObjectFunction.get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME));
        ISObjectCollector toDatetimeSetCollector1 = SObjectCollector.toDatetimeSet(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME);
        ISObjectCollector toDatetimeSetCollector2 = SObjectCollector.toDatetimeSet(IterTestUtils.CONSTS.Event.ActivityDateTime);
        // When
        Set<Datetime> actual = (Set<Datetime>) Stream.of(events).collect(toDatetimeSetCollector);
        Set<Datetime> actual1 = (Set<Datetime>) Stream.of(events).collect(toDatetimeSetCollector1);
        Set<Datetime> actual2 = (Set<Datetime>) Stream.of(events).collect(toDatetimeSetCollector2);
        // Then
        Set<Datetime> expected = new Set<Datetime>{
                (Datetime) events[0].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME),
                (Datetime) events[1].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME),
                (Datetime) events[2].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME),
                (Datetime) events[3].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME),
                (Datetime) events[4].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME)
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
    }

    /**
     * @see SObjectCollector.toTimeSet
     */
    @IsTest
    static void toTimeSet() {
        // Given
        ISObjectCollector toTimeSetCollector = SObjectCollector.toTimeSet(SObjectFunction.get(IterTestUtils.CONSTS.START_TIME));
        ISObjectCollector toTimeSetCollector1 = SObjectCollector.toTimeSet(IterTestUtils.CONSTS.START_TIME);
        ISObjectCollector toTimeSetCollector2 = SObjectCollector.toTimeSet(IterTestUtils.CONSTS.TimeSlot.StartTime);
        // When
        Set<Time> actual = (Set<Time>) Stream.of(slots).collect(toTimeSetCollector);
        Set<Time> actual1 = (Set<Time>) Stream.of(slots).collect(toTimeSetCollector1);
        Set<Time> actual2 = (Set<Time>) Stream.of(slots).collect(toTimeSetCollector2);
        // Then
        Set<Time> expected = new Set<Time>{
                (Time) slots[0].get(IterTestUtils.CONSTS.START_TIME),
                (Time) slots[1].get(IterTestUtils.CONSTS.START_TIME),
                (Time) slots[2].get(IterTestUtils.CONSTS.START_TIME),
                (Time) slots[3].get(IterTestUtils.CONSTS.START_TIME),
                (Time) slots[4].get(IterTestUtils.CONSTS.START_TIME)
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
    }

    /**
     * @see SObjectCollector.toIntSet
     */
    @IsTest
    static void toIntSet() {
        // Given
        ISObjectCollector toIntSetCollector = SObjectCollector.toIntSet(SObjectToIntFunction.get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        ISObjectCollector toIntSetCollector1 = SObjectCollector.toIntSet(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES);
        ISObjectCollector toIntSetCollector2 = SObjectCollector.toIntSet(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        // When
        Set<Integer> actual = (Set<Integer>) Stream.of(accounts).collect(toIntSetCollector);
        Set<Integer> actual1 = (Set<Integer>) Stream.of(accounts).collect(toIntSetCollector1);
        Set<Integer> actual2 = (Set<Integer>) Stream.of(accounts).collect(toIntSetCollector2);
        // Then
        Set<Integer> expected = new Set<Integer>{
                (Integer) accounts[0].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Integer) accounts[1].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Integer) accounts[2].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Integer) accounts[3].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Integer) accounts[4].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Integer) accounts[5].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Integer) accounts[6].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Integer) accounts[7].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Integer) accounts[8].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Integer) accounts[9].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES)
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
    }

    /**
     * @see SObjectCollector.toLongSet
     */
    @IsTest
    static void toLongSet() {
        // Given
        ISObjectCollector toIntSetCollector = SObjectCollector.toLongSet(SObjectToLongFunction.get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        ISObjectCollector toIntSetCollector1 = SObjectCollector.toLongSet(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES);
        ISObjectCollector toIntSetCollector2 = SObjectCollector.toLongSet(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        // When
        Set<Long> actual = (Set<Long>) Stream.of(accounts).collect(toIntSetCollector);
        Set<Long> actual1 = (Set<Long>) Stream.of(accounts).collect(toIntSetCollector1);
        Set<Long> actual2 = (Set<Long>) Stream.of(accounts).collect(toIntSetCollector2);
        // Then
        Set<Long> expected = new Set<Long>{
                (Long) accounts[0].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Long) accounts[1].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Long) accounts[2].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Long) accounts[3].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Long) accounts[4].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Long) accounts[5].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Long) accounts[6].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Long) accounts[7].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Long) accounts[8].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES),
                (Long) accounts[9].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES)
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
    }

    /**
     * @see SObjectCollector.toDoubleSet
     */
    @IsTest
    static void toDoubleSet() {
        // Given
        ISObjectCollector toDoubleSetCollector = SObjectCollector.toDoubleSet(SObjectToDoubleFunction.get(IterTestUtils.CONSTS.BILLING_LATITUDE));
        ISObjectCollector toDoubleSetCollector1 = SObjectCollector.toDoubleSet(IterTestUtils.CONSTS.BILLING_LATITUDE);
        ISObjectCollector toDoubleSetCollector2 = SObjectCollector.toDoubleSet(IterTestUtils.CONSTS.Account.BillingLatitude);
        // When
        Set<Double> actual = (Set<Double>) Stream.of(accounts).collect(toDoubleSetCollector);
        Set<Double> actual1 = (Set<Double>) Stream.of(accounts).collect(toDoubleSetCollector1);
        Set<Double> actual2 = (Set<Double>) Stream.of(accounts).collect(toDoubleSetCollector2);
        // Then
        Set<Double> expected = new Set<Double>{
                (Double) accounts[0].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                (Double) accounts[1].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                (Double) accounts[2].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                (Double) accounts[3].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                (Double) accounts[4].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                (Double) accounts[5].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                (Double) accounts[6].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                (Double) accounts[7].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                (Double) accounts[8].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                (Double) accounts[9].get(IterTestUtils.CONSTS.BILLING_LATITUDE)
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
    }

    /**
     * @see SObjectCollector.toSet
     */
    @IsTest
    static void toObjectSet() {
        // Given
        ISObjectCollector toSetCollector = SObjectCollector.toSet(SObjectFunction.get(IterTestUtils.CONSTS.BILLING_LATITUDE));
        ISObjectCollector toSetCollector1 = SObjectCollector.toSet(IterTestUtils.CONSTS.BILLING_LATITUDE);
        ISObjectCollector toSetCollector2 = SObjectCollector.toSet(IterTestUtils.CONSTS.Account.BillingLatitude);
        // When
        Set<Object> actual = (Set<Object>) Stream.of(accounts).collect(toSetCollector);
        Set<Object> actual1 = (Set<Object>) Stream.of(accounts).collect(toSetCollector1);
        Set<Object> actual2 = (Set<Object>) Stream.of(accounts).collect(toSetCollector2);
        // Then
        Set<Object> expected = new Set<Object>{
                accounts[0].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                accounts[1].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                accounts[2].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                accounts[3].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                accounts[4].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                accounts[5].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                accounts[6].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                accounts[7].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                accounts[8].get(IterTestUtils.CONSTS.BILLING_LATITUDE),
                accounts[9].get(IterTestUtils.CONSTS.BILLING_LATITUDE)
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
    }

    /**
     * @see SObjectCollector.toByBoolMap
     */
    @IsTest
    static void toByBoolMap() {
        // Given
        List<Contact> input = new List<Contact>{ contacts[0], contacts[1], contacts[4] };
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Contact.DoNotCall);
        ISObjectFunction valueMapper = SObjectFunction.identity();
        IBinaryOperator mergeFunction = BinaryOperator.right();
        ISObjectFunction getParentAccFunction = SObjectFunction.forOperator(SObjectUnaryOperator.getSObject(IterTestUtils.CONSTS.Contact.AccountId));
        // When
        Map<Boolean, SObject> actual = (Map<Boolean, SObject>) Stream.of(input).collect(SObjectCollector.toByBoolMap(IterTestUtils.CONSTS.DO_NOT_CALL));
        Map<Boolean, Contact> actual1 = (Map<Boolean, Contact>) Stream.of(input).collect(SObjectCollector.toByBoolMap(IterTestUtils.CONSTS.Contact.DoNotCall).cast(Map<Boolean, Contact>.class));
        Map<Boolean, SObject> actual2 = (Map<Boolean, SObject>) Stream.of(input).collect(SObjectCollector.toByBoolMap(keyMapper));
        Map<Boolean, Object> actual3 = (Map<Boolean, Object>) Stream.of(input).collect(SObjectCollector.toByBoolMap(keyMapper, valueMapper));
        Map<Boolean, Object> actual4 = (Map<Boolean, Object>) Stream.of(contacts).collect(SObjectCollector.toByBoolMap(keyMapper, getParentAccFunction, mergeFunction));
        Map<Boolean, String> actual5 = (Map<Boolean, String>) Stream.of(input).collect(SObjectCollector.toByBoolMap(IterTestUtils.CONSTS.DO_NOT_CALL, IterTestUtils.CONSTS.LAST_NAME).cast(Map<Boolean, String>.class));
        Map<Boolean, String> actual6 = (Map<Boolean, String>) Stream.of(input).collect(SObjectCollector.toByBoolMap(IterTestUtils.CONSTS.Contact.DoNotCall, IterTestUtils.CONSTS.Contact.LastName).cast(Map<Boolean, String>.class));
        try {
            List<Contact> input1 = new List<Contact>(contacts);
            input1.add(input1[0]);
            Stream.of(input1).collect(SObjectCollector.toByBoolMap(IterTestUtils.CONSTS.DO_NOT_CALL));
        } catch (Exception exc) {
            System.assert(exc.getMessage().contains(IterTestUtils.CONSTS.DUPLICATE_KEY));
        }
        // Then
        Map<Boolean, Contact> expected = new Map<Boolean, Contact>{
                (Boolean) contacts[0].get(IterTestUtils.CONSTS.DO_NOT_CALL) => contacts[0],
                (Boolean) contacts[1].get(IterTestUtils.CONSTS.DO_NOT_CALL) => contacts[1],
                (Boolean) contacts[4].get(IterTestUtils.CONSTS.DO_NOT_CALL) => contacts[4]
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Map<Boolean, SObject> expected1 = new Map<Boolean, SObject>{
                (Boolean) contacts[2].get(IterTestUtils.CONSTS.DO_NOT_CALL) => contacts[2].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME),
                (Boolean) contacts[3].get(IterTestUtils.CONSTS.DO_NOT_CALL) => contacts[3].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME),
                (Boolean) contacts[4].get(IterTestUtils.CONSTS.DO_NOT_CALL) => contacts[4].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)
        };
        Validate.assertEquals(expected1, actual4);
        Map<Boolean, String> expected2 = new Map<Boolean, String>{
                (Boolean) contacts[0].get(IterTestUtils.CONSTS.DO_NOT_CALL) => (String) contacts[0].get(IterTestUtils.CONSTS.LAST_NAME),
                (Boolean) contacts[1].get(IterTestUtils.CONSTS.DO_NOT_CALL) => (String) contacts[1].get(IterTestUtils.CONSTS.LAST_NAME),
                (Boolean) contacts[4].get(IterTestUtils.CONSTS.DO_NOT_CALL) => (String) contacts[4].get(IterTestUtils.CONSTS.LAST_NAME)
        };
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.toByIdMap
     */
    @IsTest
    static void toByIdMap() {
        // Given
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Contact.AccountId);
        ISObjectFunction valueMapper = SObjectFunction.identity();
        IBinaryOperator mergeFunction = BinaryOperator.right();
        ISObjectFunction getParentAccFunction = SObjectFunction.forOperator(SObjectUnaryOperator.getSObject(IterTestUtils.CONSTS.Contact.AccountId));
        // When
        Map<Id, SObject> actual = (Map<Id, SObject>) Stream.of(contacts).collect(SObjectCollector.toByIdMap(IterTestUtils.CONSTS.ACCOUNT_ID));
        Map<Id, Contact> actual1 = (Map<Id, Contact>) Stream.of(contacts).collect(SObjectCollector.toByIdMap(IterTestUtils.CONSTS.Contact.AccountId).cast(Map<Id, Contact>.class));
        Map<Id, SObject> actual2 = (Map<Id, SObject>) Stream.of(contacts).collect(SObjectCollector.toByIdMap(keyMapper));
        Map<Id, Object> actual3 = (Map<Id, Object>) Stream.of(contacts).collect(SObjectCollector.toByIdMap(keyMapper, valueMapper));
        Map<Id, Object> actual4 = (Map<Id, Object>) Stream.of(contacts).collect(SObjectCollector.toByIdMap(keyMapper, getParentAccFunction, mergeFunction));
        Map<Id, String> actual5 = (Map<Id, String>) Stream.of(contacts).collect(SObjectCollector.toByIdMap(IterTestUtils.CONSTS.ACCOUNT_ID, IterTestUtils.CONSTS.LAST_NAME).cast(Map<Id, String>.class));
        Map<Id, String> actual6 = (Map<Id, String>) Stream.of(contacts).collect(SObjectCollector.toByIdMap(IterTestUtils.CONSTS.Contact.AccountId, IterTestUtils.CONSTS.Contact.LastName).cast(Map<Id, String>.class));
        try {
            List<Contact> input = new List<Contact>(contacts);
            input.add(input[0]);
            Stream.of(input).collect(SObjectCollector.toByIdMap(IterTestUtils.CONSTS.ACCOUNT_ID));
        } catch (Exception exc) {
            System.assert(exc.getMessage().contains(IterTestUtils.CONSTS.DUPLICATE_KEY));
        }
        // Then
        Map<Id, Contact> expected = new Map<Id, Contact>{
                (Id) contacts[0].get(IterTestUtils.CONSTS.ACCOUNT_ID) => contacts[0],
                (Id) contacts[1].get(IterTestUtils.CONSTS.ACCOUNT_ID) => contacts[1],
                (Id) contacts[2].get(IterTestUtils.CONSTS.ACCOUNT_ID) => contacts[2],
                (Id) contacts[3].get(IterTestUtils.CONSTS.ACCOUNT_ID) => contacts[3],
                (Id) contacts[4].get(IterTestUtils.CONSTS.ACCOUNT_ID) => contacts[4]
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Map<Id, SObject> expected1 = new Map<Id, SObject>{
                (Id) contacts[0].get(IterTestUtils.CONSTS.ACCOUNT_ID) => contacts[0].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME),
                (Id) contacts[1].get(IterTestUtils.CONSTS.ACCOUNT_ID) => contacts[1].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME),
                (Id) contacts[2].get(IterTestUtils.CONSTS.ACCOUNT_ID) => contacts[2].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME),
                (Id) contacts[3].get(IterTestUtils.CONSTS.ACCOUNT_ID) => contacts[3].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME),
                (Id) contacts[4].get(IterTestUtils.CONSTS.ACCOUNT_ID) => contacts[4].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)
        };
        Validate.assertEquals(expected1, actual4);
        Map<Id, String> expected2 = new Map<Id, String>{
                (Id) contacts[0].get(IterTestUtils.CONSTS.ACCOUNT_ID) => (String) contacts[0].get(IterTestUtils.CONSTS.Contact.LastName),
                (Id) contacts[1].get(IterTestUtils.CONSTS.ACCOUNT_ID) => (String) contacts[1].get(IterTestUtils.CONSTS.Contact.LastName),
                (Id) contacts[2].get(IterTestUtils.CONSTS.ACCOUNT_ID) => (String) contacts[2].get(IterTestUtils.CONSTS.Contact.LastName),
                (Id) contacts[3].get(IterTestUtils.CONSTS.ACCOUNT_ID) => (String) contacts[3].get(IterTestUtils.CONSTS.Contact.LastName),
                (Id) contacts[4].get(IterTestUtils.CONSTS.ACCOUNT_ID) => (String) contacts[4].get(IterTestUtils.CONSTS.Contact.LastName)
        };
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.toByStringMap
     */
    @IsTest
    static void toByStringMap() {
        // Given
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Contact.FirstName);
        ISObjectFunction valueMapper = SObjectFunction.identity();
        IBinaryOperator mergeFunction = BinaryOperator.right();
        ISObjectFunction getParentAccFunction = SObjectFunction.forOperator(SObjectUnaryOperator.getSObject(IterTestUtils.CONSTS.Contact.AccountId));
        // When
        Map<String, SObject> actual = (Map<String, SObject>) Stream.of(contacts).collect(SObjectCollector.toByStringMap(IterTestUtils.CONSTS.FIRST_NAME));
        Map<String, Contact> actual1 = (Map<String, Contact>) Stream.of(contacts).collect(SObjectCollector.toByStringMap(IterTestUtils.CONSTS.Contact.FirstName).cast(Map<String, Contact>.class));
        Map<String, SObject> actual2 = (Map<String, SObject>) Stream.of(contacts).collect(SObjectCollector.toByStringMap(keyMapper));
        Map<String, Object> actual3 = (Map<String, Object>) Stream.of(contacts).collect(SObjectCollector.toByStringMap(keyMapper, valueMapper));
        Map<String, Object> actual4 = (Map<String, Object>) Stream.of(contacts).collect(SObjectCollector.toByStringMap(keyMapper, getParentAccFunction, mergeFunction));
        Map<String, String> actual5 = (Map<String, String>) Stream.of(contacts).collect(SObjectCollector.toByStringMap(IterTestUtils.CONSTS.FIRST_NAME, IterTestUtils.CONSTS.LAST_NAME).cast(Map<String, String>.class));
        Map<String, String> actual6 = (Map<String, String>) Stream.of(contacts).collect(SObjectCollector.toByStringMap(IterTestUtils.CONSTS.Contact.FirstName, IterTestUtils.CONSTS.Contact.LastName).cast(Map<String, String>.class));
        try {
            List<Contact> input = new List<Contact>(contacts);
            input.add(input[0]);
            Stream.of(input).collect(SObjectCollector.toByStringMap(IterTestUtils.CONSTS.FIRST_NAME));
        } catch (Exception exc) {
            System.assert(exc.getMessage().contains(IterTestUtils.CONSTS.DUPLICATE_KEY));
        }
        // Then
        Map<String, Contact> expected = new Map<String, Contact>{
                (String) contacts[0].get(IterTestUtils.CONSTS.FIRST_NAME) => contacts[0],
                (String) contacts[1].get(IterTestUtils.CONSTS.FIRST_NAME) => contacts[1],
                (String) contacts[2].get(IterTestUtils.CONSTS.FIRST_NAME) => contacts[2],
                (String) contacts[3].get(IterTestUtils.CONSTS.FIRST_NAME) => contacts[3],
                (String) contacts[4].get(IterTestUtils.CONSTS.FIRST_NAME) => contacts[4]
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Map<String, SObject> expected1 = new Map<String, SObject>{
                (String) contacts[0].get(IterTestUtils.CONSTS.FIRST_NAME) => contacts[0].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME),
                (String) contacts[1].get(IterTestUtils.CONSTS.FIRST_NAME) => contacts[1].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME),
                (String) contacts[2].get(IterTestUtils.CONSTS.FIRST_NAME) => contacts[2].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME),
                (String) contacts[3].get(IterTestUtils.CONSTS.FIRST_NAME) => contacts[3].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME),
                (String) contacts[4].get(IterTestUtils.CONSTS.FIRST_NAME) => contacts[4].getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)
        };
        Validate.assertEquals(expected1, actual4);
        Map<String, String> expected2 = new Map<String, String>{
                (String) contacts[0].get(IterTestUtils.CONSTS.FIRST_NAME) => (String) contacts[0].get(IterTestUtils.CONSTS.Contact.LastName),
                (String) contacts[1].get(IterTestUtils.CONSTS.FIRST_NAME) => (String) contacts[1].get(IterTestUtils.CONSTS.Contact.LastName),
                (String) contacts[2].get(IterTestUtils.CONSTS.FIRST_NAME) => (String) contacts[2].get(IterTestUtils.CONSTS.Contact.LastName),
                (String) contacts[3].get(IterTestUtils.CONSTS.FIRST_NAME) => (String) contacts[3].get(IterTestUtils.CONSTS.Contact.LastName),
                (String) contacts[4].get(IterTestUtils.CONSTS.FIRST_NAME) => (String) contacts[4].get(IterTestUtils.CONSTS.Contact.LastName)
        };
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.toByBlobMap
     */
    @IsTest
    static void toByBlobMap() {
        // Given
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Attachment.Body);
        ISObjectFunction valueMapper = SObjectFunction.identity();
        IBinaryOperator mergeFunction = BinaryOperator.right();
        // When
        Map<Blob, SObject> actual = (Map<Blob, SObject>) Stream.of(attachments).collect(SObjectCollector.toByBlobMap(IterTestUtils.CONSTS.BODY));
        Map<Blob, Attachment> actual1 = (Map<Blob, Attachment>) Stream.of(attachments).collect(SObjectCollector.toByBlobMap(IterTestUtils.CONSTS.Attachment.Body).cast(Map<Blob, Attachment>.class));
        Map<Blob, SObject> actual2 = (Map<Blob, SObject>) Stream.of(attachments).collect(SObjectCollector.toByBlobMap(keyMapper));
        Map<Blob, Object> actual3 = (Map<Blob, Object>) Stream.of(attachments).collect(SObjectCollector.toByBlobMap(keyMapper, valueMapper));
        Map<Blob, Object> actual4 = (Map<Blob, Object>) Stream.of(attachments).collect(SObjectCollector.toByBlobMap(keyMapper, valueMapper, mergeFunction));
        Map<Blob, String> actual5 = (Map<Blob, String>) Stream.of(attachments).collect(SObjectCollector.toByBlobMap(IterTestUtils.CONSTS.BODY, IterTestUtils.CONSTS.NAME).cast(Map<Blob, String>.class));
        Map<Blob, String> actual6 = (Map<Blob, String>) Stream.of(attachments).collect(SObjectCollector.toByBlobMap(IterTestUtils.CONSTS.Attachment.Body, IterTestUtils.CONSTS.Attachment.Name).cast(Map<Blob, String>.class));
        try {
            List<Attachment> input = new List<Attachment>(attachments);
            input.add(input[0]);
            Stream.of(input).collect(SObjectCollector.toByBlobMap(IterTestUtils.CONSTS.BODY));
        } catch (Exception exc) {
            System.assert(exc.getMessage().contains(IterTestUtils.CONSTS.DUPLICATE_KEY));
        }
        // Then
        Map<Blob, Attachment> expected = new Map<Blob, Attachment>{
                (Blob) attachments[0].get(IterTestUtils.CONSTS.BODY) => attachments[0],
                (Blob) attachments[1].get(IterTestUtils.CONSTS.BODY) => attachments[1],
                (Blob) attachments[2].get(IterTestUtils.CONSTS.BODY) => attachments[2],
                (Blob) attachments[3].get(IterTestUtils.CONSTS.BODY) => attachments[3],
                (Blob) attachments[4].get(IterTestUtils.CONSTS.BODY) => attachments[4],
                (Blob) attachments[5].get(IterTestUtils.CONSTS.BODY) => attachments[5]
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected, actual4);
        Map<Blob, String> expected2 = new Map<Blob, String>{
                (Blob) attachments[0].get(IterTestUtils.CONSTS.BODY) => (String) attachments[0].get(IterTestUtils.CONSTS.Attachment.Name),
                (Blob) attachments[1].get(IterTestUtils.CONSTS.BODY) => (String) attachments[1].get(IterTestUtils.CONSTS.Attachment.Name),
                (Blob) attachments[2].get(IterTestUtils.CONSTS.BODY) => (String) attachments[2].get(IterTestUtils.CONSTS.Attachment.Name),
                (Blob) attachments[3].get(IterTestUtils.CONSTS.BODY) => (String) attachments[3].get(IterTestUtils.CONSTS.Attachment.Name),
                (Blob) attachments[4].get(IterTestUtils.CONSTS.BODY) => (String) attachments[4].get(IterTestUtils.CONSTS.Attachment.Name),
                (Blob) attachments[5].get(IterTestUtils.CONSTS.BODY) => (String) attachments[5].get(IterTestUtils.CONSTS.Attachment.Name)
        };
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.toByDateMap
     */
    @IsTest
    static void toByDateMap() {
        // Given
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Contact.Birthdate);
        ISObjectFunction valueMapper = SObjectFunction.identity();
        IBinaryOperator mergeFunction = BinaryOperator.right();
        // When
        Map<Date, SObject> actual = (Map<Date, SObject>) Stream.of(contacts).collect(SObjectCollector.toByDateMap(IterTestUtils.CONSTS.BIRTHDATE));
        Map<Date, Contact> actual1 = (Map<Date, Contact>) Stream.of(contacts).collect(SObjectCollector.toByDateMap(IterTestUtils.CONSTS.Contact.Birthdate).cast(Map<Date, Contact>.class));
        Map<Date, SObject> actual2 = (Map<Date, SObject>) Stream.of(contacts).collect(SObjectCollector.toByDateMap(keyMapper));
        Map<Date, Object> actual3 = (Map<Date, Object>) Stream.of(contacts).collect(SObjectCollector.toByDateMap(keyMapper, valueMapper));
        Map<Date, Object> actual4 = (Map<Date, Object>) Stream.of(contacts).collect(SObjectCollector.toByDateMap(keyMapper, valueMapper, mergeFunction));
        Map<Date, String> actual5 = (Map<Date, String>) Stream.of(contacts).collect(SObjectCollector.toByDateMap(IterTestUtils.CONSTS.BIRTHDATE, IterTestUtils.CONSTS.LAST_NAME).cast(Map<Date, String>.class));
        Map<Date, String> actual6 = (Map<Date, String>) Stream.of(contacts).collect(SObjectCollector.toByDateMap(IterTestUtils.CONSTS.Contact.Birthdate, IterTestUtils.CONSTS.Contact.LastName).cast(Map<Date, String>.class));
        try {
            List<Contact> input = new List<Contact>(contacts);
            input.add(input[0]);
            Stream.of(input).collect(SObjectCollector.toByDateMap(IterTestUtils.CONSTS.BIRTHDATE));
        } catch (Exception exc) {
            System.assert(exc.getMessage().contains(IterTestUtils.CONSTS.DUPLICATE_KEY));
        }
        // Then
        Map<Date, Contact> expected = new Map<Date, Contact>{
                (Date) contacts[0].get(IterTestUtils.CONSTS.BIRTHDATE) => contacts[0],
                (Date) contacts[1].get(IterTestUtils.CONSTS.BIRTHDATE) => contacts[1],
                (Date) contacts[2].get(IterTestUtils.CONSTS.BIRTHDATE) => contacts[2],
                (Date) contacts[3].get(IterTestUtils.CONSTS.BIRTHDATE) => contacts[3],
                (Date) contacts[4].get(IterTestUtils.CONSTS.BIRTHDATE) => contacts[4]
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected, actual4);
        Map<Date, String> expected2 = new Map<Date, String>{
                (Date) contacts[0].get(IterTestUtils.CONSTS.BIRTHDATE) => (String) contacts[0].get(IterTestUtils.CONSTS.Contact.LastName),
                (Date) contacts[1].get(IterTestUtils.CONSTS.BIRTHDATE) => (String) contacts[1].get(IterTestUtils.CONSTS.Contact.LastName),
                (Date) contacts[2].get(IterTestUtils.CONSTS.BIRTHDATE) => (String) contacts[2].get(IterTestUtils.CONSTS.Contact.LastName),
                (Date) contacts[3].get(IterTestUtils.CONSTS.BIRTHDATE) => (String) contacts[3].get(IterTestUtils.CONSTS.Contact.LastName),
                (Date) contacts[4].get(IterTestUtils.CONSTS.BIRTHDATE) => (String) contacts[4].get(IterTestUtils.CONSTS.Contact.LastName)
        };
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.toByDatetimeMap
     */
    @IsTest
    static void toByDatetimeMap() {
        // Given
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Event.ActivityDateTime);
        ISObjectFunction valueMapper = SObjectFunction.identity();
        IBinaryOperator mergeFunction = BinaryOperator.right();
        // When
        Map<Datetime, SObject> actual = (Map<Datetime, SObject>) Stream.of(events).collect(SObjectCollector.toByDatetimeMap(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME));
        Map<Datetime, Event> actual1 = (Map<Datetime, Event>) Stream.of(events).collect(SObjectCollector.toByDatetimeMap(IterTestUtils.CONSTS.Event.ActivityDateTime).cast(Map<Datetime, Event>.class));
        Map<Datetime, SObject> actual2 = (Map<Datetime, SObject>) Stream.of(events).collect(SObjectCollector.toByDatetimeMap(keyMapper));
        Map<Datetime, Object> actual3 = (Map<Datetime, Object>) Stream.of(events).collect(SObjectCollector.toByDatetimeMap(keyMapper, valueMapper));
        Map<Datetime, Object> actual4 = (Map<Datetime, Object>) Stream.of(events).collect(SObjectCollector.toByDatetimeMap(keyMapper, valueMapper, mergeFunction));
        Map<Datetime, String> actual5 = (Map<Datetime, String>) Stream.of(events).collect(SObjectCollector.toByDatetimeMap(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME, IterTestUtils.CONSTS.DESCRIPTION).cast(Map<Datetime, String>.class));
        Map<Datetime, String> actual6 = (Map<Datetime, String>) Stream.of(events).collect(SObjectCollector.toByDatetimeMap(IterTestUtils.CONSTS.Event.ActivityDateTime, IterTestUtils.CONSTS.Event.Description).cast(Map<Datetime, String>.class));
        try {
            List<Event> input = new List<Event>(events);
            input.add(input[0]);
            Stream.of(input).collect(SObjectCollector.toByDatetimeMap(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME));
        } catch (Exception exc) {
            System.assert(exc.getMessage().contains(IterTestUtils.CONSTS.DUPLICATE_KEY));
        }
        // Then
        Map<Datetime, Event> expected = new Map<Datetime, Event>{
                (Datetime) events[0].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME) => events[0],
                (Datetime) events[1].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME) => events[1],
                (Datetime) events[2].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME) => events[2],
                (Datetime) events[3].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME) => events[3],
                (Datetime) events[4].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME) => events[4]
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected, actual4);
        Map<Datetime, String> expected2 = new Map<Datetime, String>{
                (Datetime) events[0].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME) => (String) events[0].get(IterTestUtils.CONSTS.Event.Description),
                (Datetime) events[1].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME) => (String) events[1].get(IterTestUtils.CONSTS.Event.Description),
                (Datetime) events[2].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME) => (String) events[2].get(IterTestUtils.CONSTS.Event.Description),
                (Datetime) events[3].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME) => (String) events[3].get(IterTestUtils.CONSTS.Event.Description),
                (Datetime) events[4].get(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME) => (String) events[4].get(IterTestUtils.CONSTS.Event.Description)
        };
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.toByTimeMap
     */
    @IsTest
    static void toByTimeMap() {
        // Given
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.TimeSlot.StartTime);
        ISObjectFunction valueMapper = SObjectFunction.identity();
        IBinaryOperator mergeFunction = BinaryOperator.right();
        // When
        Map<Time, SObject> actual = (Map<Time, SObject>) Stream.of(slots).collect(SObjectCollector.toByTimeMap(IterTestUtils.CONSTS.START_TIME));
        Map<Time, TimeSlot> actual1 = (Map<Time, TimeSlot>) Stream.of(slots).collect(SObjectCollector.toByTimeMap(IterTestUtils.CONSTS.TimeSlot.StartTime).cast(Map<Time, TimeSlot>.class));
        Map<Time, SObject> actual2 = (Map<Time, SObject>) Stream.of(slots).collect(SObjectCollector.toByTimeMap(keyMapper));
        Map<Time, Object> actual3 = (Map<Time, Object>) Stream.of(slots).collect(SObjectCollector.toByTimeMap(keyMapper, valueMapper));
        Map<Time, Object> actual4 = (Map<Time, Object>) Stream.of(slots).collect(SObjectCollector.toByTimeMap(keyMapper, valueMapper, mergeFunction));
        Map<Time, Time> actual5 = (Map<Time, Time>) Stream.of(slots).collect(SObjectCollector.toByTimeMap(IterTestUtils.CONSTS.START_TIME, IterTestUtils.CONSTS.END_TIME).cast(Map<Time, Time>.class));
        Map<Time, Time> actual6 = (Map<Time, Time>) Stream.of(slots).collect(SObjectCollector.toByTimeMap(IterTestUtils.CONSTS.TimeSlot.StartTime, IterTestUtils.CONSTS.TimeSlot.EndTime).cast(Map<Time, Time>.class));
        try {
            List<TimeSlot> input = new List<TimeSlot>(slots);
            input.add(input[0]);
            Stream.of(input).collect(SObjectCollector.toByTimeMap(IterTestUtils.CONSTS.START_TIME));
        } catch (Exception exc) {
            System.assert(exc.getMessage().contains(IterTestUtils.CONSTS.DUPLICATE_KEY));
        }
        // Then
        Map<Time, TimeSlot> expected = new Map<Time, TimeSlot>{
                (Time) slots[0].get(IterTestUtils.CONSTS.START_TIME) => slots[0],
                (Time) slots[1].get(IterTestUtils.CONSTS.START_TIME) => slots[1],
                (Time) slots[2].get(IterTestUtils.CONSTS.START_TIME) => slots[2],
                (Time) slots[3].get(IterTestUtils.CONSTS.START_TIME) => slots[3],
                (Time) slots[4].get(IterTestUtils.CONSTS.START_TIME) => slots[4]
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected, actual4);
        Map<Time, Time> expected2 = new Map<Time, Time>{
                (Time) slots[0].get(IterTestUtils.CONSTS.START_TIME) => (Time) slots[0].get(IterTestUtils.CONSTS.END_TIME),
                (Time) slots[1].get(IterTestUtils.CONSTS.START_TIME) => (Time) slots[1].get(IterTestUtils.CONSTS.END_TIME),
                (Time) slots[2].get(IterTestUtils.CONSTS.START_TIME) => (Time) slots[2].get(IterTestUtils.CONSTS.END_TIME),
                (Time) slots[3].get(IterTestUtils.CONSTS.START_TIME) => (Time) slots[3].get(IterTestUtils.CONSTS.END_TIME),
                (Time) slots[4].get(IterTestUtils.CONSTS.START_TIME) => (Time) slots[4].get(IterTestUtils.CONSTS.END_TIME)
        };
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.toByIntMap
     */
    @IsTest
    static void toByIntMap() {
        // Given
        ISObjectToIntFunction keyMapper = SObjectToIntFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        ISObjectFunction valueMapper = SObjectFunction.identity();
        IBinaryOperator mergeFunction = BinaryOperator.right();
        // When
        Map<Integer, SObject> actual = (Map<Integer, SObject>) Stream.of(accounts).collect(SObjectCollector.toByIntMap(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        Map<Integer, Account> actual1 = (Map<Integer, Account>) Stream.of(accounts).collect(SObjectCollector.toByIntMap(IterTestUtils.CONSTS.Account.NumberOfEmployees).cast(Map<Integer, Account>.class));
        Map<Integer, SObject> actual2 = (Map<Integer, SObject>) Stream.of(accounts).collect(SObjectCollector.toByIntMap(keyMapper));
        Map<Integer, Object> actual3 = (Map<Integer, Object>) Stream.of(accounts).collect(SObjectCollector.toByIntMap(keyMapper, valueMapper));
        Map<Integer, Object> actual4 = (Map<Integer, Object>) Stream.of(accounts).collect(SObjectCollector.toByIntMap(keyMapper, valueMapper, mergeFunction));
        Map<Integer, String> actual5 = (Map<Integer, String>) Stream.of(accounts).collect(SObjectCollector.toByIntMap(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES, IterTestUtils.CONSTS.NAME).cast(Map<Integer, String>.class));
        Map<Integer, String> actual6 = (Map<Integer, String>) Stream.of(accounts).collect(SObjectCollector.toByIntMap(IterTestUtils.CONSTS.Account.NumberOfEmployees, IterTestUtils.CONSTS.Account.Name).cast(Map<Integer, String>.class));
        try {
            List<Account> input = new List<Account>(accounts);
            input.add(input[0]);
            Stream.of(input).collect(SObjectCollector.toByIntMap(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        } catch (Exception exc) {
            System.assert(exc.getMessage().contains(IterTestUtils.CONSTS.DUPLICATE_KEY));
        }
        // Then
        Map<Integer, Account> expected = new Map<Integer, Account>{
                (Integer) accounts[0].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[0],
                (Integer) accounts[1].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[1],
                (Integer) accounts[2].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[2],
                (Integer) accounts[3].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[3],
                (Integer) accounts[4].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[4],
                (Integer) accounts[5].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[5],
                (Integer) accounts[6].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[6],
                (Integer) accounts[7].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[7],
                (Integer) accounts[8].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[8],
                (Integer) accounts[9].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[9]
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected, actual4);
        Map<Integer, String> expected2 = new Map<Integer, String>{
                (Integer) accounts[0].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[0].get(IterTestUtils.CONSTS.Account.Name),
                (Integer) accounts[1].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[1].get(IterTestUtils.CONSTS.Account.Name),
                (Integer) accounts[2].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[2].get(IterTestUtils.CONSTS.Account.Name),
                (Integer) accounts[3].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[3].get(IterTestUtils.CONSTS.Account.Name),
                (Integer) accounts[4].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[4].get(IterTestUtils.CONSTS.Account.Name),
                (Integer) accounts[5].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[5].get(IterTestUtils.CONSTS.Account.Name),
                (Integer) accounts[6].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[6].get(IterTestUtils.CONSTS.Account.Name),
                (Integer) accounts[7].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[7].get(IterTestUtils.CONSTS.Account.Name),
                (Integer) accounts[8].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[8].get(IterTestUtils.CONSTS.Account.Name),
                (Integer) accounts[9].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[9].get(IterTestUtils.CONSTS.Account.Name)
        };
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.toByLongMap
     */
    @IsTest
    static void toByLongMap() {
        // Given
        ISObjectToLongFunction keyMapper = SObjectToLongFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        ISObjectFunction valueMapper = SObjectFunction.identity();
        IBinaryOperator mergeFunction = BinaryOperator.right();
        // When
        Map<Long, SObject> actual = (Map<Long, SObject>) Stream.of(accounts).collect(SObjectCollector.toByLongMap(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        Map<Long, Account> actual1 = (Map<Long, Account>) Stream.of(accounts).collect(SObjectCollector.toByLongMap(IterTestUtils.CONSTS.Account.NumberOfEmployees).cast(Map<Long, Account>.class));
        Map<Long, SObject> actual2 = (Map<Long, SObject>) Stream.of(accounts).collect(SObjectCollector.toByLongMap(keyMapper));
        Map<Long, Object> actual3 = (Map<Long, Object>) Stream.of(accounts).collect(SObjectCollector.toByLongMap(keyMapper, valueMapper));
        Map<Long, Object> actual4 = (Map<Long, Object>) Stream.of(accounts).collect(SObjectCollector.toByLongMap(keyMapper, valueMapper, mergeFunction));
        Map<Long, String> actual5 = (Map<Long, String>) Stream.of(accounts).collect(SObjectCollector.toByLongMap(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES, IterTestUtils.CONSTS.NAME).cast(Map<Long, String>.class));
        Map<Long, String> actual6 = (Map<Long, String>) Stream.of(accounts).collect(SObjectCollector.toByLongMap(IterTestUtils.CONSTS.Account.NumberOfEmployees, IterTestUtils.CONSTS.Account.Name).cast(Map<Long, String>.class));
        // Then
        Map<Long, Account> expected = new Map<Long, Account>{
                (Long) accounts[0].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[0],
                (Long) accounts[1].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[1],
                (Long) accounts[2].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[2],
                (Long) accounts[3].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[3],
                (Long) accounts[4].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[4],
                (Long) accounts[5].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[5],
                (Long) accounts[6].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[6],
                (Long) accounts[7].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[7],
                (Long) accounts[8].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[8],
                (Long) accounts[9].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[9]
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected, actual4);
        Map<Long, String> expected2 = new Map<Long, String>{
                (Long) accounts[0].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[0].get(IterTestUtils.CONSTS.Account.Name),
                (Long) accounts[1].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[1].get(IterTestUtils.CONSTS.Account.Name),
                (Long) accounts[2].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[2].get(IterTestUtils.CONSTS.Account.Name),
                (Long) accounts[3].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[3].get(IterTestUtils.CONSTS.Account.Name),
                (Long) accounts[4].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[4].get(IterTestUtils.CONSTS.Account.Name),
                (Long) accounts[5].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[5].get(IterTestUtils.CONSTS.Account.Name),
                (Long) accounts[6].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[6].get(IterTestUtils.CONSTS.Account.Name),
                (Long) accounts[7].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[7].get(IterTestUtils.CONSTS.Account.Name),
                (Long) accounts[8].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[8].get(IterTestUtils.CONSTS.Account.Name),
                (Long) accounts[9].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[9].get(IterTestUtils.CONSTS.Account.Name)
        };
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.toByDoubleMap
     */
    @IsTest
    static void toByDoubleMap() {
        // Given
        ISObjectToDoubleFunction keyMapper = SObjectToDoubleFunction.get(IterTestUtils.CONSTS.Account.BillingLatitude);
        ISObjectFunction valueMapper = SObjectFunction.identity();
        IBinaryOperator mergeFunction = BinaryOperator.right();
        // When
        Map<Double, SObject> actual = (Map<Double, SObject>) Stream.of(accounts).collect(SObjectCollector.toByDoubleMap(IterTestUtils.CONSTS.BILLING_LATITUDE));
        Map<Double, Account> actual1 = (Map<Double, Account>) Stream.of(accounts).collect(SObjectCollector.toByDoubleMap(IterTestUtils.CONSTS.Account.BillingLatitude).cast(Map<Double, Account>.class));
        Map<Double, SObject> actual2 = (Map<Double, SObject>) Stream.of(accounts).collect(SObjectCollector.toByDoubleMap(keyMapper));
        Map<Double, Object> actual3 = (Map<Double, Object>) Stream.of(accounts).collect(SObjectCollector.toByDoubleMap(keyMapper, valueMapper));
        Map<Double, Object> actual4 = (Map<Double, Object>) Stream.of(accounts).collect(SObjectCollector.toByDoubleMap(keyMapper, valueMapper, mergeFunction));
        Map<Double, String> actual5 = (Map<Double, String>) Stream.of(accounts).collect(SObjectCollector.toByDoubleMap(IterTestUtils.CONSTS.BILLING_LATITUDE, IterTestUtils.CONSTS.NAME).cast(Map<Double, String>.class));
        Map<Double, String> actual6 = (Map<Double, String>) Stream.of(accounts).collect(SObjectCollector.toByDoubleMap(IterTestUtils.CONSTS.Account.BillingLatitude, IterTestUtils.CONSTS.Account.Name).cast(Map<Double, String>.class));
        // Then
        Map<Double, Account> expected = new Map<Double, Account>{
                (Double) accounts[0].get(IterTestUtils.CONSTS.Account.BillingLatitude) => accounts[0],
                (Double) accounts[1].get(IterTestUtils.CONSTS.Account.BillingLatitude) => accounts[1],
                (Double) accounts[2].get(IterTestUtils.CONSTS.Account.BillingLatitude) => accounts[2],
                (Double) accounts[3].get(IterTestUtils.CONSTS.Account.BillingLatitude) => accounts[3],
                (Double) accounts[4].get(IterTestUtils.CONSTS.Account.BillingLatitude) => accounts[4],
                (Double) accounts[5].get(IterTestUtils.CONSTS.Account.BillingLatitude) => accounts[5],
                (Double) accounts[6].get(IterTestUtils.CONSTS.Account.BillingLatitude) => accounts[6],
                (Double) accounts[7].get(IterTestUtils.CONSTS.Account.BillingLatitude) => accounts[7],
                (Double) accounts[8].get(IterTestUtils.CONSTS.Account.BillingLatitude) => accounts[8],
                (Double) accounts[9].get(IterTestUtils.CONSTS.Account.BillingLatitude) => accounts[9]
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected, actual4);
        Map<Double, String> expected2 = new Map<Double, String>{
                (Double) accounts[0].get(IterTestUtils.CONSTS.Account.BillingLatitude) => (String) accounts[0].get(IterTestUtils.CONSTS.Account.Name),
                (Double) accounts[1].get(IterTestUtils.CONSTS.Account.BillingLatitude) => (String) accounts[1].get(IterTestUtils.CONSTS.Account.Name),
                (Double) accounts[2].get(IterTestUtils.CONSTS.Account.BillingLatitude) => (String) accounts[2].get(IterTestUtils.CONSTS.Account.Name),
                (Double) accounts[3].get(IterTestUtils.CONSTS.Account.BillingLatitude) => (String) accounts[3].get(IterTestUtils.CONSTS.Account.Name),
                (Double) accounts[4].get(IterTestUtils.CONSTS.Account.BillingLatitude) => (String) accounts[4].get(IterTestUtils.CONSTS.Account.Name),
                (Double) accounts[5].get(IterTestUtils.CONSTS.Account.BillingLatitude) => (String) accounts[5].get(IterTestUtils.CONSTS.Account.Name),
                (Double) accounts[6].get(IterTestUtils.CONSTS.Account.BillingLatitude) => (String) accounts[6].get(IterTestUtils.CONSTS.Account.Name),
                (Double) accounts[7].get(IterTestUtils.CONSTS.Account.BillingLatitude) => (String) accounts[7].get(IterTestUtils.CONSTS.Account.Name),
                (Double) accounts[8].get(IterTestUtils.CONSTS.Account.BillingLatitude) => (String) accounts[8].get(IterTestUtils.CONSTS.Account.Name),
                (Double) accounts[9].get(IterTestUtils.CONSTS.Account.BillingLatitude) => (String) accounts[9].get(IterTestUtils.CONSTS.Account.Name)
        };
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.toMap
     */
    @IsTest
    static void toByObjectMap() {
        // Given
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        ISObjectFunction valueMapper = SObjectFunction.identity();
        IBinaryOperator mergeFunction = BinaryOperator.right();
        // When
        Map<Object, SObject> actual = (Map<Object, SObject>) Stream.of(accounts).collect(SObjectCollector.toMap(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        Map<Object, Account> actual1 = (Map<Object, Account>) Stream.of(accounts).collect(SObjectCollector.toMap(IterTestUtils.CONSTS.Account.NumberOfEmployees).cast(Map<Object, Account>.class));
        Map<Object, SObject> actual2 = (Map<Object, SObject>) Stream.of(accounts).collect(SObjectCollector.toMap(keyMapper));
        Map<Object, Object> actual3 = (Map<Object, Object>) Stream.of(accounts).collect(SObjectCollector.toMap(keyMapper, valueMapper));
        Map<Object, Object> actual4 = (Map<Object, Object>) Stream.of(accounts).collect(SObjectCollector.toMap(keyMapper, valueMapper, mergeFunction));
        Map<Object, String> actual5 = (Map<Object, String>) Stream.of(accounts).collect(SObjectCollector.toMap(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES, IterTestUtils.CONSTS.NAME).cast(Map<Object, String>.class));
        Map<Object, String> actual6 = (Map<Object, String>) Stream.of(accounts).collect(SObjectCollector.toMap(IterTestUtils.CONSTS.Account.NumberOfEmployees, IterTestUtils.CONSTS.Account.Name).cast(Map<Object, String>.class));
        // Then
        Map<Object, Account> expected = new Map<Object, Account>{
                accounts[0].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[0],
                accounts[1].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[1],
                accounts[2].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[2],
                accounts[3].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[3],
                accounts[4].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[4],
                accounts[5].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[5],
                accounts[6].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[6],
                accounts[7].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[7],
                accounts[8].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[8],
                accounts[9].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => accounts[9]
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected, actual4);
        Map<Object, String> expected2 = new Map<Object, String>{
                accounts[0].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[0].get(IterTestUtils.CONSTS.Account.Name),
                accounts[1].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[1].get(IterTestUtils.CONSTS.Account.Name),
                accounts[2].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[2].get(IterTestUtils.CONSTS.Account.Name),
                accounts[3].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[3].get(IterTestUtils.CONSTS.Account.Name),
                accounts[4].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[4].get(IterTestUtils.CONSTS.Account.Name),
                accounts[5].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[5].get(IterTestUtils.CONSTS.Account.Name),
                accounts[6].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[6].get(IterTestUtils.CONSTS.Account.Name),
                accounts[7].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[7].get(IterTestUtils.CONSTS.Account.Name),
                accounts[8].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[8].get(IterTestUtils.CONSTS.Account.Name),
                accounts[9].get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) => (String) accounts[9].get(IterTestUtils.CONSTS.Account.Name)
        };
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.groupingByBool
     */
    @IsTest
    static void groupingByBool() {
        // Given
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Contact.DoNotCall);
        SObjectCollector downstream = SObjectCollector.toList(IterTestUtils.CONSTS.Contact.LastName);
        // When
        Map<Boolean, List<Contact>> actual = (Map<Boolean,  List<Contact>>) Stream.of(contacts).collect(SObjectCollector.groupingByBool(IterTestUtils.CONSTS.Contact.DoNotCall));
        Map<Boolean, List<Contact>> actual1 = (Map<Boolean, List<Contact>>) Stream.of(contacts).collect(SObjectCollector.groupingByBool(IterTestUtils.CONSTS.DO_NOT_CALL));
        Map<Boolean, List<SObject>> actual2 = (Map<Boolean, List<SObject>>) Stream.of(contacts).collect(SObjectCollector.groupingByBool(keyMapper).cast(Map<Boolean, List<SObject>>.class));
        Map<Boolean, List<String>> actual3 = (Map<Boolean, List<String>>) Stream.of(contacts).collect(SObjectCollector.groupingByBool(IterTestUtils.CONSTS.Contact.DoNotCall, IterTestUtils.CONSTS.Contact.LastName).cast(Map<Boolean, List<String>>.class));
        Map<Boolean, Object> actual4 = (Map<Boolean, Object>) Stream.of(contacts).collect(SObjectCollector.groupingByBool(IterTestUtils.CONSTS.DO_NOT_CALL, IterTestUtils.CONSTS.LAST_NAME));
        Map<Boolean, Object> actual5 = (Map<Boolean, Object>) Stream.of(contacts).collect(SObjectCollector.groupingByBool(keyMapper, downstream));
        Map<Boolean, List<String>> actual6 = (Map<Boolean, List<String>>) Stream.of(contacts).collect(SObjectCollector.groupingByBool(keyMapper, Supplier.of(Map<Boolean, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Boolean, Map<Boolean, List<String>>> actual7 = (Map<Boolean, Map<Boolean, List<String>>>) Stream.of(contacts)
                .collect(SObjectCollector.groupingByBool(keyMapper, SObjectCollector.groupingByBool(IterTestUtils.CONSTS.Contact.HasOptedOutOfEmail, IterTestUtils.CONSTS.Contact.LastName)).cast(Map<Boolean, Map<Boolean, List<String>>>.class));
        Map<Boolean, Object> actual8 = (Map<Boolean, Object>) Stream.of(contacts).collect(SObjectCollector.groupingByBool(keyMapper, SObjectCollector.groupingByBool(IterTestUtils.CONSTS.HAS_OPTED_OUT_OF_EMAIL, IterTestUtils.CONSTS.LAST_NAME)));
        // Then
        Map<Boolean, List<Contact>> expected = new Map<Boolean, List<Contact>>{
                true => new List<Contact>{ contacts[0], contacts[2] },
                false => new List<Contact>{ contacts[1], contacts[3] },
                null => new List<Contact>{ contacts[4] }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Map<Boolean, List<String>> expected1 = new Map<Boolean, List<String>>{
                true => new List<String>{ (String) contacts[0].get(IterTestUtils.CONSTS.LAST_NAME), (String) contacts[2].get(IterTestUtils.CONSTS.LAST_NAME) },
                false => new List<String>{ (String) contacts[1].get(IterTestUtils.CONSTS.LAST_NAME), (String) contacts[3].get(IterTestUtils.CONSTS.LAST_NAME) },
                null => new List<String>{ (String) contacts[4].get(IterTestUtils.CONSTS.LAST_NAME) }
        };
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Map<Boolean, Map<Boolean, List<String>>> expected2 = new Map<Boolean, Map<Boolean, List<String>>>{
                true => new Map<Boolean, List<String>>{ true => new List<String>{ (String) contacts[0].get(IterTestUtils.CONSTS.LAST_NAME), (String) contacts[2].get(IterTestUtils.CONSTS.LAST_NAME) } },
                false => new Map<Boolean, List<String>>{ true => new List<String>{ (String) contacts[1].get(IterTestUtils.CONSTS.LAST_NAME) }, false => new List<String>{ (String) contacts[3].get(IterTestUtils.CONSTS.LAST_NAME) } },
                null => new Map<Boolean, List<String>>{ false => new List<String>{ (String) contacts[4].get(IterTestUtils.CONSTS.LAST_NAME) } }
        };
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(expected2, actual8);
    }

    /**
     * @see SObjectCollector.groupingById
     */
    @IsTest
    static void groupingById() {
        // Given
        contacts[0].AccountId = accounts[0].Id;
        contacts[1].AccountId = accounts[0].Id;
        contacts[2].AccountId = accounts[1].Id;
        contacts[3].AccountId = accounts[1].Id;
        contacts[4].AccountId = null;
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Contact.AccountId);
        SObjectCollector downstream = SObjectCollector.toList(IterTestUtils.CONSTS.Contact.LastName);
        // When
        Map<Id, List<Contact>> actual = (Map<Id,  List<Contact>>) Stream.of(contacts).collect(SObjectCollector.groupingById(IterTestUtils.CONSTS.Contact.AccountId));
        Map<Id, List<Contact>> actual1 = (Map<Id, List<Contact>>) Stream.of(contacts).collect(SObjectCollector.groupingById(IterTestUtils.CONSTS.ACCOUNT_ID));
        Map<Id, List<SObject>> actual2 = (Map<Id, List<SObject>>) Stream.of(contacts).collect(SObjectCollector.groupingById(keyMapper).cast(Map<Id, List<SObject>>.class));
        Map<Id, List<String>> actual3 = (Map<Id, List<String>>) Stream.of(contacts).collect(SObjectCollector.groupingById(IterTestUtils.CONSTS.Contact.AccountId, IterTestUtils.CONSTS.Contact.LastName).cast(Map<Id, List<String>>.class));
        Map<Id, Object> actual4 = (Map<Id, Object>) Stream.of(contacts).collect(SObjectCollector.groupingById(IterTestUtils.CONSTS.ACCOUNT_ID, IterTestUtils.CONSTS.LAST_NAME));
        Map<Id, Object> actual5 = (Map<Id, Object>) Stream.of(contacts).collect(SObjectCollector.groupingById(keyMapper, downstream));
        Map<Id, List<String>> actual6 = (Map<Id, List<String>>) Stream.of(contacts).collect(SObjectCollector.groupingById(keyMapper, Supplier.of(Map<Id, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Id, Map<Id, List<String>>> actual7 = (Map<Id, Map<Id, List<String>>>) Stream.of(contacts)
                .collect(SObjectCollector.groupingById(keyMapper, SObjectCollector.groupingById(IterTestUtils.CONSTS.Contact.Id, IterTestUtils.CONSTS.Contact.LastName)).cast(Map<Id, Map<Id, List<String>>>.class));
        Map<Id, Object> actual8 = (Map<Id, Object>) Stream.of(contacts).collect(SObjectCollector.groupingById(keyMapper, SObjectCollector.groupingById(IterTestUtils.CONSTS.ID, IterTestUtils.CONSTS.LAST_NAME)));
        // Then
        Map<Id, List<Contact>> expected = new Map<Id, List<Contact>>{
                accounts[0].Id => new List<Contact>{ contacts[0], contacts[1] },
                accounts[1].Id => new List<Contact>{ contacts[2], contacts[3] },
                null => new List<Contact>{ contacts[4] }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Map<Id, List<String>> expected1 = new Map<Id, List<String>>{
                accounts[0].Id => new List<String>{ (String) contacts[0].get(IterTestUtils.CONSTS.LAST_NAME), (String) contacts[1].get(IterTestUtils.CONSTS.LAST_NAME) },
                accounts[1].Id => new List<String>{ (String) contacts[2].get(IterTestUtils.CONSTS.LAST_NAME), (String) contacts[3].get(IterTestUtils.CONSTS.LAST_NAME) },
                null => new List<String>{ (String) contacts[4].get(IterTestUtils.CONSTS.LAST_NAME) }
        };
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Map<Id, Map<Id, List<String>>> expected2 = new Map<Id, Map<Id, List<String>>>{
                accounts[0].Id => new Map<Id, List<String>>{ contacts[0].Id => new List<String>{ (String) contacts[0].get(IterTestUtils.CONSTS.LAST_NAME) }, contacts[1].Id => new List<String>{ (String) contacts[1].get(IterTestUtils.CONSTS.LAST_NAME) } },
                accounts[1].Id => new Map<Id, List<String>>{ contacts[2].Id => new List<String>{ (String) contacts[2].get(IterTestUtils.CONSTS.LAST_NAME) }, contacts[3].Id => new List<String>{ (String) contacts[3].get(IterTestUtils.CONSTS.LAST_NAME) } },
                null => new Map<Id, List<String>>{ contacts[4].Id => new List<String>{ (String) contacts[4].get(IterTestUtils.CONSTS.LAST_NAME) } }
        };
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(expected2, actual8);
    }

    /**
     * @see SObjectCollector.groupingByString
     */
    @IsTest
    static void groupingByString() {
        // Given
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Contact.OtherCountry);
        SObjectCollector downstream = SObjectCollector.toList(IterTestUtils.CONSTS.Contact.LastName);
        // When
        Map<String, List<Contact>> actual = (Map<String,  List<Contact>>) Stream.of(contacts).collect(SObjectCollector.groupingByString(IterTestUtils.CONSTS.Contact.OtherCountry));
        Map<String, List<Contact>> actual1 = (Map<String, List<Contact>>) Stream.of(contacts).collect(SObjectCollector.groupingByString(IterTestUtils.CONSTS.OTHER_COUNTRY));
        Map<String, List<SObject>> actual2 = (Map<String, List<SObject>>) Stream.of(contacts).collect(SObjectCollector.groupingByString(keyMapper).cast(Map<String, List<SObject>>.class));
        Map<String, List<String>> actual3 = (Map<String, List<String>>) Stream.of(contacts).collect(SObjectCollector.groupingByString(IterTestUtils.CONSTS.Contact.OtherCountry, IterTestUtils.CONSTS.Contact.LastName).cast(Map<String, List<String>>.class));
        Map<String, Object> actual4 = (Map<String, Object>) Stream.of(contacts).collect(SObjectCollector.groupingByString(IterTestUtils.CONSTS.OTHER_COUNTRY, IterTestUtils.CONSTS.LAST_NAME));
        Map<String, Object> actual5 = (Map<String, Object>) Stream.of(contacts).collect(SObjectCollector.groupingByString(keyMapper, downstream));
        Map<String, List<String>> actual6 = (Map<String, List<String>>) Stream.of(contacts).collect(SObjectCollector.groupingByString(keyMapper, Supplier.of(Map<String, List<String>>.class), downstream.cast(List<String>.class)));
        Map<String, Map<String, List<String>>> actual7 = (Map<String, Map<String, List<String>>>) Stream.of(contacts)
                .collect(SObjectCollector.groupingByString(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.Contact.OtherCity, IterTestUtils.CONSTS.Contact.LastName)).cast(Map<String, Map<String, List<String>>>.class));
        Map<String, Object> actual8 = (Map<String, Object>) Stream.of(contacts).collect(SObjectCollector.groupingByString(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.OTHER_CITY, IterTestUtils.CONSTS.LAST_NAME)));
        // Then
        Map<String, List<Contact>> expected = new Map<String, List<Contact>>{
                IterTestUtils.CONSTS.FRANCE => new List<Contact>{ contacts[0], contacts[1] },
                IterTestUtils.CONSTS.UK => new List<Contact>{ contacts[2], contacts[3] },
                null => new List<Contact>{ contacts[4] }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Map<String, List<String>> expected1 = new Map<String, List<String>>{
                IterTestUtils.CONSTS.FRANCE => new List<String>{ (String) contacts[0].get(IterTestUtils.CONSTS.LAST_NAME), (String) contacts[1].get(IterTestUtils.CONSTS.LAST_NAME) },
                IterTestUtils.CONSTS.UK => new List<String>{ (String) contacts[2].get(IterTestUtils.CONSTS.LAST_NAME), (String) contacts[3].get(IterTestUtils.CONSTS.LAST_NAME) },
                null => new List<String>{ (String) contacts[4].get(IterTestUtils.CONSTS.LAST_NAME) }
        };
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Map<String, Map<String, List<String>>> expected2 = new Map<String, Map<String, List<String>>>{
                IterTestUtils.CONSTS.FRANCE => new Map<String, List<String>>{ IterTestUtils.CONSTS.PARIS => new List<String>{ (String) contacts[0].get(IterTestUtils.CONSTS.LAST_NAME) }, IterTestUtils.CONSTS.LYON => new List<String>{ (String) contacts[1].get(IterTestUtils.CONSTS.LAST_NAME) } },
                IterTestUtils.CONSTS.UK => new Map<String, List<String>>{ IterTestUtils.CONSTS.LONDON => new List<String>{ (String) contacts[2].get(IterTestUtils.CONSTS.LAST_NAME) }, IterTestUtils.CONSTS.BRISTOL => new List<String>{ (String) contacts[3].get(IterTestUtils.CONSTS.LAST_NAME) } },
                null => new Map<String, List<String>>{ null => new List<String>{ (String) contacts[4].get(IterTestUtils.CONSTS.LAST_NAME) } }
        };
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(expected2, actual8);
    }

    /**
     * @see SObjectCollector.groupingByBlob
     */
    @IsTest
    static void groupingByBlob() {
        // Given
        attachments[0].Body = attachments[0].Body;
        attachments[1].Body = attachments[1].Body;
        attachments[2].Body = attachments[0].Body;
        attachments[3].Body = attachments[1].Body;
        attachments[4].Body = attachments[0].Body;
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Attachment.Body);
        SObjectCollector downstream = SObjectCollector.toList(IterTestUtils.CONSTS.Attachment.Name);
        // When
        Map<Blob, List<Attachment>> actual = (Map<Blob,  List<Attachment>>) Stream.of(attachments).collect(SObjectCollector.groupingByBlob(IterTestUtils.CONSTS.Attachment.Body));
        Map<Blob, List<Attachment>> actual1 = (Map<Blob, List<Attachment>>) Stream.of(attachments).collect(SObjectCollector.groupingByBlob(IterTestUtils.CONSTS.BODY));
        Map<Blob, List<SObject>> actual2 = (Map<Blob, List<SObject>>) Stream.of(attachments).collect(SObjectCollector.groupingByBlob(keyMapper).cast(Map<Blob, List<SObject>>.class));
        Map<Blob, List<String>> actual3 = (Map<Blob, List<String>>) Stream.of(attachments).collect(SObjectCollector.groupingByBlob(IterTestUtils.CONSTS.Attachment.Body, IterTestUtils.CONSTS.Attachment.Name).cast(Map<Blob, List<String>>.class));
        Map<Blob, Object> actual4 = (Map<Blob, Object>) Stream.of(attachments).collect(SObjectCollector.groupingByBlob(IterTestUtils.CONSTS.BODY, IterTestUtils.CONSTS.NAME));
        Map<Blob, Object> actual5 = (Map<Blob, Object>) Stream.of(attachments).collect(SObjectCollector.groupingByBlob(keyMapper, downstream));
        Map<Blob, List<String>> actual6 = (Map<Blob, List<String>>) Stream.of(attachments).collect(SObjectCollector.groupingByBlob(keyMapper, Supplier.of(Map<Blob, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Blob, Map<String, List<String>>> actual7 = (Map<Blob, Map<String, List<String>>>) Stream.of(attachments)
                .collect(SObjectCollector.groupingByBlob(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.Attachment.ContentType, IterTestUtils.CONSTS.Attachment.Name)).cast(Map<Blob, Map<String, List<String>>>.class));
        Map<Blob, Object> actual8 = (Map<Blob, Object>) Stream.of(attachments).collect(SObjectCollector.groupingByBlob(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.CONTENT_TYPE, IterTestUtils.CONSTS.NAME)));
        // Then
        Map<Blob, List<Attachment>> expected = new Map<Blob, List<Attachment>>{
                attachments[0].Body => new List<Attachment>{ attachments[0], attachments[2], attachments[4] },
                attachments[1].Body => new List<Attachment>{ attachments[1], attachments[3] },
                null => new List<Attachment>{ attachments[5] }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Map<Blob, List<String>> expected1 = new Map<Blob, List<String>>{
                attachments[0].Body => new List<String>{ (String) attachments[0].get(IterTestUtils.CONSTS.NAME), (String) attachments[2].get(IterTestUtils.CONSTS.NAME), (String) attachments[4].get(IterTestUtils.CONSTS.NAME) },
                attachments[1].Body => new List<String>{ (String) attachments[1].get(IterTestUtils.CONSTS.NAME), (String) attachments[3].get(IterTestUtils.CONSTS.NAME) },
                null => new List<String>{ (String) attachments[5].get(IterTestUtils.CONSTS.NAME) }
        };
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Map<Blob, Map<String, List<String>>> expected2 = new Map<Blob, Map<String, List<String>>>{
                attachments[0].Body => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.DOC => new List<String>{ (String) attachments[0].get(IterTestUtils.CONSTS.NAME), (String) attachments[2].get(IterTestUtils.CONSTS.NAME) },
                        IterTestUtils.CONSTS.PDF => new List<String>{ (String) attachments[4].get(IterTestUtils.CONSTS.NAME) }
                },
                attachments[1].Body => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.DOC => new List<String>{ (String) attachments[1].get(IterTestUtils.CONSTS.NAME) },
                        IterTestUtils.CONSTS.PDF => new List<String>{ (String) attachments[3].get(IterTestUtils.CONSTS.NAME) }
                },
                null => new Map<String, List<String>>{ null => new List<String>{ (String) attachments[5].get(IterTestUtils.CONSTS.NAME) } }
        };
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(expected2, actual8);
    }

    /**
     * @see SObjectCollector.groupingByDate
     */
    @IsTest
    static void groupingByDate() {
        // Given
        contacts[0].Birthdate = contacts[0].Birthdate;
        contacts[1].Birthdate = contacts[1].Birthdate;
        contacts[2].Birthdate = contacts[0].Birthdate;
        contacts[3].Birthdate = contacts[1].Birthdate;
        contacts[4].Birthdate = null;
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Contact.Birthdate);
        SObjectCollector downstream = SObjectCollector.toList(IterTestUtils.CONSTS.Contact.LastName);
        // When
        Map<Date, List<Contact>> actual = (Map<Date,  List<Contact>>) Stream.of(contacts).collect(SObjectCollector.groupingByDate(IterTestUtils.CONSTS.Contact.Birthdate));
        Map<Date, List<Contact>> actual1 = (Map<Date, List<Contact>>) Stream.of(contacts).collect(SObjectCollector.groupingByDate(IterTestUtils.CONSTS.BIRTHDATE));
        Map<Date, List<SObject>> actual2 = (Map<Date, List<SObject>>) Stream.of(contacts).collect(SObjectCollector.groupingByDate(keyMapper).cast(Map<Date, List<SObject>>.class));
        Map<Date, List<String>> actual3 = (Map<Date, List<String>>) Stream.of(contacts).collect(SObjectCollector.groupingByDate(IterTestUtils.CONSTS.Contact.Birthdate, IterTestUtils.CONSTS.Contact.LastName).cast(Map<Date, List<String>>.class));
        Map<Date, Object> actual4 = (Map<Date, Object>) Stream.of(contacts).collect(SObjectCollector.groupingByDate(IterTestUtils.CONSTS.BIRTHDATE, IterTestUtils.CONSTS.LAST_NAME));
        Map<Date, Object> actual5 = (Map<Date, Object>) Stream.of(contacts).collect(SObjectCollector.groupingByDate(keyMapper, downstream));
        Map<Date, List<String>> actual6 = (Map<Date, List<String>>) Stream.of(contacts).collect(SObjectCollector.groupingByDate(keyMapper, Supplier.of(Map<Date, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Date, Map<String, List<String>>> actual7 = (Map<Date, Map<String, List<String>>>) Stream.of(contacts)
                .collect(SObjectCollector.groupingByDate(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.Contact.Department, IterTestUtils.CONSTS.Contact.LastName)).cast(Map<Date, Map<String, List<String>>>.class));
        Map<Date, Object> actual8 = (Map<Date, Object>) Stream.of(contacts).collect(SObjectCollector.groupingByDate(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.DEPARTMENT, IterTestUtils.CONSTS.LAST_NAME)));
        // Then
        Map<Date, List<Contact>> expected = new Map<Date, List<Contact>>{
                contacts[0].Birthdate => new List<Contact>{ contacts[0], contacts[2] },
                contacts[1].Birthdate => new List<Contact>{ contacts[1], contacts[3] },
                null => new List<Contact>{ contacts[4] }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Map<Date, List<String>> expected1 = new Map<Date, List<String>>{
                contacts[0].Birthdate => new List<String>{ (String) contacts[0].get(IterTestUtils.CONSTS.LAST_NAME), (String) contacts[2].get(IterTestUtils.CONSTS.LAST_NAME) },
                contacts[1].Birthdate => new List<String>{ (String) contacts[1].get(IterTestUtils.CONSTS.LAST_NAME), (String) contacts[3].get(IterTestUtils.CONSTS.LAST_NAME) },
                null => new List<String>{ (String) contacts[4].get(IterTestUtils.CONSTS.LAST_NAME) }
        };
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Map<Date, Map<String, List<String>>> expected2 = new Map<Date, Map<String, List<String>>>{
                contacts[0].Birthdate => new Map<String, List<String>>{ IterTestUtils.CONSTS.HR => new List<String>{ (String) contacts[0].get(IterTestUtils.CONSTS.LAST_NAME) }, IterTestUtils.CONSTS.FINANCE => new List<String>{ (String) contacts[2].get(IterTestUtils.CONSTS.LAST_NAME) } },
                contacts[1].Birthdate => new Map<String, List<String>>{ IterTestUtils.CONSTS.HR => new List<String>{ (String) contacts[1].get(IterTestUtils.CONSTS.LAST_NAME) }, IterTestUtils.CONSTS.FINANCE => new List<String>{ (String) contacts[3].get(IterTestUtils.CONSTS.LAST_NAME) } },
                null => new Map<String, List<String>>{ null => new List<String>{ (String) contacts[4].get(IterTestUtils.CONSTS.LAST_NAME) } }
        };
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(expected2, actual8);
    }

    /**
     * @see SObjectCollector.groupingByDatetime
     */
    @IsTest
    static void groupingByDatetime() {
        // Given
        events[0].ActivityDateTime = events[0].ActivityDateTime;
        events[1].ActivityDateTime = events[1].ActivityDateTime;
        events[2].ActivityDateTime = events[0].ActivityDateTime;
        events[3].ActivityDateTime = events[1].ActivityDateTime;
        events[4].ActivityDateTime = null;
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Event.ActivityDateTime);
        SObjectCollector downstream = SObjectCollector.toList(IterTestUtils.CONSTS.Event.Description);
        // When
        Map<Datetime, List<Event>> actual = (Map<Datetime,  List<Event>>) Stream.of(events).collect(SObjectCollector.groupingByDatetime(IterTestUtils.CONSTS.Event.ActivityDateTime));
        Map<Datetime, List<Event>> actual1 = (Map<Datetime, List<Event>>) Stream.of(events).collect(SObjectCollector.groupingByDatetime(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME));
        Map<Datetime, List<SObject>> actual2 = (Map<Datetime, List<SObject>>) Stream.of(events).collect(SObjectCollector.groupingByDatetime(keyMapper).cast(Map<Datetime, List<SObject>>.class));
        Map<Datetime, List<String>> actual3 = (Map<Datetime, List<String>>) Stream.of(events).collect(SObjectCollector.groupingByDatetime(IterTestUtils.CONSTS.Event.ActivityDateTime, IterTestUtils.CONSTS.Event.Description).cast(Map<Datetime, List<String>>.class));
        Map<Datetime, Object> actual4 = (Map<Datetime, Object>) Stream.of(events).collect(SObjectCollector.groupingByDatetime(IterTestUtils.CONSTS.ACTIVITY_DATE_TIME, IterTestUtils.CONSTS.DESCRIPTION));
        Map<Datetime, Object> actual5 = (Map<Datetime, Object>) Stream.of(events).collect(SObjectCollector.groupingByDatetime(keyMapper, downstream));
        Map<Datetime, List<String>> actual6 = (Map<Datetime, List<String>>) Stream.of(events).collect(SObjectCollector.groupingByDatetime(keyMapper, Supplier.of(Map<Datetime, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Datetime, Map<String, List<String>>> actual7 = (Map<Datetime, Map<String, List<String>>>) Stream.of(events)
                .collect(SObjectCollector.groupingByDatetime(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.Event.Type, IterTestUtils.CONSTS.Event.Description)).cast(Map<Datetime, Map<String, List<String>>>.class));
        Map<Datetime, Object> actual8 = (Map<Datetime, Object>) Stream.of(events).collect(SObjectCollector.groupingByDatetime(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.TYPE, IterTestUtils.CONSTS.DESCRIPTION)));
        // Then
        Map<Datetime, List<Event>> expected = new Map<Datetime, List<Event>>{
                events[0].ActivityDateTime => new List<Event>{ events[0], events[2] },
                events[1].ActivityDateTime => new List<Event>{ events[1], events[3] },
                null => new List<Event>{ events[4] }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Map<Datetime, List<String>> expected1 = new Map<Datetime, List<String>>{
                events[0].ActivityDateTime => new List<String>{ (String) events[0].get(IterTestUtils.CONSTS.DESCRIPTION), (String) events[2].get(IterTestUtils.CONSTS.DESCRIPTION) },
                events[1].ActivityDateTime => new List<String>{ (String) events[1].get(IterTestUtils.CONSTS.DESCRIPTION), (String) events[3].get(IterTestUtils.CONSTS.DESCRIPTION) },
                null => new List<String>{ (String) events[4].get(IterTestUtils.CONSTS.DESCRIPTION) }
        };
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Map<Datetime, Map<String, List<String>>> expected2 = new Map<Datetime, Map<String, List<String>>>{
                events[0].ActivityDateTime => new Map<String, List<String>>{ IterTestUtils.CONSTS.CALL => new List<String>{ (String) events[0].get(IterTestUtils.CONSTS.DESCRIPTION) }, IterTestUtils.CONSTS.EMAIL => new List<String>{ (String) events[2].get(IterTestUtils.CONSTS.DESCRIPTION) } },
                events[1].ActivityDateTime => new Map<String, List<String>>{ IterTestUtils.CONSTS.CALL => new List<String>{ (String) events[1].get(IterTestUtils.CONSTS.DESCRIPTION) }, IterTestUtils.CONSTS.EMAIL => new List<String>{ (String) events[3].get(IterTestUtils.CONSTS.DESCRIPTION) } },
                null => new Map<String, List<String>>{ null => new List<String>{ (String) events[4].get(IterTestUtils.CONSTS.DESCRIPTION) } }
        };
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(expected2, actual8);
    }

    /**
     * @see SObjectCollector.groupingByTime
     */
    @IsTest
    static void groupingByTime() {
        // Given
        slots[0].StartTime = slots[0].StartTime;
        slots[1].StartTime = slots[1].StartTime;
        slots[2].StartTime = slots[0].StartTime;
        slots[3].StartTime = slots[1].StartTime;
        slots[4].StartTime = null;
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.TimeSlot.StartTime);
        SObjectCollector downstream = SObjectCollector.toList(IterTestUtils.CONSTS.TimeSlot.Id);
        // When
        Map<Time, List<TimeSlot>> actual = (Map<Time,  List<TimeSlot>>) Stream.of(slots).collect(SObjectCollector.groupingByTime(IterTestUtils.CONSTS.TimeSlot.StartTime));
        Map<Time, List<TimeSlot>> actual1 = (Map<Time, List<TimeSlot>>) Stream.of(slots).collect(SObjectCollector.groupingByTime(IterTestUtils.CONSTS.START_TIME));
        Map<Time, List<SObject>> actual2 = (Map<Time, List<SObject>>) Stream.of(slots).collect(SObjectCollector.groupingByTime(keyMapper).cast(Map<Time, List<SObject>>.class));
        Map<Time, List<Id>> actual3 = (Map<Time, List<Id>>) Stream.of(slots).collect(SObjectCollector.groupingByTime(IterTestUtils.CONSTS.TimeSlot.StartTime, IterTestUtils.CONSTS.TimeSlot.Id).cast(Map<Time, List<Id>>.class));
        Map<Time, Object> actual4 = (Map<Time, Object>) Stream.of(slots).collect(SObjectCollector.groupingByTime(IterTestUtils.CONSTS.START_TIME, IterTestUtils.CONSTS.ID));
        Map<Time, Object> actual5 = (Map<Time, Object>) Stream.of(slots).collect(SObjectCollector.groupingByTime(keyMapper, downstream));
        Map<Time, List<Id>> actual6 = (Map<Time, List<Id>>) Stream.of(slots).collect(SObjectCollector.groupingByTime(keyMapper, Supplier.of(Map<Time, List<Id>>.class), downstream.cast(List<Id>.class)));
        Map<Time, Map<String, List<Id>>> actual7 = (Map<Time, Map<String, List<Id>>>) Stream.of(slots)
                .collect(SObjectCollector.groupingByTime(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.TimeSlot.Type, IterTestUtils.CONSTS.TimeSlot.Id)).cast(Map<Time, Map<String, List<Id>>>.class));
        Map<Time, Object> actual8 = (Map<Time, Object>) Stream.of(slots).collect(SObjectCollector.groupingByTime(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.TYPE, IterTestUtils.CONSTS.ID)));
        // Then
        Map<Time, List<TimeSlot>> expected = new Map<Time, List<TimeSlot>>{
                slots[0].StartTime => new List<TimeSlot>{ slots[0], slots[2] },
                slots[1].StartTime => new List<TimeSlot>{ slots[1], slots[3] },
                null => new List<TimeSlot>{ slots[4] }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Map<Time, List<Id>> expected1 = new Map<Time, List<Id>>{
                slots[0].StartTime => new List<Id>{ (Id) slots[0].get(IterTestUtils.CONSTS.ID), (Id) slots[2].get(IterTestUtils.CONSTS.ID) },
                slots[1].StartTime => new List<Id>{ (Id) slots[1].get(IterTestUtils.CONSTS.ID), (Id) slots[3].get(IterTestUtils.CONSTS.ID) },
                null => new List<Id>{ (Id) slots[4].get(IterTestUtils.CONSTS.ID) }
        };
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Map<Time, Map<String, List<Id>>> expected2 = new Map<Time, Map<String, List<Id>>>{
                slots[0].StartTime => new Map<String, List<Id>>{ IterTestUtils.CONSTS.NORMAL => new List<Id>{ (Id) slots[0].get(IterTestUtils.CONSTS.ID) }, IterTestUtils.CONSTS.EXTENDED => new List<Id>{ (Id) slots[2].get(IterTestUtils.CONSTS.ID) } },
                slots[1].StartTime => new Map<String, List<Id>>{ IterTestUtils.CONSTS.NORMAL => new List<Id>{ (Id) slots[1].get(IterTestUtils.CONSTS.ID) }, IterTestUtils.CONSTS.EXTENDED => new List<Id>{ (Id) slots[3].get(IterTestUtils.CONSTS.ID) } },
                null => new Map<String, List<Id>>{ null => new List<Id>{ (Id) slots[4].get(IterTestUtils.CONSTS.ID) } }
        };
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(expected2, actual8);
    }

    /**
     * @see SObjectCollector.groupingByInt
     */
    @IsTest
    static void groupingByInt() {
        // Given
        accounts[0].NumberOfEmployees = accounts[0].NumberOfEmployees;
        accounts[1].NumberOfEmployees = accounts[1].NumberOfEmployees;
        accounts[2].NumberOfEmployees = accounts[0].NumberOfEmployees;
        accounts[3].NumberOfEmployees = accounts[1].NumberOfEmployees;
        accounts[4].NumberOfEmployees = null;
        accounts.remove(9);
        accounts.remove(8);
        accounts.remove(7);
        accounts.remove(6);
        accounts.remove(5);
        ISObjectToIntFunction keyMapper = SObjectToIntFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        SObjectCollector downstream = SObjectCollector.toList(IterTestUtils.CONSTS.Account.Name);
        // When
        Map<Integer, List<Account>> actual = (Map<Integer,  List<Account>>) Stream.of(accounts).collect(SObjectCollector.groupingByInt(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        Map<Integer, List<Account>> actual1 = (Map<Integer, List<Account>>) Stream.of(accounts).collect(SObjectCollector.groupingByInt(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        Map<Integer, List<SObject>> actual2 = (Map<Integer, List<SObject>>) Stream.of(accounts).collect(SObjectCollector.groupingByInt(keyMapper).cast(Map<Integer, List<SObject>>.class));
        Map<Integer, List<String>> actual3 = (Map<Integer, List<String>>) Stream.of(accounts).collect(SObjectCollector.groupingByInt(IterTestUtils.CONSTS.Account.NumberOfEmployees, IterTestUtils.CONSTS.Account.Name).cast(Map<Integer, List<String>>.class));
        Map<Integer, Object> actual4 = (Map<Integer, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByInt(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES, IterTestUtils.CONSTS.NAME));
        Map<Integer, Object> actual5 = (Map<Integer, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByInt(keyMapper, downstream));
        Map<Integer, List<String>> actual6 = (Map<Integer, List<String>>) Stream.of(accounts).collect(SObjectCollector.groupingByInt(keyMapper, Supplier.of(Map<Integer, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Integer, Map<String, List<String>>> actual7 = (Map<Integer, Map<String, List<String>>>) Stream.of(accounts)
                .collect(SObjectCollector.groupingByInt(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.Account.Type, IterTestUtils.CONSTS.Account.Name)).cast(Map<Integer, Map<String, List<String>>>.class));
        Map<Integer, Object> actual8 = (Map<Integer, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByInt(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.TYPE, IterTestUtils.CONSTS.NAME)));
        // Then
        Map<Integer, List<Account>> expected = new Map<Integer, List<Account>>{
                accounts[0].NumberOfEmployees => new List<Account>{ accounts[0], accounts[2] },
                accounts[1].NumberOfEmployees => new List<Account>{ accounts[1], accounts[3] },
                null => new List<Account>{ accounts[4] }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Map<Integer, List<String>> expected1 = new Map<Integer, List<String>>{
                accounts[0].NumberOfEmployees => new List<String>{ (String) accounts[0].get(IterTestUtils.CONSTS.NAME), (String) accounts[2].get(IterTestUtils.CONSTS.NAME) },
                accounts[1].NumberOfEmployees => new List<String>{ (String) accounts[1].get(IterTestUtils.CONSTS.NAME), (String) accounts[3].get(IterTestUtils.CONSTS.NAME) },
                null => new List<String>{ (String) accounts[4].get(IterTestUtils.CONSTS.NAME) }
        };
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Map<Integer, Map<String, List<String>>> expected2 = new Map<Integer, Map<String, List<String>>>{
                accounts[0].NumberOfEmployees => new Map<String, List<String>>{ IterTestUtils.CONSTS.CUSTOMER => new List<String>{ (String) accounts[0].get(IterTestUtils.CONSTS.NAME) }, IterTestUtils.CONSTS.PARTNER => new List<String>{ (String) accounts[2].get(IterTestUtils.CONSTS.NAME) } },
                accounts[1].NumberOfEmployees => new Map<String, List<String>>{ IterTestUtils.CONSTS.CUSTOMER => new List<String>{ (String) accounts[1].get(IterTestUtils.CONSTS.NAME) }, IterTestUtils.CONSTS.PARTNER => new List<String>{ (String) accounts[3].get(IterTestUtils.CONSTS.NAME) } },
                null => new Map<String, List<String>>{ null => new List<String>{ (String) accounts[4].get(IterTestUtils.CONSTS.NAME) } }
        };
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(expected2, actual8);
    }

    /**
     * @see SObjectCollector.groupingByLong
     */
    @IsTest
    static void groupingByLong() {
        // Given
        accounts[0].NumberOfEmployees = accounts[0].NumberOfEmployees;
        accounts[1].NumberOfEmployees = accounts[1].NumberOfEmployees;
        accounts[2].NumberOfEmployees = accounts[0].NumberOfEmployees;
        accounts[3].NumberOfEmployees = accounts[1].NumberOfEmployees;
        accounts[4].NumberOfEmployees = null;
        accounts.remove(9);
        accounts.remove(8);
        accounts.remove(7);
        accounts.remove(6);
        accounts.remove(5);
        ISObjectToLongFunction keyMapper = SObjectToLongFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        SObjectCollector downstream = SObjectCollector.toList(IterTestUtils.CONSTS.Account.Name);
        // When
        Map<Long, List<Account>> actual = (Map<Long,  List<Account>>) Stream.of(accounts).collect(SObjectCollector.groupingByLong(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        Map<Long, List<Account>> actual1 = (Map<Long, List<Account>>) Stream.of(accounts).collect(SObjectCollector.groupingByLong(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        Map<Long, List<SObject>> actual2 = (Map<Long, List<SObject>>) Stream.of(accounts).collect(SObjectCollector.groupingByLong(keyMapper).cast(Map<Long, List<SObject>>.class));
        Map<Long, List<String>> actual3 = (Map<Long, List<String>>) Stream.of(accounts).collect(SObjectCollector.groupingByLong(IterTestUtils.CONSTS.Account.NumberOfEmployees, IterTestUtils.CONSTS.Account.Name).cast(Map<Long, List<String>>.class));
        Map<Long, Object> actual4 = (Map<Long, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByLong(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES, IterTestUtils.CONSTS.NAME));
        Map<Long, Object> actual5 = (Map<Long, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByLong(keyMapper, downstream));
        Map<Long, List<String>> actual6 = (Map<Long, List<String>>) Stream.of(accounts).collect(SObjectCollector.groupingByLong(keyMapper, Supplier.of(Map<Long, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Long, Map<String, List<String>>> actual7 = (Map<Long, Map<String, List<String>>>) Stream.of(accounts)
                .collect(SObjectCollector.groupingByLong(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.Account.Type, IterTestUtils.CONSTS.Account.Name)).cast(Map<Long, Map<String, List<String>>>.class));
        Map<Long, Object> actual8 = (Map<Long, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByLong(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.TYPE, IterTestUtils.CONSTS.NAME)));
        // Then
        Map<Long, List<Account>> expected = new Map<Long, List<Account>>{
                accounts[0].NumberOfEmployees => new List<Account>{ accounts[0], accounts[2] },
                accounts[1].NumberOfEmployees => new List<Account>{ accounts[1], accounts[3] },
                null => new List<Account>{ accounts[4] }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Map<Long, List<String>> expected1 = new Map<Long, List<String>>{
                accounts[0].NumberOfEmployees => new List<String>{ (String) accounts[0].get(IterTestUtils.CONSTS.NAME), (String) accounts[2].get(IterTestUtils.CONSTS.NAME) },
                accounts[1].NumberOfEmployees => new List<String>{ (String) accounts[1].get(IterTestUtils.CONSTS.NAME), (String) accounts[3].get(IterTestUtils.CONSTS.NAME) },
                null => new List<String>{ (String) accounts[4].get(IterTestUtils.CONSTS.NAME) }
        };
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Map<Long, Map<String, List<String>>> expected2 = new Map<Long, Map<String, List<String>>>{
                accounts[0].NumberOfEmployees => new Map<String, List<String>>{ IterTestUtils.CONSTS.CUSTOMER => new List<String>{ (String) accounts[0].get(IterTestUtils.CONSTS.NAME) }, IterTestUtils.CONSTS.PARTNER => new List<String>{ (String) accounts[2].get(IterTestUtils.CONSTS.NAME) } },
                accounts[1].NumberOfEmployees => new Map<String, List<String>>{ IterTestUtils.CONSTS.CUSTOMER => new List<String>{ (String) accounts[1].get(IterTestUtils.CONSTS.NAME) }, IterTestUtils.CONSTS.PARTNER => new List<String>{ (String) accounts[3].get(IterTestUtils.CONSTS.NAME) } },
                null => new Map<String, List<String>>{ null => new List<String>{ (String) accounts[4].get(IterTestUtils.CONSTS.NAME) } }
        };
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(expected2, actual8);
    }

    /**
     * @see SObjectCollector.groupingByDouble
     */
    @IsTest
    static void groupingByDouble() {
        // Given
        accounts[0].BillingLatitude = accounts[0].BillingLatitude;
        accounts[1].BillingLatitude = accounts[1].BillingLatitude;
        accounts[2].BillingLatitude = accounts[0].BillingLatitude;
        accounts[3].BillingLatitude = accounts[1].BillingLatitude;
        accounts[4].BillingLatitude = null;
        accounts.remove(9);
        accounts.remove(8);
        accounts.remove(7);
        accounts.remove(6);
        accounts.remove(5);
        ISObjectToDoubleFunction keyMapper = SObjectToDoubleFunction.get(IterTestUtils.CONSTS.Account.BillingLatitude);
        SObjectCollector downstream = SObjectCollector.toList(IterTestUtils.CONSTS.Account.Name);
        // When
        Map<Double, List<Account>> actual = (Map<Double,  List<Account>>) Stream.of(accounts).collect(SObjectCollector.groupingByDouble(IterTestUtils.CONSTS.Account.BillingLatitude));
        Map<Double, List<Account>> actual1 = (Map<Double, List<Account>>) Stream.of(accounts).collect(SObjectCollector.groupingByDouble(IterTestUtils.CONSTS.BILLING_LATITUDE));
        Map<Double, List<SObject>> actual2 = (Map<Double, List<SObject>>) Stream.of(accounts).collect(SObjectCollector.groupingByDouble(keyMapper).cast(Map<Double, List<SObject>>.class));
        Map<Double, List<String>> actual3 = (Map<Double, List<String>>) Stream.of(accounts).collect(SObjectCollector.groupingByDouble(IterTestUtils.CONSTS.Account.BillingLatitude, IterTestUtils.CONSTS.Account.Name).cast(Map<Double, List<String>>.class));
        Map<Double, Object> actual4 = (Map<Double, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByDouble(IterTestUtils.CONSTS.BILLING_LATITUDE, IterTestUtils.CONSTS.NAME));
        Map<Double, Object> actual5 = (Map<Double, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByDouble(keyMapper, downstream));
        Map<Double, List<String>> actual6 = (Map<Double, List<String>>) Stream.of(accounts).collect(SObjectCollector.groupingByDouble(keyMapper, Supplier.of(Map<Double, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Double, Map<String, List<String>>> actual7 = (Map<Double, Map<String, List<String>>>) Stream.of(accounts)
                .collect(SObjectCollector.groupingByDouble(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.Account.BillingCountry, IterTestUtils.CONSTS.Account.Name)).cast(Map<Double, Map<String, List<String>>>.class));
        Map<Double, Object> actual8 = (Map<Double, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByDouble(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.BILLING_COUNTRY, IterTestUtils.CONSTS.NAME)));
        // Then
        Map<Double, List<Account>> expected = new Map<Double, List<Account>>{
                accounts[0].BillingLatitude => new List<Account>{ accounts[0], accounts[2] },
                accounts[1].BillingLatitude => new List<Account>{ accounts[1], accounts[3] },
                null => new List<Account>{ accounts[4] }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Map<Double, List<String>> expected1 = new Map<Double, List<String>>{
                accounts[0].BillingLatitude => new List<String>{ (String) accounts[0].get(IterTestUtils.CONSTS.NAME), (String) accounts[2].get(IterTestUtils.CONSTS.NAME) },
                accounts[1].BillingLatitude => new List<String>{ (String) accounts[1].get(IterTestUtils.CONSTS.NAME), (String) accounts[3].get(IterTestUtils.CONSTS.NAME) },
                null => new List<String>{ (String) accounts[4].get(IterTestUtils.CONSTS.NAME) }
        };
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Map<Double, Map<String, List<String>>> expected2 = new Map<Double, Map<String, List<String>>>{
                accounts[0].BillingLatitude => new Map<String, List<String>>{ IterTestUtils.CONSTS.FRANCE => new List<String>{ (String) accounts[0].get(IterTestUtils.CONSTS.NAME) }, IterTestUtils.CONSTS.UK => new List<String>{ (String) accounts[2].get(IterTestUtils.CONSTS.NAME) } },
                accounts[1].BillingLatitude => new Map<String, List<String>>{ IterTestUtils.CONSTS.FRANCE => new List<String>{ (String) accounts[1].get(IterTestUtils.CONSTS.NAME) }, IterTestUtils.CONSTS.UK => new List<String>{ (String) accounts[3].get(IterTestUtils.CONSTS.NAME) } },
                null => new Map<String, List<String>>{ null => new List<String>{ (String) accounts[4].get(IterTestUtils.CONSTS.NAME) } }
        };
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(expected2, actual8);
    }

    /**
     * @see SObjectCollector.groupingBy
     */
    @IsTest
    static void groupingBy() {
        // Given
        accounts[0].BillingLatitude = accounts[0].BillingLatitude;
        accounts[1].BillingLatitude = accounts[1].BillingLatitude;
        accounts[2].BillingLatitude = accounts[0].BillingLatitude;
        accounts[3].BillingLatitude = accounts[1].BillingLatitude;
        accounts[4].BillingLatitude = null;
        accounts.remove(9);
        accounts.remove(8);
        accounts.remove(7);
        accounts.remove(6);
        accounts.remove(5);
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Account.BillingLatitude);
        SObjectCollector downstream = SObjectCollector.toList(IterTestUtils.CONSTS.Account.Name);
        // When
        Map<Object, List<Account>> actual = (Map<Object,  List<Account>>) Stream.of(accounts).collect(SObjectCollector.groupingBy(IterTestUtils.CONSTS.Account.BillingLatitude));
        Map<Object, List<Account>> actual1 = (Map<Object, List<Account>>) Stream.of(accounts).collect(SObjectCollector.groupingBy(IterTestUtils.CONSTS.BILLING_LATITUDE));
        Map<Object, List<SObject>> actual2 = (Map<Object, List<SObject>>) Stream.of(accounts).collect(SObjectCollector.groupingBy(keyMapper).cast(Map<Object, List<SObject>>.class));
        Map<Object, List<String>> actual3 = (Map<Object, List<String>>) Stream.of(accounts).collect(SObjectCollector.groupingBy(IterTestUtils.CONSTS.Account.BillingLatitude, IterTestUtils.CONSTS.Account.Name).cast(Map<Object, List<String>>.class));
        Map<Object, Object> actual4 = (Map<Object, Object>) Stream.of(accounts).collect(SObjectCollector.groupingBy(IterTestUtils.CONSTS.BILLING_LATITUDE, IterTestUtils.CONSTS.NAME));
        Map<Object, Object> actual5 = (Map<Object, Object>) Stream.of(accounts).collect(SObjectCollector.groupingBy(keyMapper, downstream));
        Map<Object, List<String>> actual6 = (Map<Object, List<String>>) Stream.of(accounts).collect(SObjectCollector.groupingBy(keyMapper, Supplier.of(Map<Object, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Object, Map<String, List<String>>> actual7 = (Map<Object, Map<String, List<String>>>) Stream.of(accounts)
                .collect(SObjectCollector.groupingBy(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.Account.BillingCountry, IterTestUtils.CONSTS.Account.Name)).cast(Map<Object, Map<String, List<String>>>.class));
        Map<Object, Object> actual8 = (Map<Object, Object>) Stream.of(accounts).collect(SObjectCollector.groupingBy(keyMapper, SObjectCollector.groupingByString(IterTestUtils.CONSTS.BILLING_COUNTRY, IterTestUtils.CONSTS.NAME)));
        // Then
        Map<Object, List<Account>> expected = new Map<Object, List<Account>>{
                accounts[0].BillingLatitude => new List<Account>{ accounts[0], accounts[2] },
                accounts[1].BillingLatitude => new List<Account>{ accounts[1], accounts[3] },
                null => new List<Account>{ accounts[4] }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Map<Object, List<String>> expected1 = new Map<Object, List<String>>{
                accounts[0].BillingLatitude => new List<String>{ (String) accounts[0].get(IterTestUtils.CONSTS.NAME), (String) accounts[2].get(IterTestUtils.CONSTS.NAME) },
                accounts[1].BillingLatitude => new List<String>{ (String) accounts[1].get(IterTestUtils.CONSTS.NAME), (String) accounts[3].get(IterTestUtils.CONSTS.NAME) },
                null => new List<String>{ (String) accounts[4].get(IterTestUtils.CONSTS.NAME) }
        };
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Map<Object, Map<String, List<String>>> expected2 = new Map<Object, Map<String, List<String>>>{
                accounts[0].BillingLatitude => new Map<String, List<String>>{ IterTestUtils.CONSTS.FRANCE => new List<String>{ (String) accounts[0].get(IterTestUtils.CONSTS.NAME) }, IterTestUtils.CONSTS.UK => new List<String>{ (String) accounts[2].get(IterTestUtils.CONSTS.NAME) } },
                accounts[1].BillingLatitude => new Map<String, List<String>>{ IterTestUtils.CONSTS.FRANCE => new List<String>{ (String) accounts[1].get(IterTestUtils.CONSTS.NAME) }, IterTestUtils.CONSTS.UK => new List<String>{ (String) accounts[3].get(IterTestUtils.CONSTS.NAME) } },
                null => new Map<String, List<String>>{ null => new List<String>{ (String) accounts[4].get(IterTestUtils.CONSTS.NAME) } }
        };
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(expected2, actual8);
    }

    /**
     * @see SObjectCollector.partitioningBy
     */
    @IsTest
    static void partitioningBy() {
        // Given
        ISObjectPredicate predicate = SObjectPredicate.isEqual(IterTestUtils.CONSTS.Contact.OtherCountry, IterTestUtils.CONSTS.UK);
        SObjectCollector downstream = SObjectCollector.toList(IterTestUtils.CONSTS.Contact.LastName);
        // When
        Map<Boolean, List<SObject>> actual = (Map<Boolean, List<SObject>>) Stream.of(contacts).collect(SObjectCollector.partitioningBy(IterTestUtils.CONSTS.Contact.OtherCountry, IterTestUtils.CONSTS.UK));
        Map<Boolean, List<Contact>> actual1 = (Map<Boolean, List<Contact>>) Stream.of(contacts).collect(SObjectCollector.partitioningBy(IterTestUtils.CONSTS.OTHER_COUNTRY, IterTestUtils.CONSTS.UK).cast(Map<Boolean, List<Contact>>.class));
        Map<Boolean, List<Contact>> actual2 = (Map<Boolean, List<Contact>>) Stream.of(contacts).collect(SObjectCollector.partitioningBy(predicate).cast(Map<Boolean, List<Contact>>.class));
        Map<Boolean, List<String>> actual3 = (Map<Boolean, List<String>>) Stream.of(contacts).collect(SObjectCollector.partitioningBy(predicate, downstream).cast(Map<Boolean, List<String>>.class));
        Map<Boolean, Map<String, List<String>>> actual4 = (Map<Boolean, Map<String, List<String>>>) Stream.of(contacts)
                .collect(SObjectCollector.partitioningBy(predicate, SObjectCollector.groupingByString(IterTestUtils.CONSTS.Contact.OtherCity, IterTestUtils.CONSTS.Contact.LastName)).cast(Map<Boolean, Map<String, List<String>>>.class));
        Map<Boolean, Object> actual5 = (Map<Boolean, Object>) Stream.of(contacts).collect(SObjectCollector.partitioningBy(predicate, SObjectCollector.groupingByString(IterTestUtils.CONSTS.OTHER_CITY, IterTestUtils.CONSTS.LAST_NAME)));
        // Then
        Map<Boolean, List<SObject>> expected = new Map<Boolean, List<SObject>>{
                true => new List<Contact>{ contacts[2], contacts[3] },
                false => new List<Contact>{ contacts[0], contacts[1], contacts[4] }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Map<Boolean, List<String>> expected1 = new Map<Boolean, List<String>>{
                true => new List<String>{ (String) contacts[2].get(IterTestUtils.CONSTS.LAST_NAME), (String) contacts[3].get(IterTestUtils.CONSTS.LAST_NAME) },
                false => new List<String>{ (String) contacts[0].get(IterTestUtils.CONSTS.LAST_NAME), (String) contacts[1].get(IterTestUtils.CONSTS.LAST_NAME), (String) contacts[4].get(IterTestUtils.CONSTS.LAST_NAME) }
        };
        Validate.assertEquals(expected1, actual3);
        Map<Boolean, Map<String, List<String>>> expected2 = new Map<Boolean, Map<String, List<String>>>{
                true => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.LONDON => new List<String>{ (String) contacts[2].get(IterTestUtils.CONSTS.LAST_NAME) },
                        IterTestUtils.CONSTS.BRISTOL => new List<String>{ (String) contacts[3].get(IterTestUtils.CONSTS.LAST_NAME) }
                },
                false => new Map<String, List<String>>{
                        IterTestUtils.CONSTS.PARIS => new List<String>{ (String) contacts[0].get(IterTestUtils.CONSTS.LAST_NAME) },
                        IterTestUtils.CONSTS.LYON => new List<String>{ (String) contacts[1].get(IterTestUtils.CONSTS.LAST_NAME) },
                        null => new List<String>{ (String) contacts[4].get(IterTestUtils.CONSTS.LAST_NAME) }
                }
        };
        Validate.assertEquals(expected2, actual4);
        Validate.assertEquals(expected2, actual5);
    }

    /**
     * @see SObjectCollector.joining
     */
    @IsTest
    static void joining() {
        // Given
        String delimiter = ';';
        String prefix = 'prefix';
        String suffix = 'suffix';
        // When
        Object actual = Stream.of(contacts).collect(SObjectCollector.joining(IterTestUtils.CONSTS.LAST_NAME));
        Object actual1 = Stream.of(contacts).collect(SObjectCollector.joining(IterTestUtils.CONSTS.Contact.LastName));
        String actual2 = (String) Stream.of(contacts).collect(SObjectCollector.joining(IterTestUtils.CONSTS.Contact.LastName, delimiter));
        String actual3 = (String) Stream.of(contacts).collect(SObjectCollector.joining(IterTestUtils.CONSTS.Contact.LastName, delimiter, prefix, suffix));
        // Then
        String expected =
                          contacts[0].LastName
                        + contacts[1].LastName
                        + contacts[2].LastName
                        + contacts[3].LastName
                        + contacts[4].LastName;
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        String expected1 =
                                      contacts[0].LastName
                        + delimiter + contacts[1].LastName
                        + delimiter + contacts[2].LastName
                        + delimiter + contacts[3].LastName
                        + delimiter + contacts[4].LastName;
        Validate.assertEquals(expected1, actual2);
        String expected2 = prefix +
                                              contacts[0].LastName
                                + delimiter + contacts[1].LastName
                                + delimiter + contacts[2].LastName
                                + delimiter + contacts[3].LastName
                                + delimiter + contacts[4].LastName
                           + suffix;
        Validate.assertEquals(expected2, actual3);
    }

    /**
     * @see SObjectCollector.averagingInt
     * @see SObjectCollector.counting
     * @see SObjectCollector.summingInt
     */
    @IsTest
    static void intCollectors() {
        // Given
        accounts.remove(4); // To prevent NPE
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Account.Type);
        ISObjectToIntFunction mapper = SObjectToIntFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        // When
        Integer actual = (Integer) Stream.of(accounts).collect(SObjectCollector.counting());
        Double actual1 = (Double) Stream.of(accounts).collect(SObjectCollector.averagingInt(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        Double actual2 = (Double) Stream.of(accounts).collect(SObjectCollector.averagingInt(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        Double actual3 = (Double) Stream.of(accounts).collect(SObjectCollector.averagingInt(mapper));
        Integer actual4 = (Integer) Stream.of(accounts).collect(SObjectCollector.summingInt(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        Integer actual5 = (Integer) Stream.of(accounts).collect(SObjectCollector.summingInt(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        Integer actual6 = (Integer) Stream.of(accounts).collect(SObjectCollector.summingInt(mapper));
        Map<String, Object> actual7 = (Map<String, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByString(keyMapper, SObjectCollector.summingInt(mapper)));
        // Then
        Validate.assertEquals(actual, accounts.size());
        Integer sum = (
                accounts[0].NumberOfEmployees
                        + accounts[1].NumberOfEmployees
                        + accounts[2].NumberOfEmployees
                        + accounts[3].NumberOfEmployees
                        + accounts[4].NumberOfEmployees
                        + accounts[5].NumberOfEmployees
                        + accounts[6].NumberOfEmployees
                        + accounts[7].NumberOfEmployees
                        + accounts[8].NumberOfEmployees
        );
        Double expected = (sum) / ((Double) accounts.size());
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Double expected1 = sum;
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Map<String, Integer> expected2 = new Map<String, Integer>{
                IterTestUtils.CONSTS.CUSTOMER => accounts[0].NumberOfEmployees + accounts[1].NumberOfEmployees,
                IterTestUtils.CONSTS.PARTNER => accounts[2].NumberOfEmployees + accounts[3].NumberOfEmployees + accounts[4].NumberOfEmployees,
                IterTestUtils.CONSTS.COMPETITOR => accounts[5].NumberOfEmployees + accounts[6].NumberOfEmployees + accounts[7].NumberOfEmployees,
                null => accounts[8].NumberOfEmployees
        };
        Validate.assertEquals(expected2, actual7);
    }

    /**
     * @see SObjectCollector.averagingLong
     * @see SObjectCollector.summingLong
     */
    @IsTest
    static void longCollectors() {
        // Given
        accounts.remove(4); // To prevent NPE
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Account.Type);
        ISObjectToLongFunction mapper = SObjectToLongFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        // When
        Double actual = (Double) Stream.of(accounts).collect(SObjectCollector.averagingLong(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        Double actual1 = (Double) Stream.of(accounts).collect(SObjectCollector.averagingLong(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        Double actual2 = (Double) Stream.of(accounts).collect(SObjectCollector.averagingLong(mapper));
        Long actual3 = (Long) Stream.of(accounts).collect(SObjectCollector.summingLong(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        Long actual4 = (Long) Stream.of(accounts).collect(SObjectCollector.summingLong(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        Long actual5 = (Long) Stream.of(accounts).collect(SObjectCollector.summingLong(mapper));
        Map<String, Object> actual6 = (Map<String, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByString(keyMapper, SObjectCollector.summingLong(mapper)));
        // Then
        Long sum = (
                accounts[0].NumberOfEmployees
                        + accounts[1].NumberOfEmployees
                        + accounts[2].NumberOfEmployees
                        + accounts[3].NumberOfEmployees
                        + accounts[4].NumberOfEmployees
                        + accounts[5].NumberOfEmployees
                        + accounts[6].NumberOfEmployees
                        + accounts[7].NumberOfEmployees
                        + accounts[8].NumberOfEmployees
        );
        Double expected = (sum) / ((Double) accounts.size());
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Double expected1 = sum;
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Map<String, Long> expected2 = new Map<String, Long>{
                IterTestUtils.CONSTS.CUSTOMER => accounts[0].NumberOfEmployees + accounts[1].NumberOfEmployees,
                IterTestUtils.CONSTS.PARTNER => accounts[2].NumberOfEmployees + accounts[3].NumberOfEmployees + accounts[4].NumberOfEmployees,
                IterTestUtils.CONSTS.COMPETITOR => accounts[5].NumberOfEmployees + accounts[6].NumberOfEmployees + accounts[7].NumberOfEmployees,
                null => accounts[8].NumberOfEmployees
        };
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.averagingDouble
     * @see SObjectCollector.summingDouble
     */
    @IsTest
    static void doubleCollectors() {
        // Given
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Account.Type);
        ISObjectToDoubleFunction mapper = SObjectToDoubleFunction.get(IterTestUtils.CONSTS.Account.BillingLatitude);
        // When
        Double actual = (Double) Stream.of(accounts).collect(SObjectCollector.averagingDouble(IterTestUtils.CONSTS.BILLING_LATITUDE));
        Double actual1 = (Double) Stream.of(accounts).collect(SObjectCollector.averagingDouble(IterTestUtils.CONSTS.Account.BillingLatitude));
        Double actual2 = (Double) Stream.of(accounts).collect(SObjectCollector.averagingDouble(mapper));
        Double actual3 = (Double) Stream.of(accounts).collect(SObjectCollector.summingDouble(IterTestUtils.CONSTS.BILLING_LATITUDE));
        Double actual4 = (Double) Stream.of(accounts).collect(SObjectCollector.summingDouble(IterTestUtils.CONSTS.Account.BillingLatitude));
        Double actual5 = (Double) Stream.of(accounts).collect(SObjectCollector.summingDouble(mapper));
        Map<String, Object> actual6 = (Map<String, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByString(keyMapper, SObjectCollector.summingDouble(mapper)));
        // Then
        Double sum = (
                accounts[0].BillingLatitude
                        + accounts[1].BillingLatitude
                        + accounts[2].BillingLatitude
                        + accounts[3].BillingLatitude
                        + accounts[4].BillingLatitude
                        + accounts[5].BillingLatitude
                        + accounts[6].BillingLatitude
                        + accounts[7].BillingLatitude
                        + accounts[8].BillingLatitude
                        + accounts[9].BillingLatitude
        );
        Double expected = (sum) / ((Double) accounts.size());
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Double expected1 = sum;
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Map<String, Double> expected2 = new Map<String, Double>{
                IterTestUtils.CONSTS.CUSTOMER => accounts[0].BillingLatitude + accounts[1].BillingLatitude,
                IterTestUtils.CONSTS.PARTNER => accounts[2].BillingLatitude + accounts[3].BillingLatitude + accounts[5].BillingLatitude,
                IterTestUtils.CONSTS.COMPETITOR => accounts[6].BillingLatitude + accounts[7].BillingLatitude + accounts[8].BillingLatitude,
                null => accounts[4].BillingLatitude + accounts[9].BillingLatitude
        };
        Validate.assertEquals(expected2, actual6);
    }

    /**
     * @see SObjectCollector.filtering
     */
    @IsTest
    static void filtering() {
        // Given
        Integer value = 100;
        ISObjectPredicate predicate = SObjectPredicate.isGreater(IterTestUtils.CONSTS.Account.NumberOfEmployees, value);
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Account.Type);
        // When
        List<Account> actual = (List<Account>) Stream.of(accounts).collect(SObjectCollector.filtering(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES, value));
        List<Account> actual1 = (List<Account>) Stream.of(accounts).collect(SObjectCollector.filtering(IterTestUtils.CONSTS.Account.NumberOfEmployees, value));
        List<Account> actual2 = (List<Account>) Stream.of(accounts).collect(SObjectCollector.filtering(predicate));
        Set<SObject> actual3 = (Set<SObject>) Stream.of(accounts).collect(SObjectCollector.filtering(predicate, SObjectCollector.toSet()));
        Map<String, List<Account>> actual4 = (Map<String, List<Account>>) Stream.of(accounts).collect(SObjectCollector.groupingByString(keyMapper, SObjectCollector.filtering(predicate)).cast(Map<String, List<Account>>.class));
        // Then
        List<Account> expected = new List<Account>{ accounts[2] };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        List<Account> expected1 = new List<Account>{ accounts[0], accounts[1], accounts[5], accounts[7], accounts[8], accounts[9] };
        Validate.assertEquals(expected1, actual2);
        Set<SObject> expected2 = new Set<SObject>{ accounts[0], accounts[1], accounts[5], accounts[7], accounts[8], accounts[9] };
        Validate.assertEquals(expected2, actual3);
        Map<String, List<Account>> expected3 = new Map<String, List<Account>>{
                IterTestUtils.CONSTS.CUSTOMER => new List<Account>{ accounts[0], accounts[1] },
                IterTestUtils.CONSTS.PARTNER => new List<Account>{ accounts[5] },
                IterTestUtils.CONSTS.COMPETITOR => new List<Account>{ accounts[7], accounts[8] },
                null => new List<Account>{ accounts[9] }
        };
        Validate.assertEquals(expected3, actual4);
    }

    /**
     * @see SObjectCollector.mapping
     */
    @IsTest
    static void mapping() {
        // Given
        ISObjectFunction mapper = SObjectFunction.get(IterTestUtils.CONSTS.ID);
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Account.Type);
        // When
        List<Object> actual = (List<Object>) Stream.of(accounts).collect(SObjectCollector.mapping(mapper));
        List<Id> actual1 = (List<Id>) Stream.of(accounts).collect(SObjectCollector.mapping(mapper).cast(List<Id>.class));
        List<Id> actual2 = (List<Id>) Stream.of(accounts).collect(SObjectCollector.mapping(IterTestUtils.CONSTS.ID).cast(List<Id>.class));
        List<Id> actual3 = (List<Id>) Stream.of(accounts).collect(SObjectCollector.mapping(IterTestUtils.CONSTS.Account.Id).cast(List<Id>.class));
        Set<Id> actual4 = (Set<Id>) Stream.of(accounts).collect(SObjectCollector.mapping(mapper, Collector.toIdSet()));
        Map<String, List<Id>> actual5 = (Map<String, List<Id>>) Stream.of(accounts)
                .collect(SObjectCollector.groupingByString(keyMapper, SObjectCollector.mapping(mapper)).cast(Map<String, List<Id>>.class));
        // Then
        List<Id> expected = new List<Id>{
                accounts[0].Id,
                accounts[1].Id,
                accounts[2].Id,
                accounts[3].Id,
                accounts[4].Id,
                accounts[5].Id,
                accounts[6].Id,
                accounts[7].Id,
                accounts[8].Id,
                accounts[9].Id
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Set<Id> expected1 = new Set<Id>(expected);
        Validate.assertEquals(expected1, actual4);
        Map<String, List<Id>> expected2 = new Map<String, List<Id>>{
                IterTestUtils.CONSTS.CUSTOMER => new List<Id>{
                        accounts[0].Id,
                        accounts[1].Id
                },
                IterTestUtils.CONSTS.PARTNER => new List<Id>{
                        accounts[2].Id,
                        accounts[3].Id,
                        accounts[5].Id
                },
                IterTestUtils.CONSTS.COMPETITOR => new List<Id>{
                        accounts[6].Id,
                        accounts[7].Id,
                        accounts[8].Id
                },
                null => new List<Id>{
                        accounts[4].Id,
                        accounts[9].Id
                }
        };
        Validate.assertEquals(expected2, actual5);
    }

    /**
     * @see SObjectCollector.flatMapping
     */
    @IsTest
    static void flatMapping() {
        // Given
        List<Account> accounts = IterTestUtils.generateAccounts();
        ISObjectFunction mapper = SObjectFunction.getSObjects(IterTestUtils.CONSTS.CONTACTS);
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Account.Type);
        // When
        List<Object> actual = (List<Object>) Stream.of(accounts).collect(SObjectCollector.flatMapping(mapper));
        List<Contact> actual1 = (List<Contact>) Stream.of(accounts).collect(SObjectCollector.flatMapping(mapper).cast(List<Contact>.class));
        List<Contact> actual2 = (List<Contact>) Stream.of(accounts).collect(SObjectCollector.flatMapping(IterTestUtils.CONSTS.CONTACTS).cast(List<Contact>.class));
        List<Contact> actual3 = (List<Contact>) Stream.of(accounts).collect(SObjectCollector.flatMapping(IterTestUtils.CONSTS.Contact.AccountId).cast(List<Contact>.class));
        Set<SObject> actual4 = (Set<SObject>) Stream.of(accounts).collect(SObjectCollector.flatMapping(mapper, Collector.toSObjectSet()));
        Map<String, List<Contact>> actual5 = (Map<String, List<Contact>>) Stream.of(accounts)
                .collect(SObjectCollector.groupingByString(keyMapper, SObjectCollector.flatMapping(mapper)).cast(Map<String, List<Contact>>.class));
        // Then
        List<SObject> expected = new List<SObject>();
        for (Account acc : accounts) {
            List<SObject> children = acc.getSObjects(IterTestUtils.CONSTS.CONTACTS);
            if (children != null) {
                expected.addAll(children);
            }
        }
        Validate.assertEquals(ObjectStream.of(expected).toList(), actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Set<SObject> expected1 = new Set<SObject>(expected);
        Validate.assertEquals(expected1, actual4);
        Map<String, List<Contact>> expected2 = new Map<String, List<Contact>>{
                IterTestUtils.CONSTS.CUSTOMER => new List<Contact>{
                        accounts[0].Contacts[0],
                        accounts[1].Contacts[0],
                        accounts[2].Contacts[0]
                },
                IterTestUtils.CONSTS.PARTNER => new List<Contact>{
                        accounts[3].Contacts[0],
                        accounts[5].Contacts[0],
                        accounts[5].Contacts[1]
                },
                IterTestUtils.CONSTS.COMPETITOR => new List<Contact>(),
                null => new List<Contact>{
                        accounts[4].Contacts[0]
                }
        };
        Validate.assertEquals(expected2, actual5);
    }

    /**
     * @see SObjectCollector.reducing
     */
    @IsTest
    static void reducing() {
        // Given
        accounts.remove(4); // To prevent NPE
        ISObjectBinaryOperator accumulator = SObjectBinaryOperator.maxBy(SObjectComparator.comparing(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        ISObjectBinaryOperator sumIntFieldReducer = new IterTestUtils.SumIntFieldReducer(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES);
        ISObjectFunction keyMapper = SObjectFunction.get(IterTestUtils.CONSTS.Account.Type);
        // When
        OptionalSObject actual = (OptionalSObject) Stream.of(accounts).collect(SObjectCollector.reducing(accumulator));
        Account actual1 = (Account) Stream.of(accounts).collect(SObjectCollector.reducing(new Account(NumberOfEmployees = 0), sumIntFieldReducer));
        Map<String, Object> actual2 = (Map<String, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByString(keyMapper, SObjectCollector.reducing(accumulator)));
        // Then
        Validate.assertEquals(accounts[8], actual.get());
        Account expected2 = new Account(NumberOfEmployees =
                  accounts[0].NumberOfEmployees
                + accounts[1].NumberOfEmployees
                + accounts[2].NumberOfEmployees
                + accounts[3].NumberOfEmployees
                + accounts[4].NumberOfEmployees
                + accounts[5].NumberOfEmployees
                + accounts[6].NumberOfEmployees
                + accounts[7].NumberOfEmployees
                + accounts[8].NumberOfEmployees
        );
        Validate.assertEquals(expected2, actual1);
        Map<String, OptionalSObject> expected = new Map<String, OptionalSObject>{
                IterTestUtils.CONSTS.CUSTOMER => OptionalSObject.of(accounts[0]),
                IterTestUtils.CONSTS.PARTNER => OptionalSObject.of(accounts[4]),
                IterTestUtils.CONSTS.COMPETITOR => OptionalSObject.of(accounts[7]),
                null => OptionalSObject.of(accounts[8])
        };
        Validate.assertEquals(expected, actual2);
    }

    /**
     * @see SObjectCollector.maximizing
     * @see SObjectCollector.minimizing
     */
    @IsTest
    static void optimizing() {
        // Given
        ISObjectComparator comparator = SObjectComparator.comparing(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        ISObjectFunction keyMapper = SObjectFunction.get(Account.Type);
        // When
        OptionalSObject actual = (OptionalSObject) Stream.of(accounts).collect(SObjectCollector.maximizing(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        OptionalSObject actual1 = (OptionalSObject) Stream.of(accounts).collect(SObjectCollector.maximizing(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        OptionalSObject actual2 = (OptionalSObject) Stream.of(accounts).collect(SObjectCollector.maximizing(comparator));
        OptionalSObject actual3 = (OptionalSObject) Stream.of(accounts).collect(SObjectCollector.minimizing(IterTestUtils.CONSTS.Account.NumberOfEmployees));
        OptionalSObject actual4 = (OptionalSObject) Stream.of(accounts).collect(SObjectCollector.minimizing(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        OptionalSObject actual5 = (OptionalSObject) Stream.of(accounts).collect(SObjectCollector.minimizing(comparator));
        Map<String, Object> actual6 = (Map<String, Object>) Stream.of(accounts).collect(SObjectCollector.groupingByString(keyMapper, SObjectCollector.minimizing(comparator)));
        // Then
        Validate.assertEquals(accounts[9], actual.get());
        Validate.assertEquals(accounts[9], actual1.get());
        Validate.assertEquals(accounts[9], actual2.get());
        Validate.assertEquals(accounts[4], actual3.get());
        Validate.assertEquals(accounts[4], actual4.get());
        Validate.assertEquals(accounts[4], actual5.get());
        Map<String, OptionalSObject> expected = new Map<String, OptionalSObject>{
                IterTestUtils.CONSTS.CUSTOMER => OptionalSObject.of(accounts[1]),
                IterTestUtils.CONSTS.PARTNER => OptionalSObject.of(accounts[3]),
                IterTestUtils.CONSTS.COMPETITOR => OptionalSObject.of(accounts[6]),
                null => OptionalSObject.of(accounts[4])
        };
        Validate.assertEquals(expected, actual6);
    }

}
