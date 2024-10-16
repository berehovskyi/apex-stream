/**
 * @see SObjectCollectorProvider
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs, PMD.CyclomaticComplexity, PMD.NcssTypeCount')
private class SObjectCollectorProviderTest {
    private static final Map<SObjectType, List<SObject>> DATA = AfTestData.generateSObjects();
    private static final List<Account> ACCOUNTS = DATA.get(Account.SObjectType);
    private static final List<Contact> CONTACTS = DATA.get(Contact.SObjectType);
    private static final List<Attachment> ATTACHMENTS = DATA.get(Attachment.SObjectType);
    private static final List<Event> EVENTS = DATA.get(Event.SObjectType);
    private static final List<ContactPointEmail> SLOTS = DATA.get(ContactPointEmail.SObjectType);
    private static final CollectorProvider COL = new SObjectCollectorProvider();

    /**
     * @see CollectorProvider.toList
     */
    @IsTest
    static void toList() {
        // Given
        ICollector toListCollector = COL.toList();
        ICollector toNameListCollector = COL.toList().val(new SObjectFunctionProvider().get(AfTestConsts.NAME));
        ICollector toNameListCollector1 = COL.toList().val(AfTestConsts.NAME).cast(List<String>.class);
        ICollector toNameListCollector2 = COL.toList().of(String.class).val(AfTestConsts.Account.Name);
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
     * @see CollectorProvider.toBoolSet
     */
    @IsTest
    static void toBoolSet() {
        // Given
        ICollector toBoolSetCollector = COL.toBoolSet().val(new SObjectFunctionProvider().get(AfTestConsts.DO_NOT_CALL));
        ICollector toBoolSetCollector1 = COL.toBoolSet().val(AfTestConsts.DO_NOT_CALL);
        ICollector toBoolSetCollector2 = COL.toBoolSet().val(AfTestConsts.Contact.DoNotCall);
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
     * @see CollectorProvider.toIdSet
     */
    @IsTest
    static void toIdSet() {
        // Given
        ICollector toIdSetCollector = COL.toIdSet().val(new SObjectFunctionProvider().get(AfTestConsts.ID));
        ICollector toIdSetCollector1 = COL.toIdSet().val(AfTestConsts.ID);
        ICollector toIdSetCollector2 = COL.toIdSet().val(AfTestConsts.Contact.Id);
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
     * @see CollectorProvider.toStringSet
     */
    @IsTest
    static void toStringSet() {
        // Given
        ICollector toStringSetCollector = COL.toStringSet().val(new SObjectFunctionProvider().get(AfTestConsts.LAST_NAME));
        ICollector toStringSetCollector1 = COL.toStringSet().val(AfTestConsts.LAST_NAME);
        ICollector toStringSetCollector2 = COL.toStringSet().val(AfTestConsts.Contact.LastName);
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
     * @see CollectorProvider.toBlobSet
     */
    @IsTest
    static void toBlobSet() {
        // Given
        ICollector toBlobSetCollector = COL.toBlobSet().val(new SObjectFunctionProvider().get(AfTestConsts.BODY));
        ICollector toBlobSetCollector1 = COL.toBlobSet().val(AfTestConsts.BODY);
        ICollector toBlobSetCollector2 = COL.toBlobSet().val(AfTestConsts.Attachment.Body);
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
     * @see CollectorProvider.toDateSet
     */
    @IsTest
    static void toDateSet() {
        // Given
        ICollector toDateSetCollector = COL.toDateSet().val(new SObjectFunctionProvider().get(AfTestConsts.BIRTHDATE));
        ICollector toDateSetCollector1 = COL.toDateSet().val(AfTestConsts.BIRTHDATE);
        ICollector toDateSetCollector2 = COL.toDateSet().val(AfTestConsts.Contact.Birthdate);
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
     * @see CollectorProvider.toDatetimeSet
     */
    @IsTest
    static void toDatetimeSet() {
        // Given
        ICollector toDatetimeSetCollector = COL.toDatetimeSet().val(new SObjectFunctionProvider().get(AfTestConsts.ACTIVITY_DATE_TIME));
        ICollector toDatetimeSetCollector1 = COL.toDatetimeSet().val(AfTestConsts.ACTIVITY_DATE_TIME);
        ICollector toDatetimeSetCollector2 = COL.toDatetimeSet().val(AfTestConsts.Event.ActivityDateTime);
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
     * @see CollectorProvider.toTimeSet
     */
    @IsTest
    static void toTimeSet() {
        // Given
        ICollector toTimeSetCollector = COL.toTimeSet().val(new SObjectFunctionProvider().get(AfTestConsts.BEST_START_TIME));
        ICollector toTimeSetCollector1 = COL.toTimeSet().val(AfTestConsts.BEST_START_TIME);
        ICollector toTimeSetCollector2 = COL.toTimeSet().val(AfTestConsts.ContactEmail.StartTime);
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
     * @see CollectorProvider.toIntSet
     */
    @IsTest
    static void toIntSet() {
        // Given
        ICollector toIntSetCollector = COL.toIntSet().val(new SObjectFunctionProvider().get(AfTestConsts.NUMBER_OF_EMPLOYEES));
        ICollector toIntSetCollector1 = COL.toIntSet().val(AfTestConsts.NUMBER_OF_EMPLOYEES);
        ICollector toIntSetCollector2 = COL.toIntSet().val(AfTestConsts.Account.NumberOfEmployees);
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
     * @see CollectorProvider.toLongSet
     */
    @IsTest
    static void toLongSet() {
        // Given
        ICollector toIntSetCollector = COL.toLongSet().val(new SObjectFunctionProvider().get(AfTestConsts.NUMBER_OF_EMPLOYEES));
        ICollector toIntSetCollector1 = COL.toLongSet().val(AfTestConsts.NUMBER_OF_EMPLOYEES);
        ICollector toIntSetCollector2 = COL.toLongSet().val(AfTestConsts.Account.NumberOfEmployees);
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
     * @see CollectorProvider.toDoubleSet
     */
    @IsTest
    static void toDoubleSet() {
        // Given
        ICollector toDoubleSetCollector = COL.toDoubleSet().val(new SObjectFunctionProvider().get(AfTestConsts.BILLING_LATITUDE));
        ICollector toDoubleSetCollector1 = COL.toDoubleSet().val(AfTestConsts.BILLING_LATITUDE);
        ICollector toDoubleSetCollector2 = COL.toDoubleSet().val(AfTestConsts.Account.BillingLatitude);
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
     * @see CollectorProvider.toSObjectSet
     */
    @IsTest
    static void toSObjectSet() {
        // Given
        ICollector toSetCollector = COL.toSObjectSet();
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
     * @see CollectorProvider.toObjectSet
     */
    @IsTest
    static void toObjectSet() {
        // Given
        ICollector toSetCollector = COL.toObjectSet().val(new SObjectFunctionProvider().get(AfTestConsts.BILLING_LATITUDE));
        ICollector toSetCollector1 = COL.toObjectSet().val(AfTestConsts.BILLING_LATITUDE);
        ICollector toSetCollector2 = COL.toObjectSet().val(AfTestConsts.Account.BillingLatitude);
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
     * @see CollectorProvider.toByBoolMap
     */
    @IsTest
    static void toByBoolMap() {
        // Given
        List<Contact> input = new List<Contact>{ CONTACTS[0], CONTACTS[1], CONTACTS[4] };
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Contact.DoNotCall);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        IFunction getParentAccFunction = new SObjectFunctionProvider().getSObject(AfTestConsts.Contact.AccountId);
        // When
        Map<Boolean, Contact> actual = (Map<Boolean, Contact>) AfTestCommons.collect(input, COL.toByBoolMap().of(Contact.class).key(AfTestConsts.DO_NOT_CALL));
        Map<Boolean, Contact> actual1 = (Map<Boolean, Contact>) AfTestCommons.collect(input, COL.toByBoolMap().key(AfTestConsts.Contact.DoNotCall).cast(Map<Boolean, Contact>.class));
        Map<Boolean, SObject> actual2 = (Map<Boolean, SObject>) AfTestCommons.collect(input, COL.toByBoolMap().key(keyMapper));
        Map<Boolean, Contact> actual3 = (Map<Boolean, Contact>) AfTestCommons.collect(input, COL.toByBoolMap().key(keyMapper).val(valueMapper).cast(Map<Boolean, Contact>.class));
        Map<Boolean, Account> actual4 = (Map<Boolean, Account>) AfTestCommons.collect(CONTACTS, COL.toByBoolMap().merger(mergeFunction).key(keyMapper).val(getParentAccFunction).cast(Map<Boolean, Account>.class));
        Map<Boolean, String> actual5 = (Map<Boolean, String>) AfTestCommons.collect(input, COL.toByBoolMap().key(AfTestConsts.DO_NOT_CALL).val(AfTestConsts.LAST_NAME).cast(Map<Boolean, String>.class));
        Map<Boolean, String> actual6 = (Map<Boolean, String>) AfTestCommons.collect(input, COL.toByBoolMap().of(Supplier.of(Map<Boolean, String>.class)).key(AfTestConsts.Contact.DoNotCall).val(AfTestConsts.Contact.LastName));
        try {
            List<Contact> input1 = new List<Contact>(CONTACTS);
            input1.add(input1[0]);
            AfTestCommons.collect(input1, COL.toByBoolMap().key(AfTestConsts.DO_NOT_CALL));
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
     * @see CollectorProvider.toByIdMap
     */
    @IsTest
    static void toByIdMap() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Contact.AccountId);
        IFunction valueMapper = Function.identity();
        IOperator valueMapper1 = Operator.identity();
        IBiOperator mergeFunction = BiOperator.right();
        IBiOperator mergeFunction1 = BiOperator.right();
        IFunction getParentAccFunction = new SObjectFunctionProvider().getSObject(AfTestConsts.Contact.AccountId);
        Collector toMapCollector = COL.toByIdMap().of(SObject.class).key('Id');
        // When
        Map<Id, Contact> actual = (Map<Id, Contact>) AfTestCommons.collect(CONTACTS, COL.toByIdMap().of(Contact.class).key(AfTestConsts.ACCOUNT_ID));
        Map<Id, Contact> actual1 = (Map<Id, Contact>) AfTestCommons.collect(CONTACTS, COL.toByIdMap().key(AfTestConsts.Contact.AccountId).cast(Map<Id, Contact>.class));
        Map<Id, SObject> actual2 = (Map<Id, SObject>) AfTestCommons.collect(CONTACTS, COL.toByIdMap().key(keyMapper));
        Map<Id, Object> actual3 = (Map<Id, Object>) AfTestCommons.collect(CONTACTS, COL.toByIdMap().key(keyMapper).val(valueMapper));
        Map<Id, Object> actual4 = (Map<Id, Object>) AfTestCommons.collect(CONTACTS, COL.toByIdMap().merger(mergeFunction).key(keyMapper).val(getParentAccFunction));
        Map<Id, String> actual5 = (Map<Id, String>) AfTestCommons.collect(CONTACTS, COL.toByIdMap().key(AfTestConsts.ACCOUNT_ID).val(AfTestConsts.LAST_NAME).cast(Map<Id, String>.class));
        Map<Id, String> actual6 = (Map<Id, String>) AfTestCommons.collect(CONTACTS, COL.toByIdMap().of(Supplier.of(Map<Id, String>.class)).key(AfTestConsts.Contact.AccountId).val(AfTestConsts.Contact.LastName));
        List<Contact> input = new List<Contact>(CONTACTS);
        input.add(input[0]);
        Map<Id, Object> actual7 = (Map<Id, Object>) AfTestCommons.collect(input, COL.toByIdMap().merger(mergeFunction).key(keyMapper).val(getParentAccFunction));
        Map<Id, SObject> actual8 = (Map<Id, SObject>) AfTestCommons.collect(input, COL.toByIdMap().merger(mergeFunction1).key(keyMapper).val(valueMapper1).cast(Map<Id, SObject>.class));
        try {
            AfTestCommons.collect(input, COL.toByIdMap().key(AfTestConsts.ACCOUNT_ID));
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
     * @see CollectorProvider.toByStringMap
     */
    @IsTest
    static void toByStringMap() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Contact.FirstName);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        IFunction getParentAccFunction = new SObjectFunctionProvider().getSObject(AfTestConsts.Contact.AccountId);
        // When
        Map<String, Contact> actual = (Map<String, Contact>) AfTestCommons.collect(CONTACTS, COL.toByStringMap().of(Contact.class).key(AfTestConsts.FIRST_NAME));
        Map<String, Contact> actual1 = (Map<String, Contact>) AfTestCommons.collect(CONTACTS, COL.toByStringMap().key(AfTestConsts.Contact.FirstName).cast(Map<String, Contact>.class));
        Map<String, SObject> actual2 = (Map<String, SObject>) AfTestCommons.collect(CONTACTS, COL.toByStringMap().key(keyMapper));
        Map<String, Object> actual3 = (Map<String, Object>) AfTestCommons.collect(CONTACTS, COL.toByStringMap().key(keyMapper).val(valueMapper));
        Map<String, Object> actual4 = (Map<String, Object>) AfTestCommons.collect(CONTACTS, COL.toByStringMap().merger(mergeFunction).key(keyMapper).val(getParentAccFunction));
        Map<String, String> actual5 = (Map<String, String>) AfTestCommons.collect(CONTACTS, COL.toByStringMap().key(AfTestConsts.FIRST_NAME).val(AfTestConsts.LAST_NAME).cast(Map<String, String>.class));
        Map<String, String> actual6 = (Map<String, String>) AfTestCommons.collect(CONTACTS, COL.toByStringMap().of(Supplier.of(Map<String, String>.class)).key(AfTestConsts.Contact.FirstName).val(AfTestConsts.Contact.LastName));
        try {
            List<Contact> input = new List<Contact>(CONTACTS);
            input.add(input[0]);
            AfTestCommons.collect(input, COL.toByStringMap().key(AfTestConsts.FIRST_NAME));
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
     * @see CollectorProvider.toByBlobMap
     */
    @IsTest
    static void toByBlobMap() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Attachment.Body);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Blob, Attachment> actual = (Map<Blob, Attachment>) AfTestCommons.collect(ATTACHMENTS, COL.toByBlobMap().of(Attachment.class).key(AfTestConsts.BODY));
        Map<Blob, Attachment> actual1 = (Map<Blob, Attachment>) AfTestCommons.collect(ATTACHMENTS, COL.toByBlobMap().key(AfTestConsts.Attachment.Body).cast(Map<Blob, Attachment>.class));
        Map<Blob, SObject> actual2 = (Map<Blob, SObject>) AfTestCommons.collect(ATTACHMENTS, COL.toByBlobMap().key(keyMapper));
        Map<Blob, Object> actual3 = (Map<Blob, Object>) AfTestCommons.collect(ATTACHMENTS, COL.toByBlobMap().key(keyMapper).val(valueMapper));
        Map<Blob, Object> actual4 = (Map<Blob, Object>) AfTestCommons.collect(ATTACHMENTS, COL.toByBlobMap().merger(mergeFunction).key(keyMapper).val(valueMapper));
        Map<Blob, String> actual5 = (Map<Blob, String>) AfTestCommons.collect(ATTACHMENTS, COL.toByBlobMap().key(AfTestConsts.BODY).val(AfTestConsts.NAME).cast(Map<Blob, String>.class));
        Map<Blob, String> actual6 = (Map<Blob, String>) AfTestCommons.collect(ATTACHMENTS, COL.toByBlobMap().of(Supplier.of(Map<Blob, String>.class)).key(AfTestConsts.Attachment.Body).val(AfTestConsts.Attachment.Name));
        try {
            List<Attachment> input = new List<Attachment>(ATTACHMENTS);
            input.add(input[0]);
            AfTestCommons.collect(input, COL.toByBlobMap().key(AfTestConsts.BODY));
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
     * @see CollectorProvider.toByDateMap
     */
    @IsTest
    static void toByDateMap() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Contact.Birthdate);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Date, Contact> actual = (Map<Date, Contact>) AfTestCommons.collect(CONTACTS, COL.toByDateMap().of(Contact.class).key(AfTestConsts.BIRTHDATE));
        Map<Date, Contact> actual1 = (Map<Date, Contact>) AfTestCommons.collect(CONTACTS, COL.toByDateMap().key(AfTestConsts.Contact.Birthdate).cast(Map<Date, Contact>.class));
        Map<Date, SObject> actual2 = (Map<Date, SObject>) AfTestCommons.collect(CONTACTS, COL.toByDateMap().key(keyMapper));
        Map<Date, Object> actual3 = (Map<Date, Object>) AfTestCommons.collect(CONTACTS, COL.toByDateMap().key(keyMapper).val(valueMapper));
        Map<Date, Object> actual4 = (Map<Date, Object>) AfTestCommons.collect(CONTACTS, COL.toByDateMap().merger(mergeFunction).key(keyMapper).val(valueMapper));
        Map<Date, String> actual5 = (Map<Date, String>) AfTestCommons.collect(CONTACTS, COL.toByDateMap().key(AfTestConsts.BIRTHDATE).val(AfTestConsts.LAST_NAME).cast(Map<Date, String>.class));
        Map<Date, String> actual6 = (Map<Date, String>) AfTestCommons.collect(CONTACTS, COL.toByDateMap().of(Supplier.of(Map<Date, String>.class)).key(AfTestConsts.Contact.Birthdate).val(AfTestConsts.Contact.LastName));
        try {
            List<Contact> input = new List<Contact>(CONTACTS);
            input.add(input[0]);
            AfTestCommons.collect(input, COL.toByDateMap().key(AfTestConsts.BIRTHDATE));
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
     * @see CollectorProvider.toByDatetimeMap
     */
    @IsTest
    static void toByDatetimeMap() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Event.ActivityDateTime);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Datetime, Event> actual = (Map<Datetime, Event>) AfTestCommons.collect(EVENTS, COL.toByDatetimeMap().of(Event.class).key(AfTestConsts.ACTIVITY_DATE_TIME));
        Map<Datetime, Event> actual1 = (Map<Datetime, Event>) AfTestCommons.collect(EVENTS, COL.toByDatetimeMap().key(AfTestConsts.Event.ActivityDateTime).cast(Map<Datetime, Event>.class));
        Map<Datetime, SObject> actual2 = (Map<Datetime, SObject>) AfTestCommons.collect(EVENTS, COL.toByDatetimeMap().key(keyMapper));
        Map<Datetime, Object> actual3 = (Map<Datetime, Object>) AfTestCommons.collect(EVENTS, COL.toByDatetimeMap().key(keyMapper).val(valueMapper));
        Map<Datetime, Object> actual4 = (Map<Datetime, Object>) AfTestCommons.collect(EVENTS, COL.toByDatetimeMap().merger(mergeFunction).key(keyMapper).val(valueMapper));
        Map<Datetime, String> actual5 = (Map<Datetime, String>) AfTestCommons.collect(EVENTS, COL.toByDatetimeMap().key(AfTestConsts.ACTIVITY_DATE_TIME).val(AfTestConsts.DESCRIPTION).cast(Map<Datetime, String>.class));
        Map<Datetime, String> actual6 = (Map<Datetime, String>) AfTestCommons.collect(EVENTS, COL.toByDatetimeMap().of(Supplier.of(Map<Datetime, String>.class)).key(AfTestConsts.Event.ActivityDateTime).val(AfTestConsts.Event.Description));
        try {
            List<Event> input = new List<Event>(EVENTS);
            input.add(input[0]);
            AfTestCommons.collect(input, COL.toByDatetimeMap().key(AfTestConsts.ACTIVITY_DATE_TIME));
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
     * @see CollectorProvider.toByTimeMap
     */
    @IsTest
    static void toByTimeMap() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.ContactEmail.StartTime);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Time, ContactPointEmail> actual = (Map<Time, ContactPointEmail>) AfTestCommons.collect(SLOTS, COL.toByTimeMap().of(ContactPointEmail.class).key(AfTestConsts.BEST_START_TIME));
        Map<Time, ContactPointEmail> actual1 = (Map<Time, ContactPointEmail>) AfTestCommons.collect(SLOTS, COL.toByTimeMap().key(AfTestConsts.ContactEmail.StartTime).cast(Map<Time, ContactPointEmail>.class));
        Map<Time, SObject> actual2 = (Map<Time, SObject>) AfTestCommons.collect(SLOTS, COL.toByTimeMap().key(keyMapper));
        Map<Time, Object> actual3 = (Map<Time, Object>) AfTestCommons.collect(SLOTS, COL.toByTimeMap().key(keyMapper).val(valueMapper));
        Map<Time, Object> actual4 = (Map<Time, Object>) AfTestCommons.collect(SLOTS, COL.toByTimeMap().merger(mergeFunction).key(keyMapper).val(valueMapper));
        Map<Time, Time> actual5 = (Map<Time, Time>) AfTestCommons.collect(SLOTS, COL.toByTimeMap().key(AfTestConsts.BEST_START_TIME).val(AfTestConsts.BEST_END_TIME).cast(Map<Time, Time>.class));
        Map<Time, Time> actual6 = (Map<Time, Time>) AfTestCommons.collect(SLOTS, COL.toByTimeMap().of(Supplier.of(Map<Time, Time>.class)).key(AfTestConsts.ContactEmail.StartTime).val(AfTestConsts.ContactEmail.EndTime));
        try {
            List<ContactPointEmail> input = new List<ContactPointEmail>(SLOTS);
            input.add(input[0]);
            AfTestCommons.collect(input, COL.toByTimeMap().key(AfTestConsts.BEST_START_TIME));
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
     * @see CollectorProvider.toByIntMap
     */
    @IsTest
    static void toByIntMap() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.NumberOfEmployees);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Integer, Account> actual = (Map<Integer, Account>) AfTestCommons.collect(ACCOUNTS, COL.toByIntMap().of(Account.class).key(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Map<Integer, Account> actual1 = (Map<Integer, Account>) AfTestCommons.collect(ACCOUNTS, COL.toByIntMap().key(AfTestConsts.Account.NumberOfEmployees).cast(Map<Integer, Account>.class));
        Map<Integer, SObject> actual2 = (Map<Integer, SObject>) AfTestCommons.collect(ACCOUNTS, COL.toByIntMap().key(keyMapper));
        Map<Integer, Object> actual3 = (Map<Integer, Object>) AfTestCommons.collect(ACCOUNTS, COL.toByIntMap().key(keyMapper).val(valueMapper));
        Map<Integer, Object> actual4 = (Map<Integer, Object>) AfTestCommons.collect(ACCOUNTS, COL.toByIntMap().merger(mergeFunction).key(keyMapper).val(valueMapper));
        Map<Integer, String> actual5 = (Map<Integer, String>) AfTestCommons.collect(ACCOUNTS, COL.toByIntMap().key(AfTestConsts.NUMBER_OF_EMPLOYEES).val(AfTestConsts.NAME).cast(Map<Integer, String>.class));
        Map<Integer, String> actual6 = (Map<Integer, String>) AfTestCommons.collect(ACCOUNTS, COL.toByIntMap().of(Supplier.of(Map<Integer, String>.class)).key(AfTestConsts.Account.NumberOfEmployees).val(AfTestConsts.Account.Name));
        try {
            List<Account> input = new List<Account>(ACCOUNTS);
            input.add(input[0]);
            AfTestCommons.collect(input, COL.toByIntMap().key(AfTestConsts.NUMBER_OF_EMPLOYEES));
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
     * @see CollectorProvider.toByLongMap
     */
    @IsTest
    static void toByLongMap() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.NumberOfEmployees);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Long, Account> actual = (Map<Long, Account>) AfTestCommons.collect(ACCOUNTS, COL.toByLongMap().of(Account.class).key(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Map<Long, Account> actual1 = (Map<Long, Account>) AfTestCommons.collect(ACCOUNTS, COL.toByLongMap().key(AfTestConsts.Account.NumberOfEmployees).cast(Map<Long, Account>.class));
        Map<Long, SObject> actual2 = (Map<Long, SObject>) AfTestCommons.collect(ACCOUNTS, COL.toByLongMap().key(keyMapper));
        Map<Long, Object> actual3 = (Map<Long, Object>) AfTestCommons.collect(ACCOUNTS, COL.toByLongMap().key(keyMapper).val(valueMapper));
        Map<Long, Object> actual4 = (Map<Long, Object>) AfTestCommons.collect(ACCOUNTS, COL.toByLongMap().merger(mergeFunction).key(keyMapper).val(valueMapper));
        Map<Long, String> actual5 = (Map<Long, String>) AfTestCommons.collect(ACCOUNTS, COL.toByLongMap().key(AfTestConsts.NUMBER_OF_EMPLOYEES).val(AfTestConsts.NAME).cast(Map<Long, String>.class));
        Map<Long, String> actual6 = (Map<Long, String>) AfTestCommons.collect(ACCOUNTS, COL.toByLongMap().of(Supplier.of(Map<Long, String>.class)).key(AfTestConsts.Account.NumberOfEmployees).val(AfTestConsts.Account.Name));
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
     * @see CollectorProvider.toByDoubleMap
     */
    @IsTest
    static void toByDoubleMap() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.BillingLatitude);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Double, Account> actual = (Map<Double, Account>) AfTestCommons.collect(ACCOUNTS, COL.toByDoubleMap().of(Account.class).key(AfTestConsts.BILLING_LATITUDE));
        Map<Double, Account> actual1 = (Map<Double, Account>) AfTestCommons.collect(ACCOUNTS, COL.toByDoubleMap().key(AfTestConsts.Account.BillingLatitude).cast(Map<Double, Account>.class));
        Map<Double, SObject> actual2 = (Map<Double, SObject>) AfTestCommons.collect(ACCOUNTS, COL.toByDoubleMap().key(keyMapper));
        Map<Double, Object> actual3 = (Map<Double, Object>) AfTestCommons.collect(ACCOUNTS, COL.toByDoubleMap().key(keyMapper).val(valueMapper));
        Map<Double, Object> actual4 = (Map<Double, Object>) AfTestCommons.collect(ACCOUNTS, COL.toByDoubleMap().merger(mergeFunction).key(keyMapper).val(valueMapper));
        Map<Double, String> actual5 = (Map<Double, String>) AfTestCommons.collect(ACCOUNTS, COL.toByDoubleMap().key(AfTestConsts.BILLING_LATITUDE).val(AfTestConsts.NAME).cast(Map<Double, String>.class));
        Map<Double, String> actual6 = (Map<Double, String>) AfTestCommons.collect(ACCOUNTS, COL.toByDoubleMap().of(Supplier.of(Map<Double, String>.class)).key(AfTestConsts.Account.BillingLatitude).val(AfTestConsts.Account.Name));
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
     * @see CollectorProvider.toByObjectMap
     */
    @IsTest
    @SuppressWarnings('PMD.NcssMethodCount')
    static void toByObjectMap() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.NumberOfEmployees);
        IFunction valueMapper = Function.identity();
        IBiOperator mergeFunction = BiOperator.right();
        // When
        Map<Object, Account> actual = (Map<Object, Account>) AfTestCommons.collect(ACCOUNTS, COL.toByObjectMap().of(Account.class).key(AfTestConsts.NUMBER_OF_EMPLOYEES).val());
        Map<Object, Account> actual1 = (Map<Object, Account>) AfTestCommons.collect(ACCOUNTS, COL.toByObjectMap().key(AfTestConsts.Account.NumberOfEmployees).cast(Map<Object, Account>.class));
        Map<Object, SObject> actual2 = (Map<Object, SObject>) AfTestCommons.collect(ACCOUNTS, COL.toByObjectMap().key(keyMapper));
        Map<Object, Object> actual3 = (Map<Object, Object>) AfTestCommons.collect(ACCOUNTS, COL.toByObjectMap().key(keyMapper).val(valueMapper));
        Map<Object, Object> actual4 = (Map<Object, Object>) AfTestCommons.collect(ACCOUNTS, COL.toByObjectMap().merger(mergeFunction).key(keyMapper).val(valueMapper));
        Map<Object, String> actual5 = (Map<Object, String>) AfTestCommons.collect(ACCOUNTS, COL.toByObjectMap().key(AfTestConsts.NUMBER_OF_EMPLOYEES).val(AfTestConsts.NAME).cast(Map<Object, String>.class));
        Map<Object, String> actual6 = (Map<Object, String>) AfTestCommons.collect(ACCOUNTS, COL.toByObjectMap().of(Supplier.of(Map<Object, String>.class)).key(AfTestConsts.Account.NumberOfEmployees).val(AfTestConsts.Account.Name));
        Map<Object, String> actual7 = (Map<Object, String>) AfTestCommons.collect(ACCOUNTS, COL.toByObjectMap().of(String.class).key().val(AfTestConsts.NAME));
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
        Map<Object, String> expected3 = new Map<Object, String>{
            ACCOUNTS[0] => (String) ACCOUNTS[0].get(AfTestConsts.Account.Name),
            ACCOUNTS[1] => (String) ACCOUNTS[1].get(AfTestConsts.Account.Name),
            ACCOUNTS[2] => (String) ACCOUNTS[2].get(AfTestConsts.Account.Name),
            ACCOUNTS[3] => (String) ACCOUNTS[3].get(AfTestConsts.Account.Name),
            ACCOUNTS[4] => (String) ACCOUNTS[4].get(AfTestConsts.Account.Name),
            ACCOUNTS[5] => (String) ACCOUNTS[5].get(AfTestConsts.Account.Name),
            ACCOUNTS[6] => (String) ACCOUNTS[6].get(AfTestConsts.Account.Name),
            ACCOUNTS[7] => (String) ACCOUNTS[7].get(AfTestConsts.Account.Name),
            ACCOUNTS[8] => (String) ACCOUNTS[8].get(AfTestConsts.Account.Name),
            ACCOUNTS[9] => (String) ACCOUNTS[9].get(AfTestConsts.Account.Name)
        };
        Assert.areEqual(expected3, actual7);
    }

    /**
     * @see CollectorProvider.groupingByBool
     */
    @IsTest
    static void groupingByBool() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Contact.DoNotCall);
        Collector downstream = COL.toList().val(AfTestConsts.Contact.LastName);
        // When
        Map<Boolean, List<Contact>> actual = (Map<Boolean, List<Contact>>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().key(AfTestConsts.Contact.DoNotCall));
        Map<Boolean, List<Contact>> actual1 = (Map<Boolean, List<Contact>>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().key(AfTestConsts.DO_NOT_CALL));
        Map<Boolean, List<SObject>> actual2 = (Map<Boolean, List<SObject>>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().key(keyMapper));
        Map<Boolean, Set<SObject>> actual3 = (Map<Boolean, Set<SObject>>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().of(Set<SObject>.class).key(keyMapper).val(COL.toSObjectSet()));
        Map<Boolean, List<String>> actual4 = (Map<Boolean, List<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().key(AfTestConsts.Contact.DoNotCall).val(AfTestConsts.Contact.LastName).cast(Map<Boolean, List<String>>.class));
        Map<Boolean, List<String>> actual5 = (Map<Boolean, List<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().of(List<String>.class).key(AfTestConsts.Contact.DoNotCall).val(AfTestConsts.Contact.LastName));
        Map<Boolean, Object> actual6 = (Map<Boolean, Object>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().key(AfTestConsts.Contact.DoNotCall).val(AfTestConsts.LAST_NAME));
        Map<Boolean, Object> actual7 = (Map<Boolean, Object>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().key(keyMapper).val(downstream).cast(Map<Boolean, List<String>>.class));
        Map<Boolean, List<String>> actual8 = (Map<Boolean, List<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().of(Supplier.of(Map<Boolean, List<String>>.class)).key(keyMapper).val(downstream.cast(List<String>.class)));
        Map<Boolean, Set<String>> actual9 = (Map<Boolean, Set<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().of(Set<String>.class).key(AfTestConsts.Contact.DoNotCall).val(COL.toStringSet().val(AfTestConsts.Contact.LastName)));
        Map<Boolean, Set<String>> actual10 = (Map<Boolean, Set<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().key(AfTestConsts.Contact.DoNotCall).val(COL.toStringSet().val(AfTestConsts.Contact.LastName)).cast(Map<Boolean, Set<String>>.class));
        Map<Boolean, Map<Boolean, List<String>>> actual11 = (Map<Boolean, Map<Boolean, List<String>>>)
            AfTestCommons.collect(CONTACTS, COL.groupingByBool().key(keyMapper).val(COL.groupingByBool().key(AfTestConsts.Contact.HasOptedOutOfEmail).val(AfTestConsts.Contact.LastName)).cast(Map<Boolean, Map<Boolean, List<String>>>.class));
        Map<Boolean, Object> actual12 = (Map<Boolean, Object>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().key(keyMapper).val(COL.groupingByBool().key(AfTestConsts.HAS_OPTED_OUT_OF_EMAIL).val(AfTestConsts.LAST_NAME)));
        Map<Boolean, Map<Boolean, Set<String>>> actual13 = (Map<Boolean, Map<Boolean, Set<String>>>) AfTestCommons.collect(CONTACTS, COL.groupingByBool().key(keyMapper).val(COL.groupingByBool().key(AfTestConsts.HAS_OPTED_OUT_OF_EMAIL).val(COL.toStringSet().val(AfTestConsts.LAST_NAME))).cast(Map<Boolean, Map<Boolean, Set<String>>>.class));
        // Then
        Map<Boolean, List<Contact>> expected = new Map<Boolean, List<Contact>>{
            true => new List<Contact>{ CONTACTS[0], CONTACTS[2] },
            false => new List<Contact>{ CONTACTS[1], CONTACTS[3] },
            null => new List<Contact>{ CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Boolean, Set<SObject>> expected1 = new Map<Boolean, Set<SObject>>{
            true => new Set<SObject>{ CONTACTS[0], CONTACTS[2] },
            false => new Set<SObject>{ CONTACTS[1], CONTACTS[3] },
            null => new Set<SObject>{ CONTACTS[4] }
        };
        Assert.areEqual(expected1, actual3);
        Map<Boolean, List<String>> expected2 = new Map<Boolean, List<String>>{
            true => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) },
            false => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
        Map<Boolean, Set<String>> expected3 = new Map<Boolean, Set<String>>{
            true => new Set<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) },
            false => new Set<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            null => new Set<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected3, actual9);
        Assert.areEqual(expected3, actual10);
        Map<Boolean, Map<Boolean, List<String>>> expected4 = new Map<Boolean, Map<Boolean, List<String>>>{
            true => new Map<Boolean, List<String>>{ true => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) } },
            false => new Map<Boolean, List<String>>{ true => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) }, false => new List<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) } },
            null => new Map<Boolean, List<String>>{ false => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) } }
        };
        Assert.areEqual(expected4, actual11);
        Assert.areEqual(expected4, actual12);
        Map<Boolean, Map<Boolean, Set<String>>> expected5 = new Map<Boolean, Map<Boolean, Set<String>>>{
            true => new Map<Boolean, Set<String>>{ true => new Set<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) } },
            false => new Map<Boolean, Set<String>>{ true => new Set<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) }, false => new Set<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) } },
            null => new Map<Boolean, Set<String>>{ false => new Set<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) } }
        };
        Assert.areEqual(expected5, actual13);
    }

    /**
     * @see CollectorProvider.groupingById
     */
    @IsTest
    static void groupingById() {
        // Given
        CONTACTS[0].AccountId = ACCOUNTS[0].Id;
        CONTACTS[1].AccountId = ACCOUNTS[0].Id;
        CONTACTS[2].AccountId = ACCOUNTS[1].Id;
        CONTACTS[3].AccountId = ACCOUNTS[1].Id;
        CONTACTS[4].AccountId = null;
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Contact.AccountId);
        Collector downstream = COL.toList().val(AfTestConsts.Contact.LastName);
        // When
        Map<Id, List<Contact>> actual = (Map<Id, List<Contact>>) AfTestCommons.collect(CONTACTS, COL.groupingById().key(AfTestConsts.Contact.AccountId));
        Map<Id, List<Contact>> actual1 = (Map<Id, List<Contact>>) AfTestCommons.collect(CONTACTS, COL.groupingById().key(AfTestConsts.ACCOUNT_ID));
        Map<Id, List<SObject>> actual2 = (Map<Id, List<SObject>>) AfTestCommons.collect(CONTACTS, COL.groupingById().key(keyMapper));
        Map<Id, Set<SObject>> actual3 = (Map<Id, Set<SObject>>) AfTestCommons.collect(CONTACTS, COL.groupingById().of(Set<SObject>.class).key(keyMapper).val(COL.toSObjectSet()));
        Map<Id, List<String>> actual4 = (Map<Id, List<String>>) AfTestCommons.collect(CONTACTS, COL.groupingById().key(AfTestConsts.Contact.AccountId).val(AfTestConsts.Contact.LastName).cast(Map<Id, List<String>>.class));
        Map<Id, List<String>> actual5 = (Map<Id, List<String>>) AfTestCommons.collect(CONTACTS, COL.groupingById().of(List<String>.class).key(AfTestConsts.Contact.AccountId).val(AfTestConsts.Contact.LastName));
        Map<Id, Object> actual6 = (Map<Id, Object>) AfTestCommons.collect(CONTACTS, COL.groupingById().key(AfTestConsts.ACCOUNT_ID).val(AfTestConsts.LAST_NAME));
        Map<Id, Object> actual7 = (Map<Id, Object>) AfTestCommons.collect(CONTACTS, COL.groupingById().key(keyMapper).val(downstream));
        Map<Id, List<String>> actual8 = (Map<Id, List<String>>) AfTestCommons.collect(CONTACTS, COL.groupingById().of(Supplier.of(Map<Id, List<String>>.class)).key(keyMapper).val(downstream.cast(List<String>.class)));
        Map<Id, Set<String>> actual9 = (Map<Id, Set<String>>) AfTestCommons.collect(CONTACTS, COL.groupingById().of(Set<String>.class).key(AfTestConsts.Contact.AccountId).val(COL.toStringSet().val(AfTestConsts.Contact.LastName)));
        Map<Id, Set<String>> actual10 = (Map<Id, Set<String>>) AfTestCommons.collect(CONTACTS, COL.groupingById().key(AfTestConsts.Contact.AccountId).val(COL.toStringSet().val(AfTestConsts.Contact.LastName)).cast(Map<Id, Set<String>>.class));
        Map<Id, Map<Id, List<String>>> actual11 = (Map<Id, Map<Id, List<String>>>)
            AfTestCommons.collect(CONTACTS, COL.groupingById().key(keyMapper).val(COL.groupingById().key(AfTestConsts.Contact.Id).val(AfTestConsts.Contact.LastName)).cast(Map<Id, Map<Id, List<String>>>.class));
        Map<Id, Object> actual12 = (Map<Id, Object>) AfTestCommons.collect(CONTACTS, COL.groupingById().key(keyMapper).val(COL.groupingById().key(AfTestConsts.ID).val(AfTestConsts.LAST_NAME)));
        Map<Id, Map<Id, Set<String>>> actual13 = (Map<Id, Map<Id, Set<String>>>) AfTestCommons.collect(CONTACTS, COL.groupingById().key(keyMapper).val(COL.groupingById().key(AfTestConsts.Contact.Id).val(COL.toStringSet().val(AfTestConsts.Contact.LastName))).cast(Map<Id, Map<Id, Set<String>>>.class));
        // Then
        Map<Id, List<Contact>> expected = new Map<Id, List<Contact>>{
            ACCOUNTS[0].Id => new List<Contact>{ CONTACTS[0], CONTACTS[1] },
            ACCOUNTS[1].Id => new List<Contact>{ CONTACTS[2], CONTACTS[3] },
            null => new List<Contact>{ CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Id, Set<SObject>> expected1 = new Map<Id, Set<SObject>>{
            ACCOUNTS[0].Id => new Set<SObject>{ CONTACTS[0], CONTACTS[1] },
            ACCOUNTS[1].Id => new Set<SObject>{ CONTACTS[2], CONTACTS[3] },
            null => new Set<SObject>{ CONTACTS[4] }
        };
        Assert.areEqual(expected1, actual3);
        Map<Id, List<String>> expected2 = new Map<Id, List<String>>{
            ACCOUNTS[0].Id => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) },
            ACCOUNTS[1].Id => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
        Map<Id, Set<String>> expected3 = new Map<Id, Set<String>>{
            ACCOUNTS[0].Id => new Set<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) },
            ACCOUNTS[1].Id => new Set<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            null => new Set<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected3, actual9);
        Assert.areEqual(expected3, actual10);
        Map<Id, Map<Id, List<String>>> expected4 = new Map<Id, Map<Id, List<String>>>{
            ACCOUNTS[0].Id => new Map<Id, List<String>>{ CONTACTS[0].Id => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME) }, CONTACTS[1].Id => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) } },
            ACCOUNTS[1].Id => new Map<Id, List<String>>{ CONTACTS[2].Id => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) }, CONTACTS[3].Id => new List<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) } },
            null => new Map<Id, List<String>>{ CONTACTS[4].Id => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) } }
        };
        Assert.areEqual(expected4, actual11);
        Assert.areEqual(expected4, actual12);
        Map<Id, Map<Id, Set<String>>> expected5 = new Map<Id, Map<Id, Set<String>>>{
            ACCOUNTS[0].Id => new Map<Id, Set<String>>{ CONTACTS[0].Id => new Set<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME) }, CONTACTS[1].Id => new Set<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) } },
            ACCOUNTS[1].Id => new Map<Id, Set<String>>{ CONTACTS[2].Id => new Set<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) }, CONTACTS[3].Id => new Set<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) } },
            null => new Map<Id, Set<String>>{ CONTACTS[4].Id => new Set<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) } }
        };
        Assert.areEqual(expected5, actual13);
    }

    /**
     * @see CollectorProvider.groupingByString
     */
    @IsTest
    static void groupingByString() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Contact.OtherCountry);
        Collector downstream = COL.toList().val(AfTestConsts.Contact.LastName);
        // When
        Map<String, List<Contact>> actual = (Map<String, List<Contact>>) AfTestCommons.collect(CONTACTS, COL.groupingByString().key(AfTestConsts.Contact.OtherCountry));
        Map<String, List<Contact>> actual1 = (Map<String, List<Contact>>) AfTestCommons.collect(CONTACTS, COL.groupingByString().key(AfTestConsts.OTHER_COUNTRY));
        Map<String, List<SObject>> actual2 = (Map<String, List<SObject>>) AfTestCommons.collect(CONTACTS, COL.groupingByString().key(keyMapper));
        Map<String, Set<SObject>> actual3 = (Map<String, Set<SObject>>) AfTestCommons.collect(CONTACTS, COL.groupingByString().of(Set<SObject>.class).key(keyMapper).val(COL.toSObjectSet()));
        Map<String, List<String>> actual4 = (Map<String, List<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByString().key(AfTestConsts.Contact.OtherCountry).val(AfTestConsts.Contact.LastName).cast(Map<String, List<String>>.class));
        Map<String, List<String>> actual5 = (Map<String, List<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByString().of(List<String>.class).key(AfTestConsts.Contact.OtherCountry).val(AfTestConsts.Contact.LastName));
        Map<String, Object> actual6 = (Map<String, Object>) AfTestCommons.collect(CONTACTS, COL.groupingByString().key(AfTestConsts.Contact.OtherCountry).val(AfTestConsts.LAST_NAME));
        Map<String, Object> actual7 = (Map<String, Object>) AfTestCommons.collect(CONTACTS, COL.groupingByString().key(keyMapper).val(downstream));
        Map<String, List<String>> actual8 = (Map<String, List<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByString().of(Supplier.of(Map<String, List<String>>.class)).key(keyMapper).val(downstream.cast(List<String>.class)));
        Map<String, Set<String>> actual9 = (Map<String, Set<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByString().of(Set<String>.class).key(AfTestConsts.Contact.OtherCountry).val(COL.toStringSet().val(AfTestConsts.Contact.LastName)));
        Map<String, Set<String>> actual10 = (Map<String, Set<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByString().key(AfTestConsts.Contact.OtherCountry).val(COL.toStringSet().val(AfTestConsts.Contact.LastName)).cast(Map<String, Set<String>>.class));
        Map<String, Map<String, List<String>>> actual11 = (Map<String, Map<String, List<String>>>)
            AfTestCommons.collect(CONTACTS, COL.groupingByString().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.Contact.OtherCity).val(AfTestConsts.Contact.LastName)).cast(Map<String, Map<String, List<String>>>.class));
        Map<String, Object> actual12 = (Map<String, Object>) AfTestCommons.collect(CONTACTS, COL.groupingByString().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.OTHER_CITY).val(AfTestConsts.LAST_NAME)));
        Map<String, Map<String, Set<String>>> actual13 = (Map<String, Map<String, Set<String>>>) AfTestCommons.collect(CONTACTS, COL.groupingByString().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.OTHER_CITY).val(COL.toStringSet().val(AfTestConsts.Contact.LastName))).cast(Map<String, Map<String, Set<String>>>.class));
        // Then
        Map<String, List<Contact>> expected = new Map<String, List<Contact>>{
            AfTestConsts.FRANCE => new List<Contact>{ CONTACTS[0], CONTACTS[1] },
            AfTestConsts.UK => new List<Contact>{ CONTACTS[2], CONTACTS[3] },
            null => new List<Contact>{ CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<String, Set<SObject>> expected1 = new Map<String, Set<SObject>>{
            AfTestConsts.FRANCE => new Set<SObject>{ CONTACTS[0], CONTACTS[1] },
            AfTestConsts.UK => new Set<SObject>{ CONTACTS[2], CONTACTS[3] },
            null => new Set<SObject>{ CONTACTS[4] }
        };
        Assert.areEqual(expected1, actual3);
        Map<String, List<String>> expected2 = new Map<String, List<String>>{
            AfTestConsts.FRANCE => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) },
            AfTestConsts.UK => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
        Map<String, Set<String>> expected3 = new Map<String, Set<String>>{
            AfTestConsts.FRANCE => new Set<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) },
            AfTestConsts.UK => new Set<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            null => new Set<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected3, actual9);
        Assert.areEqual(expected3, actual10);
        Map<String, Map<String, List<String>>> expected4 = new Map<String, Map<String, List<String>>>{
            AfTestConsts.FRANCE => new Map<String, List<String>>{ AfTestConsts.PARIS => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME) }, AfTestConsts.LYON => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) } },
            AfTestConsts.UK => new Map<String, List<String>>{ AfTestConsts.LONDON => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) }, AfTestConsts.BRISTOL => new List<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) } }
        };
        Assert.areEqual(expected4, actual11);
        Assert.areEqual(expected4, actual12);
        Map<String, Map<String, Set<String>>> expected5 = new Map<String, Map<String, Set<String>>>{
            AfTestConsts.FRANCE => new Map<String, Set<String>>{ AfTestConsts.PARIS => new Set<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME) }, AfTestConsts.LYON => new Set<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) } },
            AfTestConsts.UK => new Map<String, Set<String>>{ AfTestConsts.LONDON => new Set<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) }, AfTestConsts.BRISTOL => new Set<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) } },
            null => new Map<String, Set<String>>{ null => new Set<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) } }
        };
        Assert.areEqual(expected5, actual13);
    }

    /**
     * @see CollectorProvider.groupingByBlob
     */
    @IsTest
    static void groupingByBlob() {
        // Given
        ATTACHMENTS[0].Body = ATTACHMENTS[0].Body;
        ATTACHMENTS[1].Body = ATTACHMENTS[1].Body;
        ATTACHMENTS[2].Body = ATTACHMENTS[0].Body;
        ATTACHMENTS[3].Body = ATTACHMENTS[1].Body;
        ATTACHMENTS[4].Body = ATTACHMENTS[0].Body;
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Attachment.Body);
        Collector downstream = COL.toList().val(AfTestConsts.Attachment.Name);
        // When
        Map<Blob, List<Attachment>> actual = (Map<Blob, List<Attachment>>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().key(AfTestConsts.Attachment.Body));
        Map<Blob, List<Attachment>> actual1 = (Map<Blob, List<Attachment>>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().key(AfTestConsts.BODY));
        Map<Blob, List<SObject>> actual2 = (Map<Blob, List<SObject>>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().key(keyMapper));
        Map<Blob, Set<SObject>> actual3 = (Map<Blob, Set<SObject>>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().of(Set<SObject>.class).key(keyMapper).val(COL.toSObjectSet()));
        Map<Blob, List<String>> actual4 = (Map<Blob, List<String>>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().key(AfTestConsts.Attachment.Body).val(AfTestConsts.Attachment.Name).cast(Map<Blob, List<String>>.class));
        Map<Blob, List<String>> actual5 = (Map<Blob, List<String>>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().of(List<String>.class).key(AfTestConsts.Attachment.Body).val(AfTestConsts.Attachment.Name));
        Map<Blob, Object> actual6 = (Map<Blob, Object>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().key(AfTestConsts.BODY).val(AfTestConsts.NAME));
        Map<Blob, Object> actual7 = (Map<Blob, Object>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().key(keyMapper).val(downstream));
        Map<Blob, List<String>> actual8 = (Map<Blob, List<String>>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().of(Supplier.of(Map<Blob, List<String>>.class)).key(keyMapper).val(downstream.cast(List<String>.class)));
        Map<Blob, Set<String>> actual9 = (Map<Blob, Set<String>>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().of(Set<String>.class).key(AfTestConsts.Attachment.Body).val(COL.toStringSet().val(AfTestConsts.Attachment.Name)));
        Map<Blob, Set<String>> actual10 = (Map<Blob, Set<String>>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().key(AfTestConsts.Attachment.Body).val(COL.toStringSet().val(AfTestConsts.Attachment.Name)).cast(Map<Blob, Set<String>>.class));
        Map<Blob, Map<String, List<String>>> actual11 = (Map<Blob, Map<String, List<String>>>)
            AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.Attachment.ContentType).val(AfTestConsts.Attachment.Name)).cast(Map<Blob, Map<String, List<String>>>.class));
        Map<Blob, Object> actual12 = (Map<Blob, Object>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.CONTENT_TYPE).val(AfTestConsts.NAME)));
        Map<Blob, Map<String, Set<String>>> actual13 = (Map<Blob, Map<String, Set<String>>>) AfTestCommons.collect(ATTACHMENTS, COL.groupingByBlob().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.CONTENT_TYPE).val(COL.toStringSet().val(AfTestConsts.Attachment.Name))).cast(Map<Blob, Map<String, Set<String>>>.class));
        // Then
        Map<Blob, List<Attachment>> expected = new Map<Blob, List<Attachment>>{
            ATTACHMENTS[0].Body => new List<Attachment>{ ATTACHMENTS[0], ATTACHMENTS[2], ATTACHMENTS[4] },
            ATTACHMENTS[1].Body => new List<Attachment>{ ATTACHMENTS[1], ATTACHMENTS[3] },
            null => new List<Attachment>{ ATTACHMENTS[5] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Blob, Set<SObject>> expected1 = new Map<Blob, Set<SObject>>{
            ATTACHMENTS[0].Body => new Set<SObject>{ ATTACHMENTS[0], ATTACHMENTS[2], ATTACHMENTS[4] },
            ATTACHMENTS[1].Body => new Set<SObject>{ ATTACHMENTS[1], ATTACHMENTS[3] },
            null => new Set<SObject>{ ATTACHMENTS[5] }
        };
        Assert.areEqual(expected1, actual3);
        Map<Blob, List<String>> expected2 = new Map<Blob, List<String>>{
            ATTACHMENTS[0].Body => new List<String>{ (String) ATTACHMENTS[0].get(AfTestConsts.NAME), (String) ATTACHMENTS[2].get(AfTestConsts.NAME), (String) ATTACHMENTS[4].get(AfTestConsts.NAME) },
            ATTACHMENTS[1].Body => new List<String>{ (String) ATTACHMENTS[1].get(AfTestConsts.NAME), (String) ATTACHMENTS[3].get(AfTestConsts.NAME) },
            null => new List<String>{ (String) ATTACHMENTS[5].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
        Map<Blob, Set<String>> expected3 = new Map<Blob, Set<String>>{
            ATTACHMENTS[0].Body => new Set<String>{ (String) ATTACHMENTS[0].get(AfTestConsts.NAME), (String) ATTACHMENTS[2].get(AfTestConsts.NAME), (String) ATTACHMENTS[4].get(AfTestConsts.NAME) },
            ATTACHMENTS[1].Body => new Set<String>{ (String) ATTACHMENTS[1].get(AfTestConsts.NAME), (String) ATTACHMENTS[3].get(AfTestConsts.NAME) },
            null => new Set<String>{ (String) ATTACHMENTS[5].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected3, actual9);
        Assert.areEqual(expected3, actual10);
        Map<Blob, Map<String, List<String>>> expected4 = new Map<Blob, Map<String, List<String>>>{
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
        Assert.areEqual(expected4, actual11);
        Assert.areEqual(expected4, actual12);
        Map<Blob, Map<String, Set<String>>> expected5 = new Map<Blob, Map<String, Set<String>>>{
            ATTACHMENTS[0].Body => new Map<String, Set<String>>{
                AfTestConsts.DOC => new Set<String>{ (String) ATTACHMENTS[0].get(AfTestConsts.NAME), (String) ATTACHMENTS[2].get(AfTestConsts.NAME) },
                AfTestConsts.PDF => new Set<String>{ (String) ATTACHMENTS[4].get(AfTestConsts.NAME) }
            },
            ATTACHMENTS[1].Body => new Map<String, Set<String>>{
                AfTestConsts.DOC => new Set<String>{ (String) ATTACHMENTS[1].get(AfTestConsts.NAME) },
                AfTestConsts.PDF => new Set<String>{ (String) ATTACHMENTS[3].get(AfTestConsts.NAME) }
            },
            null => new Map<String, Set<String>>{ null => new Set<String>{ (String) ATTACHMENTS[5].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected5, actual13);
    }

    /**
     * @see CollectorProvider.groupingByDate
     */
    @IsTest
    static void groupingByDate() {
        // Given
        CONTACTS[0].Birthdate = CONTACTS[0].Birthdate;
        CONTACTS[1].Birthdate = CONTACTS[1].Birthdate;
        CONTACTS[2].Birthdate = CONTACTS[0].Birthdate;
        CONTACTS[3].Birthdate = CONTACTS[1].Birthdate;
        CONTACTS[4].Birthdate = null;
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Contact.Birthdate);
        Collector downstream = COL.toList().val(AfTestConsts.Contact.LastName);
        // When
        Map<Date, List<Contact>> actual = (Map<Date, List<Contact>>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().key(AfTestConsts.Contact.Birthdate));
        Map<Date, List<Contact>> actual1 = (Map<Date, List<Contact>>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().key(AfTestConsts.BIRTHDATE));
        Map<Date, List<SObject>> actual2 = (Map<Date, List<SObject>>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().key(keyMapper));
        Map<Date, Set<SObject>> actual3 = (Map<Date, Set<SObject>>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().of(Set<SObject>.class).key(keyMapper).val(COL.toSObjectSet()));
        Map<Date, List<String>> actual4 = (Map<Date, List<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().key(AfTestConsts.Contact.Birthdate).val(AfTestConsts.Contact.LastName).cast(Map<Date, List<String>>.class));
        Map<Date, List<String>> actual5 = (Map<Date, List<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().of(List<String>.class).key(AfTestConsts.Contact.Birthdate).val(AfTestConsts.Contact.LastName));
        Map<Date, Object> actual6 = (Map<Date, Object>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().key(AfTestConsts.BIRTHDATE).val(AfTestConsts.LAST_NAME));
        Map<Date, Object> actual7 = (Map<Date, Object>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().key(keyMapper).val(downstream));
        Map<Date, List<String>> actual8 = (Map<Date, List<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().of(Supplier.of(Map<Date, List<String>>.class)).key(keyMapper).val(downstream.cast(List<String>.class)));
        Map<Date, Set<String>> actual9 = (Map<Date, Set<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().of(Set<String>.class).key(AfTestConsts.Contact.Birthdate).val(COL.toStringSet().val(AfTestConsts.Contact.LastName)));
        Map<Date, Set<String>> actual10 = (Map<Date, Set<String>>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().key(AfTestConsts.Contact.Birthdate).val(COL.toStringSet().val(AfTestConsts.Contact.LastName)).cast(Map<Date, Set<String>>.class));
        Map<Date, Map<String, List<String>>> actual11 = (Map<Date, Map<String, List<String>>>)
            AfTestCommons.collect(CONTACTS, COL.groupingByDate().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.Contact.Department).val(AfTestConsts.Contact.LastName)).cast(Map<Date, Map<String, List<String>>>.class));
        Map<Date, Object> actual12 = (Map<Date, Object>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.DEPARTMENT).val(AfTestConsts.LAST_NAME)));
        Map<Date, Map<String, Set<String>>> actual13 = (Map<Date, Map<String, Set<String>>>) AfTestCommons.collect(CONTACTS, COL.groupingByDate().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.DEPARTMENT).val(COL.toStringSet().val(AfTestConsts.Contact.LastName))).cast(Map<Date, Map<String, Set<String>>>.class));
        // Then
        Map<Date, List<Contact>> expected = new Map<Date, List<Contact>>{
            CONTACTS[0].Birthdate => new List<Contact>{ CONTACTS[0], CONTACTS[2] },
            CONTACTS[1].Birthdate => new List<Contact>{ CONTACTS[1], CONTACTS[3] },
            null => new List<Contact>{ CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Date, Set<SObject>> expected1 = new Map<Date, Set<SObject>>{
            CONTACTS[0].Birthdate => new Set<SObject>{ CONTACTS[0], CONTACTS[2] },
            CONTACTS[1].Birthdate => new Set<SObject>{ CONTACTS[1], CONTACTS[3] },
            null => new Set<SObject>{ CONTACTS[4] }
        };
        Assert.areEqual(expected1, actual3);
        Map<Date, List<String>> expected2 = new Map<Date, List<String>>{
            CONTACTS[0].Birthdate => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) },
            CONTACTS[1].Birthdate => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
        Map<Date, Set<String>> expected3 = new Map<Date, Set<String>>{
            CONTACTS[0].Birthdate => new Set<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) },
            CONTACTS[1].Birthdate => new Set<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            null => new Set<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected3, actual9);
        Assert.areEqual(expected3, actual10);
        Map<Date, Map<String, List<String>>> expected4 = new Map<Date, Map<String, List<String>>>{
            CONTACTS[0].Birthdate => new Map<String, List<String>>{ AfTestConsts.HR => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME) }, AfTestConsts.FINANCE => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) } },
            CONTACTS[1].Birthdate => new Map<String, List<String>>{ AfTestConsts.HR => new List<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) }, AfTestConsts.FINANCE => new List<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) } }
        };
        Assert.areEqual(expected4, actual11);
        Assert.areEqual(expected4, actual12);
        Map<Date, Map<String, Set<String>>> expected5 = new Map<Date, Map<String, Set<String>>>{
            CONTACTS[0].Birthdate => new Map<String, Set<String>>{ AfTestConsts.HR => new Set<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME) }, AfTestConsts.FINANCE => new Set<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME) } },
            CONTACTS[1].Birthdate => new Map<String, Set<String>>{ AfTestConsts.HR => new Set<String>{ (String) CONTACTS[1].get(AfTestConsts.LAST_NAME) }, AfTestConsts.FINANCE => new Set<String>{ (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) } },
            null => new Map<String, Set<String>>{ null => new Set<String>{ (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) } }
        };
        Assert.areEqual(expected5, actual13);
    }

    /**
     * @see CollectorProvider.groupingByDatetime
     */
    @IsTest
    static void groupingByDatetime() {
        // Given
        EVENTS[0].ActivityDateTime = EVENTS[0].ActivityDateTime;
        EVENTS[1].ActivityDateTime = EVENTS[1].ActivityDateTime;
        EVENTS[2].ActivityDateTime = EVENTS[0].ActivityDateTime;
        EVENTS[3].ActivityDateTime = EVENTS[1].ActivityDateTime;
        EVENTS[4].ActivityDateTime = null;
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Event.ActivityDateTime);
        Collector downstream = COL.toList().val(AfTestConsts.Event.Description);
        // When
        Map<Datetime, List<Event>> actual = (Map<Datetime, List<Event>>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().key(AfTestConsts.Event.ActivityDateTime));
        Map<Datetime, List<Event>> actual1 = (Map<Datetime, List<Event>>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().key(AfTestConsts.ACTIVITY_DATE_TIME));
        Map<Datetime, List<SObject>> actual2 = (Map<Datetime, List<SObject>>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().key(keyMapper));
        Map<Datetime, Set<SObject>> actual3 = (Map<Datetime, Set<SObject>>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().of(Set<SObject>.class).key(keyMapper).val(COL.toSObjectSet()));
        Map<Datetime, List<String>> actual4 = (Map<Datetime, List<String>>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().key(AfTestConsts.Event.ActivityDateTime).val(AfTestConsts.Event.Description).cast(Map<Datetime, List<String>>.class));
        Map<Datetime, List<String>> actual5 = (Map<Datetime, List<String>>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().of(List<String>.class).key(AfTestConsts.Event.ActivityDateTime).val(AfTestConsts.Event.Description));
        Map<Datetime, Object> actual6 = (Map<Datetime, Object>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().key(AfTestConsts.ACTIVITY_DATE_TIME).val(AfTestConsts.DESCRIPTION));
        Map<Datetime, Object> actual7 = (Map<Datetime, Object>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().key(keyMapper).val(downstream));
        Map<Datetime, List<String>> actual8 = (Map<Datetime, List<String>>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().of(Supplier.of(Map<Datetime, List<String>>.class)).key(keyMapper).val(downstream.cast(List<String>.class)));
        Map<Datetime, Set<String>> actual9 = (Map<Datetime, Set<String>>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().of(Set<String>.class).key(AfTestConsts.Event.ActivityDateTime).val(COL.toStringSet().val(AfTestConsts.Event.Description)));
        Map<Datetime, Set<String>> actual10 = (Map<Datetime, Set<String>>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().key(AfTestConsts.Event.ActivityDateTime).val(COL.toStringSet().val(AfTestConsts.Event.Description)).cast(Map<Datetime, Set<String>>.class));
        Map<Datetime, Map<String, List<String>>> actual11 = (Map<Datetime, Map<String, List<String>>>)
            AfTestCommons.collect(EVENTS, COL.groupingByDatetime().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.Event.Type).val(AfTestConsts.Event.Description)).cast(Map<Datetime, Map<String, List<String>>>.class));
        Map<Datetime, Object> actual12 = (Map<Datetime, Object>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.TYPE).val(AfTestConsts.DESCRIPTION)));
        Map<Datetime, Map<String, Set<String>>> actual13 = (Map<Datetime, Map<String, Set<String>>>) AfTestCommons.collect(EVENTS, COL.groupingByDatetime().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.TYPE).val(COL.toStringSet().val(AfTestConsts.Event.Description))).cast(Map<Datetime, Map<String, Set<String>>>.class));
        // Then
        Map<Datetime, List<Event>> expected = new Map<Datetime, List<Event>>{
            EVENTS[0].ActivityDateTime => new List<Event>{ EVENTS[0], EVENTS[2] },
            EVENTS[1].ActivityDateTime => new List<Event>{ EVENTS[1], EVENTS[3] },
            null => new List<Event>{ EVENTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Datetime, Set<SObject>> expected1 = new Map<Datetime, Set<SObject>>{
            EVENTS[0].ActivityDateTime => new Set<SObject>{ EVENTS[0], EVENTS[2] },
            EVENTS[1].ActivityDateTime => new Set<SObject>{ EVENTS[1], EVENTS[3] },
            null => new Set<SObject>{ EVENTS[4] }
        };
        Assert.areEqual(expected1, actual3);
        Map<Datetime, List<String>> expected2 = new Map<Datetime, List<String>>{
            EVENTS[0].ActivityDateTime => new List<String>{ (String) EVENTS[0].get(AfTestConsts.DESCRIPTION), (String) EVENTS[2].get(AfTestConsts.DESCRIPTION) },
            EVENTS[1].ActivityDateTime => new List<String>{ (String) EVENTS[1].get(AfTestConsts.DESCRIPTION), (String) EVENTS[3].get(AfTestConsts.DESCRIPTION) },
            null => new List<String>{ (String) EVENTS[4].get(AfTestConsts.DESCRIPTION) }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
        Map<Datetime, Set<String>> expected3 = new Map<Datetime, Set<String>>{
            EVENTS[0].ActivityDateTime => new Set<String>{ (String) EVENTS[0].get(AfTestConsts.DESCRIPTION), (String) EVENTS[2].get(AfTestConsts.DESCRIPTION) },
            EVENTS[1].ActivityDateTime => new Set<String>{ (String) EVENTS[1].get(AfTestConsts.DESCRIPTION), (String) EVENTS[3].get(AfTestConsts.DESCRIPTION) },
            null => new Set<String>{ (String) EVENTS[4].get(AfTestConsts.DESCRIPTION) }
        };
        Assert.areEqual(expected3, actual9);
        Assert.areEqual(expected3, actual10);
        Map<Datetime, Map<String, List<String>>> expected4 = new Map<Datetime, Map<String, List<String>>>{
            EVENTS[0].ActivityDateTime => new Map<String, List<String>>{ AfTestConsts.CALL => new List<String>{ (String) EVENTS[0].get(AfTestConsts.DESCRIPTION) }, AfTestConsts.EMAIL => new List<String>{ (String) EVENTS[2].get(AfTestConsts.DESCRIPTION) } },
            EVENTS[1].ActivityDateTime => new Map<String, List<String>>{ AfTestConsts.CALL => new List<String>{ (String) EVENTS[1].get(AfTestConsts.DESCRIPTION) }, AfTestConsts.EMAIL => new List<String>{ (String) EVENTS[3].get(AfTestConsts.DESCRIPTION) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) EVENTS[4].get(AfTestConsts.DESCRIPTION) } }
        };
        Assert.areEqual(expected4, actual11);
        Assert.areEqual(expected4, actual12);
        Map<Datetime, Map<String, Set<String>>> expected5 = new Map<Datetime, Map<String, Set<String>>>{
            EVENTS[0].ActivityDateTime => new Map<String, Set<String>>{ AfTestConsts.CALL => new Set<String>{ (String) EVENTS[0].get(AfTestConsts.DESCRIPTION) }, AfTestConsts.EMAIL => new Set<String>{ (String) EVENTS[2].get(AfTestConsts.DESCRIPTION) } },
            EVENTS[1].ActivityDateTime => new Map<String, Set<String>>{ AfTestConsts.CALL => new Set<String>{ (String) EVENTS[1].get(AfTestConsts.DESCRIPTION) }, AfTestConsts.EMAIL => new Set<String>{ (String) EVENTS[3].get(AfTestConsts.DESCRIPTION) } },
            null => new Map<String, Set<String>>{ null => new Set<String>{ (String) EVENTS[4].get(AfTestConsts.DESCRIPTION) } }
        };
        Assert.areEqual(expected5, actual13);
    }

    /**
     * @see CollectorProvider.groupingByTime
     */
    @IsTest
    static void groupingByTime() {
        // Given
        SLOTS[0].BestTimeToContactStartTime = SLOTS[0].BestTimeToContactStartTime;
        SLOTS[1].BestTimeToContactStartTime = SLOTS[1].BestTimeToContactStartTime;
        SLOTS[2].BestTimeToContactStartTime = SLOTS[0].BestTimeToContactStartTime;
        SLOTS[3].BestTimeToContactStartTime = SLOTS[1].BestTimeToContactStartTime;
        SLOTS[4].BestTimeToContactStartTime = null;
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.ContactEmail.StartTime);
        Collector downstream = COL.toList().val(AfTestConsts.ContactEmail.Id);
        // When
        Map<Time, List<ContactPointEmail>> actual = (Map<Time, List<ContactPointEmail>>) AfTestCommons.collect(SLOTS, COL.groupingByTime().key(AfTestConsts.ContactEmail.StartTime));
        Map<Time, List<ContactPointEmail>> actual1 = (Map<Time, List<ContactPointEmail>>) AfTestCommons.collect(SLOTS, COL.groupingByTime().key(AfTestConsts.BEST_START_TIME));
        Map<Time, List<SObject>> actual2 = (Map<Time, List<SObject>>) AfTestCommons.collect(SLOTS, COL.groupingByTime().key(keyMapper));
        Map<Time, Set<SObject>> actual3 = (Map<Time, Set<SObject>>) AfTestCommons.collect(SLOTS, COL.groupingByTime().of(Set<SObject>.class).key(keyMapper).val(COL.toSObjectSet()));
        Map<Time, List<Id>> actual4 = (Map<Time, List<Id>>) AfTestCommons.collect(SLOTS, COL.groupingByTime().key(AfTestConsts.ContactEmail.StartTime).val(AfTestConsts.ContactEmail.Id).cast(Map<Time, List<Id>>.class));
        Map<Time, List<Id>> actual5 = (Map<Time, List<Id>>) AfTestCommons.collect(SLOTS, COL.groupingByTime().of(List<Id>.class).key(AfTestConsts.ContactEmail.StartTime).val(AfTestConsts.ContactEmail.Id));
        Map<Time, Object> actual6 = (Map<Time, Object>) AfTestCommons.collect(SLOTS, COL.groupingByTime().key(AfTestConsts.BEST_START_TIME).val(AfTestConsts.ID));
        Map<Time, Object> actual7 = (Map<Time, Object>) AfTestCommons.collect(SLOTS, COL.groupingByTime().key(keyMapper).val(downstream).cast(Map<Time, List<Id>>.class));
        Map<Time, List<Id>> actual8 = (Map<Time, List<Id>>) AfTestCommons.collect(SLOTS, COL.groupingByTime().of(Supplier.of(Map<Time, List<Id>>.class)).key(keyMapper).val(downstream.cast(List<Id>.class)));
        Map<Time, Set<Id>> actual9 = (Map<Time, Set<Id>>) AfTestCommons.collect(SLOTS, COL.groupingByTime().of(Set<Id>.class).key(AfTestConsts.ContactEmail.StartTime).val(COL.toIdSet().val(AfTestConsts.ContactEmail.Id)));
        Map<Time, Set<Id>> actual10 = (Map<Time, Set<Id>>) AfTestCommons.collect(SLOTS, COL.groupingByTime().key(AfTestConsts.ContactEmail.StartTime).val(COL.toIdSet().val(AfTestConsts.ContactEmail.Id)).cast(Map<Time, Set<Id>>.class));
        Map<Time, Map<String, List<Id>>> actual11 = (Map<Time, Map<String, List<Id>>>)
            AfTestCommons.collect(SLOTS, COL.groupingByTime().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.ContactEmail.Address).val(AfTestConsts.ContactEmail.Id)).cast(Map<Time, Map<String, List<Id>>>.class));
        Map<Time, Object> actual12 = (Map<Time, Object>) AfTestCommons.collect(SLOTS, COL.groupingByTime().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.EMAIL_ADDRESS).val(AfTestConsts.ID)));
        Map<Time, Map<String, Set<Id>>> actual13 = (Map<Time, Map<String, Set<Id>>>)
            AfTestCommons.collect(SLOTS, COL.groupingByTime().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.EMAIL_ADDRESS).val(COL.toIdSet().val(AfTestConsts.ContactEmail.Id))).cast(Map<Time, Map<String, Set<Id>>>.class));
        // Then
        Map<Time, List<ContactPointEmail>> expected = new Map<Time, List<ContactPointEmail>>{
            SLOTS[0].BestTimeToContactStartTime => new List<ContactPointEmail>{ SLOTS[0], SLOTS[2] },
            SLOTS[1].BestTimeToContactStartTime => new List<ContactPointEmail>{ SLOTS[1], SLOTS[3] },
            null => new List<ContactPointEmail>{ SLOTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Time, Set<SObject>> expected1 = new Map<Time, Set<SObject>>{
            SLOTS[0].BestTimeToContactStartTime => new Set<SObject>{ SLOTS[0], SLOTS[2] },
            SLOTS[1].BestTimeToContactStartTime => new Set<SObject>{ SLOTS[1], SLOTS[3] },
            null => new Set<SObject>{ SLOTS[4] }
        };
        Assert.areEqual(expected1, actual3);
        Map<Time, List<Id>> expected2 = new Map<Time, List<Id>>{
            SLOTS[0].BestTimeToContactStartTime => new List<Id>{ (Id) SLOTS[0].get(AfTestConsts.ID), (Id) SLOTS[2].get(AfTestConsts.ID) },
            SLOTS[1].BestTimeToContactStartTime => new List<Id>{ (Id) SLOTS[1].get(AfTestConsts.ID), (Id) SLOTS[3].get(AfTestConsts.ID) },
            null => new List<Id>{ (Id) SLOTS[4].get(AfTestConsts.ID) }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
        Map<Time, Set<Id>> expected3 = new Map<Time, Set<Id>>{
            SLOTS[0].BestTimeToContactStartTime => new Set<Id>{ (Id) SLOTS[0].get(AfTestConsts.ID), (Id) SLOTS[2].get(AfTestConsts.ID) },
            SLOTS[1].BestTimeToContactStartTime => new Set<Id>{ (Id) SLOTS[1].get(AfTestConsts.ID), (Id) SLOTS[3].get(AfTestConsts.ID) },
            null => new Set<Id>{ (Id) SLOTS[4].get(AfTestConsts.ID) }
        };
        Assert.areEqual(expected3, actual9);
        Assert.areEqual(expected3, actual10);
        Map<Time, Map<String, List<Id>>> expected4 = new Map<Time, Map<String, List<Id>>>{
            SLOTS[0].BestTimeToContactStartTime => new Map<String, List<Id>>{ AfTestConsts.NORMAL => new List<Id>{ (Id) SLOTS[0].get(AfTestConsts.ID) }, AfTestConsts.EXTENDED => new List<Id>{ (Id) SLOTS[2].get(AfTestConsts.ID) } },
            SLOTS[1].BestTimeToContactStartTime => new Map<String, List<Id>>{ AfTestConsts.NORMAL => new List<Id>{ (Id) SLOTS[1].get(AfTestConsts.ID) }, AfTestConsts.EXTENDED => new List<Id>{ (Id) SLOTS[3].get(AfTestConsts.ID) } },
            null => new Map<String, List<Id>>{ null => new List<Id>{ (Id) SLOTS[4].get(AfTestConsts.ID) } }
        };
        Assert.areEqual(expected4, actual11);
        Assert.areEqual(expected4, actual12);
        Map<Time, Map<String, Set<Id>>> expected5 = new Map<Time, Map<String, Set<Id>>>{
            SLOTS[0].BestTimeToContactStartTime => new Map<String, Set<Id>>{ AfTestConsts.NORMAL => new Set<Id>{ (Id) SLOTS[0].get(AfTestConsts.ID) }, AfTestConsts.EXTENDED => new Set<Id>{ (Id) SLOTS[2].get(AfTestConsts.ID) } },
            SLOTS[1].BestTimeToContactStartTime => new Map<String, Set<Id>>{ AfTestConsts.NORMAL => new Set<Id>{ (Id) SLOTS[1].get(AfTestConsts.ID) }, AfTestConsts.EXTENDED => new Set<Id>{ (Id) SLOTS[3].get(AfTestConsts.ID) } },
            null => new Map<String, Set<Id>>{ null => new Set<Id>{ (Id) SLOTS[4].get(AfTestConsts.ID) } }
        };
        Assert.areEqual(expected5, actual13);
    }

    /**
     * @see CollectorProvider.groupingByInt
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
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.NumberOfEmployees);
        Collector downstream = COL.toList().val(AfTestConsts.Account.Name);
        // When
        Map<Integer, List<Account>> actual = (Map<Integer, List<Account>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().key(AfTestConsts.Account.NumberOfEmployees));
        Map<Integer, List<Account>> actual1 = (Map<Integer, List<Account>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().key(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Map<Integer, List<SObject>> actual2 = (Map<Integer, List<SObject>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().key(keyMapper));
        Map<Integer, Set<SObject>> actual3 = (Map<Integer, Set<SObject>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().of(Set<SObject>.class).key(keyMapper).val(COL.toSObjectSet()));
        Map<Integer, List<String>> actual4 = (Map<Integer, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().key(AfTestConsts.Account.NumberOfEmployees).val(AfTestConsts.Account.Name).cast(Map<Integer, List<String>>.class));
        Map<Integer, List<String>> actual5 = (Map<Integer, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().of(List<String>.class).key(AfTestConsts.Account.NumberOfEmployees).val(AfTestConsts.Account.Name));
        Map<Integer, Object> actual6 = (Map<Integer, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().key(AfTestConsts.NUMBER_OF_EMPLOYEES).val(AfTestConsts.NAME));
        Map<Integer, Object> actual7 = (Map<Integer, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().key(keyMapper).val(downstream).cast(Map<Integer, List<String>>.class));
        Map<Integer, List<String>> actual8 = (Map<Integer, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().of(Supplier.of(Map<Integer, List<String>>.class)).key(keyMapper).val(downstream.cast(List<String>.class)));
        Map<Integer, Set<String>> actual9 = (Map<Integer, Set<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().of(Set<String>.class).key(AfTestConsts.Account.NumberOfEmployees).val(COL.toStringSet().val(AfTestConsts.Account.Name)));
        Map<Integer, Set<String>> actual10 = (Map<Integer, Set<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().key(AfTestConsts.Account.NumberOfEmployees).val(COL.toStringSet().val(AfTestConsts.Account.Name)).cast(Map<Integer, Set<String>>.class));
        Map<Integer, Map<String, List<String>>> actual11 = (Map<Integer, Map<String, List<String>>>)
            AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.Account.Type).val(AfTestConsts.Account.Name)).cast(Map<Integer, Map<String, List<String>>>.class));
        Map<Integer, Object> actual12 = (Map<Integer, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.TYPE).val(AfTestConsts.NAME)));
        Map<Integer, Map<String, Set<String>>> actual13 = (Map<Integer, Map<String, Set<String>>>)
            AfTestCommons.collect(ACCOUNTS, COL.groupingByInt().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.TYPE).val(COL.toStringSet().val(AfTestConsts.Account.Name))).cast(Map<Integer, Map<String, Set<String>>>.class));
        // Then
        Map<Integer, List<Account>> expected = new Map<Integer, List<Account>>{
            ACCOUNTS[0].NumberOfEmployees => new List<Account>{ ACCOUNTS[0], ACCOUNTS[2] },
            ACCOUNTS[1].NumberOfEmployees => new List<Account>{ ACCOUNTS[1], ACCOUNTS[3] },
            null => new List<Account>{ ACCOUNTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Integer, Set<SObject>> expected1 = new Map<Integer, Set<SObject>>{
            ACCOUNTS[0].NumberOfEmployees => new Set<SObject>{ ACCOUNTS[0], ACCOUNTS[2] },
            ACCOUNTS[1].NumberOfEmployees => new Set<SObject>{ ACCOUNTS[1], ACCOUNTS[3] },
            null => new Set<SObject>{ ACCOUNTS[4] }
        };
        Assert.areEqual(expected1, actual3);
        Map<Integer, List<String>> expected2 = new Map<Integer, List<String>>{
            ACCOUNTS[0].NumberOfEmployees => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME), (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[1].NumberOfEmployees => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME), (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
        Map<Integer, Set<String>> expected3 = new Map<Integer, Set<String>>{
            ACCOUNTS[0].NumberOfEmployees => new Set<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME), (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[1].NumberOfEmployees => new Set<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME), (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            null => new Set<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected3, actual9);
        Assert.areEqual(expected3, actual10);
        Map<Integer, Map<String, List<String>>> expected4 = new Map<Integer, Map<String, List<String>>>{
            ACCOUNTS[0].NumberOfEmployees => new Map<String, List<String>>{ AfTestConsts.CUSTOMER => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) }, AfTestConsts.PARTNER => new List<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) } },
            ACCOUNTS[1].NumberOfEmployees => new Map<String, List<String>>{ AfTestConsts.CUSTOMER => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) }, AfTestConsts.PARTNER => new List<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected4, actual11);
        Assert.areEqual(expected4, actual12);
        Map<Integer, Map<String, Set<String>>> expected5 = new Map<Integer, Map<String, Set<String>>>{
            ACCOUNTS[0].NumberOfEmployees => new Map<String, Set<String>>{ AfTestConsts.CUSTOMER => new Set<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) }, AfTestConsts.PARTNER => new Set<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) } },
            ACCOUNTS[1].NumberOfEmployees => new Map<String, Set<String>>{ AfTestConsts.CUSTOMER => new Set<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) }, AfTestConsts.PARTNER => new Set<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) } },
            null => new Map<String, Set<String>>{ null => new Set<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected5, actual13);
    }

    /**
     * @see CollectorProvider.groupingByLong
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
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.NumberOfEmployees);
        Collector downstream = COL.toList().val(AfTestConsts.Account.Name);
        // When
        Map<Long, List<Account>> actual = (Map<Long, List<Account>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().key(AfTestConsts.Account.NumberOfEmployees));
        Map<Long, List<Account>> actual1 = (Map<Long, List<Account>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().key(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Map<Long, List<SObject>> actual2 = (Map<Long, List<SObject>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().key(keyMapper));
        Map<Long, Set<SObject>> actual3 = (Map<Long, Set<SObject>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().of(Set<SObject>.class).key(keyMapper).val(COL.toSObjectSet()));
        Map<Long, List<String>> actual4 = (Map<Long, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().key(AfTestConsts.Account.NumberOfEmployees).val(AfTestConsts.Account.Name).cast(Map<Long, List<String>>.class));
        Map<Long, List<String>> actual5 = (Map<Long, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().of(List<String>.class).key(AfTestConsts.Account.NumberOfEmployees).val(AfTestConsts.Account.Name));
        Map<Long, Object> actual6 = (Map<Long, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().key(AfTestConsts.NUMBER_OF_EMPLOYEES).val(AfTestConsts.NAME));
        Map<Long, Object> actual7 = (Map<Long, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().key(keyMapper).val(downstream).cast(Map<Long, List<String>>.class));
        Map<Long, List<String>> actual8 = (Map<Long, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().of(Supplier.of(Map<Long, List<String>>.class)).key(keyMapper).val(downstream.cast(List<String>.class)));
        Map<Long, Set<String>> actual9 = (Map<Long, Set<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().of(Set<String>.class).key(AfTestConsts.Account.NumberOfEmployees).val(COL.toStringSet().val(AfTestConsts.Account.Name)));
        Map<Long, Set<String>> actual10 = (Map<Long, Set<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().key(AfTestConsts.Account.NumberOfEmployees).val(COL.toStringSet().val(AfTestConsts.Account.Name)).cast(Map<Long, Set<String>>.class));
        Map<Long, Map<String, List<String>>> actual11 = (Map<Long, Map<String, List<String>>>)
            AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.Account.Type).val(AfTestConsts.Account.Name)).cast(Map<Long, Map<String, List<String>>>.class));
        Map<Long, Object> actual12 = (Map<Long, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.TYPE).val(AfTestConsts.NAME)));
        Map<Long, Map<String, Set<String>>> actual13 = (Map<Long, Map<String, Set<String>>>)
            AfTestCommons.collect(ACCOUNTS, COL.groupingByLong().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.TYPE).val(COL.toStringSet().val(AfTestConsts.Account.Name))).cast(Map<Long, Map<String, Set<String>>>.class));
        // Then
        Map<Long, List<Account>> expected = new Map<Long, List<Account>>{
            ACCOUNTS[0].NumberOfEmployees => new List<Account>{ ACCOUNTS[0], ACCOUNTS[2] },
            ACCOUNTS[1].NumberOfEmployees => new List<Account>{ ACCOUNTS[1], ACCOUNTS[3] },
            null => new List<Account>{ ACCOUNTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Long, Set<SObject>> expected1 = new Map<Long, Set<SObject>>{
            ACCOUNTS[0].NumberOfEmployees => new Set<SObject>{ ACCOUNTS[0], ACCOUNTS[2] },
            ACCOUNTS[1].NumberOfEmployees => new Set<SObject>{ ACCOUNTS[1], ACCOUNTS[3] },
            null => new Set<SObject>{ ACCOUNTS[4] }
        };
        Assert.areEqual(expected1, actual3);
        Map<Long, List<String>> expected2 = new Map<Long, List<String>>{
            ACCOUNTS[0].NumberOfEmployees => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME), (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[1].NumberOfEmployees => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME), (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
        Map<Long, Set<String>> expected3 = new Map<Long, Set<String>>{
            ACCOUNTS[0].NumberOfEmployees => new Set<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME), (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[1].NumberOfEmployees => new Set<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME), (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            null => new Set<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected3, actual9);
        Assert.areEqual(expected3, actual10);
        Map<Long, Map<String, List<String>>> expected4 = new Map<Long, Map<String, List<String>>>{
            ACCOUNTS[0].NumberOfEmployees => new Map<String, List<String>>{ AfTestConsts.CUSTOMER => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) }, AfTestConsts.PARTNER => new List<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) } },
            ACCOUNTS[1].NumberOfEmployees => new Map<String, List<String>>{ AfTestConsts.CUSTOMER => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) }, AfTestConsts.PARTNER => new List<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected4, actual11);
        Assert.areEqual(expected4, actual12);
        Map<Long, Map<String, Set<String>>> expected5 = new Map<Long, Map<String, Set<String>>>{
            ACCOUNTS[0].NumberOfEmployees => new Map<String, Set<String>>{ AfTestConsts.CUSTOMER => new Set<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) }, AfTestConsts.PARTNER => new Set<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) } },
            ACCOUNTS[1].NumberOfEmployees => new Map<String, Set<String>>{ AfTestConsts.CUSTOMER => new Set<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) }, AfTestConsts.PARTNER => new Set<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) } },
            null => new Map<String, Set<String>>{ null => new Set<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected5, actual13);
    }

    /**
     * @see CollectorProvider.groupingByDouble
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
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.BillingLatitude);
        Collector downstream = COL.toList().val(AfTestConsts.Account.Name);
        // When
        Map<Double, List<Account>> actual = (Map<Double, List<Account>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().key(AfTestConsts.Account.BillingLatitude));
        Map<Double, List<Account>> actual1 = (Map<Double, List<Account>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().key(AfTestConsts.BILLING_LATITUDE));
        Map<Double, List<SObject>> actual2 = (Map<Double, List<SObject>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().key(keyMapper));
        Map<Double, Set<SObject>> actual3 = (Map<Double, Set<SObject>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().of(Set<SObject>.class).key(keyMapper).val(COL.toSObjectSet()));
        Map<Double, List<String>> actual4 = (Map<Double, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().key(AfTestConsts.Account.BillingLatitude).val(AfTestConsts.Account.Name).cast(Map<Double, List<String>>.class));
        Map<Double, List<String>> actual5 = (Map<Double, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().of(List<String>.class).key(AfTestConsts.Account.BillingLatitude).val(AfTestConsts.Account.Name));
        Map<Double, Object> actual6 = (Map<Double, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().key(AfTestConsts.BILLING_LATITUDE).val(AfTestConsts.NAME));
        Map<Double, Object> actual7 = (Map<Double, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().key(keyMapper).val(downstream).cast(Map<Double, List<String>>.class));
        Map<Double, List<String>> actual8 = (Map<Double, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().of(Supplier.of(Map<Double, List<String>>.class)).key(keyMapper).val(downstream.cast(List<String>.class)));
        Map<Double, Set<String>> actual9 = (Map<Double, Set<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().of(Set<String>.class).key(AfTestConsts.Account.BillingLatitude).val(COL.toStringSet().val(AfTestConsts.Account.Name)));
        Map<Double, Set<String>> actual10 = (Map<Double, Set<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().key(AfTestConsts.Account.BillingLatitude).val(COL.toStringSet().val(AfTestConsts.Account.Name)).cast(Map<Double, Set<String>>.class));
        Map<Double, Map<String, List<String>>> actual11 = (Map<Double, Map<String, List<String>>>)
            AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.Account.BillingCountry).val(AfTestConsts.Account.Name)).cast(Map<Double, Map<String, List<String>>>.class));
        Map<Double, Object> actual12 = (Map<Double, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.BILLING_COUNTRY).val(AfTestConsts.NAME)));
        Map<Double, Map<String, Set<String>>> actual13 = (Map<Double, Map<String, Set<String>>>)
            AfTestCommons.collect(ACCOUNTS, COL.groupingByDouble().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.BILLING_COUNTRY).val(COL.toStringSet().val(AfTestConsts.Account.Name))).cast(Map<Double, Map<String, Set<String>>>.class));
        // Then
        Map<Double, List<Account>> expected = new Map<Double, List<Account>>{
            ACCOUNTS[0].BillingLatitude => new List<Account>{ ACCOUNTS[0], ACCOUNTS[2] },
            ACCOUNTS[1].BillingLatitude => new List<Account>{ ACCOUNTS[1], ACCOUNTS[3] },
            null => new List<Account>{ ACCOUNTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Double, Set<SObject>> expected1 = new Map<Double, Set<SObject>>{
            ACCOUNTS[0].BillingLatitude => new Set<SObject>{ ACCOUNTS[0], ACCOUNTS[2] },
            ACCOUNTS[1].BillingLatitude => new Set<SObject>{ ACCOUNTS[1], ACCOUNTS[3] },
            null => new Set<SObject>{ ACCOUNTS[4] }
        };
        Assert.areEqual(expected1, actual3);
        Map<Double, List<String>> expected2 = new Map<Double, List<String>>{
            ACCOUNTS[0].BillingLatitude => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME), (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[1].BillingLatitude => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME), (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
        Map<Double, Set<String>> expected3 = new Map<Double, Set<String>>{
            ACCOUNTS[0].BillingLatitude => new Set<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME), (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[1].BillingLatitude => new Set<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME), (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            null => new Set<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected3, actual9);
        Assert.areEqual(expected3, actual10);
        Map<Double, Map<String, List<String>>> expected4 = new Map<Double, Map<String, List<String>>>{
            ACCOUNTS[0].BillingLatitude => new Map<String, List<String>>{ AfTestConsts.FRANCE => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) }, AfTestConsts.UK => new List<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) } },
            ACCOUNTS[1].BillingLatitude => new Map<String, List<String>>{ AfTestConsts.FRANCE => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) }, AfTestConsts.UK => new List<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected4, actual11);
        Assert.areEqual(expected4, actual12);
        Map<Double, Map<String, Set<String>>> expected5 = new Map<Double, Map<String, Set<String>>>{
            ACCOUNTS[0].BillingLatitude => new Map<String, Set<String>>{ AfTestConsts.FRANCE => new Set<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) }, AfTestConsts.UK => new Set<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) } },
            ACCOUNTS[1].BillingLatitude => new Map<String, Set<String>>{ AfTestConsts.FRANCE => new Set<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) }, AfTestConsts.UK => new Set<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) } },
            null => new Map<String, Set<String>>{ null => new Set<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected5, actual13);
    }

    /**
     * @see CollectorProvider.groupingByObject
     */
    @IsTest
    @SuppressWarnings('PMD.NcssMethodCount')
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
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.BillingLatitude);
        Collector downstream = COL.toList().val(AfTestConsts.Account.Name);
        // When
        Map<Object, List<Account>> actual = (Map<Object, List<Account>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().key(AfTestConsts.Account.BillingLatitude));
        Map<Object, List<Account>> actual1 = (Map<Object, List<Account>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().key(AfTestConsts.BILLING_LATITUDE));
        Map<Object, List<SObject>> actual2 = (Map<Object, List<SObject>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().key(keyMapper));
        Map<Object, Set<SObject>> actual3 = (Map<Object, Set<SObject>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().of(Set<SObject>.class).key(keyMapper).val(COL.toSObjectSet()));
        Map<Object, List<String>> actual4 = (Map<Object, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().key(AfTestConsts.Account.BillingLatitude).val(AfTestConsts.Account.Name).cast(Map<Object, List<String>>.class));
        Map<Object, List<String>> actual5 = (Map<Object, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().of(List<String>.class).key(AfTestConsts.Account.BillingLatitude).val(AfTestConsts.Account.Name));
        Map<Object, Object> actual6 = (Map<Object, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().key(AfTestConsts.BILLING_LATITUDE).val(AfTestConsts.NAME));
        Map<Object, Object> actual7 = (Map<Object, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().key(keyMapper).val(downstream).cast(Map<Object, List<String>>.class));
        Map<Object, List<String>> actual8 = (Map<Object, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().of(Supplier.of(Map<Object, List<String>>.class)).key(keyMapper).val(downstream.cast(List<String>.class)));
        Map<Object, Set<String>> actual9 = (Map<Object, Set<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().of(Set<String>.class).key(AfTestConsts.Account.BillingLatitude).val(COL.toStringSet().val(AfTestConsts.Account.Name)));
        Map<Object, Set<String>> actual10 = (Map<Object, Set<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().key(AfTestConsts.Account.BillingLatitude).val(COL.toStringSet().val(AfTestConsts.Account.Name)).cast(Map<Object, Set<String>>.class));
        Map<Object, Map<String, List<String>>> actual11 = (Map<Object, Map<String, List<String>>>)
            AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.Account.BillingCountry).val(AfTestConsts.Account.Name)).cast(Map<Object, Map<String, List<String>>>.class));
        Map<Object, Object> actual12 = (Map<Object, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.BILLING_COUNTRY).val(AfTestConsts.NAME)));
        Map<Object, Map<String, Set<String>>> actual13 = (Map<Object, Map<String, Set<String>>>)
            AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().key(keyMapper).val(COL.groupingByString().key(AfTestConsts.BILLING_COUNTRY).val(COL.toStringSet().val(AfTestConsts.Account.Name))).cast(Map<Object, Map<String, Set<String>>>.class));
        Map<Object, List<SObject>> actual14 = (Map<Object, List<SObject>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().key(keyMapper).val());
        Map<Object, List<String>> actual15 = (Map<Object, List<String>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByObject().of(List<String>.class).key().val(AfTestConsts.Account.Name));
        // Then
        Map<Object, List<Account>> expected = new Map<Object, List<Account>>{
            ACCOUNTS[0].BillingLatitude => new List<Account>{ ACCOUNTS[0], ACCOUNTS[2] },
            ACCOUNTS[1].BillingLatitude => new List<Account>{ ACCOUNTS[1], ACCOUNTS[3] },
            null => new List<Account>{ ACCOUNTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual14);
        Map<Object, Set<SObject>> expected1 = new Map<Object, Set<SObject>>{
            ACCOUNTS[0].BillingLatitude => new Set<SObject>{ ACCOUNTS[0], ACCOUNTS[2] },
            ACCOUNTS[1].BillingLatitude => new Set<SObject>{ ACCOUNTS[1], ACCOUNTS[3] },
            null => new Set<SObject>{ ACCOUNTS[4] }
        };
        Assert.areEqual(expected1, actual3);
        Map<Object, List<String>> expected2 = new Map<Object, List<String>>{
            ACCOUNTS[0].BillingLatitude => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME), (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[1].BillingLatitude => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME), (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected2, actual8);
        Map<Object, Set<String>> expected3 = new Map<Object, Set<String>>{
            ACCOUNTS[0].BillingLatitude => new Set<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME), (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[1].BillingLatitude => new Set<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME), (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            null => new Set<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected3, actual9);
        Assert.areEqual(expected3, actual10);
        Map<Object, Map<String, List<String>>> expected4 = new Map<Object, Map<String, List<String>>>{
            ACCOUNTS[0].BillingLatitude => new Map<String, List<String>>{ AfTestConsts.FRANCE => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) }, AfTestConsts.UK => new List<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) } },
            ACCOUNTS[1].BillingLatitude => new Map<String, List<String>>{ AfTestConsts.FRANCE => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) }, AfTestConsts.UK => new List<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) } },
            null => new Map<String, List<String>>{ null => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected4, actual11);
        Assert.areEqual(expected4, actual12);
        Map<Object, Map<String, Set<String>>> expected5 = new Map<Object, Map<String, Set<String>>>{
            ACCOUNTS[0].BillingLatitude => new Map<String, Set<String>>{ AfTestConsts.FRANCE => new Set<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) }, AfTestConsts.UK => new Set<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) } },
            ACCOUNTS[1].BillingLatitude => new Map<String, Set<String>>{ AfTestConsts.FRANCE => new Set<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) }, AfTestConsts.UK => new Set<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) } },
            null => new Map<String, Set<String>>{ null => new Set<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) } }
        };
        Assert.areEqual(expected5, actual13);
        Map<Object, List<String>> expected6 = new Map<Object, List<String>>{
            ACCOUNTS[0] => new List<String>{ (String) ACCOUNTS[0].get(AfTestConsts.NAME) },
            ACCOUNTS[1] => new List<String>{ (String) ACCOUNTS[1].get(AfTestConsts.NAME) },
            ACCOUNTS[2] => new List<String>{ (String) ACCOUNTS[2].get(AfTestConsts.NAME) },
            ACCOUNTS[3] => new List<String>{ (String) ACCOUNTS[3].get(AfTestConsts.NAME) },
            ACCOUNTS[4] => new List<String>{ (String) ACCOUNTS[4].get(AfTestConsts.NAME) }
        };
        Assert.areEqual(expected6, actual15);
    }

    /**
     * @see CollectorProvider.partitioningBy
     */
    @IsTest
    static void partitioningBy() {
        // Given
        IPredicate predicate = new SObjectDefaultComparerPredicateProvider().is(AfTestConsts.Contact.OtherCountry).eq().var((Object) AfTestConsts.UK);
        Collector downstream = COL.toList().val(AfTestConsts.Contact.LastName);
        // When
        Map<Boolean, List<SObject>> actual = (Map<Boolean, List<SObject>>) AfTestCommons.collect(CONTACTS, COL.partitioningBy().key(AfTestConsts.Contact.OtherCountry, AfTestConsts.UK));
        Map<Boolean, List<Contact>> actual1 = (Map<Boolean, List<Contact>>) AfTestCommons.collect(CONTACTS, COL.partitioningBy().key(AfTestConsts.OTHER_COUNTRY, AfTestConsts.UK).cast(Map<Boolean, List<Contact>>.class));
        Map<Boolean, List<Contact>> actual2 = (Map<Boolean, List<Contact>>) AfTestCommons.collect(CONTACTS, COL.partitioningBy().key(predicate).cast(Map<Boolean, List<Contact>>.class));
        Map<Boolean, Set<SObject>> actual3 = (Map<Boolean, Set<SObject>>) AfTestCommons.collect(CONTACTS, COL.partitioningBy().of(Set<SObject>.class).key(predicate).val(COL.toSObjectSet()));
        Map<Boolean, List<String>> actual4 = (Map<Boolean, List<String>>) AfTestCommons.collect(CONTACTS, COL.partitioningBy().key(predicate).val(downstream).cast(Map<Boolean, List<String>>.class));
        Map<Boolean, List<String>> actual5 = (Map<Boolean, List<String>>) AfTestCommons.collect(CONTACTS, COL.partitioningBy().of(Supplier.of(Map<Boolean, List<String>>.class)).key(predicate).val(downstream.cast(List<String>.class)));
        Map<Boolean, Map<String, List<String>>> actual6 = (Map<Boolean, Map<String, List<String>>>)
            AfTestCommons.collect(CONTACTS, COL.partitioningBy().key(predicate).val(COL.groupingByString().key(AfTestConsts.Contact.OtherCity).val(AfTestConsts.Contact.LastName)).cast(Map<Boolean, Map<String, List<String>>>.class));
        Map<Boolean, Object> actual7 = (Map<Boolean, Object>) AfTestCommons.collect(CONTACTS, COL.partitioningBy().key(predicate).val(COL.groupingByString().key(AfTestConsts.OTHER_CITY).val(AfTestConsts.LAST_NAME)));
        Map<Boolean, List<SObject>> actual8 = (Map<Boolean, List<SObject>>) AfTestCommons.collect(CONTACTS, COL.partitioningBy().key(AfTestConsts.Contact.DoNotCall));
        Map<Boolean, List<SObject>> actual9 = (Map<Boolean, List<SObject>>) AfTestCommons.collect(CONTACTS, COL.partitioningBy().key(AfTestConsts.DO_NOT_CALL));
        // Then
        Map<Boolean, List<Contact>> expected = new Map<Boolean, List<Contact>>{
            true => new List<Contact>{ CONTACTS[2], CONTACTS[3] },
            false => new List<Contact>{ CONTACTS[0], CONTACTS[1], CONTACTS[4] }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Map<Boolean, Set<SObject>> expected1 = new Map<Boolean, Set<SObject>>{
            true => new Set<SObject>{ CONTACTS[2], CONTACTS[3] },
            false => new Set<SObject>{ CONTACTS[0], CONTACTS[1], CONTACTS[4] }
        };
        Assert.areEqual(expected1, actual3);
        Map<Boolean, List<String>> expected2 = new Map<Boolean, List<String>>{
            true => new List<String>{ (String) CONTACTS[2].get(AfTestConsts.LAST_NAME), (String) CONTACTS[3].get(AfTestConsts.LAST_NAME) },
            false => new List<String>{ (String) CONTACTS[0].get(AfTestConsts.LAST_NAME), (String) CONTACTS[1].get(AfTestConsts.LAST_NAME), (String) CONTACTS[4].get(AfTestConsts.LAST_NAME) }
        };
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Map<Boolean, Map<String, List<String>>> expected3 = new Map<Boolean, Map<String, List<String>>>{
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
        Assert.areEqual(expected3, actual6);
        Assert.areEqual(expected3, actual7);
        Map<Boolean, List<Contact>> expected4 = new Map<Boolean, List<Contact>>{
            true => new List<Contact>{ CONTACTS[0], CONTACTS[2] },
            false => new List<Contact>{ CONTACTS[1], CONTACTS[3], CONTACTS[4] }
        };
        Assert.areEqual(expected4, actual8);
        Assert.areEqual(expected4, actual9);
    }

    /**
     * @see CollectorProvider.joining
     */
    @IsTest
    static void joining() {
        // Given
        String delimiter = ';';
        String prefix = 'prefix';
        String suffix = 'suffix';
        // When
        Object actual = AfTestCommons.collect(CONTACTS, COL.joining().val(AfTestConsts.LAST_NAME));
        Object actual1 = AfTestCommons.collect(CONTACTS, COL.joining().val(AfTestConsts.Contact.LastName));
        String actual2 = (String) AfTestCommons.collect(CONTACTS, COL.joining().del(delimiter).val(AfTestConsts.Contact.LastName));
        String actual3 = (String) AfTestCommons.collect(CONTACTS, COL.joining().del(delimiter).pre(prefix).suf(suffix).val(AfTestConsts.Contact.LastName));
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
     * @see CollectorProvider.averagingInt
     * @see CollectorProvider.counting
     * @see CollectorProvider.summingInt
     */
    @IsTest
    static void intCollectors() {
        // Given
        ACCOUNTS.remove(4); // To prevent NPE
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.Type);
        IFunction mapper = new SObjectFunctionProvider().get(AfTestConsts.Account.NumberOfEmployees);
        // When
        Integer actual = (Integer) AfTestCommons.collect(ACCOUNTS, COL.counting());
        Double actual1 = (Double) AfTestCommons.collect(ACCOUNTS, COL.averagingInt().val(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Double actual2 = (Double) AfTestCommons.collect(ACCOUNTS, COL.averagingInt().val(AfTestConsts.Account.NumberOfEmployees));
        Double actual3 = (Double) AfTestCommons.collect(ACCOUNTS, COL.averagingInt().val(mapper));
        Integer actual4 = (Integer) AfTestCommons.collect(ACCOUNTS, COL.summingInt().val(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Integer actual5 = (Integer) AfTestCommons.collect(ACCOUNTS, COL.summingInt().val(AfTestConsts.Account.NumberOfEmployees));
        Integer actual6 = (Integer) AfTestCommons.collect(ACCOUNTS, COL.summingInt().val(mapper));
        Map<String, Object> actual7 = (Map<String, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByString().key(keyMapper).val(COL.summingInt().val(mapper)));
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
     * @see CollectorProvider.averagingLong
     * @see CollectorProvider.summingLong
     */
    @IsTest
    static void longCollectors() {
        // Given
        ACCOUNTS.remove(4); // To prevent NPE
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.Type);
        IFunction mapper = new SObjectFunctionProvider().get(AfTestConsts.Account.NumberOfEmployees);
        // When
        Double actual = (Double) AfTestCommons.collect(ACCOUNTS, COL.averagingLong().val(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Double actual1 = (Double) AfTestCommons.collect(ACCOUNTS, COL.averagingLong().val(AfTestConsts.Account.NumberOfEmployees));
        Double actual2 = (Double) AfTestCommons.collect(ACCOUNTS, COL.averagingLong().val(mapper));
        Long actual3 = (Long) AfTestCommons.collect(ACCOUNTS, COL.summingLong().val(AfTestConsts.NUMBER_OF_EMPLOYEES));
        Long actual4 = (Long) AfTestCommons.collect(ACCOUNTS, COL.summingLong().val(AfTestConsts.Account.NumberOfEmployees));
        Long actual5 = (Long) AfTestCommons.collect(ACCOUNTS, COL.summingLong().val(mapper));
        Map<String, Object> actual6 = (Map<String, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByString().key(keyMapper).val(COL.summingLong().val(mapper)));
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
     * @see CollectorProvider.averagingDouble
     * @see CollectorProvider.summingDouble
     */
    @IsTest
    static void doubleCollectors() {
        // Given
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.Type);
        IFunction mapper = new SObjectFunctionProvider().get(AfTestConsts.Account.BillingLatitude);
        // When
        Double actual = (Double) AfTestCommons.collect(ACCOUNTS, COL.averagingDouble().val(AfTestConsts.BILLING_LATITUDE));
        Double actual1 = (Double) AfTestCommons.collect(ACCOUNTS, COL.averagingDouble().val(AfTestConsts.Account.BillingLatitude));
        Double actual2 = (Double) AfTestCommons.collect(ACCOUNTS, COL.averagingDouble().val(mapper));
        Double actual3 = (Double) AfTestCommons.collect(ACCOUNTS, COL.summingDouble().val(AfTestConsts.BILLING_LATITUDE));
        Double actual4 = (Double) AfTestCommons.collect(ACCOUNTS, COL.summingDouble().val(AfTestConsts.Account.BillingLatitude));
        Double actual5 = (Double) AfTestCommons.collect(ACCOUNTS, COL.summingDouble().val(mapper));
        Map<String, Object> actual6 = (Map<String, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByString().key(keyMapper).val(COL.summingDouble().val(mapper)));
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
     * @see CollectorProvider.filtering
     */
    @IsTest
    static void filtering() {
        // Given
        Integer value = 100;
        IPredicate predicate = new SObjectDefaultComparerPredicateProvider().is(AfTestConsts.Account.NumberOfEmployees).gt().var(value);
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.Type);
        // When
        List<Account> actual = (List<Account>) AfTestCommons.collect(ACCOUNTS, COL.filtering().when(AfTestConsts.NUMBER_OF_EMPLOYEES, value));
        List<Account> actual1 = (List<Account>) AfTestCommons.collect(ACCOUNTS, COL.filtering().when(AfTestConsts.Account.NumberOfEmployees, value));
        List<Account> actual2 = (List<Account>) AfTestCommons.collect(ACCOUNTS, COL.filtering().when(predicate).val().cast(List<Account>.class));
        Set<SObject> actual3 = (Set<SObject>) AfTestCommons.collect(ACCOUNTS, COL.filtering().when(predicate).to(COL.toSObjectSet()));
        Map<String, List<Account>> actual4 = (Map<String, List<Account>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByString().key(keyMapper).val(COL.filtering().when(predicate)).cast(Map<String, List<Account>>.class));
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
     * @see CollectorProvider.mapping
     */
    @IsTest
    static void mapping() {
        // Given
        IFunction mapper = new SObjectFunctionProvider().get(AfTestConsts.ID);
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.Type);
        // When
        List<Object> actual = (List<Object>) AfTestCommons.collect(ACCOUNTS, COL.mapping().val(mapper));
        List<Id> actual1 = (List<Id>) AfTestCommons.collect(ACCOUNTS, COL.mapping().val(mapper).cast(List<Id>.class));
        List<Id> actual2 = (List<Id>) AfTestCommons.collect(ACCOUNTS, COL.mapping().val(AfTestConsts.ID).cast(List<Id>.class));
        List<Id> actual3 = (List<Id>) AfTestCommons.collect(ACCOUNTS, COL.mapping().val(AfTestConsts.Account.Id).cast(List<Id>.class));
        Set<Id> actual4 = (Set<Id>) AfTestCommons.collect(ACCOUNTS, COL.mapping().val(mapper).to(COL.toIdSet()));
        Map<String, List<Id>> actual5 = (Map<String, List<Id>>) AfTestCommons.collect(ACCOUNTS, COL.groupingByString().key(keyMapper).val(COL.mapping().val(mapper)).cast(Map<String, List<Id>>.class));
        List<Account> actual6 = (List<Account>) AfTestCommons.collect(ACCOUNTS, COL.mapping().val().cast(List<Account>.class));
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
        Assert.areEqual(ACCOUNTS, actual6);
    }

    /**
     * @see CollectorProvider.flatMapping
     */
    @IsTest
    static void flatMapping() {
        // Given
        List<Account> accounts = AfTestData.generateAccounts();
        IFunction mapper = new SObjectFunctionProvider().getSObjects(AfTestConsts.CONTACTS);
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.Type);
        // When
        List<Object> actual = (List<Object>) AfTestCommons.collect(accounts, COL.flatMapping().val(mapper));
        List<Contact> actual1 = (List<Contact>) AfTestCommons.collect(accounts, COL.flatMapping().val(mapper).cast(List<Contact>.class));
        List<Contact> actual2 = (List<Contact>) AfTestCommons.collect(accounts, COL.flatMapping().val(AfTestConsts.CONTACTS).cast(List<Contact>.class));
        List<Contact> actual3 = (List<Contact>) AfTestCommons.collect(accounts, COL.flatMapping().val(AfTestConsts.Contact.AccountId).cast(List<Contact>.class));
        Set<SObject> actual4 = (Set<SObject>) AfTestCommons.collect(accounts, COL.flatMapping().val(mapper).to(COL.toSObjectSet()));
        Map<String, List<Contact>> actual5 = (Map<String, List<Contact>>) AfTestCommons.collect(accounts, COL.groupingByString().key(keyMapper).val(COL.flatMapping().val(mapper)).cast(Map<String, List<Contact>>.class));
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
     * @see CollectorProvider.folding
     */
    @IsTest
    static void folding() {
        // Given
        ACCOUNTS.remove(4); // To prevent NPE
        IBiOperator sumIntFieldReducer = new AfTestCommons.SumIntFieldReducer(AfTestConsts.NUMBER_OF_EMPLOYEES);
        IBiOperator sumDouble = new AfTestCommons.SumDoubleBiOperator();
        // When
        Account actual = (Account) AfTestCommons.collect(ACCOUNTS, COL.folding(new Account(NumberOfEmployees = 0)).acc(sumIntFieldReducer));
        Account actual1 = (Account) AfTestCommons.collect(ACCOUNTS, COL.folding(new Account(NumberOfEmployees = 0)).val(Function.identity()).acc(sumIntFieldReducer));
        Double actual2 = (Double) AfTestCommons.collect(ACCOUNTS, COL.folding(0.0).val(AfTestConsts.NUMBER_OF_EMPLOYEES).acc(sumDouble));
        Double actual3 = (Double) AfTestCommons.collect(ACCOUNTS, COL.folding(0.0).val(AfTestConsts.Account.NumberOfEmployees).acc(sumDouble));
        Exception exc;
        try {
            new CollectorProvider.GetElement(1).apply(new List<Object>{ 1 });
        } catch (IndexOutOfBoundsException ie) {
            exc = ie;
        }
        // Then
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
        Assert.areEqual(expected2, actual);
        Assert.areEqual(expected2, actual1);
        Double expected3 = ACCOUNTS[0].NumberOfEmployees
            + ACCOUNTS[1].NumberOfEmployees
            + ACCOUNTS[2].NumberOfEmployees
            + ACCOUNTS[3].NumberOfEmployees
            + ACCOUNTS[4].NumberOfEmployees
            + ACCOUNTS[5].NumberOfEmployees
            + ACCOUNTS[6].NumberOfEmployees
            + ACCOUNTS[7].NumberOfEmployees
            + ACCOUNTS[8].NumberOfEmployees;
        Assert.areEqual(expected3, actual2);
        Assert.areEqual(expected3, actual3);
        Assert.isNotNull(exc);
    }

    /**
     * @see CollectorProvider.reducing
     */
    @IsTest
    static void reducing() {
        // Given
        ACCOUNTS.remove(4); // To prevent NPE
        IBiOperator accumulator = BiOperator.maxBy(Comparer.comparing(new SObjectFunctionProvider().get(AfTestConsts.Account.NumberOfEmployees)));
        IFunction keyMapper = new SObjectFunctionProvider().get(AfTestConsts.Account.Type);
        // When
        IOptional actual = (Optional) AfTestCommons.collect(ACCOUNTS, COL.reducing().acc(accumulator));
        Map<String, Object> actual1 = (Map<String, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByString().key(keyMapper).val(COL.reducing().acc(accumulator)));
        IOptional actual2 = (Optional) AfTestCommons.collect(new List<Account>(), COL.reducing().acc(accumulator));
        // Then
        Assert.areEqual(ACCOUNTS[8], actual.get());
        Map<String, Optional> expected = new Map<String, Optional>{
            AfTestConsts.CUSTOMER => Optional.of(ACCOUNTS[0]),
            AfTestConsts.PARTNER => Optional.of(ACCOUNTS[4]),
            AfTestConsts.COMPETITOR => Optional.of(ACCOUNTS[7]),
            null => Optional.of(ACCOUNTS[8])
        };
        Assert.areEqual(expected, actual1);
        Assert.isTrue(actual2.isEmpty(), Label.AF_ErrorMessage_NoValuePresent);
    }

    /**
     * @see CollectorProvider.maximizing
     * @see CollectorProvider.minimizing
     */
    @IsTest
    static void optimizing() {
        // Given
        IComparer comparer = Comparer.comparing(new SObjectFunctionProvider().get(Account.NumberOfEmployees));
        IFunction keyMapper = new SObjectFunctionProvider().get(Account.Type);
        // When
        IOptional actual = (Optional) AfTestCommons.collect(ACCOUNTS, COL.maximizing().val(AfTestConsts.Account.NumberOfEmployees));
        IOptional actual1 = (Optional) AfTestCommons.collect(ACCOUNTS, COL.maximizing().val(AfTestConsts.NUMBER_OF_EMPLOYEES));
        IOptional actual2 = (Optional) AfTestCommons.collect(ACCOUNTS, COL.maximizing().val(comparer));
        IOptional actual3 = (Optional) AfTestCommons.collect(ACCOUNTS, COL.minimizing().val(AfTestConsts.Account.NumberOfEmployees));
        IOptional actual4 = (Optional) AfTestCommons.collect(ACCOUNTS, COL.minimizing().val(AfTestConsts.NUMBER_OF_EMPLOYEES));
        IOptional actual5 = (Optional) AfTestCommons.collect(ACCOUNTS, COL.minimizing().val(comparer));
        Map<String, Object> actual6 = (Map<String, Object>) AfTestCommons.collect(ACCOUNTS, COL.groupingByString().key(keyMapper).val(COL.minimizing().val(comparer)));
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
