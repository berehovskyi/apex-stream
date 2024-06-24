/**
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@TestVisible
@SuppressWarnings('PMD.ExcessivePublicCount')
private class AsTestData {

    private static Integer count = 0;
    public static Id generateId(SObjectType sObjType) {
        String keyPrefix = sObjType.getDescribe().getKeyPrefix();
        String fakeIdPrefix = '000000000000'.substring(0, 12 - String.valueOf(count).length());
        return Id.valueOf(keyPrefix + fakeIdPrefix + count++);
    }
    public static List<Boolean> generateBools() {
        return new List<Boolean>{ true, false, true, null };
    }
    public static List<Id> generateIds() {
        Id id0 = generateId(Contact.SObjectType);
        Id id1 = generateId(Contact.SObjectType);
        Id id2 = generateId(Contact.SObjectType);
        Id id3 = generateId(Contact.SObjectType);
        Id id4 = generateId(Contact.SObjectType);
        return new List<Id>{ id0, id1, id2, id3, id4 };
    }
    public static List<Blob> generateBlobs() {
        Blob bl0 = Blob.valueOf('0');
        Blob bl1 = Blob.valueOf('1');
        Blob bl2 = Blob.valueOf('2');
        Blob bl3 = Blob.valueOf('3');
        Blob bl4 = Blob.valueOf('4');
        return new List<Blob>{ bl0, bl1, bl2, bl3, bl4 };
    }
    public static List<Integer> generateInts() {
        return new List<Integer>{ 1, 2, 3, 4, 4, 6, -10, -3, 2154, 0, -4, -0, 323, 55 };
    }
    public static List<Integer> generateInts1() {
        return new List<Integer>{ 200, 100, 0, 400, 3000 };
    }
    public static List<Integer> generateInts2() {
        return new List<Integer>{ 0, -4, -5, 10, 13, -1, 4, -9, 1, 13 };
    }
    public static List<Long> generateLongs() {
        return new List<Long>{ 1L, 2L, 3L, 4, 4L, 6L, -10L, -3L, 2154L, 0L, -4L, -0L, 323L, 55L, 2147483648L };
    }
    public static List<Long> generateLongs1() {
        return new List<Long>{ 200L, 100L, 0L, 400L, 3000L };
    }
    public static List<Long> generateLongs2() {
        return new List<Long>{ 0L, -4L, -5L, 10, 13, -1L, 42L, -9L, 1L, 13L };
    }
    public static List<Double> generateDoubles() {
        return new List<Double>{ -5.5, 0, 1.0, 3, 8.99, Math.PI, 10.001, Math.E };
    }
    public static List<Double> generateDoubles1() {
        return new List<Double>{ 28.635308, 77.22496, 38.952101, 30.87415, 67.451453 };
    }
    public static List<Double> generateDoubles2() {
        return new List<Double>{ 28.635308, 77.22496, 38.952101, 30.87415, 67.451453 };
    }
    public static List<Object> generateMix() {
        return new List<Object>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
    }
    public static List<String> generateStrings() {
        return new List<String>{
            'abcde', 'abc', 'fghi', 'hello', 'this', 'world', 'abba', 'abba xyz', 'hello ', ' this', 'world',
            'Hello Jason', 'Hello Freddy', 'Hello Sam', 'fGhi', 'ABCDE', 'abc 1', 'fG00hi', 'fG00hi$',
            'abcd1234!@#$%^&*()`~-_+={[}]|:<,>.?', '√', '1234567890', 'R32', '12.5', '', ' ', 'hello'
        };
    }
    public static List<Date> generateDates() {
        Date d0 = Date.newInstance(1990, 1, 1);
        Date d1 = Date.newInstance(1991, 2, 2);
        Date d2 = Date.newInstance(1992, 3, 3);
        Date d3 = Date.newInstance(1993, 4, 4);
        return new List<Date>{ d0, d1, d2, d3 };
    }
    public static List<Date> generateDates1() {
        List<Date> dates = generateDates();
        dates.add(Date.today());
        return dates;
    }
    public static List<Time> generateTimes() {
        Time t0 = Time.newInstance(15, 0, 0, 0);
        Time t1 = Time.newInstance(16, 0, 0, 0);
        Time t2 = Time.newInstance(17, 0, 0, 0);
        Time t3 = Time.newInstance(18, 0, 0, 0);
        return new List<Time>{ t0, t1, t2, t3 };
    }
    public static List<Datetime> generateDatetimes() {
        Datetime dt0 = Datetime.newInstance(1990, 1, 1, 15, 0, 0);
        Datetime dt1 = Datetime.newInstance(1991, 2, 2, 15, 0, 0);
        Datetime dt2 = Datetime.newInstance(1992, 3, 3, 15, 0, 0);
        Datetime dt3 = Datetime.newInstance(1993, 4, 4, 15, 0, 0);
        return new List<Datetime>{ dt0, dt1, dt2, dt3 };
    }
    public static List<Datetime> generateDatetimes1() {
        List<Datetime> datetimes = generateDatetimes();
        datetimes.add(Datetime.now());
        return datetimes;
    }
    public static List<Account> generateAccounts() {
        Id accId0 = generateId(Account.SObjectType);
        Id accId1 = generateId(Account.SObjectType);
        Id accId2 = generateId(Account.SObjectType);
        Id accId3 = generateId(Account.SObjectType);
        Id accId4 = generateId(Account.SObjectType);
        Id accId5 = generateId(Account.SObjectType);
        Id accId6 = generateId(Account.SObjectType);
        Id accId7 = generateId(Account.SObjectType);
        Id accId8 = generateId(Account.SObjectType);
        Id accId9 = generateId(Account.SObjectType);
        Account acc = new Account(Id = accId0, Name = 'Test Acc', Type = AsTestConsts.CUSTOMER, NumberOfEmployees = 0, BillingLatitude = 45.45);
        Account acc1 = new Account(Id = accId1, Name = 'Test Acc1', Type = AsTestConsts.CUSTOMER, BillingLatitude = -20.45);
        Account acc2 = new Account(Id = accId2, Name = 'CTest Acc2', Type = AsTestConsts.CUSTOMER, NumberOfEmployees = 301, BillingLatitude = -45.45);
        Account acc3 = new Account(Id = accId3, Name = 'Test Acc3', Type = AsTestConsts.PARTNER, NumberOfEmployees = 400, BillingLatitude = 10.00);
        Account acc4 = new Account(Id = accId4, Name = 'test Acc4', NumberOfEmployees = 500, BillingLatitude = 28.14);
        Account acc5 = new Account(Id = accId5, Name = 'Fest Acc4', Type = AsTestConsts.PARTNER, NumberOfEmployees = 605, BillingLatitude = -50.45);
        Account acc6 = new Account(Id = accId6, Name = 'BTest Acc6', Type = AsTestConsts.COMPETITOR, NumberOfEmployees = -50, BillingLatitude = -17.40);
        Account acc7 = new Account(Id = accId7, Name = 'Test Acc7', Type = AsTestConsts.COMPETITOR, NumberOfEmployees = 103, BillingLatitude = 63.80);
        Account acc8 = new Account(Id = accId8, Name = 'ATest Acc8', Type = AsTestConsts.COMPETITOR, NumberOfEmployees = 150, BillingLatitude = -80.13);
        Account acc9 = new Account(Id = accId9, Name = 'Parent Account');
        acc.putSObject('Parent', acc9);
        acc1.putSObject('Parent', acc9);
        acc2.putSObject('Parent', acc9);
        acc3.putSObject('Parent', acc9);
        acc4.putSObject('Parent', acc9);
        acc5.putSObject('Parent', acc9);
        Id conId0 = generateId(Contact.SObjectType);
        Id conId1 = generateId(Contact.SObjectType);
        Id conId2 = generateId(Contact.SObjectType);
        Id conId3 = generateId(Contact.SObjectType);
        Id conId4 = generateId(Contact.SObjectType);
        Id conId5 = generateId(Contact.SObjectType);
        Id conId6 = generateId(Contact.SObjectType);
        Contact con = new Contact(Id = conId0, AccountId = accId0, LastName = 'Test Name', Department = 'Finance');
        Contact con1 = new Contact(Id = conId1, AccountId = accId1, LastName = 'Test Name1', Department = 'Finance');
        Contact con2 = new Contact(Id = conId2, AccountId = accId2, LastName = 'Test Name2', Department = 'Finance');
        Contact con3 = new Contact(Id = conId3, AccountId = accId3, LastName = 'Test Name3', Department = 'HR');
        Contact con4 = new Contact(Id = conId4, AccountId = accId4, LastName = 'Test Name4', Department = 'HR');
        Contact con5 = new Contact(Id = conId5, AccountId = accId5, LastName = 'Test Name5', Department = 'Finance');
        Contact con6 = new Contact(Id = conId6, AccountId = accId5, LastName = 'Test Name5', Department = 'Finance');
        acc = (Account) setSObjects(acc, Contact.AccountId, new List<Contact>{ con });
        acc1 = (Account) setSObjects(acc1, Contact.AccountId, new List<Contact>{ con1 });
        acc2 = (Account) setSObjects(acc2, Contact.AccountId, new List<Contact>{ con2 });
        acc3 = (Account) setSObjects(acc3, Contact.AccountId, new List<Contact>{ con3 });
        acc4 = (Account) setSObjects(acc4, Contact.AccountId, new List<Contact>{ con4 });
        acc5 = (Account) setSObjects(acc5, Contact.AccountId, new List<Contact>{ con5, con6 });
        return new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5, acc6, acc7, acc8 };
    }
    public static List<Account> generateAccounts1() {
        List<Integer> ints = generateInts1();
        List<Double> dbs = generateDoubles1();
        Account acc = new Account(Name = 'Test Acc', Type = AsTestConsts.CUSTOMER, NumberOfEmployees = ints[0], BillingLatitude = dbs[0]);
        Account acc1 = new Account(Name = 'Test Acc1', Type = AsTestConsts.CUSTOMER, NumberOfEmployees = ints[1], BillingLatitude = dbs[1]);
        Account acc2 = new Account(Name = 'Test Acc2', Type = AsTestConsts.CUSTOMER, NumberOfEmployees = ints[2], BillingLatitude = dbs[2]);
        Account acc3 = new Account(Name = 'Test Acc3', Type = AsTestConsts.PARTNER, NumberOfEmployees = ints[3], BillingLatitude = dbs[3]);
        Account acc4 = new Account(Name = 'Test Acc4', Type = AsTestConsts.PARTNER, NumberOfEmployees = ints[4], BillingLatitude = dbs[4]);
        return new List<Account>{ acc, acc1, acc2, acc3, acc4 };
    }
    public static List<Contact> generateContacts() {
        return generateContacts(true);
    }
    public static List<Contact> generateContacts(Boolean relateEachToAccount) {
        Id accId0 = generateId(Account.SObjectType);
        Id accId1 = generateId(Account.SObjectType);
        Id accId2 = generateId(Account.SObjectType);
        Id accId3 = generateId(Account.SObjectType);
        Id accId4 = generateId(Account.SObjectType);
        Id accId5 = generateId(Account.SObjectType);
        Id accId6 = generateId(Account.SObjectType);
        Account acc = new Account(Id = accId0, Name = 'Test Acc', Type = AsTestConsts.CUSTOMER, NumberOfEmployees = 200, BillingLatitude = 45.45, BillingCountry = AsTestConsts.FRANCE);
        Account acc1 = new Account(Id = accId1, Name = 'Test Acc1', Type = AsTestConsts.CUSTOMER, NumberOfEmployees = 180, BillingLatitude = 20.45, BillingCountry = AsTestConsts.FRANCE);
        Account acc2 = new Account(Id = accId2, Name = 'CTest Acc2', Type = AsTestConsts.PARTNER, NumberOfEmployees = 100, BillingLatitude = 45.50, BillingCountry = AsTestConsts.UK);
        Account acc3 = new Account(Id = accId3, Name = 'Test Acc3', Type = AsTestConsts.PARTNER, NumberOfEmployees = 0, BillingLatitude = 10.00, BillingCountry = AsTestConsts.UK);
        Account acc4 = new Account(Id = accId4, Name = 'test Acc4', BillingLatitude = 28.15);
        Account acc5 = new Account(Id = accId5, Name = 'Test Acc5', Type = AsTestConsts.PARTNER);
        Account acc6 = new Account(Id = accId6, Name = 'Parent Account');
        acc.putSObject('Parent', acc6);
        acc1.putSObject('Parent', acc6);
        acc2.putSObject('Parent', acc6);
        acc3.putSObject('Parent', acc6);
        acc4.putSObject('Parent', acc6);
        acc5.putSObject('Parent', acc6);
        Id conId0 = generateId(Contact.SObjectType);
        Id conId1 = generateId(Contact.SObjectType);
        Id conId2 = generateId(Contact.SObjectType);
        Id conId3 = generateId(Contact.SObjectType);
        Id conId4 = generateId(Contact.SObjectType);
        Id conId5 = generateId(Contact.SObjectType);
        Date d = Date.newInstance(1990, 1, 1);
        Date d1 = Date.newInstance(1990, 2, 2);
        Date d2 = Date.newInstance(1990, 3, 3);
        Date d3 = Date.newInstance(1990, 4, 4);
        Contact con = new Contact(Id = conId0, AccountId = acc.Id, FirstName = 'Test FirstName', LastName = 'Test Name',
            DoNotCall = true, HasOptedOutOfEmail = true, Birthdate = d, OtherCountry = AsTestConsts.FRANCE, OtherCity = AsTestConsts.PARIS, Department = AsTestConsts.HR);
        Contact con1 = new Contact(Id = conId1, AccountId = acc1.Id, FirstName = 'Test FirstName1', LastName = 'Test Name1',
            DoNotCall = false, HasOptedOutOfEmail = true, Birthdate = d1, OtherCountry = AsTestConsts.FRANCE, OtherCity = AsTestConsts.LYON, Department = AsTestConsts.HR);
        Contact con2 = new Contact(Id = conId2, AccountId = acc2.Id, FirstName = 'Test FirstName2', LastName = 'Test Name2',
            DoNotCall = true, HasOptedOutOfEmail = true, Birthdate = d2, OtherCountry = AsTestConsts.UK, OtherCity = AsTestConsts.LONDON, Department = AsTestConsts.FINANCE);
        Contact con3 = new Contact(Id = conId3, AccountId = acc3.Id, FirstName = 'Test FirstName3', LastName = 'Test Name3',
            DoNotCall = false, HasOptedOutOfEmail = false, OtherCountry = AsTestConsts.UK, OtherCity = AsTestConsts.BRISTOL, Department = AsTestConsts.FINANCE);
        Contact con4 = new Contact(Id = conId4, AccountId = acc4.Id, FirstName = 'Test FirstName4', LastName = 'Test Name4',
            HasOptedOutOfEmail = false, Birthdate = d3);
        Contact con5 = new Contact(Id = conId5, AccountId = accId5, LastName = 'Test Name5', Department = AsTestConsts.FINANCE);
        Event as11 = new Event(Id = generateId(Event.SObjectType), WhoId = conId0, ActivityDate = Date.today());
        Event as12 = new Event(Id = generateId(Event.SObjectType), WhoId = conId0, ActivityDate = Date.today());
        Event as21 = new Event(Id = generateId(Event.SObjectType), WhoId = conId1, ActivityDate = Date.today().addDays(-1));
        Event as22 = new Event(Id = generateId(Event.SObjectType), WhoId = conId1, ActivityDate = Date.today().addDays(-1));
        Event as31 = new Event(Id = generateId(Event.SObjectType), WhoId = conId2, ActivityDate = Date.today());
        Event as32 = new Event(Id = generateId(Event.SObjectType), WhoId = conId2, ActivityDate = Date.today().addDays(-1));
        Event as41 = new Event(Id = generateId(Event.SObjectType), WhoId = conId3);
        Event as42 = new Event(Id = generateId(Event.SObjectType), WhoId = conId3, ActivityDate = Date.today().addDays(-1));
        Event as5 = new Event(Id = generateId(Event.SObjectType), WhoId = conId4);
        Event as6 = new Event(Id = generateId(Event.SObjectType), WhoId = conId5, ActivityDate = Date.today().addDays(-1));
        con.putSObject('Account', acc);
        con1.putSObject('Account', acc1);
        con2.putSObject('Account', acc2);
        con3.putSObject('Account', acc3);
        con4.putSObject('Account', acc4);
        if (relateEachToAccount) {
            con5.putSObject('Account', acc5);
        }
        con = (Contact) setSObjects(con, Event.WhoId, new List<Event>{ as11, as12 });
        con1 = (Contact) setSObjects(con1, Event.WhoId, new List<Event>{ as21, as22 });
        con2 = (Contact) setSObjects(con2, Event.WhoId, new List<Event>{ as31, as32 });
        con3 = (Contact) setSObjects(con3, Event.WhoId, new List<Event>{ as41, as42 });
        con4 = (Contact) setSObjects(con4, Event.WhoId, new List<Event>{ as5 });
        con5 = (Contact) setSObjects(con5, Event.WhoId, new List<Event>{ as6 });
        return new List<Contact>{ con, con1, con2, con3, con4, con5 };
    }
    public static List<Contact> generateContacts1() {
        List<Id> ids = generateIds();
        List<Date> ds = generateDates1();
        Id accId0 = generateId(Account.SObjectType);
        Id accId1 = generateId(Account.SObjectType);
        Contact con = new Contact(Id = ids[0], LastName = 'Test Name', Birthdate = ds[0], Department = AsTestConsts.HR, AccountId = accId0, DoNotCall = true);
        Contact con1 = new Contact(Id = ids[1], LastName = 'Test Name1', Birthdate = ds[1], Department = AsTestConsts.HR, AccountId = accId1, DoNotCall = false);
        Contact con2 = new Contact(Id = ids[2], LastName = 'Test Name2', Birthdate = ds[2], Department = AsTestConsts.HR, AccountId = accId0, DoNotCall = true);
        Contact con3 = new Contact(Id = ids[3], LastName = 'Test Name3', Birthdate = ds[3], Department = AsTestConsts.FINANCE, AccountId = accId1, DoNotCall = false);
        Contact con4 = new Contact(Id = ids[4], LastName = 'Test Name4', Department = AsTestConsts.FINANCE, AccountId = accId0);
        return new List<Contact>{ con, con1, con2, con3, con4 };
    }
    public static List<Comparable> generateComparables() {
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        john.setProbability((Double) 99.0);
        jake.setProbability((Double) 0.0);
        sam.setProbability((Double) 50.0);
        lucy.setProbability((Double) 30.0);
        return new List<Comparable>{ john, jake, sam, lucy };
    }
    public static List<AsPerson> generatePersons() {
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        john.setProbability((Double) 99.0);
        jake.setProbability((Double) 0.0);
        sam.setProbability((Double) 50.0);
        lucy.setProbability((Double) 30.0);
        return new List<AsPerson>{ john, jake, sam, lucy };
    }

    public static SObject setSObjects(SObject parent, SObjectField childRelField, List<SObject> children) {
        return (SObject) new AsTestCommons.SetSObjectsByFieldNameOperator(childRelField, Function.constant(children)).apply(parent);
    }

}
