/**
 * @see SObjectCollectors
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings(
    'PMD.ApexAssertionsShouldIncludeMessage, PMD.ApexUnitTestClassShouldHaveRunAs, PMD.CognitiveComplexity, PMD.NcssTypeCount, PMD.CyclomaticComplexity'
)
private class SObjectCollectorsTest {

    private static final Map<SObjectType, List<SObject>> DATA = AfTestData.generateSObjects();
    private static final List<Account> ACCOUNTS = DATA.get(Account.SObjectType);
    private static final List<Contact> CONTACTS = DATA.get(Contact.SObjectType);
    private static final List<Attachment> ATTACHMENTS = DATA.get(Attachment.SObjectType);
    private static final List<Event> EVENTS = DATA.get(Event.SObjectType);
    private static final List<ContactPointEmail> SLOTS = DATA.get(ContactPointEmail.SObjectType);

    static {
        new SObjectCollectors();
    }

    /**
     * @see SObjectCollectors.toList
     */
    @IsTest
    static void toList() {
        // Given
        ICollector toListCollector = SObjectCollectors.toList().cast(List<SObject>.class);
        ICollector toNameListCollector = SObjectCollectors.toList(SObjectFunctions.get(AfTestConsts.NAME));
        ICollector toNameListCollector1 = SObjectCollectors.toList(AfTestConsts.NAME).cast(List<String>.class);
        ICollector toNameListCollector2 = SObjectCollectors.toList(AfTestConsts.Account.Name).cast(List<String>.class);
        // When
        List<Account> actual = (List<Account>) AfTestCommons.collect(ACCOUNTS, toListCollector);
        List<Object> actual1 = (List<Object>) AfTestCommons.collect(ACCOUNTS, toNameListCollector);
        List<String> actual2 = (List<String>) AfTestCommons.collect(ACCOUNTS, toNameListCollector1);
        List<String> actual3 = (List<String>) AfTestCommons.collect(ACCOUNTS, toNameListCollector2);
        // Then
        Assert.areEqual(ACCOUNTS, actual);
        List<String> expected = new List<String>{
            (String) ACCOUNTS[0].get(AfTestConsts.NAME),
            (String) ACCOUNTS[1].get(AfTestConsts.NAME),
            (String) ACCOUNTS[2].get(AfTestConsts.NAME),
            (String) ACCOUNTS[3].get(AfTestConsts.NAME),
            (String) ACCOUNTS[4].get(AfTestConsts.NAME),
            (String) ACCOUNTS[5].get(AfTestConsts.NAME),
            (String) ACCOUNTS[6].get(AfTestConsts.NAME),
            (String) ACCOUNTS[7].get(AfTestConsts.NAME),
            (String) ACCOUNTS[8].get(AfTestConsts.NAME),
            (String) ACCOUNTS[9].get(AfTestConsts.NAME)
        };
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
    }

    /**
     * @see SObjectCollectors.toSObjectSet
     */
    @IsTest
    static void toSObjectSet() {
        // Given
        ICollector toSetCollector = SObjectCollectors.toSObjectSet();
        // When
        Set<SObject> actual = (Set<SObject>) AfTestCommons.collect(ACCOUNTS, toSetCollector);
        // Then
        Set<SObject> expected = new Set<SObject>{
            ACCOUNTS[0],
            ACCOUNTS[1],
            ACCOUNTS[2],
            ACCOUNTS[3],
            ACCOUNTS[4],
            ACCOUNTS[5],
            ACCOUNTS[6],
            ACCOUNTS[7],
            ACCOUNTS[8],
            ACCOUNTS[9]
        };
        Assert.areEqual(expected, actual);
    }


    /**
     * @see SObjectCollectors.toBoolSet
     */
    @IsTest
    static void toBoolSet() {
        // Given
        ICollector toBoolSetCollector = SObjectCollectors.toBoolSet(SObjectFunctions.get(AfTestConsts.DO_NOT_CALL));
        ICollector toBoolSetCollector1 = SObjectCollectors.toBoolSet(AfTestConsts.DO_NOT_CALL);
        ICollector toBoolSetCollector2 = SObjectCollectors.toBoolSet(AfTestConsts.Contact.DoNotCall);
        // When
        Set<Boolean> actual = (Set<Boolean>) AfTestCommons.collect(CONTACTS, toBoolSetCollector);
        Set<Boolean> actual1 = (Set<Boolean>) AfTestCommons.collect(CONTACTS, toBoolSetCollector1);
        Set<Boolean> actual2 = (Set<Boolean>) AfTestCommons.collect(CONTACTS, toBoolSetCollector2);
        // Then
        Set<Boolean> expected = new Set<Boolean>{
            (Boolean) CONTACTS[0].get(AfTestConsts.DO_NOT_CALL),
            (Boolean) CONTACTS[1].get(AfTestConsts.DO_NOT_CALL),
            (Boolean) CONTACTS[2].get(AfTestConsts.DO_NOT_CALL),
            (Boolean) CONTACTS[3].get(AfTestConsts.DO_NOT_CALL),
            (Boolean) CONTACTS[4].get(AfTestConsts.DO_NOT_CALL)
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
    }

    /**
     * @see SObjectCollectors.toIdSet
     */
    @IsTest
    static void toIdSet() {
        // Given
        ICollector toIdSetCollector = SObjectCollectors.toIdSet(SObjectFunctions.get(AfTestConsts.ID));
        ICollector toIdSetCollector1 = SObjectCollectors.toIdSet(AfTestConsts.ID);
        ICollector toIdSetCollector2 = SObjectCollectors.toIdSet(AfTestConsts.Contact.Id);
        // When
        Set<Id> actual = (Set<Id>) AfTestCommons.collect(CONTACTS, toIdSetCollector);
        Set<Id> actual1 = (Set<Id>) AfTestCommons.collect(CONTACTS, toIdSetCollector1);
        Set<Id> actual2 = (Set<Id>) AfTestCommons.collect(CONTACTS, toIdSetCollector2);
        // Then
        Set<Id> expected = new Set<Id>{
            (Id) CONTACTS[0].get(AfTestConsts.ID),
            (Id) CONTACTS[1].get(AfTestConsts.ID),
            (Id) CONTACTS[2].get(AfTestConsts.ID),
            (Id) CONTACTS[3].get(AfTestConsts.ID),
            (Id) CONTACTS[4].get(AfTestConsts.ID)
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
    }

    /**
     * @see SObjectCollectors.toStringSet
     */
    @IsTest
    static void toStringSet() {
        // Given
        ICollector toStringSetCollector = SObjectCollectors.toStringSet(SObjectFunctions.get(AfTestConsts.LAST_NAME));
        ICollector toStringSetCollector1 = SObjectCollectors.toStringSet(AfTestConsts.LAST_NAME);
        ICollector toStringSetCollector2 = SObjectCollectors.toStringSet(AfTestConsts.Contact.LastName);
        // When
        Set<String> actual = (Set<String>) AfTestCommons.collect(CONTACTS, toStringSetCollector);
        Set<String> actual1 = (Set<String>) AfTestCommons.collect(CONTACTS, toStringSetCollector1);
        Set<String> actual2 = (Set<String>) AfTestCommons.collect(CONTACTS, toStringSetCollector2);
        // Then
        Set<String> expected = new Set<String>{
            (String) CONTACTS[0].get(AfTestConsts.LAST_NAME),
            (String) CONTACTS[1].get(AfTestConsts.LAST_NAME),
            (String) CONTACTS[2].get(AfTestConsts.LAST_NAME),
            (String) CONTACTS[3].get(AfTestConsts.LAST_NAME),
            (String) CONTACTS[4].get(AfTestConsts.LAST_NAME)
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
    }

    /**
     * @see SObjectCollectors.toBlobSet
     */
    @IsTest
    static void toBlobSet() {
        // Given
        ICollector toBlobSetCollector = SObjectCollectors.toBlobSet(SObjectFunctions.get(AfTestConsts.BODY));
        ICollector toBlobSetCollector1 = SObjectCollectors.toBlobSet(AfTestConsts.BODY);
        ICollector toBlobSetCollector2 = SObjectCollectors.toBlobSet(AfTestConsts.Attachment.Body);
        // When
        Set<Blob> actual = (Set<Blob>) AfTestCommons.collect(ATTACHMENTS, toBlobSetCollector);
        Set<Blob> actual1 = (Set<Blob>) AfTestCommons.collect(ATTACHMENTS, toBlobSetCollector1);
        Set<Blob> actual2 = (Set<Blob>) AfTestCommons.collect(ATTACHMENTS, toBlobSetCollector2);
        // Then
        Set<Blob> expected = new Set<Blob>{
            (Blob) ATTACHMENTS[0].get(AfTestConsts.BODY),
            (Blob) ATTACHMENTS[1].get(AfTestConsts.BODY),
            (Blob) ATTACHMENTS[2].get(AfTestConsts.BODY),
            (Blob) ATTACHMENTS[3].get(AfTestConsts.BODY),
            (Blob) ATTACHMENTS[4].get(AfTestConsts.BODY),
            (Blob) ATTACHMENTS[5].get(AfTestConsts.BODY)
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
    }

    /**
     * @see SObjectCollectors.toDateSet
     */
    @IsTest
    static void toDateSet() {
        // Given
        ICollector toDateSetCollector = SObjectCollectors.toDateSet(SObjectFunctions.get(AfTestConsts.BIRTHDATE));
        ICollector toDateSetCollector1 = SObjectCollectors.toDateSet(AfTestConsts.BIRTHDATE);
        ICollector toDateSetCollector2 = SObjectCollectors.toDateSet(AfTestConsts.Contact.Birthdate);
        // When
        Set<Date> actual = (Set<Date>) AfTestCommons.collect(CONTACTS, toDateSetCollector);
        Set<Date> actual1 = (Set<Date>) AfTestCommons.collect(CONTACTS, toDateSetCollector1);
        Set<Date> actual2 = (Set<Date>) AfTestCommons.collect(CONTACTS, toDateSetCollector2);
        // Then
        Set<Date> expected = new Set<Date>{
            (Date) CONTACTS[0].get(AfTestConsts.BIRTHDATE),
            (Date) CONTACTS[1].get(AfTestConsts.BIRTHDATE),
            (Date) CONTACTS[2].get(AfTestConsts.BIRTHDATE),
            (Date) CONTACTS[3].get(AfTestConsts.BIRTHDATE),
            (Date) CONTACTS[4].get(AfTestConsts.BIRTHDATE)
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
    }

    /**
     * @see SObjectCollectors.toDatetimeSet
     */
    @IsTest
    static void toDatetimeSet() {
        // Given
        ICollector toDatetimeSetCollector = SObjectCollectors.toDatetimeSet(SObjectFunctions.get(AfTestConsts.ACTIVITY_DATE_TIME));
        ICollector toDatetimeSetCollector1 = SObjectCollectors.toDatetimeSet(AfTestConsts.ACTIVITY_DATE_TIME);
        ICollector toDatetimeSetCollector2 = SObjectCollectors.toDatetimeSet(AfTestConsts.Event.ActivityDateTime);
        // When
        Set<Datetime> actual = (Set<Datetime>) AfTestCommons.collect(EVENTS, toDatetimeSetCollector);
        Set<Datetime> actual1 = (Set<Datetime>) AfTestCommons.collect(EVENTS, toDatetimeSetCollector1);
        Set<Datetime> actual2 = (Set<Datetime>) AfTestCommons.collect(EVENTS, toDatetimeSetCollector2);
        // Then
        Set<Datetime> expected = new Set<Datetime>{
            (Datetime) EVENTS[0].get(AfTestConsts.ACTIVITY_DATE_TIME),
            (Datetime) EVENTS[1].get(AfTestConsts.ACTIVITY_DATE_TIME),
            (Datetime) EVENTS[2].get(AfTestConsts.ACTIVITY_DATE_TIME),
            (Datetime) EVENTS[3].get(AfTestConsts.ACTIVITY_DATE_TIME),
            (Datetime) EVENTS[4].get(AfTestConsts.ACTIVITY_DATE_TIME)
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
    }

    /**
     * @see SObjectCollectors.toTimeSet
     */
    @IsTest
    static void toTimeSet() {
        // Given
        ICollector toTimeSetCollector = SObjectCollectors.toTimeSet(SObjectFunctions.get(AfTestConsts.BEST_START_TIME));
        ICollector toTimeSetCollector1 = SObjectCollectors.toTimeSet(AfTestConsts.BEST_START_TIME);
        ICollector toTimeSetCollector2 = SObjectCollectors.toTimeSet(AfTestConsts.ContactEmail.StartTime);
        // When
        Set<Time> actual = (Set<Time>) AfTestCommons.collect(SLOTS, toTimeSetCollector);
        Set<Time> actual1 = (Set<Time>) AfTestCommons.collect(SLOTS, toTimeSetCollector1);
        Set<Time> actual2 = (Set<Time>) AfTestCommons.collect(SLOTS, toTimeSetCollector2);
        // Then
        Set<Time> expected = new Set<Time>{
            (Time) SLOTS[0].get(AfTestConsts.BEST_START_TIME),
            (Time) SLOTS[1].get(AfTestConsts.BEST_START_TIME),
            (Time) SLOTS[2].get(AfTestConsts.BEST_START_TIME),
            (Time) SLOTS[3].get(AfTestConsts.BEST_START_TIME),
            (Time) SLOTS[4].get(AfTestConsts.BEST_START_TIME)
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
    }

    /**
     * @see SObjectCollectors.toIntSet
     */
    @IsTest
    static void toIntSet() {
        // Given
        ICollector toIntSetCollector = SObjectCollectors.toIntSet(SObjectFunctions.get(AfTestConsts.NUMBER_OF_EMPLOYEES));
        ICollector toIntSetCollector1 = SObjectCollectors.toIntSet(AfTestConsts.NUMBER_OF_EMPLOYEES);
        ICollector toIntSetCollector2 = SObjectCollectors.toIntSet(AfTestConsts.Account.NumberOfEmployees);
        // When
        Set<Integer> actual = (Set<Integer>) AfTestCommons.collect(ACCOUNTS, toIntSetCollector);
        Set<Integer> actual1 = (Set<Integer>) AfTestCommons.collect(ACCOUNTS, toIntSetCollector1);
        Set<Integer> actual2 = (Set<Integer>) AfTestCommons.collect(ACCOUNTS, toIntSetCollector2);
        // Then
        Set<Integer> expected = new Set<Integer>{
            (Integer) ACCOUNTS[0].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Integer) ACCOUNTS[1].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Integer) ACCOUNTS[2].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Integer) ACCOUNTS[3].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Integer) ACCOUNTS[4].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Integer) ACCOUNTS[5].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Integer) ACCOUNTS[6].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Integer) ACCOUNTS[7].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Integer) ACCOUNTS[8].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Integer) ACCOUNTS[9].get(AfTestConsts.NUMBER_OF_EMPLOYEES)
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
    }

    /**
     * @see SObjectCollectors.toLongSet
     */
    @IsTest
    static void toLongSet() {
        // Given
        ICollector toIntSetCollector = SObjectCollectors.toLongSet(SObjectFunctions.get(AfTestConsts.NUMBER_OF_EMPLOYEES));
        ICollector toIntSetCollector1 = SObjectCollectors.toLongSet(AfTestConsts.NUMBER_OF_EMPLOYEES);
        ICollector toIntSetCollector2 = SObjectCollectors.toLongSet(AfTestConsts.Account.NumberOfEmployees);
        // When
        Set<Long> actual = (Set<Long>) AfTestCommons.collect(ACCOUNTS, toIntSetCollector);
        Set<Long> actual1 = (Set<Long>) AfTestCommons.collect(ACCOUNTS, toIntSetCollector1);
        Set<Long> actual2 = (Set<Long>) AfTestCommons.collect(ACCOUNTS, toIntSetCollector2);
        // Then
        Set<Long> expected = new Set<Long>{
            (Long) ACCOUNTS[0].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Long) ACCOUNTS[1].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Long) ACCOUNTS[2].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Long) ACCOUNTS[3].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Long) ACCOUNTS[4].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Long) ACCOUNTS[5].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Long) ACCOUNTS[6].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Long) ACCOUNTS[7].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Long) ACCOUNTS[8].get(AfTestConsts.NUMBER_OF_EMPLOYEES),
            (Long) ACCOUNTS[9].get(AfTestConsts.NUMBER_OF_EMPLOYEES)
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
    }

    /**
     * @see SObjectCollectors.toDoubleSet
     */
    @IsTest
    static void toDoubleSet() {
        // Given
        ICollector toDoubleSetCollector = SObjectCollectors.toDoubleSet(SObjectFunctions.get(AfTestConsts.BILLING_LATITUDE));
        ICollector toDoubleSetCollector1 = SObjectCollectors.toDoubleSet(AfTestConsts.BILLING_LATITUDE);
        ICollector toDoubleSetCollector2 = SObjectCollectors.toDoubleSet(AfTestConsts.Account.BillingLatitude);
        // When
        Set<Double> actual = (Set<Double>) AfTestCommons.collect(ACCOUNTS, toDoubleSetCollector);
        Set<Double> actual1 = (Set<Double>) AfTestCommons.collect(ACCOUNTS, toDoubleSetCollector1);
        Set<Double> actual2 = (Set<Double>) AfTestCommons.collect(ACCOUNTS, toDoubleSetCollector2);
        // Then
        Set<Double> expected = new Set<Double>{
            (Double) ACCOUNTS[0].get(AfTestConsts.BILLING_LATITUDE),
            (Double) ACCOUNTS[1].get(AfTestConsts.BILLING_LATITUDE),
            (Double) ACCOUNTS[2].get(AfTestConsts.BILLING_LATITUDE),
            (Double) ACCOUNTS[3].get(AfTestConsts.BILLING_LATITUDE),
            (Double) ACCOUNTS[4].get(AfTestConsts.BILLING_LATITUDE),
            (Double) ACCOUNTS[5].get(AfTestConsts.BILLING_LATITUDE),
            (Double) ACCOUNTS[6].get(AfTestConsts.BILLING_LATITUDE),
            (Double) ACCOUNTS[7].get(AfTestConsts.BILLING_LATITUDE),
            (Double) ACCOUNTS[8].get(AfTestConsts.BILLING_LATITUDE),
            (Double) ACCOUNTS[9].get(AfTestConsts.BILLING_LATITUDE)
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
    }

    /**
     * @see SObjectCollectors.toObjectSet
     */
    @IsTest
    static void toObjectSet() {
        // Given
        ICollector toSetCollector = SObjectCollectors.toObjectSet(SObjectFunctions.get(AfTestConsts.BILLING_LATITUDE));
        ICollector toSetCollector1 = SObjectCollectors.toObjectSet(AfTestConsts.BILLING_LATITUDE);
        ICollector toSetCollector2 = SObjectCollectors.toObjectSet(AfTestConsts.Account.BillingLatitude);
        // When
        Set<Object> actual = (Set<Object>) AfTestCommons.collect(ACCOUNTS, toSetCollector);
        Set<Object> actual1 = (Set<Object>) AfTestCommons.collect(ACCOUNTS, toSetCollector1);
        Set<Object> actual2 = (Set<Object>) AfTestCommons.collect(ACCOUNTS, toSetCollector2);
        // Then
        Set<Object> expected = new Set<Object>{
            ACCOUNTS[0].get(AfTestConsts.BILLING_LATITUDE),
            ACCOUNTS[1].get(AfTestConsts.BILLING_LATITUDE),
            ACCOUNTS[2].get(AfTestConsts.BILLING_LATITUDE),
            ACCOUNTS[3].get(AfTestConsts.BILLING_LATITUDE),
            ACCOUNTS[4].get(AfTestConsts.BILLING_LATITUDE),
            ACCOUNTS[5].get(AfTestConsts.BILLING_LATITUDE),
            ACCOUNTS[6].get(AfTestConsts.BILLING_LATITUDE),
            ACCOUNTS[7].get(AfTestConsts.BILLING_LATITUDE),
            ACCOUNTS[8].get(AfTestConsts.BILLING_LATITUDE),
            ACCOUNTS[9].get(AfTestConsts.BILLING_LATITUDE)
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
    }

    /**
     * @see SObjectCollectors.toByBoolMap
     */
    @IsTest
    static void toByBoolMap() {
        // Given
        List<Contact> input = new List<Contact>{ CONTACTS[0], CONTACTS[1], CONTACTS[4] };
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Contact.DoNotCall);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        IFunction getParentAccFunction = SObjectOperators.getSObject(AfTestConsts.Contact.AccountId);
        // When
        Map<Boolean, SObject> actual = (Map<Boolean, SObject>) AfTestCommons.collect(input, SObjectCollectors.toByBoolMap(AfTestConsts.DO_NOT_CALL));
        Map<Boolean, Contact> actual1 = (Map<Boolean, Contact>) AfTestCommons.collect(input, SObjectCollectors.toByBoolMap(AfTestConsts.Contact.DoNotCall).cast(Map<Boolean, Contact>.class));
        Map<Boolean, SObject> actual2 = (Map<Boolean, SObject>) AfTestCommons.collect(input, SObjectCollectors.toByBoolMap(keyMapper).cast(Map<Boolean, Contact>.class));
        Map<Boolean, Contact> actual3 = (Map<Boolean, Contact>) AfTestCommons.collect(input, SObjectCollectors.toByBoolMap(keyMapper, valueMapper).cast(Map<Boolean, Contact>.class));
        Map<Boolean, Account> actual4 = (Map<Boolean, Account>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByBoolMap(keyMapper, getParentAccFunction, mergeFunction).cast(Map<Boolean, Account>.class));
        Map<Boolean, String> actual5 = (Map<Boolean, String>) AfTestCommons.collect(input, SObjectCollectors.toByBoolMap(AfTestConsts.DO_NOT_CALL, AfTestConsts.LAST_NAME).cast(Map<Boolean, String>.class));
        Map<Boolean, String> actual6 = (Map<Boolean, String>) AfTestCommons.collect(input, SObjectCollectors.toByBoolMap(AfTestConsts.Contact.DoNotCall, AfTestConsts.Contact.LastName).cast(Map<Boolean, String>.class));
        try {
            List<Contact> input1 = new List<Contact>(CONTACTS);
            input1.add(input1[0]);
            AfTestCommons.collect(input1, SObjectCollectors.toByBoolMap(AfTestConsts.DO_NOT_CALL));
        } catch (Exception exc) {
            Assert.isTrue(exc.getMessage().contains(AfTestConsts.DUPLICATE_KEY));
        }
        // Then
        Map<Boolean, Contact> expected = new Map<Boolean, Contact>{
            (Boolean) CONTACTS[0].get(AfTestConsts.DO_NOT_CALL) => CONTACTS[0],
            (Boolean) CONTACTS[1].get(AfTestConsts.DO_NOT_CALL) => CONTACTS[1],
            (Boolean) CONTACTS[4].get(AfTestConsts.DO_NOT_CALL) => CONTACTS[4]
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Map<Boolean, SObject> expected1 = new Map<Boolean, SObject>{
            (Boolean) CONTACTS[2].get(AfTestConsts.DO_NOT_CALL) => CONTACTS[2].getSObject(AfTestConsts.Account.SOBJECT_NAME),
            (Boolean) CONTACTS[3].get(AfTestConsts.DO_NOT_CALL) => CONTACTS[3].getSObject(AfTestConsts.Account.SOBJECT_NAME),
            (Boolean) CONTACTS[4].get(AfTestConsts.DO_NOT_CALL) => CONTACTS[4].getSObject(AfTestConsts.Account.SOBJECT_NAME)
        };
        Assert.areEqual(expected1, actual4);
        Map<Boolean, String> expected2 = new Map<Boolean, String>{
            (Boolean) CONTACTS[0].get(AfTestConsts.DO_NOT_CALL) => (String) CONTACTS[0].get(AfTestConsts.LAST_NAME),
            (Boolean) CONTACTS[1].get(AfTestConsts.DO_NOT_CALL) => (String) CONTACTS[1].get(AfTestConsts.LAST_NAME),
            (Boolean) CONTACTS[4].get(AfTestConsts.DO_NOT_CALL) => (String) CONTACTS[4].get(AfTestConsts.LAST_NAME)
        };
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
    }

    /**
     * @see SObjectCollectors.toByIdMap
     */
    @IsTest
    static void toByIdMap() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Contact.AccountId);
        IFunction valueMapper = Function.identity();
        IOperator valueMapper1 = Operator.identity();
        IBiOperator mergeFunction = BiOperator.right();
        IBiOperator mergeFunction1 = BiOperator.right();
        IFunction getParentAccFunction = SObjectOperators.getSObject(AfTestConsts.Contact.AccountId);
        Collector toMapCollector = SObjectCollectors.toByIdMap();
        // When
        Map<Id, SObject> actual = (Map<Id, SObject>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByIdMap(AfTestConsts.ACCOUNT_ID));
        Map<Id, Contact> actual1 = (Map<Id, Contact>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByIdMap(AfTestConsts.Contact.AccountId).cast(Map<Id, Contact>.class));
        Map<Id, SObject> actual2 = (Map<Id, SObject>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByIdMap(keyMapper).cast(Map<Id, SObject>.class));
        Map<Id, Object> actual3 = (Map<Id, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByIdMap(keyMapper, valueMapper));
        Map<Id, Object> actual4 = (Map<Id, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByIdMap(keyMapper, getParentAccFunction, mergeFunction));
        Map<Id, String> actual5 = (Map<Id, String>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByIdMap(AfTestConsts.ACCOUNT_ID, AfTestConsts.LAST_NAME).cast(Map<Id, String>.class));
        Map<Id, String> actual6 = (Map<Id, String>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByIdMap(AfTestConsts.Contact.AccountId, AfTestConsts.Contact.LastName).cast(Map<Id, String>.class));
        List<Contact> input = new List<Contact>(CONTACTS);
        input.add(input[0]);
        Map<Id, Object> actual7 = (Map<Id, Object>) AfTestCommons.collect(input, SObjectCollectors.toByIdMap(keyMapper, getParentAccFunction, mergeFunction));
        Map<Id, SObject> actual8 = (Map<Id, SObject>) AfTestCommons.collect(input, SObjectCollectors.toByIdMap(keyMapper, valueMapper1, mergeFunction1).cast(Map<Id, SObject>.class));
        try {
            AfTestCommons.collect(input, SObjectCollectors.toByIdMap(AfTestConsts.ACCOUNT_ID));
        } catch (Exception exc) {
            Assert.isTrue(exc.getMessage().contains(AfTestConsts.DUPLICATE_KEY));
        }
        Map<Id, SObject> actual9 = (Map<Id, SObject>) AfTestCommons.collect(ACCOUNTS, toMapCollector);
        Map<Id, Account> actual10 = (Map<Id, Account>) AfTestCommons.collect(ACCOUNTS, toMapCollector.cast(Map<Id, Account>.class));
        // Then
        Map<Id, Contact> expected = new Map<Id, Contact>{
            (Id) CONTACTS[0].get(AfTestConsts.ACCOUNT_ID) => CONTACTS[0],
            (Id) CONTACTS[1].get(AfTestConsts.ACCOUNT_ID) => CONTACTS[1],
            (Id) CONTACTS[2].get(AfTestConsts.ACCOUNT_ID) => CONTACTS[2],
            (Id) CONTACTS[3].get(AfTestConsts.ACCOUNT_ID) => CONTACTS[3],
            (Id) CONTACTS[4].get(AfTestConsts.ACCOUNT_ID) => CONTACTS[4]
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual8);
        Map<Id, SObject> expected1 = new Map<Id, SObject>{
            (Id) CONTACTS[0].get(AfTestConsts.ACCOUNT_ID) => CONTACTS[0].getSObject(AfTestConsts.Account.SOBJECT_NAME),
            (Id) CONTACTS[1].get(AfTestConsts.ACCOUNT_ID) => CONTACTS[1].getSObject(AfTestConsts.Account.SOBJECT_NAME),
            (Id) CONTACTS[2].get(AfTestConsts.ACCOUNT_ID) => CONTACTS[2].getSObject(AfTestConsts.Account.SOBJECT_NAME),
            (Id) CONTACTS[3].get(AfTestConsts.ACCOUNT_ID) => CONTACTS[3].getSObject(AfTestConsts.Account.SOBJECT_NAME),
            (Id) CONTACTS[4].get(AfTestConsts.ACCOUNT_ID) => CONTACTS[4].getSObject(AfTestConsts.Account.SOBJECT_NAME)
        };
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual7);
        Map<Id, String> expected2 = new Map<Id, String>{
            (Id) CONTACTS[0].get(AfTestConsts.ACCOUNT_ID) => (String) CONTACTS[0].get(AfTestConsts.Contact.LastName),
            (Id) CONTACTS[1].get(AfTestConsts.ACCOUNT_ID) => (String) CONTACTS[1].get(AfTestConsts.Contact.LastName),
            (Id) CONTACTS[2].get(AfTestConsts.ACCOUNT_ID) => (String) CONTACTS[2].get(AfTestConsts.Contact.LastName),
            (Id) CONTACTS[3].get(AfTestConsts.ACCOUNT_ID) => (String) CONTACTS[3].get(AfTestConsts.Contact.LastName),
            (Id) CONTACTS[4].get(AfTestConsts.ACCOUNT_ID) => (String) CONTACTS[4].get(AfTestConsts.Contact.LastName)
        };
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(new Map<Id, Account>(ACCOUNTS), actual9);
        Assert.areEqual(new Map<Id, Account>(ACCOUNTS), actual10);
    }

    /**
     * @see SObjectCollectors.toByStringMap
     */
    @IsTest
    static void toByStringMap() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Contact.FirstName);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        IFunction getParentAccFunction = SObjectOperators.getSObject(AfTestConsts.Contact.AccountId);
        // When
        Map<String, SObject> actual = (Map<String, SObject>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByStringMap(AfTestConsts.FIRST_NAME));
        Map<String, Contact> actual1 = (Map<String, Contact>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByStringMap(AfTestConsts.Contact.FirstName).cast(Map<String, Contact>.class));
        Map<String, SObject> actual2 = (Map<String, SObject>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByStringMap(keyMapper).cast(Map<String, SObject>.class));
        Map<String, Object> actual3 = (Map<String, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByStringMap(keyMapper, valueMapper));
        Map<String, Object> actual4 = (Map<String, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByStringMap(keyMapper, getParentAccFunction, mergeFunction));
        Map<String, String> actual5 = (Map<String, String>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByStringMap(AfTestConsts.FIRST_NAME, AfTestConsts.LAST_NAME).cast(Map<String, String>.class));
        Map<String, String> actual6 = (Map<String, String>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByStringMap(AfTestConsts.Contact.FirstName, AfTestConsts.Contact.LastName).cast(Map<String, String>.class));
        try {
            List<Contact> input = new List<Contact>(CONTACTS);
            input.add(input[0]);
            AfTestCommons.collect(input, SObjectCollectors.toByStringMap(AfTestConsts.FIRST_NAME));
        } catch (Exception exc) {
            Assert.isTrue(exc.getMessage().contains(AfTestConsts.DUPLICATE_KEY));
        }
        // Then
        Map<String, Contact> expected = new Map<String, Contact>{
            (String) CONTACTS[0].get(AfTestConsts.FIRST_NAME) => CONTACTS[0],
            (String) CONTACTS[1].get(AfTestConsts.FIRST_NAME) => CONTACTS[1],
            (String) CONTACTS[2].get(AfTestConsts.FIRST_NAME) => CONTACTS[2],
            (String) CONTACTS[3].get(AfTestConsts.FIRST_NAME) => CONTACTS[3],
            (String) CONTACTS[4].get(AfTestConsts.FIRST_NAME) => CONTACTS[4]
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Map<String, SObject> expected1 = new Map<String, SObject>{
            (String) CONTACTS[0].get(AfTestConsts.FIRST_NAME) => CONTACTS[0].getSObject(AfTestConsts.Account.SOBJECT_NAME),
            (String) CONTACTS[1].get(AfTestConsts.FIRST_NAME) => CONTACTS[1].getSObject(AfTestConsts.Account.SOBJECT_NAME),
            (String) CONTACTS[2].get(AfTestConsts.FIRST_NAME) => CONTACTS[2].getSObject(AfTestConsts.Account.SOBJECT_NAME),
            (String) CONTACTS[3].get(AfTestConsts.FIRST_NAME) => CONTACTS[3].getSObject(AfTestConsts.Account.SOBJECT_NAME),
            (String) CONTACTS[4].get(AfTestConsts.FIRST_NAME) => CONTACTS[4].getSObject(AfTestConsts.Account.SOBJECT_NAME)
        };
        Assert.areEqual(expected1, actual4);
        Map<String, String> expected2 = new Map<String, String>{
            (String) CONTACTS[0].get(AfTestConsts.FIRST_NAME) => (String) CONTACTS[0].get(AfTestConsts.Contact.LastName),
            (String) CONTACTS[1].get(AfTestConsts.FIRST_NAME) => (String) CONTACTS[1].get(AfTestConsts.Contact.LastName),
            (String) CONTACTS[2].get(AfTestConsts.FIRST_NAME) => (String) CONTACTS[2].get(AfTestConsts.Contact.LastName),
            (String) CONTACTS[3].get(AfTestConsts.FIRST_NAME) => (String) CONTACTS[3].get(AfTestConsts.Contact.LastName),
            (String) CONTACTS[4].get(AfTestConsts.FIRST_NAME) => (String) CONTACTS[4].get(AfTestConsts.Contact.LastName)
        };
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
    }

    /**
     * @see SObjectCollectors.toByBlobMap
     */
    @IsTest
    static void toByBlobMap() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Attachment.Body);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Blob, SObject> actual = (Map<Blob, SObject>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.toByBlobMap(AfTestConsts.BODY));
        Map<Blob, Attachment> actual1 = (Map<Blob, Attachment>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.toByBlobMap(AfTestConsts.Attachment.Body).cast(Map<Blob, Attachment>.class));
        Map<Blob, SObject> actual2 = (Map<Blob, SObject>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.toByBlobMap(keyMapper).cast(Map<Blob, SObject>.class));
        Map<Blob, Object> actual3 = (Map<Blob, Object>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.toByBlobMap(keyMapper, valueMapper));
        Map<Blob, Object> actual4 = (Map<Blob, Object>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.toByBlobMap(keyMapper, valueMapper, mergeFunction));
        Map<Blob, String> actual5 = (Map<Blob, String>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.toByBlobMap(AfTestConsts.BODY, AfTestConsts.NAME).cast(Map<Blob, String>.class));
        Map<Blob, String> actual6 = (Map<Blob, String>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.toByBlobMap(AfTestConsts.Attachment.Body, AfTestConsts.Attachment.Name).cast(Map<Blob, String>.class));
        try {
            List<Attachment> input = new List<Attachment>(ATTACHMENTS);
            input.add(input[0]);
            AfTestCommons.collect(input, SObjectCollectors.toByBlobMap(AfTestConsts.BODY));
        } catch (Exception exc) {
            Assert.isTrue(exc.getMessage().contains(AfTestConsts.DUPLICATE_KEY));
        }
        // Then
        Map<Blob, Attachment> expected = new Map<Blob, Attachment>{
            (Blob) ATTACHMENTS[0].get(AfTestConsts.BODY) => ATTACHMENTS[0],
            (Blob) ATTACHMENTS[1].get(AfTestConsts.BODY) => ATTACHMENTS[1],
            (Blob) ATTACHMENTS[2].get(AfTestConsts.BODY) => ATTACHMENTS[2],
            (Blob) ATTACHMENTS[3].get(AfTestConsts.BODY) => ATTACHMENTS[3],
            (Blob) ATTACHMENTS[4].get(AfTestConsts.BODY) => ATTACHMENTS[4],
            (Blob) ATTACHMENTS[5].get(AfTestConsts.BODY) => ATTACHMENTS[5]
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Map<Blob, String> expected2 = new Map<Blob, String>{
            (Blob) ATTACHMENTS[0].get(AfTestConsts.BODY) => (String) ATTACHMENTS[0].get(AfTestConsts.Attachment.Name),
            (Blob) ATTACHMENTS[1].get(AfTestConsts.BODY) => (String) ATTACHMENTS[1].get(AfTestConsts.Attachment.Name),
            (Blob) ATTACHMENTS[2].get(AfTestConsts.BODY) => (String) ATTACHMENTS[2].get(AfTestConsts.Attachment.Name),
            (Blob) ATTACHMENTS[3].get(AfTestConsts.BODY) => (String) ATTACHMENTS[3].get(AfTestConsts.Attachment.Name),
            (Blob) ATTACHMENTS[4].get(AfTestConsts.BODY) => (String) ATTACHMENTS[4].get(AfTestConsts.Attachment.Name),
            (Blob) ATTACHMENTS[5].get(AfTestConsts.BODY) => (String) ATTACHMENTS[5].get(AfTestConsts.Attachment.Name)
        };
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
    }

    /**
     * @see SObjectCollectors.toByDateMap
     */
    @IsTest
    static void toByDateMap() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Contact.Birthdate);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Date, SObject> actual = (Map<Date, SObject>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByDateMap(AfTestConsts.BIRTHDATE));
        Map<Date, Contact> actual1 = (Map<Date, Contact>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByDateMap(AfTestConsts.Contact.Birthdate).cast(Map<Date, Contact>.class));
        Map<Date, SObject> actual2 = (Map<Date, SObject>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByDateMap(keyMapper).cast(Map<Date, SObject>.class));
        Map<Date, Object> actual3 = (Map<Date, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByDateMap(keyMapper, valueMapper));
        Map<Date, Object> actual4 = (Map<Date, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByDateMap(keyMapper, valueMapper, mergeFunction));
        Map<Date, String> actual5 = (Map<Date, String>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByDateMap(AfTestConsts.BIRTHDATE, AfTestConsts.LAST_NAME).cast(Map<Date, String>.class));
        Map<Date, String> actual6 = (Map<Date, String>) AfTestCommons.collect(CONTACTS, SObjectCollectors.toByDateMap(AfTestConsts.Contact.Birthdate, AfTestConsts.Contact.LastName).cast(Map<Date, String>.class));
        try {
            List<Contact> input = new List<Contact>(CONTACTS);
            input.add(input[0]);
            AfTestCommons.collect(input, SObjectCollectors.toByDateMap(AfTestConsts.BIRTHDATE));
        } catch (Exception exc) {
            Assert.isTrue(exc.getMessage().contains(AfTestConsts.DUPLICATE_KEY));
        }
        // Then
        Map<Date, Contact> expected = new Map<Date, Contact>{
            (Date) CONTACTS[0].get(AfTestConsts.BIRTHDATE) => CONTACTS[0],
            (Date) CONTACTS[1].get(AfTestConsts.BIRTHDATE) => CONTACTS[1],
            (Date) CONTACTS[2].get(AfTestConsts.BIRTHDATE) => CONTACTS[2],
            (Date) CONTACTS[3].get(AfTestConsts.BIRTHDATE) => CONTACTS[3],
            (Date) CONTACTS[4].get(AfTestConsts.BIRTHDATE) => CONTACTS[4]
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Map<Date, String> expected2 = new Map<Date, String>{
            (Date) CONTACTS[0].get(AfTestConsts.BIRTHDATE) => (String) CONTACTS[0].get(AfTestConsts.Contact.LastName),
            (Date) CONTACTS[1].get(AfTestConsts.BIRTHDATE) => (String) CONTACTS[1].get(AfTestConsts.Contact.LastName),
            (Date) CONTACTS[2].get(AfTestConsts.BIRTHDATE) => (String) CONTACTS[2].get(AfTestConsts.Contact.LastName),
            (Date) CONTACTS[3].get(AfTestConsts.BIRTHDATE) => (String) CONTACTS[3].get(AfTestConsts.Contact.LastName),
            (Date) CONTACTS[4].get(AfTestConsts.BIRTHDATE) => (String) CONTACTS[4].get(AfTestConsts.Contact.LastName)
        };
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
    }

    /**
     * @see SObjectCollectors.toByDatetimeMap
     */
    @IsTest
    static void toByDatetimeMap() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Event.ActivityDateTime);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Datetime, SObject> actual = (Map<Datetime, SObject>) AfTestCommons.collect(EVENTS, SObjectCollectors.toByDatetimeMap(AfTestConsts.ACTIVITY_DATE_TIME));
        Map<Datetime, Event> actual1 = (Map<Datetime, Event>) AfTestCommons.collect(EVENTS, SObjectCollectors.toByDatetimeMap(AfTestConsts.Event.ActivityDateTime).cast(Map<Datetime, Event>.class));
        Map<Datetime, SObject> actual2 = (Map<Datetime, SObject>) AfTestCommons.collect(EVENTS, SObjectCollectors.toByDatetimeMap(keyMapper).cast(Map<Datetime, SObject>.class));
        Map<Datetime, Object> actual3 = (Map<Datetime, Object>) AfTestCommons.collect(EVENTS, SObjectCollectors.toByDatetimeMap(keyMapper, valueMapper));
        Map<Datetime, Object> actual4 = (Map<Datetime, Object>) AfTestCommons.collect(EVENTS, SObjectCollectors.toByDatetimeMap(keyMapper, valueMapper, mergeFunction));
        Map<Datetime, String> actual5 = (Map<Datetime, String>) AfTestCommons.collect(EVENTS, SObjectCollectors.toByDatetimeMap(AfTestConsts.ACTIVITY_DATE_TIME, AfTestConsts.DESCRIPTION).cast(Map<Datetime, String>.class));
        Map<Datetime, String> actual6 = (Map<Datetime, String>) AfTestCommons.collect(EVENTS, SObjectCollectors.toByDatetimeMap(AfTestConsts.Event.ActivityDateTime, AfTestConsts.Event.Description).cast(Map<Datetime, String>.class));
        try {
            List<Event> input = new List<Event>(EVENTS);
            input.add(input[0]);
            AfTestCommons.collect(input, SObjectCollectors.toByDatetimeMap(AfTestConsts.ACTIVITY_DATE_TIME));
        } catch (Exception exc) {
            Assert.isTrue(exc.getMessage().contains(AfTestConsts.DUPLICATE_KEY));
        }
        // Then
        Map<Datetime, Event> expected = new Map<Datetime, Event>{
            (Datetime) EVENTS[0].get(AfTestConsts.ACTIVITY_DATE_TIME) => EVENTS[0],
            (Datetime) EVENTS[1].get(AfTestConsts.ACTIVITY_DATE_TIME) => EVENTS[1],
            (Datetime) EVENTS[2].get(AfTestConsts.ACTIVITY_DATE_TIME) => EVENTS[2],
            (Datetime) EVENTS[3].get(AfTestConsts.ACTIVITY_DATE_TIME) => EVENTS[3],
            (Datetime) EVENTS[4].get(AfTestConsts.ACTIVITY_DATE_TIME) => EVENTS[4]
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Map<Datetime, String> expected2 = new Map<Datetime, String>{
            (Datetime) EVENTS[0].get(AfTestConsts.ACTIVITY_DATE_TIME) => (String) EVENTS[0].get(AfTestConsts.Event.Description),
            (Datetime) EVENTS[1].get(AfTestConsts.ACTIVITY_DATE_TIME) => (String) EVENTS[1].get(AfTestConsts.Event.Description),
            (Datetime) EVENTS[2].get(AfTestConsts.ACTIVITY_DATE_TIME) => (String) EVENTS[2].get(AfTestConsts.Event.Description),
            (Datetime) EVENTS[3].get(AfTestConsts.ACTIVITY_DATE_TIME) => (String) EVENTS[3].get(AfTestConsts.Event.Description),
            (Datetime) EVENTS[4].get(AfTestConsts.ACTIVITY_DATE_TIME) => (String) EVENTS[4].get(AfTestConsts.Event.Description)
        };
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
    }

    /**
     * @see SObjectCollectors.toByTimeMap
     */
    @IsTest
    static void toByTimeMap() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.ContactEmail.StartTime);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Time, SObject> actual = (Map<Time, SObject>) AfTestCommons.collect(SLOTS, SObjectCollectors.toByTimeMap(AfTestConsts.BEST_START_TIME));
        Map<Time, ContactPointEmail> actual1 = (Map<Time, ContactPointEmail>) AfTestCommons.collect(SLOTS, SObjectCollectors.toByTimeMap(AfTestConsts.ContactEmail.StartTime).cast(Map<Time, ContactPointEmail>.class));
        Map<Time, SObject> actual2 = (Map<Time, SObject>) AfTestCommons.collect(SLOTS, SObjectCollectors.toByTimeMap(keyMapper).cast(Map<Time, SObject>.class));
        Map<Time, Object> actual3 = (Map<Time, Object>) AfTestCommons.collect(SLOTS, SObjectCollectors.toByTimeMap(keyMapper, valueMapper));
        Map<Time, Object> actual4 = (Map<Time, Object>) AfTestCommons.collect(SLOTS, SObjectCollectors.toByTimeMap(keyMapper, valueMapper, mergeFunction));
        Map<Time, Time> actual5 = (Map<Time, Time>) AfTestCommons.collect(SLOTS, SObjectCollectors.toByTimeMap(AfTestConsts.BEST_START_TIME, AfTestConsts.BEST_END_TIME).cast(Map<Time, Time>.class));
        Map<Time, Time> actual6 = (Map<Time, Time>) AfTestCommons.collect(SLOTS, SObjectCollectors.toByTimeMap(AfTestConsts.ContactEmail.StartTime, AfTestConsts.ContactEmail.EndTime).cast(Map<Time, Time>.class));
        try {
            List<ContactPointEmail> input = new List<ContactPointEmail>(SLOTS);
            input.add(input[0]);
            AfTestCommons.collect(input, SObjectCollectors.toByTimeMap(AfTestConsts.BEST_START_TIME));
        } catch (Exception exc) {
            Assert.isTrue(exc.getMessage().contains(AfTestConsts.DUPLICATE_KEY));
        }
        // Then
        Map<Time, ContactPointEmail> expected = new Map<Time, ContactPointEmail>{
            (Time) SLOTS[0].get(AfTestConsts.BEST_START_TIME) => SLOTS[0],
            (Time) SLOTS[1].get(AfTestConsts.BEST_START_TIME) => SLOTS[1],
            (Time) SLOTS[2].get(AfTestConsts.BEST_START_TIME) => SLOTS[2],
            (Time) SLOTS[3].get(AfTestConsts.BEST_START_TIME) => SLOTS[3],
            (Time) SLOTS[4].get(AfTestConsts.BEST_START_TIME) => SLOTS[4]
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Map<Time, Time> expected2 = new Map<Time, Time>{
            (Time) SLOTS[0].get(AfTestConsts.BEST_START_TIME) => (Time) SLOTS[0].get(AfTestConsts.BEST_END_TIME),
            (Time) SLOTS[1].get(AfTestConsts.BEST_START_TIME) => (Time) SLOTS[1].get(AfTestConsts.BEST_END_TIME),
            (Time) SLOTS[2].get(AfTestConsts.BEST_START_TIME) => (Time) SLOTS[2].get(AfTestConsts.BEST_END_TIME),
            (Time) SLOTS[3].get(AfTestConsts.BEST_START_TIME) => (Time) SLOTS[3].get(AfTestConsts.BEST_END_TIME),
            (Time) SLOTS[4].get(AfTestConsts.BEST_START_TIME) => (Time) SLOTS[4].get(AfTestConsts.BEST_END_TIME)
        };
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
    }

    /**
     * @see SObjectCollectors.toByIntMap
     */
    @IsTest
    static void toByIntMap() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.NumberOfEmployees);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Integer, SObject> actual = (Map<Integer, SObject>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByIntMap(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Map<Integer, Account> actual1 = (Map<Integer, Account>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByIntMap(AfTestConsts.Account.NumberOfEmployees).cast(Map<Integer, Account>.class));
        Map<Integer, SObject> actual2 = (Map<Integer, SObject>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByIntMap(keyMapper).cast(Map<Integer, SObject>.class));
        Map<Integer, Object> actual3 = (Map<Integer, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByIntMap(keyMapper, valueMapper));
        Map<Integer, Object> actual4 = (Map<Integer, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByIntMap(keyMapper, valueMapper, mergeFunction));
        Map<Integer, String> actual5 = (Map<Integer, String>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByIntMap(AfTestConsts.NUMBER_OF_EMPLOYEES, AfTestConsts.NAME).cast(Map<Integer, String>.class));
        Map<Integer, String> actual6 = (Map<Integer, String>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByIntMap(AfTestConsts.Account.NumberOfEmployees, AfTestConsts.Account.Name).cast(Map<Integer, String>.class));
        try {
            List<Account> input = new List<Account>(ACCOUNTS);
            input.add(input[0]);
            AfTestCommons.collect(input, SObjectCollectors.toByIntMap(AfTestConsts.NUMBER_OF_EMPLOYEES));
        } catch (Exception exc) {
            Assert.isTrue(exc.getMessage().contains(AfTestConsts.DUPLICATE_KEY));
        }
        // Then
        Map<Integer, Account> expected = new Map<Integer, Account>{
            (Integer) ACCOUNTS[0].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[0],
            (Integer) ACCOUNTS[1].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[1],
            (Integer) ACCOUNTS[2].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[2],
            (Integer) ACCOUNTS[3].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[3],
            (Integer) ACCOUNTS[4].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[4],
            (Integer) ACCOUNTS[5].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[5],
            (Integer) ACCOUNTS[6].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[6],
            (Integer) ACCOUNTS[7].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[7],
            (Integer) ACCOUNTS[8].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[8],
            (Integer) ACCOUNTS[9].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[9]
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Map<Integer, String> expected2 = new Map<Integer, String>{
            (Integer) ACCOUNTS[0].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[0].get(AfTestConsts.Account.Name),
            (Integer) ACCOUNTS[1].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[1].get(AfTestConsts.Account.Name),
            (Integer) ACCOUNTS[2].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[2].get(AfTestConsts.Account.Name),
            (Integer) ACCOUNTS[3].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[3].get(AfTestConsts.Account.Name),
            (Integer) ACCOUNTS[4].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[4].get(AfTestConsts.Account.Name),
            (Integer) ACCOUNTS[5].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[5].get(AfTestConsts.Account.Name),
            (Integer) ACCOUNTS[6].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[6].get(AfTestConsts.Account.Name),
            (Integer) ACCOUNTS[7].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[7].get(AfTestConsts.Account.Name),
            (Integer) ACCOUNTS[8].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[8].get(AfTestConsts.Account.Name),
            (Integer) ACCOUNTS[9].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[9].get(AfTestConsts.Account.Name)
        };
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
    }

    /**
     * @see SObjectCollectors.toByLongMap
     */
    @IsTest
    static void toByLongMap() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.NumberOfEmployees);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Long, SObject> actual = (Map<Long, SObject>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByLongMap(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Map<Long, Account> actual1 = (Map<Long, Account>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByLongMap(AfTestConsts.Account.NumberOfEmployees).cast(Map<Long, Account>.class));
        Map<Long, SObject> actual2 = (Map<Long, SObject>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByLongMap(keyMapper).cast(Map<Long, SObject>.class));
        Map<Long, Object> actual3 = (Map<Long, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByLongMap(keyMapper, valueMapper));
        Map<Long, Object> actual4 = (Map<Long, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByLongMap(keyMapper, valueMapper, mergeFunction));
        Map<Long, String> actual5 = (Map<Long, String>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByLongMap(AfTestConsts.NUMBER_OF_EMPLOYEES, AfTestConsts.NAME).cast(Map<Long, String>.class));
        Map<Long, String> actual6 = (Map<Long, String>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByLongMap(AfTestConsts.Account.NumberOfEmployees, AfTestConsts.Account.Name).cast(Map<Long, String>.class));
        // Then
        Map<Long, Account> expected = new Map<Long, Account>{
            (Long) ACCOUNTS[0].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[0],
            (Long) ACCOUNTS[1].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[1],
            (Long) ACCOUNTS[2].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[2],
            (Long) ACCOUNTS[3].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[3],
            (Long) ACCOUNTS[4].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[4],
            (Long) ACCOUNTS[5].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[5],
            (Long) ACCOUNTS[6].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[6],
            (Long) ACCOUNTS[7].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[7],
            (Long) ACCOUNTS[8].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[8],
            (Long) ACCOUNTS[9].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[9]
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Map<Long, String> expected2 = new Map<Long, String>{
            (Long) ACCOUNTS[0].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[0].get(AfTestConsts.Account.Name),
            (Long) ACCOUNTS[1].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[1].get(AfTestConsts.Account.Name),
            (Long) ACCOUNTS[2].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[2].get(AfTestConsts.Account.Name),
            (Long) ACCOUNTS[3].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[3].get(AfTestConsts.Account.Name),
            (Long) ACCOUNTS[4].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[4].get(AfTestConsts.Account.Name),
            (Long) ACCOUNTS[5].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[5].get(AfTestConsts.Account.Name),
            (Long) ACCOUNTS[6].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[6].get(AfTestConsts.Account.Name),
            (Long) ACCOUNTS[7].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[7].get(AfTestConsts.Account.Name),
            (Long) ACCOUNTS[8].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[8].get(AfTestConsts.Account.Name),
            (Long) ACCOUNTS[9].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[9].get(AfTestConsts.Account.Name)
        };
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
    }

    /**
     * @see SObjectCollectors.toByDoubleMap
     */
    @IsTest
    static void toByDoubleMap() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.BillingLatitude);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Double, SObject> actual = (Map<Double, SObject>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByDoubleMap(AfTestConsts.BILLING_LATITUDE));
        Map<Double, Account> actual1 = (Map<Double, Account>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByDoubleMap(AfTestConsts.Account.BillingLatitude).cast(Map<Double, Account>.class));
        Map<Double, SObject> actual2 = (Map<Double, SObject>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByDoubleMap(keyMapper).cast(Map<Double, SObject>.class));
        Map<Double, Object> actual3 = (Map<Double, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByDoubleMap(keyMapper, valueMapper));
        Map<Double, Object> actual4 = (Map<Double, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByDoubleMap(keyMapper, valueMapper, mergeFunction));
        Map<Double, String> actual5 = (Map<Double, String>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByDoubleMap(AfTestConsts.BILLING_LATITUDE, AfTestConsts.NAME).cast(Map<Double, String>.class));
        Map<Double, String> actual6 = (Map<Double, String>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByDoubleMap(AfTestConsts.Account.BillingLatitude, AfTestConsts.Account.Name).cast(Map<Double, String>.class));
        // Then
        Map<Double, Account> expected = new Map<Double, Account>{
            (Double) ACCOUNTS[0].get(AfTestConsts.Account.BillingLatitude) => ACCOUNTS[0],
            (Double) ACCOUNTS[1].get(AfTestConsts.Account.BillingLatitude) => ACCOUNTS[1],
            (Double) ACCOUNTS[2].get(AfTestConsts.Account.BillingLatitude) => ACCOUNTS[2],
            (Double) ACCOUNTS[3].get(AfTestConsts.Account.BillingLatitude) => ACCOUNTS[3],
            (Double) ACCOUNTS[4].get(AfTestConsts.Account.BillingLatitude) => ACCOUNTS[4],
            (Double) ACCOUNTS[5].get(AfTestConsts.Account.BillingLatitude) => ACCOUNTS[5],
            (Double) ACCOUNTS[6].get(AfTestConsts.Account.BillingLatitude) => ACCOUNTS[6],
            (Double) ACCOUNTS[7].get(AfTestConsts.Account.BillingLatitude) => ACCOUNTS[7],
            (Double) ACCOUNTS[8].get(AfTestConsts.Account.BillingLatitude) => ACCOUNTS[8],
            (Double) ACCOUNTS[9].get(AfTestConsts.Account.BillingLatitude) => ACCOUNTS[9]
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Map<Double, String> expected2 = new Map<Double, String>{
            (Double) ACCOUNTS[0].get(AfTestConsts.Account.BillingLatitude) => (String) ACCOUNTS[0].get(AfTestConsts.Account.Name),
            (Double) ACCOUNTS[1].get(AfTestConsts.Account.BillingLatitude) => (String) ACCOUNTS[1].get(AfTestConsts.Account.Name),
            (Double) ACCOUNTS[2].get(AfTestConsts.Account.BillingLatitude) => (String) ACCOUNTS[2].get(AfTestConsts.Account.Name),
            (Double) ACCOUNTS[3].get(AfTestConsts.Account.BillingLatitude) => (String) ACCOUNTS[3].get(AfTestConsts.Account.Name),
            (Double) ACCOUNTS[4].get(AfTestConsts.Account.BillingLatitude) => (String) ACCOUNTS[4].get(AfTestConsts.Account.Name),
            (Double) ACCOUNTS[5].get(AfTestConsts.Account.BillingLatitude) => (String) ACCOUNTS[5].get(AfTestConsts.Account.Name),
            (Double) ACCOUNTS[6].get(AfTestConsts.Account.BillingLatitude) => (String) ACCOUNTS[6].get(AfTestConsts.Account.Name),
            (Double) ACCOUNTS[7].get(AfTestConsts.Account.BillingLatitude) => (String) ACCOUNTS[7].get(AfTestConsts.Account.Name),
            (Double) ACCOUNTS[8].get(AfTestConsts.Account.BillingLatitude) => (String) ACCOUNTS[8].get(AfTestConsts.Account.Name),
            (Double) ACCOUNTS[9].get(AfTestConsts.Account.BillingLatitude) => (String) ACCOUNTS[9].get(AfTestConsts.Account.Name)
        };
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
    }


    /**
     * @see SObjectCollectors.toByObjectMap
     */
    @IsTest
    static void toByObjectMap() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.NumberOfEmployees);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Object, SObject> actual = (Map<Object, SObject>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByObjectMap(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Map<Object, Account> actual1 = (Map<Object, Account>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByObjectMap(AfTestConsts.Account.NumberOfEmployees).cast(Map<Object, Account>.class));
        Map<Object, SObject> actual2 = (Map<Object, SObject>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByObjectMap(keyMapper).cast(Map<Object, SObject>.class));
        Map<Object, Object> actual3 = (Map<Object, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByObjectMap(keyMapper, valueMapper));
        Map<Object, Object> actual4 = (Map<Object, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByObjectMap(keyMapper, valueMapper, mergeFunction));
        Map<Object, String> actual5 = (Map<Object, String>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByObjectMap(AfTestConsts.NUMBER_OF_EMPLOYEES, AfTestConsts.NAME).cast(Map<Object, String>.class));
        Map<Object, String> actual6 = (Map<Object, String>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.toByObjectMap(AfTestConsts.Account.NumberOfEmployees, AfTestConsts.Account.Name).cast(Map<Object, String>.class));
        // Then
        Map<Object, Account> expected = new Map<Object, Account>{
            ACCOUNTS[0].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[0],
            ACCOUNTS[1].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[1],
            ACCOUNTS[2].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[2],
            ACCOUNTS[3].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[3],
            ACCOUNTS[4].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[4],
            ACCOUNTS[5].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[5],
            ACCOUNTS[6].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[6],
            ACCOUNTS[7].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[7],
            ACCOUNTS[8].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[8],
            ACCOUNTS[9].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => ACCOUNTS[9]
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Map<Object, String> expected2 = new Map<Object, String>{
            ACCOUNTS[0].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[0].get(AfTestConsts.Account.Name),
            ACCOUNTS[1].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[1].get(AfTestConsts.Account.Name),
            ACCOUNTS[2].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[2].get(AfTestConsts.Account.Name),
            ACCOUNTS[3].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[3].get(AfTestConsts.Account.Name),
            ACCOUNTS[4].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[4].get(AfTestConsts.Account.Name),
            ACCOUNTS[5].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[5].get(AfTestConsts.Account.Name),
            ACCOUNTS[6].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[6].get(AfTestConsts.Account.Name),
            ACCOUNTS[7].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[7].get(AfTestConsts.Account.Name),
            ACCOUNTS[8].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[8].get(AfTestConsts.Account.Name),
            ACCOUNTS[9].get(AfTestConsts.NUMBER_OF_EMPLOYEES) => (String) ACCOUNTS[9].get(AfTestConsts.Account.Name)
        };
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
    }

    /**
     * @see SObjectCollectors.groupingByBool
     */
    @IsTest
    static void groupingByBool() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Contact.DoNotCall);
        Collector downstream = SObjectCollectors.toList(AfTestConsts.Contact.LastName);
        // When
        Map<Boolean, List<Contact>> actual = (Map<Boolean,  List<Contact>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByBool(AfTestConsts.Contact.DoNotCall));
        Map<Boolean, List<Contact>> actual1 = (Map<Boolean, List<Contact>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByBool(AfTestConsts.DO_NOT_CALL));
        Map<Boolean, List<SObject>> actual2 = (Map<Boolean, List<SObject>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByBool(keyMapper).cast(Map<Boolean, List<SObject>>.class));
        Map<Boolean, List<String>> actual3 = (Map<Boolean, List<String>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByBool(AfTestConsts.Contact.DoNotCall, AfTestConsts.Contact.LastName).cast(Map<Boolean, List<String>>.class));
        Map<Boolean, Object> actual4 = (Map<Boolean, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByBool(AfTestConsts.DO_NOT_CALL, AfTestConsts.LAST_NAME));
        Map<Boolean, Object> actual5 = (Map<Boolean, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByBool(keyMapper, downstream));
        Map<Boolean, List<String>> actual6 = (Map<Boolean, List<String>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByBool(keyMapper, Supplier.of(Map<Boolean, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Boolean, Map<Boolean, List<String>>> actual7 = (Map<Boolean, Map<Boolean, List<String>>>)
            AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByBool(keyMapper, SObjectCollectors.groupingByBool(AfTestConsts.Contact.HasOptedOutOfEmail, AfTestConsts.Contact.LastName)).cast(Map<Boolean, Map<Boolean, List<String>>>.class));
        Map<Boolean, Object> actual8 = (Map<Boolean, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByBool(keyMapper, SObjectCollectors.groupingByBool(AfTestConsts.HAS_OPTED_OUT_OF_EMAIL, AfTestConsts.LAST_NAME)));
        // Then
        Map<Boolean, List<Contact>> expected = new Map<Boolean, List<Contact>>{
            true => new List<Contact>{ CONTACTS[0], CONTACTS[2] },
            false => new List<Contact>{ CONTACTS[1], CONTACTS[3] },
            null => new List<Contact>{ CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Boolean, List<String>> expected1 = new Map<Boolean, List<String>>{
            true => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) },
            false => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Map<Boolean, Map<Boolean, List<String>>> expected2 = new Map<Boolean, Map<Boolean, List<String>>>{
            true => new Map<Boolean, List<String>>{ true => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) } },
            false => new Map<Boolean, List<String>>{ true => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) }, false => new List<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) } },
            null => new Map<Boolean, List<String>>{ false => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) } }
        };
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
    }

    /**
     * @see SObjectCollectors.groupingById
     */
    @IsTest
    static void groupingById() {
        // Given
        CONTACTS[0].AccountId = ACCOUNTS[0].Id;
        CONTACTS[1].AccountId = ACCOUNTS[0].Id;
        CONTACTS[2].AccountId = ACCOUNTS[1].Id;
        CONTACTS[3].AccountId = ACCOUNTS[1].Id;
        CONTACTS[4].AccountId = null;
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Contact.AccountId);
        Collector downstream = SObjectCollectors.toList(AfTestConsts.Contact.LastName);
        // When
        Map<Id, List<Contact>> actual = (Map<Id,  List<Contact>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingById(AfTestConsts.Contact.AccountId));
        Map<Id, List<Contact>> actual1 = (Map<Id, List<Contact>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingById(AfTestConsts.ACCOUNT_ID));
        Map<Id, List<SObject>> actual2 = (Map<Id, List<SObject>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingById(keyMapper).cast(Map<Id, List<SObject>>.class));
        Map<Id, List<String>> actual3 = (Map<Id, List<String>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingById(AfTestConsts.Contact.AccountId, AfTestConsts.Contact.LastName).cast(Map<Id, List<String>>.class));
        Map<Id, Object> actual4 = (Map<Id, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingById(AfTestConsts.ACCOUNT_ID, AfTestConsts.LAST_NAME));
        Map<Id, Object> actual5 = (Map<Id, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingById(keyMapper, downstream));
        Map<Id, List<String>> actual6 = (Map<Id, List<String>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingById(keyMapper, Supplier.of(Map<Id, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Id, Map<Id, List<String>>> actual7 = (Map<Id, Map<Id, List<String>>>)
            AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingById(keyMapper, SObjectCollectors.groupingById(AfTestConsts.Contact.Id, AfTestConsts.Contact.LastName)).cast(Map<Id, Map<Id, List<String>>>.class));
        Map<Id, Object> actual8 = (Map<Id, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingById(keyMapper, SObjectCollectors.groupingById(AfTestConsts.ID, AfTestConsts.LAST_NAME)));
        // Then
        Map<Id, List<Contact>> expected = new Map<Id, List<Contact>>{
            ACCOUNTS[0].Id => new List<Contact>{ CONTACTS[0], CONTACTS[1] },
            ACCOUNTS[1].Id => new List<Contact>{ CONTACTS[2], CONTACTS[3] },
            null => new List<Contact>{ CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Id, List<String>> expected1 = new Map<Id, List<String>>{
            ACCOUNTS[0].Id => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) },
            ACCOUNTS[1].Id => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Map<Id, Map<Id, List<String>>> expected2 = new Map<Id, Map<Id, List<String>>>{
            ACCOUNTS[0].Id => new Map<Id, List<String>>{ CONTACTS[0].Id => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME) }, CONTACTS[1].Id => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) } },
            ACCOUNTS[1].Id => new Map<Id, List<String>>{ CONTACTS[2].Id => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) }, CONTACTS[3].Id => new List<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) } },
            null => new Map<Id, List<String>>{ CONTACTS[4].Id => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) } }
        };
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
    }

    /**
     * @see SObjectCollectors.groupingByString
     */
    @IsTest
    static void groupingByString() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Contact.OtherCountry);
        Collector downstream = SObjectCollectors.toList(AfTestConsts.Contact.LastName);
        // When
        Map<String, List<Contact>> actual = (Map<String,  List<Contact>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByString(AfTestConsts.Contact.OtherCountry));
        Map<String, List<Contact>> actual1 = (Map<String, List<Contact>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByString(AfTestConsts.OTHER_COUNTRY));
        Map<String, List<SObject>> actual2 = (Map<String, List<SObject>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByString(keyMapper).cast(Map<String, List<SObject>>.class));
        Map<String, List<String>> actual3 = (Map<String, List<String>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByString(AfTestConsts.Contact.OtherCountry, AfTestConsts.Contact.LastName).cast(Map<String, List<String>>.class));
        Map<String, Object> actual4 = (Map<String, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByString(AfTestConsts.OTHER_COUNTRY, AfTestConsts.LAST_NAME));
        Map<String, Object> actual5 = (Map<String, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByString(keyMapper, downstream));
        Map<String, List<String>> actual6 = (Map<String, List<String>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByString(keyMapper, Supplier.of(Map<String, List<String>>.class), downstream.cast(List<String>.class)));
        Map<String, Map<String, List<String>>> actual7 = (Map<String, Map<String, List<String>>>)
            AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByString(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.Contact.OtherCity, AfTestConsts.Contact.LastName)).cast(Map<String, Map<String, List<String>>>.class));
        Map<String, Object> actual8 = (Map<String, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByString(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.OTHER_CITY, AfTestConsts.LAST_NAME)));
        // Then
        Map<String, List<Contact>> expected = new Map<String, List<Contact>>{
            AfTestConsts.FRANCE => new List<Contact>{ CONTACTS[0], CONTACTS[1] },
            AfTestConsts.UK => new List<Contact>{ CONTACTS[2], CONTACTS[3] },
            null => new List<Contact>{ CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<String, List<String>> expected1 = new Map<String, List<String>>{
            AfTestConsts.FRANCE => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) },
            AfTestConsts.UK => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Map<String, Map<String, List<String>>> expected2 = new Map<String, Map<String, List<String>>>{
            AfTestConsts.FRANCE => new Map<String, List<String>>{ AfTestConsts.PARIS => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME) }, AfTestConsts.LYON => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) } },
            AfTestConsts.UK => new Map<String, List<String>>{ AfTestConsts.LONDON => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) }, AfTestConsts.BRISTOL => new List<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) } }
        };
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
    }

    /**
     * @see SObjectCollectors.groupingByBlob
     */
    @IsTest
    static void groupingByBlob() {
        // Given
        ATTACHMENTS[0].Body = ATTACHMENTS[0].Body;
        ATTACHMENTS[1].Body = ATTACHMENTS[1].Body;
        ATTACHMENTS[2].Body = ATTACHMENTS[0].Body;
        ATTACHMENTS[3].Body = ATTACHMENTS[1].Body;
        ATTACHMENTS[4].Body = ATTACHMENTS[0].Body;
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Attachment.Body);
        Collector downstream = SObjectCollectors.toList(AfTestConsts.Attachment.Name);
        // When
        Map<Blob, List<Attachment>> actual = (Map<Blob,  List<Attachment>>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.groupingByBlob(AfTestConsts.Attachment.Body));
        Map<Blob, List<Attachment>> actual1 = (Map<Blob, List<Attachment>>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.groupingByBlob(AfTestConsts.BODY));
        Map<Blob, List<SObject>> actual2 = (Map<Blob, List<SObject>>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.groupingByBlob(keyMapper).cast(Map<Blob, List<SObject>>.class));
        Map<Blob, List<String>> actual3 = (Map<Blob, List<String>>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.groupingByBlob(AfTestConsts.Attachment.Body, AfTestConsts.Attachment.Name).cast(Map<Blob, List<String>>.class));
        Map<Blob, Object> actual4 = (Map<Blob, Object>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.groupingByBlob(AfTestConsts.BODY, AfTestConsts.NAME));
        Map<Blob, Object> actual5 = (Map<Blob, Object>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.groupingByBlob(keyMapper, downstream));
        Map<Blob, List<String>> actual6 = (Map<Blob, List<String>>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.groupingByBlob(keyMapper, Supplier.of(Map<Blob, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Blob, Map<String, List<String>>> actual7 = (Map<Blob, Map<String, List<String>>>)
            AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.groupingByBlob(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.Attachment.ContentType, AfTestConsts.Attachment.Name)).cast(Map<Blob, Map<String, List<String>>>.class));
        Map<Blob, Object> actual8 = (Map<Blob, Object>) AfTestCommons.collect(ATTACHMENTS, SObjectCollectors.groupingByBlob(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.CONTENT_TYPE, AfTestConsts.NAME)));
        // Then
        Map<Blob, List<Attachment>> expected = new Map<Blob, List<Attachment>>{
            ATTACHMENTS[0].Body => new List<Attachment>{ ATTACHMENTS[0], ATTACHMENTS[2], ATTACHMENTS[4] },
            ATTACHMENTS[1].Body => new List<Attachment>{ ATTACHMENTS[1], ATTACHMENTS[3] },
            null => new List<Attachment>{ ATTACHMENTS[5] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Blob, List<String>> expected1 = new Map<Blob, List<String>>{
            ATTACHMENTS[0].Body => new List<String>{ (String) ATTACHMENTS[0].get(AfTestConsts.NAME), (String) ATTACHMENTS[2].get(AfTestConsts.NAME), (String) ATTACHMENTS[4].get(AfTestConsts.NAME) },
            ATTACHMENTS[1].Body => new List<String>{ (String) ATTACHMENTS[1].get(AfTestConsts.NAME), (String) ATTACHMENTS[3].get(AfTestConsts.NAME) },
            null => new List<String>{ (String) ATTACHMENTS[5].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Map<Blob, Map<String, List<String>>> expected2 = new Map<Blob, Map<String, List<String>>>{
            ATTACHMENTS[0].Body => new Map<String, List<String>>{
                AfTestConsts.DOC => new List<String>{ (String) ATTACHMENTS[0].get(AfTestConsts.NAME), (String) ATTACHMENTS[2].get(AfTestConsts.NAME) },
                AfTestConsts.PDF => new List<String>{ (String) ATTACHMENTS[4].get(AfTestConsts.NAME) }
            },
            ATTACHMENTS[1].Body => new Map<String, List<String>>{
                AfTestConsts.DOC => new List<String>{ (String) ATTACHMENTS[1].get(AfTestConsts.NAME) },
                AfTestConsts.PDF => new List<String>{ (String) ATTACHMENTS[3].get(AfTestConsts.NAME) }
            },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) ATTACHMENTS[5].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
    }

    /**
     * @see SObjectCollectors.groupingByDate
     */
    @IsTest
    static void groupingByDate() {
        // Given
        CONTACTS[0].Birthdate = CONTACTS[0].Birthdate;
        CONTACTS[1].Birthdate = CONTACTS[1].Birthdate;
        CONTACTS[2].Birthdate = CONTACTS[0].Birthdate;
        CONTACTS[3].Birthdate = CONTACTS[1].Birthdate;
        CONTACTS[4].Birthdate = null;
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Contact.Birthdate);
        Collector downstream = SObjectCollectors.toList(AfTestConsts.Contact.LastName);
        // When
        Map<Date, List<Contact>> actual = (Map<Date,  List<Contact>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByDate(AfTestConsts.Contact.Birthdate));
        Map<Date, List<Contact>> actual1 = (Map<Date, List<Contact>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByDate(AfTestConsts.BIRTHDATE));
        Map<Date, List<SObject>> actual2 = (Map<Date, List<SObject>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByDate(keyMapper).cast(Map<Date, List<SObject>>.class));
        Map<Date, List<String>> actual3 = (Map<Date, List<String>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByDate(AfTestConsts.Contact.Birthdate, AfTestConsts.Contact.LastName).cast(Map<Date, List<String>>.class));
        Map<Date, Object> actual4 = (Map<Date, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByDate(AfTestConsts.BIRTHDATE, AfTestConsts.LAST_NAME));
        Map<Date, Object> actual5 = (Map<Date, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByDate(keyMapper, downstream));
        Map<Date, List<String>> actual6 = (Map<Date, List<String>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByDate(keyMapper, Supplier.of(Map<Date, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Date, Map<String, List<String>>> actual7 = (Map<Date, Map<String, List<String>>>)
            AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByDate(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.Contact.Department, AfTestConsts.Contact.LastName)).cast(Map<Date, Map<String, List<String>>>.class));
        Map<Date, Object> actual8 = (Map<Date, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.groupingByDate(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.DEPARTMENT, AfTestConsts.LAST_NAME)));
        // Then
        Map<Date, List<Contact>> expected = new Map<Date, List<Contact>>{
            CONTACTS[0].Birthdate => new List<Contact>{ CONTACTS[0], CONTACTS[2] },
            CONTACTS[1].Birthdate => new List<Contact>{ CONTACTS[1], CONTACTS[3] },
            null => new List<Contact>{ CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Date, List<String>> expected1 = new Map<Date, List<String>>{
            CONTACTS[0].Birthdate => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) },
            CONTACTS[1].Birthdate => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Map<Date, Map<String, List<String>>> expected2 = new Map<Date, Map<String, List<String>>>{
            CONTACTS[0].Birthdate => new Map<String, List<String>>{ AfTestConsts.HR => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME) }, AfTestConsts.FINANCE => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) } },
            CONTACTS[1].Birthdate => new Map<String, List<String>>{ AfTestConsts.HR => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) }, AfTestConsts.FINANCE => new List<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) } }
        };
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
    }

    /**
     * @see SObjectCollectors.groupingByDatetime
     */
    @IsTest
    static void groupingByDatetime() {
        // Given
        EVENTS[0].ActivityDateTime = EVENTS[0].ActivityDateTime;
        EVENTS[1].ActivityDateTime = EVENTS[1].ActivityDateTime;
        EVENTS[2].ActivityDateTime = EVENTS[0].ActivityDateTime;
        EVENTS[3].ActivityDateTime = EVENTS[1].ActivityDateTime;
        EVENTS[4].ActivityDateTime = null;
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Event.ActivityDateTime);
        Collector downstream = SObjectCollectors.toList(AfTestConsts.Event.Description);
        // When
        Map<Datetime, List<Event>> actual = (Map<Datetime,  List<Event>>) AfTestCommons.collect(EVENTS, SObjectCollectors.groupingByDatetime(AfTestConsts.Event.ActivityDateTime));
        Map<Datetime, List<Event>> actual1 = (Map<Datetime, List<Event>>) AfTestCommons.collect(EVENTS, SObjectCollectors.groupingByDatetime(AfTestConsts.ACTIVITY_DATE_TIME));
        Map<Datetime, List<SObject>> actual2 = (Map<Datetime, List<SObject>>) AfTestCommons.collect(EVENTS, SObjectCollectors.groupingByDatetime(keyMapper).cast(Map<Datetime, List<SObject>>.class));
        Map<Datetime, List<String>> actual3 = (Map<Datetime, List<String>>) AfTestCommons.collect(EVENTS, SObjectCollectors.groupingByDatetime(AfTestConsts.Event.ActivityDateTime, AfTestConsts.Event.Description).cast(Map<Datetime, List<String>>.class));
        Map<Datetime, Object> actual4 = (Map<Datetime, Object>) AfTestCommons.collect(EVENTS, SObjectCollectors.groupingByDatetime(AfTestConsts.ACTIVITY_DATE_TIME, AfTestConsts.DESCRIPTION));
        Map<Datetime, Object> actual5 = (Map<Datetime, Object>) AfTestCommons.collect(EVENTS, SObjectCollectors.groupingByDatetime(keyMapper, downstream));
        Map<Datetime, List<String>> actual6 = (Map<Datetime, List<String>>) AfTestCommons.collect(EVENTS, SObjectCollectors.groupingByDatetime(keyMapper, Supplier.of(Map<Datetime, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Datetime, Map<String, List<String>>> actual7 = (Map<Datetime, Map<String, List<String>>>)
            AfTestCommons.collect(EVENTS, SObjectCollectors.groupingByDatetime(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.Event.Type, AfTestConsts.Event.Description)).cast(Map<Datetime, Map<String, List<String>>>.class));
        Map<Datetime, Object> actual8 = (Map<Datetime, Object>) AfTestCommons.collect(EVENTS, SObjectCollectors.groupingByDatetime(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.TYPE, AfTestConsts.DESCRIPTION)));
        // Then
        Map<Datetime, List<Event>> expected = new Map<Datetime, List<Event>>{
            EVENTS[0].ActivityDateTime => new List<Event>{ EVENTS[0], EVENTS[2] },
            EVENTS[1].ActivityDateTime => new List<Event>{ EVENTS[1], EVENTS[3] },
            null => new List<Event>{ EVENTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Datetime, List<String>> expected1 = new Map<Datetime, List<String>>{
            EVENTS[0].ActivityDateTime => new List<String>{ (String) EVENTS[0].get(AfTestConsts.DESCRIPTION), (String) EVENTS[2].get(AfTestConsts.DESCRIPTION) },
            EVENTS[1].ActivityDateTime => new List<String>{ (String) EVENTS[1].get(AfTestConsts.DESCRIPTION), (String) EVENTS[3].get(AfTestConsts.DESCRIPTION) },
            null => new List<String>{ (String) EVENTS[4].get(AfTestConsts.DESCRIPTION) }
        };
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Map<Datetime, Map<String, List<String>>> expected2 = new Map<Datetime, Map<String, List<String>>>{
            EVENTS[0].ActivityDateTime => new Map<String, List<String>>{ AfTestConsts.CALL => new List<String>{ (String) EVENTS[0].get(AfTestConsts.DESCRIPTION) }, AfTestConsts.EMAIL => new List<String>{ (String) EVENTS[2].get(AfTestConsts.DESCRIPTION) } },
            EVENTS[1].ActivityDateTime => new Map<String, List<String>>{ AfTestConsts.CALL => new List<String>{ (String) EVENTS[1].get(AfTestConsts.DESCRIPTION) }, AfTestConsts.EMAIL => new List<String>{ (String) EVENTS[3].get(AfTestConsts.DESCRIPTION) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) EVENTS[4].get(AfTestConsts.DESCRIPTION) } }
        };
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
    }

    /**
     * @see SObjectCollectors.groupingByTime
     */
    @IsTest
    static void groupingByTime() {
        // Given
        SLOTS[0].BestTimeToContactStartTime = SLOTS[0].BestTimeToContactStartTime;
        SLOTS[1].BestTimeToContactStartTime = SLOTS[1].BestTimeToContactStartTime;
        SLOTS[2].BestTimeToContactStartTime = SLOTS[0].BestTimeToContactStartTime;
        SLOTS[3].BestTimeToContactStartTime = SLOTS[1].BestTimeToContactStartTime;
        SLOTS[4].BestTimeToContactStartTime = null;
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.ContactEmail.StartTime);
        Collector downstream = SObjectCollectors.toList(AfTestConsts.ContactEmail.Id);
        // When
        Map<Time, List<ContactPointEmail>> actual = (Map<Time, List<ContactPointEmail>>) AfTestCommons.collect(SLOTS, SObjectCollectors.groupingByTime(AfTestConsts.ContactEmail.StartTime));
        Map<Time, List<ContactPointEmail>> actual1 = (Map<Time, List<ContactPointEmail>>) AfTestCommons.collect(SLOTS, SObjectCollectors.groupingByTime(AfTestConsts.BEST_START_TIME));
        Map<Time, List<SObject>> actual2 = (Map<Time, List<SObject>>) AfTestCommons.collect(SLOTS, SObjectCollectors.groupingByTime(keyMapper).cast(Map<Time, List<SObject>>.class));
        Map<Time, List<Id>> actual3 = (Map<Time, List<Id>>) AfTestCommons.collect(SLOTS, SObjectCollectors.groupingByTime(AfTestConsts.ContactEmail.StartTime, AfTestConsts.ContactEmail.Id).cast(Map<Time, List<Id>>.class));
        Map<Time, Object> actual4 = (Map<Time, Object>) AfTestCommons.collect(SLOTS, SObjectCollectors.groupingByTime(AfTestConsts.BEST_START_TIME, AfTestConsts.ID));
        Map<Time, Object> actual5 = (Map<Time, Object>) AfTestCommons.collect(SLOTS, SObjectCollectors.groupingByTime(keyMapper, downstream));
        Map<Time, List<Id>> actual6 = (Map<Time, List<Id>>) AfTestCommons.collect(SLOTS, SObjectCollectors.groupingByTime(keyMapper, Supplier.of(Map<Time, List<Id>>.class), downstream.cast(List<Id>.class)));
        Map<Time, Map<String, List<Id>>> actual7 = (Map<Time, Map<String, List<Id>>>)
            AfTestCommons.collect(SLOTS, SObjectCollectors.groupingByTime(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.ContactEmail.Address, AfTestConsts.ContactEmail.Id)).cast(Map<Time, Map<String, List<Id>>>.class));
        Map<Time, Object> actual8 = (Map<Time, Object>) AfTestCommons.collect(SLOTS, SObjectCollectors.groupingByTime(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.EMAIL_ADDRESS, AfTestConsts.ID)));
        // Then
        Map<Time, List<ContactPointEmail>> expected = new Map<Time, List<ContactPointEmail>>{
            SLOTS[0].BestTimeToContactStartTime => new List<ContactPointEmail>{ SLOTS[0], SLOTS[2] },
            SLOTS[1].BestTimeToContactStartTime => new List<ContactPointEmail>{ SLOTS[1], SLOTS[3] },
            null => new List<ContactPointEmail>{ SLOTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Time, List<Id>> expected1 = new Map<Time, List<Id>>{
            SLOTS[0].BestTimeToContactStartTime => new List<Id>{ (Id) SLOTS[0].get(AfTestConsts.ID), (Id) SLOTS[2].get(AfTestConsts.ID) },
            SLOTS[1].BestTimeToContactStartTime => new List<Id>{ (Id) SLOTS[1].get(AfTestConsts.ID), (Id) SLOTS[3].get(AfTestConsts.ID) },
            null => new List<Id>{ (Id) SLOTS[4].get(AfTestConsts.ID) }
        };
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Map<Time, Map<String, List<Id>>> expected2 = new Map<Time, Map<String, List<Id>>>{
            SLOTS[0].BestTimeToContactStartTime => new Map<String, List<Id>>{ AfTestConsts.NORMAL => new List<Id>{ (Id) SLOTS[0].get(AfTestConsts.ID) }, AfTestConsts.EXTENDED => new List<Id>{ (Id) SLOTS[2].get(AfTestConsts.ID) } },
            SLOTS[1].BestTimeToContactStartTime => new Map<String, List<Id>>{ AfTestConsts.NORMAL => new List<Id>{ (Id) SLOTS[1].get(AfTestConsts.ID) }, AfTestConsts.EXTENDED => new List<Id>{ (Id) SLOTS[3].get(AfTestConsts.ID) } },
            null => new Map<String, List<Id>>{ null => new List<Id>{ (Id) SLOTS[4].get(AfTestConsts.ID) } }
        };
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
    }

    /**
     * @see SObjectCollectors.groupingByInt
     */
    @IsTest
    static void groupingByInt() {
        // Given
        ACCOUNTS[0].NumberOfEmployees = ACCOUNTS[0].NumberOfEmployees;
        ACCOUNTS[1].NumberOfEmployees = ACCOUNTS[1].NumberOfEmployees;
        ACCOUNTS[2].NumberOfEmployees = ACCOUNTS[0].NumberOfEmployees;
        ACCOUNTS[3].NumberOfEmployees = ACCOUNTS[1].NumberOfEmployees;
        ACCOUNTS[4].NumberOfEmployees = null;
        ACCOUNTS.remove(9);
        ACCOUNTS.remove(8);
        ACCOUNTS.remove(7);
        ACCOUNTS.remove(6);
        ACCOUNTS.remove(5);
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.NumberOfEmployees);
        Collector downstream = SObjectCollectors.toList(AfTestConsts.Account.Name);
        // When
        Map<Integer, List<Account>> actual = (Map<Integer, List<Account>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByInt(AfTestConsts.Account.NumberOfEmployees));
        Map<Integer, List<Account>> actual1 = (Map<Integer, List<Account>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByInt(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Map<Integer, List<SObject>> actual2 = (Map<Integer, List<SObject>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByInt(keyMapper).cast(Map<Integer, List<SObject>>.class));
        Map<Integer, List<String>> actual3 = (Map<Integer, List<String>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByInt(AfTestConsts.Account.NumberOfEmployees, AfTestConsts.Account.Name).cast(Map<Integer, List<String>>.class));
        Map<Integer, Object> actual4 = (Map<Integer, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByInt(AfTestConsts.NUMBER_OF_EMPLOYEES, AfTestConsts.NAME));
        Map<Integer, Object> actual5 = (Map<Integer, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByInt(keyMapper, downstream));
        Map<Integer, List<String>> actual6 = (Map<Integer, List<String>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByInt(keyMapper, Supplier.of(Map<Integer, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Integer, Map<String, List<String>>> actual7 = (Map<Integer, Map<String, List<String>>>)
            AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByInt(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.Account.Type, AfTestConsts.Account.Name)).cast(Map<Integer, Map<String, List<String>>>.class));
        Map<Integer, Object> actual8 = (Map<Integer, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByInt(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.TYPE, AfTestConsts.NAME)));
        // Then
        Map<Integer, List<Account>> expected = new Map<Integer, List<Account>>{
            ACCOUNTS[0].NumberOfEmployees => new List<Account>{ ACCOUNTS[0], ACCOUNTS[2] },
            ACCOUNTS[1].NumberOfEmployees => new List<Account>{ ACCOUNTS[1], ACCOUNTS[3] },
            null => new List<Account>{ ACCOUNTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Integer, List<String>> expected1 = new Map<Integer, List<String>>{
            ACCOUNTS[0].NumberOfEmployees => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME), (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[1].NumberOfEmployees => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME), (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Map<Integer, Map<String, List<String>>> expected2 = new Map<Integer, Map<String, List<String>>>{
            ACCOUNTS[0].NumberOfEmployees => new Map<String, List<String>>{ AfTestConsts.CUSTOMER => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) }, AfTestConsts.PARTNER => new List<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) } },
            ACCOUNTS[1].NumberOfEmployees => new Map<String, List<String>>{ AfTestConsts.CUSTOMER => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) }, AfTestConsts.PARTNER => new List<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
    }

    /**
     * @see SObjectCollectors.groupingByLong
     */
    @IsTest
    static void groupingByLong() {
        // Given
        ACCOUNTS[0].NumberOfEmployees = ACCOUNTS[0].NumberOfEmployees;
        ACCOUNTS[1].NumberOfEmployees = ACCOUNTS[1].NumberOfEmployees;
        ACCOUNTS[2].NumberOfEmployees = ACCOUNTS[0].NumberOfEmployees;
        ACCOUNTS[3].NumberOfEmployees = ACCOUNTS[1].NumberOfEmployees;
        ACCOUNTS[4].NumberOfEmployees = null;
        ACCOUNTS.remove(9);
        ACCOUNTS.remove(8);
        ACCOUNTS.remove(7);
        ACCOUNTS.remove(6);
        ACCOUNTS.remove(5);
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.NumberOfEmployees);
        Collector downstream = SObjectCollectors.toList(AfTestConsts.Account.Name);
        // When
        Map<Long, List<Account>> actual = (Map<Long, List<Account>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByLong(AfTestConsts.Account.NumberOfEmployees));
        Map<Long, List<Account>> actual1 = (Map<Long, List<Account>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByLong(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Map<Long, List<SObject>> actual2 = (Map<Long, List<SObject>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByLong(keyMapper).cast(Map<Long, List<SObject>>.class));
        Map<Long, List<String>> actual3 = (Map<Long, List<String>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByLong(AfTestConsts.Account.NumberOfEmployees, AfTestConsts.Account.Name).cast(Map<Long, List<String>>.class));
        Map<Long, Object> actual4 = (Map<Long, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByLong(AfTestConsts.NUMBER_OF_EMPLOYEES, AfTestConsts.NAME));
        Map<Long, Object> actual5 = (Map<Long, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByLong(keyMapper, downstream));
        Map<Long, List<String>> actual6 = (Map<Long, List<String>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByLong(keyMapper, Supplier.of(Map<Long, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Long, Map<String, List<String>>> actual7 = (Map<Long, Map<String, List<String>>>)
            AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByLong(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.Account.Type, AfTestConsts.Account.Name)).cast(Map<Long, Map<String, List<String>>>.class));
        Map<Long, Object> actual8 = (Map<Long, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByLong(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.TYPE, AfTestConsts.NAME)));
        // Then
        Map<Long, List<Account>> expected = new Map<Long, List<Account>>{
            ACCOUNTS[0].NumberOfEmployees => new List<Account>{ ACCOUNTS[0], ACCOUNTS[2] },
            ACCOUNTS[1].NumberOfEmployees => new List<Account>{ ACCOUNTS[1], ACCOUNTS[3] },
            null => new List<Account>{ ACCOUNTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Long, List<String>> expected1 = new Map<Long, List<String>>{
            ACCOUNTS[0].NumberOfEmployees => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME), (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[1].NumberOfEmployees => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME), (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Map<Long, Map<String, List<String>>> expected2 = new Map<Long, Map<String, List<String>>>{
            ACCOUNTS[0].NumberOfEmployees => new Map<String, List<String>>{ AfTestConsts.CUSTOMER => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) }, AfTestConsts.PARTNER => new List<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) } },
            ACCOUNTS[1].NumberOfEmployees => new Map<String, List<String>>{ AfTestConsts.CUSTOMER => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) }, AfTestConsts.PARTNER => new List<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
    }

    /**
     * @see SObjectCollectors.groupingByDouble
     */
    @IsTest
    static void groupingByDouble() {
        // Given
        ACCOUNTS[0].BillingLatitude = ACCOUNTS[0].BillingLatitude;
        ACCOUNTS[1].BillingLatitude = ACCOUNTS[1].BillingLatitude;
        ACCOUNTS[2].BillingLatitude = ACCOUNTS[0].BillingLatitude;
        ACCOUNTS[3].BillingLatitude = ACCOUNTS[1].BillingLatitude;
        ACCOUNTS[4].BillingLatitude = null;
        ACCOUNTS.remove(9);
        ACCOUNTS.remove(8);
        ACCOUNTS.remove(7);
        ACCOUNTS.remove(6);
        ACCOUNTS.remove(5);
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.BillingLatitude);
        Collector downstream = SObjectCollectors.toList(AfTestConsts.Account.Name);
        // When
        Map<Double, List<Account>> actual = (Map<Double,  List<Account>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByDouble(AfTestConsts.Account.BillingLatitude));
        Map<Double, List<Account>> actual1 = (Map<Double, List<Account>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByDouble(AfTestConsts.BILLING_LATITUDE));
        Map<Double, List<SObject>> actual2 = (Map<Double, List<SObject>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByDouble(keyMapper).cast(Map<Double, List<SObject>>.class));
        Map<Double, List<String>> actual3 = (Map<Double, List<String>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByDouble(AfTestConsts.Account.BillingLatitude, AfTestConsts.Account.Name).cast(Map<Double, List<String>>.class));
        Map<Double, Object> actual4 = (Map<Double, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByDouble(AfTestConsts.BILLING_LATITUDE, AfTestConsts.NAME));
        Map<Double, Object> actual5 = (Map<Double, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByDouble(keyMapper, downstream));
        Map<Double, List<String>> actual6 = (Map<Double, List<String>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByDouble(keyMapper, Supplier.of(Map<Double, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Double, Map<String, List<String>>> actual7 = (Map<Double, Map<String, List<String>>>)
            AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByDouble(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.Account.BillingCountry, AfTestConsts.Account.Name)).cast(Map<Double, Map<String, List<String>>>.class));
        Map<Double, Object> actual8 = (Map<Double, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByDouble(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.BILLING_COUNTRY, AfTestConsts.NAME)));
        // Then
        Map<Double, List<Account>> expected = new Map<Double, List<Account>>{
            ACCOUNTS[0].BillingLatitude => new List<Account>{ ACCOUNTS[0], ACCOUNTS[2] },
            ACCOUNTS[1].BillingLatitude => new List<Account>{ ACCOUNTS[1], ACCOUNTS[3] },
            null => new List<Account>{ ACCOUNTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Double, List<String>> expected1 = new Map<Double, List<String>>{
            ACCOUNTS[0].BillingLatitude => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME), (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[1].BillingLatitude => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME), (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Map<Double, Map<String, List<String>>> expected2 = new Map<Double, Map<String, List<String>>>{
            ACCOUNTS[0].BillingLatitude => new Map<String, List<String>>{ AfTestConsts.FRANCE => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) }, AfTestConsts.UK => new List<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) } },
            ACCOUNTS[1].BillingLatitude => new Map<String, List<String>>{ AfTestConsts.FRANCE => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) }, AfTestConsts.UK => new List<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
    }

    /**
     * @see SObjectCollectors.groupingByObject
     */
    @IsTest
    static void groupingByObject() {
        // Given
        ACCOUNTS[0].BillingLatitude = ACCOUNTS[0].BillingLatitude;
        ACCOUNTS[1].BillingLatitude = ACCOUNTS[1].BillingLatitude;
        ACCOUNTS[2].BillingLatitude = ACCOUNTS[0].BillingLatitude;
        ACCOUNTS[3].BillingLatitude = ACCOUNTS[1].BillingLatitude;
        ACCOUNTS[4].BillingLatitude = null;
        ACCOUNTS.remove(9);
        ACCOUNTS.remove(8);
        ACCOUNTS.remove(7);
        ACCOUNTS.remove(6);
        ACCOUNTS.remove(5);
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.BillingLatitude);
        Collector downstream = SObjectCollectors.toList(AfTestConsts.Account.Name);
        // When
        Map<Object, List<Account>> actual = (Map<Object, List<Account>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByObject(AfTestConsts.Account.BillingLatitude));
        Map<Object, List<Account>> actual1 = (Map<Object, List<Account>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByObject(AfTestConsts.BILLING_LATITUDE));
        Map<Object, List<SObject>> actual2 = (Map<Object, List<SObject>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByObject(keyMapper).cast(Map<Object, List<SObject>>.class));
        Map<Object, List<String>> actual3 = (Map<Object, List<String>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByObject(AfTestConsts.Account.BillingLatitude, AfTestConsts.Account.Name).cast(Map<Object, List<String>>.class));
        Map<Object, Object> actual4 = (Map<Object, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByObject(AfTestConsts.BILLING_LATITUDE, AfTestConsts.NAME));
        Map<Object, Object> actual5 = (Map<Object, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByObject(keyMapper, downstream));
        Map<Object, List<String>> actual6 = (Map<Object, List<String>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByObject(keyMapper, Supplier.of(Map<Object, List<String>>.class), downstream.cast(List<String>.class)));
        Map<Object, Map<String, List<String>>> actual7 = (Map<Object, Map<String, List<String>>>)
            AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByObject(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.Account.BillingCountry, AfTestConsts.Account.Name)).cast(Map<Object, Map<String, List<String>>>.class));
        Map<Object, Object> actual8 = (Map<Object, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByObject(keyMapper, SObjectCollectors.groupingByString(AfTestConsts.BILLING_COUNTRY, AfTestConsts.NAME)));
        // Then
        Map<Object, List<Account>> expected = new Map<Object, List<Account>>{
            ACCOUNTS[0].BillingLatitude => new List<Account>{ ACCOUNTS[0], ACCOUNTS[2] },
            ACCOUNTS[1].BillingLatitude => new List<Account>{ ACCOUNTS[1], ACCOUNTS[3] },
            null => new List<Account>{ ACCOUNTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Object, List<String>> expected1 = new Map<Object, List<String>>{
            ACCOUNTS[0].BillingLatitude => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME), (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[1].BillingLatitude => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME), (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Map<Object, Map<String, List<String>>> expected2 = new Map<Object, Map<String, List<String>>>{
            ACCOUNTS[0].BillingLatitude => new Map<String, List<String>>{ AfTestConsts.FRANCE => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) }, AfTestConsts.UK => new List<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) } },
            ACCOUNTS[1].BillingLatitude => new Map<String, List<String>>{ AfTestConsts.FRANCE => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) }, AfTestConsts.UK => new List<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
    }

    /**
     * @see SObjectCollectors.partitioningBy
     */
    @IsTest
    static void partitioningBy() {
        // Given
        IPredicate predicate = SObjectPredicates.isEqual(AfTestConsts.Contact.OtherCountry, AfTestConsts.UK);
        Collector downstream = SObjectCollectors.toList(AfTestConsts.Contact.LastName);
        // When
        Map<Boolean, List<SObject>> actual = (Map<Boolean, List<SObject>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.partitioningBy(AfTestConsts.Contact.OtherCountry, AfTestConsts.UK));
        Map<Boolean, List<Contact>> actual1 = (Map<Boolean, List<Contact>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.partitioningBy(AfTestConsts.OTHER_COUNTRY, AfTestConsts.UK).cast(Map<Boolean, List<Contact>>.class));
        Map<Boolean, List<Contact>> actual2 = (Map<Boolean, List<Contact>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.partitioningBy(predicate).cast(Map<Boolean, List<Contact>>.class));
        Map<Boolean, List<String>> actual3 = (Map<Boolean, List<String>>) AfTestCommons.collect(CONTACTS, SObjectCollectors.partitioningBy(predicate, downstream).cast(Map<Boolean, List<String>>.class));
        Map<Boolean, Map<String, List<String>>> actual4 = (Map<Boolean, Map<String, List<String>>>)
            AfTestCommons.collect(CONTACTS, SObjectCollectors.partitioningBy(predicate, SObjectCollectors.groupingByString(AfTestConsts.Contact.OtherCity, AfTestConsts.Contact.LastName)).cast(Map<Boolean, Map<String, List<String>>>.class));
        Map<Boolean, Object> actual5 = (Map<Boolean, Object>) AfTestCommons.collect(CONTACTS, SObjectCollectors.partitioningBy(predicate, SObjectCollectors.groupingByString(AfTestConsts.OTHER_CITY, AfTestConsts.LAST_NAME)));
        // Then
        Map<Boolean, List<SObject>> expected = new Map<Boolean, List<SObject>>{
            true => new List<Contact>{ CONTACTS[2], CONTACTS[3] },
            false => new List<Contact>{ CONTACTS[0], CONTACTS[1], CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Boolean, List<String>> expected1 = new Map<Boolean, List<String>>{
            true => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            false => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[1].get(AfTestConsts.LAST_NAME), (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected1, actual3);
        Map<Boolean, Map<String, List<String>>> expected2 = new Map<Boolean, Map<String, List<String>>>{
            true => new Map<String, List<String>>{
                AfTestConsts.LONDON => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) },
                AfTestConsts.BRISTOL => new List<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) }
            },
            false => new Map<String, List<String>>{
                AfTestConsts.PARIS => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME) },
                AfTestConsts.LYON => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) },
                null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
            }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
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
        Object actual = AfTestCommons.collect(CONTACTS, SObjectCollectors.joining(AfTestConsts.LAST_NAME));
        Object actual1 = AfTestCommons.collect(CONTACTS, SObjectCollectors.joining(AfTestConsts.Contact.LastName));
        String actual2 = (String) AfTestCommons.collect(CONTACTS, SObjectCollectors.joining(AfTestConsts.Contact.LastName, delimiter));
        String actual3 = (String) AfTestCommons.collect(CONTACTS, SObjectCollectors.joining(AfTestConsts.Contact.LastName, delimiter, prefix, suffix));
        // Then
        String expected =
            CONTACTS[0].LastName
            + CONTACTS[1].LastName
            + CONTACTS[2].LastName
            + CONTACTS[3].LastName
            + CONTACTS[4].LastName;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        String expected1 =
            CONTACTS[0].LastName
            + delimiter + CONTACTS[1].LastName
            + delimiter + CONTACTS[2].LastName
            + delimiter + CONTACTS[3].LastName
            + delimiter + CONTACTS[4].LastName;
        Assert.areEqual(expected1, actual2);
        String expected2 = prefix +
            CONTACTS[0].LastName
            + delimiter + CONTACTS[1].LastName
            + delimiter + CONTACTS[2].LastName
            + delimiter + CONTACTS[3].LastName
            + delimiter + CONTACTS[4].LastName
            + suffix;
        Assert.areEqual(expected2, actual3);
    }

    /**
     * @see SObjectCollectors.averagingInt
     * @see SObjectCollectors.counting
     * @see SObjectCollectors.summingInt
     */
    @IsTest
    static void intCollectors() {
        // Given
        ACCOUNTS.remove(4); // To prevent NPE
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.Type);
        IFunction mapper = SObjectFunctions.get(AfTestConsts.Account.NumberOfEmployees);
        // When
        Integer actual = (Integer) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.counting());
        Double actual1 = (Double) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.averagingInt(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Double actual2 = (Double) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.averagingInt(AfTestConsts.Account.NumberOfEmployees));
        Double actual3 = (Double) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.averagingInt(mapper));
        Integer actual4 = (Integer) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.summingInt(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Integer actual5 = (Integer) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.summingInt(AfTestConsts.Account.NumberOfEmployees));
        Integer actual6 = (Integer) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.summingInt(mapper));
        Map<String, Object> actual7 = (Map<String, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByString(keyMapper, SObjectCollectors.summingInt(mapper)));
        // Then
        Assert.areEqual(actual, ACCOUNTS.size());
        Integer sum = (
            ACCOUNTS[0].NumberOfEmployees
            + ACCOUNTS[1].NumberOfEmployees
            + ACCOUNTS[2].NumberOfEmployees
            + ACCOUNTS[3].NumberOfEmployees
            + ACCOUNTS[4].NumberOfEmployees
            + ACCOUNTS[5].NumberOfEmployees
            + ACCOUNTS[6].NumberOfEmployees
            + ACCOUNTS[7].NumberOfEmployees
            + ACCOUNTS[8].NumberOfEmployees
        );
        Double expected = (sum) / ((Double) ACCOUNTS.size());
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Double expected1 = sum;
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Map<String, Integer> expected2 = new Map<String, Integer>{
            AfTestConsts.CUSTOMER => ACCOUNTS[0].NumberOfEmployees + ACCOUNTS[1].NumberOfEmployees,
            AfTestConsts.PARTNER => ACCOUNTS[2].NumberOfEmployees + ACCOUNTS[3].NumberOfEmployees + ACCOUNTS[4].NumberOfEmployees,
            AfTestConsts.COMPETITOR => ACCOUNTS[5].NumberOfEmployees + ACCOUNTS[6].NumberOfEmployees + ACCOUNTS[7].NumberOfEmployees,
            null => ACCOUNTS[8].NumberOfEmployees
        };
        Assert.areEqual(expected2, actual7);
    }

    /**
     * @see SObjectCollectors.averagingLong
     * @see SObjectCollectors.summingLong
     */
    @IsTest
    static void longCollectors() {
        // Given
        ACCOUNTS.remove(4); // To prevent NPE
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.Type);
        IFunction mapper = SObjectFunctions.get(AfTestConsts.Account.NumberOfEmployees);
        // When
        Double actual = (Double) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.averagingLong(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Double actual1 = (Double) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.averagingLong(AfTestConsts.Account.NumberOfEmployees));
        Double actual2 = (Double) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.averagingLong(mapper));
        Long actual3 = (Long) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.summingLong(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Long actual4 = (Long) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.summingLong(AfTestConsts.Account.NumberOfEmployees));
        Long actual5 = (Long) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.summingLong(mapper));
        Map<String, Object> actual6 = (Map<String, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByString(keyMapper, SObjectCollectors.summingLong(mapper)));
        // Then
        Long sum = (
            ACCOUNTS[0].NumberOfEmployees
            + ACCOUNTS[1].NumberOfEmployees
            + ACCOUNTS[2].NumberOfEmployees
            + ACCOUNTS[3].NumberOfEmployees
            + ACCOUNTS[4].NumberOfEmployees
            + ACCOUNTS[5].NumberOfEmployees
            + ACCOUNTS[6].NumberOfEmployees
            + ACCOUNTS[7].NumberOfEmployees
            + ACCOUNTS[8].NumberOfEmployees
        );
        Double expected = (sum) / ((Double) ACCOUNTS.size());
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Double expected1 = sum;
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Map<String, Long> expected2 = new Map<String, Long>{
            AfTestConsts.CUSTOMER => ACCOUNTS[0].NumberOfEmployees + ACCOUNTS[1].NumberOfEmployees,
            AfTestConsts.PARTNER => ACCOUNTS[2].NumberOfEmployees + ACCOUNTS[3].NumberOfEmployees + ACCOUNTS[4].NumberOfEmployees,
            AfTestConsts.COMPETITOR => ACCOUNTS[5].NumberOfEmployees + ACCOUNTS[6].NumberOfEmployees + ACCOUNTS[7].NumberOfEmployees,
            null => ACCOUNTS[8].NumberOfEmployees
        };
        Assert.areEqual(expected2, actual6);
    }

    /**
     * @see SObjectCollectors.averagingDouble
     * @see SObjectCollectors.summingDouble
     */
    @IsTest
    static void doubleCollectors() {
        // Given
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.Type);
        IFunction mapper = SObjectFunctions.get(AfTestConsts.Account.BillingLatitude);
        // When
        Double actual = (Double) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.averagingDouble(AfTestConsts.BILLING_LATITUDE));
        Double actual1 = (Double) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.averagingDouble(AfTestConsts.Account.BillingLatitude));
        Double actual2 = (Double) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.averagingDouble(mapper));
        Double actual3 = (Double) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.summingDouble(AfTestConsts.BILLING_LATITUDE));
        Double actual4 = (Double) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.summingDouble(AfTestConsts.Account.BillingLatitude));
        Double actual5 = (Double) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.summingDouble(mapper));
        Map<String, Object> actual6 = (Map<String, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByString(keyMapper, SObjectCollectors.summingDouble(mapper)));
        // Then
        Double sum = (
            ACCOUNTS[0].BillingLatitude
            + ACCOUNTS[1].BillingLatitude
            + ACCOUNTS[2].BillingLatitude
            + ACCOUNTS[3].BillingLatitude
            + ACCOUNTS[4].BillingLatitude
            + ACCOUNTS[5].BillingLatitude
            + ACCOUNTS[6].BillingLatitude
            + ACCOUNTS[7].BillingLatitude
            + ACCOUNTS[8].BillingLatitude
            + ACCOUNTS[9].BillingLatitude
        );
        Double expected = (sum) / ((Double) ACCOUNTS.size());
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Double expected1 = sum;
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Map<String, Double> expected2 = new Map<String, Double>{
            AfTestConsts.CUSTOMER => ACCOUNTS[0].BillingLatitude + ACCOUNTS[1].BillingLatitude,
            AfTestConsts.PARTNER => ACCOUNTS[2].BillingLatitude + ACCOUNTS[3].BillingLatitude + ACCOUNTS[5].BillingLatitude,
            AfTestConsts.COMPETITOR => ACCOUNTS[6].BillingLatitude + ACCOUNTS[7].BillingLatitude + ACCOUNTS[8].BillingLatitude,
            null => ACCOUNTS[4].BillingLatitude + ACCOUNTS[9].BillingLatitude
        };
        Assert.areEqual(expected2, actual6);
    }

    /**
     * @see SObjectCollectors.filtering
     */
    @IsTest
    static void filtering() {
        // Given
        Integer value = 100;
        IPredicate predicate = SObjectPredicates.isGreater(AfTestConsts.Account.NumberOfEmployees, value);
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.Type);
        // When
        List<Account> actual = (List<Account>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.filtering(AfTestConsts.NUMBER_OF_EMPLOYEES, value));
        List<Account> actual1 = (List<Account>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.filtering(AfTestConsts.Account.NumberOfEmployees, value));
        List<Account> actual2 = (List<Account>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.filtering(predicate).cast(List<Account>.class));
        Set<SObject> actual3 = (Set<SObject>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.filtering(predicate, SObjectCollectors.toSObjectSet()));
        Map<String, List<Account>> actual4 = (Map<String, List<Account>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByString(keyMapper, SObjectCollectors.filtering(predicate)).cast(Map<String, List<Account>>.class));
        // Then
        List<Account> expected = new List<Account>{ ACCOUNTS[2] };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        List<Account> expected1 = new List<Account>{ ACCOUNTS[0], ACCOUNTS[1], ACCOUNTS[5], ACCOUNTS[7], ACCOUNTS[8], ACCOUNTS[9] };
        Assert.areEqual(expected1, actual2);
        Set<SObject> expected2 = new Set<SObject>{ ACCOUNTS[0], ACCOUNTS[1], ACCOUNTS[5], ACCOUNTS[7], ACCOUNTS[8], ACCOUNTS[9] };
        Assert.areEqual(expected2, actual3);
        Map<String, List<Account>> expected3 = new Map<String, List<Account>>{
            AfTestConsts.CUSTOMER => new List<Account>{ ACCOUNTS[0], ACCOUNTS[1] },
            AfTestConsts.PARTNER => new List<Account>{ ACCOUNTS[5] },
            AfTestConsts.COMPETITOR => new List<Account>{ ACCOUNTS[7], ACCOUNTS[8] },
            null => new List<Account>{ ACCOUNTS[9] }
        };
        Assert.areEqual(expected3, actual4);
    }

    /**
     * @see SObjectCollectors.mapping
     */
    @IsTest
    static void mapping() {
        // Given
        IFunction mapper = SObjectFunctions.get(AfTestConsts.ID);
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.Type);
        // When
        List<Object> actual = (List<Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.mapping(mapper));
        List<Id> actual1 = (List<Id>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.mapping(mapper).cast(List<Id>.class));
        List<Id> actual2 = (List<Id>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.mapping(AfTestConsts.ID).cast(List<Id>.class));
        List<Id> actual3 = (List<Id>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.mapping(AfTestConsts.Account.Id).cast(List<Id>.class));
        Set<Id> actual4 = (Set<Id>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.mapping(mapper, Collector.of(Supplier.of(Set<Id>.class), SetObjectConsumers.addToIdSet(Function.identity()))));
        Map<String, List<Id>> actual5 = (Map<String, List<Id>>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByString(keyMapper, SObjectCollectors.mapping(mapper)).cast(Map<String, List<Id>>.class));
        // Then
        List<Id> expected = new List<Id>{
            ACCOUNTS[0].Id,
            ACCOUNTS[1].Id,
            ACCOUNTS[2].Id,
            ACCOUNTS[3].Id,
            ACCOUNTS[4].Id,
            ACCOUNTS[5].Id,
            ACCOUNTS[6].Id,
            ACCOUNTS[7].Id,
            ACCOUNTS[8].Id,
            ACCOUNTS[9].Id
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Set<Id> expected1 = new Set<Id>(expected);
        Assert.areEqual(expected1, actual4);
        Map<String, List<Id>> expected2 = new Map<String, List<Id>>{
            AfTestConsts.CUSTOMER => new List<Id>{
                ACCOUNTS[0].Id,
                ACCOUNTS[1].Id
            },
            AfTestConsts.PARTNER => new List<Id>{
                ACCOUNTS[2].Id,
                ACCOUNTS[3].Id,
                ACCOUNTS[5].Id
            },
            AfTestConsts.COMPETITOR => new List<Id>{
                ACCOUNTS[6].Id,
                ACCOUNTS[7].Id,
                ACCOUNTS[8].Id
            },
            null => new List<Id>{
                ACCOUNTS[4].Id,
                ACCOUNTS[9].Id
            }
        };
        Assert.areEqual(expected2, actual5);
    }

    /**
     * @see SObjectCollectors.flatMapping
     */
    @IsTest
    static void flatMapping() {
        // Given
        List<Account> accounts = AfTestData.generateAccounts();
        IFunction mapper = SObjectFunctions.getSObjects(AfTestConsts.CONTACTS);
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.Type);
        // When
        List<Object> actual = (List<Object>) AfTestCommons.collect(accounts, SObjectCollectors.flatMapping(mapper));
        List<Contact> actual1 = (List<Contact>) AfTestCommons.collect(accounts, SObjectCollectors.flatMapping(mapper).cast(List<Contact>.class));
        List<Contact> actual2 = (List<Contact>) AfTestCommons.collect(accounts, SObjectCollectors.flatMapping(AfTestConsts.CONTACTS).cast(List<Contact>.class));
        List<Contact> actual3 = (List<Contact>) AfTestCommons.collect(accounts, SObjectCollectors.flatMapping(AfTestConsts.Contact.AccountId).cast(List<Contact>.class));
        Set<SObject> actual4 = (Set<SObject>) AfTestCommons.collect(accounts, SObjectCollectors.flatMapping(mapper, Collector.of(Supplier.of(Set<SObject>.class), SetObjectConsumers.addToSObjectSet(Function.identity()))));
        Map<String, List<Contact>> actual5 = (Map<String, List<Contact>>) AfTestCommons.collect(accounts, SObjectCollectors.groupingByString(keyMapper, SObjectCollectors.flatMapping(mapper)).cast(Map<String, List<Contact>>.class));
        // Then
        List<SObject> expected = new List<SObject>();
        for (Account acc : accounts) {
            List<SObject> children = acc.getSObjects(AfTestConsts.CONTACTS);
            if (children != null) {
                expected.addAll(children);
            }
        }
        Assert.areEqual(expected, AfTestCommons.deepClone(actual, List<SObject>.class));
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Set<SObject> expected1 = new Set<SObject>(expected);
        Assert.areEqual(expected1, actual4);
        Map<String, List<Contact>> expected2 = new Map<String, List<Contact>>{
            AfTestConsts.CUSTOMER => new List<Contact>{
                accounts[0].Contacts[0],
                accounts[1].Contacts[0],
                accounts[2].Contacts[0]
            },
            AfTestConsts.PARTNER => new List<Contact>{
                accounts[3].Contacts[0],
                accounts[5].Contacts[0],
                accounts[5].Contacts[1]
            },
            AfTestConsts.COMPETITOR => new List<Contact>(),
            null => new List<Contact>{
                accounts[4].Contacts[0]
            }
        };
        Assert.areEqual(expected2, actual5);
    }

    /**
     * @see SObjectCollectors.reducing
     */
    @IsTest
    static void reducing() {
        // Given
        ACCOUNTS.remove(4); // To prevent NPE
        IBiOperator accumulator = BiOperator.maxBy(Comparer.comparing(SObjectFunctions.get(AfTestConsts.Account.NumberOfEmployees)));
        IBiOperator sumIntFieldReducer = new AfTestCommons.SumIntFieldReducer(AfTestConsts.NUMBER_OF_EMPLOYEES);
        IFunction keyMapper = SObjectFunctions.get(AfTestConsts.Account.Type);
        // When
        IOptional actual = (Optional) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.reducing(accumulator));
        Account actual1 = (Account) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.reducing(new Account(NumberOfEmployees = 0), sumIntFieldReducer));
        Map<String, Object> actual2 = (Map<String, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByString(keyMapper, SObjectCollectors.reducing(accumulator)));
        IOptional actual3 = (Optional) AfTestCommons.collect(new List<Account>(), SObjectCollectors.reducing(accumulator));
        // Then
        Assert.areEqual(ACCOUNTS[8], actual.get());
        Account expected2 = new Account(NumberOfEmployees =
            ACCOUNTS[0].NumberOfEmployees
            + ACCOUNTS[1].NumberOfEmployees
            + ACCOUNTS[2].NumberOfEmployees
            + ACCOUNTS[3].NumberOfEmployees
            + ACCOUNTS[4].NumberOfEmployees
            + ACCOUNTS[5].NumberOfEmployees
            + ACCOUNTS[6].NumberOfEmployees
            + ACCOUNTS[7].NumberOfEmployees
            + ACCOUNTS[8].NumberOfEmployees
        );
        Assert.areEqual(expected2, actual1);
        Map<String, Optional> expected = new Map<String, Optional>{
            AfTestConsts.CUSTOMER => Optional.of(ACCOUNTS[0]),
            AfTestConsts.PARTNER => Optional.of(ACCOUNTS[4]),
            AfTestConsts.COMPETITOR => Optional.of(ACCOUNTS[7]),
            null => Optional.of(ACCOUNTS[8])
        };
        Assert.areEqual(expected, actual2);
        Assert.isTrue(actual3.isEmpty(), Label.AF_ErrorMessage_NoValuePresent);
    }

    /**
     * @see SObjectCollectors.maximizing
     * @see SObjectCollectors.minimizing
     */
    @IsTest
    static void optimizing() {
        // Given
        IComparer comparer = Comparer.comparing(SObjectFunctions.get(Account.NumberOfEmployees));
        IFunction keyMapper = SObjectFunctions.get(Account.Type);
        // When
        IOptional actual = (Optional) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.maximizing(AfTestConsts.Account.NumberOfEmployees));
        IOptional actual1 = (Optional) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.maximizing(AfTestConsts.NUMBER_OF_EMPLOYEES));
        IOptional actual2 = (Optional) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.maximizing(comparer));
        IOptional actual3 = (Optional) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.minimizing(AfTestConsts.Account.NumberOfEmployees));
        IOptional actual4 = (Optional) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.minimizing(AfTestConsts.NUMBER_OF_EMPLOYEES));
        IOptional actual5 = (Optional) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.minimizing(comparer));
        Map<String, Object> actual6 = (Map<String, Object>) AfTestCommons.collect(ACCOUNTS, SObjectCollectors.groupingByString(keyMapper, SObjectCollectors.minimizing(comparer)));
        // Then
        Assert.areEqual(ACCOUNTS[9], actual.get());
        Assert.areEqual(ACCOUNTS[9], actual1.get());
        Assert.areEqual(ACCOUNTS[9], actual2.get());
        Assert.areEqual(ACCOUNTS[4], actual3.get());
        Assert.areEqual(ACCOUNTS[4], actual4.get());
        Assert.areEqual(ACCOUNTS[4], actual5.get());
        Map<String, IOptional> expected = new Map<String, Optional>{
            AfTestConsts.CUSTOMER => Optional.of(ACCOUNTS[1]),
            AfTestConsts.PARTNER => Optional.of(ACCOUNTS[3]),
            AfTestConsts.COMPETITOR => Optional.of(ACCOUNTS[6]),
            null => Optional.of(ACCOUNTS[4])
        };
        Assert.areEqual(expected, actual6);
    }

}
