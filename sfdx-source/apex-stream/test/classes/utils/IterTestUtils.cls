/**
 * @author O. Berehovskyi
 */
@IsTest
public class IterTestUtils {

    public static final Consts CONSTS = new Consts();
    private static Integer count = 0;
    public static Id generateId(SObjectType sObjType) {
        String keyPrefix = sObjType.getDescribe().getKeyPrefix();
        String fakeIdPrefix = '000000000000'.substring(0, 12 - String.valueOf(count).length());
        return Id.valueOf(keyPrefix + fakeIdPrefix + count++);
    }
    public class Person implements Comparable {
        private String name;
        private Integer age;
        private Date someDate;
        private Long autoId;
        private Boolean isActive;
        private Double probability;
        public Person(String name, Integer age, Date someDate, Long longNumber, Boolean isActive) {
            this.name = name;
            this.age = age;
            this.someDate = someDate;
            this.autoId = longNumber;
            this.isActive = isActive;
        }
        public String getName() {
            return name;
        }
        public void setName(String name) {
            this.name = name;
        }
        public Integer getAge() {
            return age;
        }
        public void setAge(Integer age) {
            this.age = age;
        }
        public Date getSomeDate() {
            return someDate;
        }
        public void setSomeDate(Date someDate) {
            this.someDate = someDate;
        }
        public Long getAutoId() {
            return autoId;
        }
        public void setAutoId(Long autoId) {
            this.autoId = autoId;
        }
        public Boolean isActive() {
            return isActive;
        }
        public void setActive(Boolean isActive) {
            this.isActive = isActive;
        }
        public Double getProbability() {
            return probability;
        }
        public void setProbability(Double probability) {
            this.probability = probability;
        }
        public Integer compareTo(Object o) {
            Person that = (Person) o;
            if (autoId == that.autoId) return 0;
            if (autoId > that.autoId) return 1;
            return -1;
        }
        public Boolean equals(Object obj) {
            if (obj == null || !(obj instanceof Person)) return false;
            Person that = (Person) obj;
            return this.name == that.name
                    && (this.age == that.age)
                    && (this.someDate == that.someDate)
                    && (this.autoId == that.autoId);
        }
        public override Integer hashCode() {
            Integer result = 0;
            result = 31 * result + (name == null ? 0 : name.hashCode());
            result = 31 * result + (age == null ? 0 : age);
            result = 31 * result + (autoId == null ? 0 : (Integer) (autoId ^ (autoId >>> 32)));
            return result;
        }
    }
    public class SetNameConsumer extends Consumer {
        private final String name;
        public SetNameConsumer(String name) {
            this.name = name;
        }
        public override void accept(Object o) {
            ((Person) o).setName(name);
        }
    }
    public class SetActiveConsumer extends Consumer {
        private final Boolean isActive;
        public SetActiveConsumer(Boolean isActive) {
            this.isActive = isActive;
        }
        public override void accept(Object o) {
            ((Person) o).setActive(isActive);
        }
    }
    public class SetAutoId extends Consumer {
        private final Long autoId;
        public SetAutoId(Long autoId) {
            this.autoId = autoId;
        }
        public override void accept(Object o) {
            ((Person) o).setAutoId(autoId);
        }
    }
    public class ConvertToUser extends ToSObjectFunction {
        public override SObject apply(Object o) {
            Person person = (Person) o;
            return new User(
                    LastName = person.name,
                    IsActive = person.isActive
            );
        }
    }
    public class IsNameChangedPredicate extends Predicate {
        private final String oldName;
        public IsNameChangedPredicate(String oldName) {
            this.oldName = oldName;
        }
        public override Boolean test(Object o) {
            Person person = (Person) o;
            return person.getName() != oldName;
        }
    }
    public class GetIdFunction extends Function {
        public override Object apply(Object o) { return ((Person) o).getAutoId(); }
    }
    public class GetIdAsLongFunction extends ToLongFunction {
        public override Long apply(Object o) { return ((Person) o).getAutoId(); }
    }
    public class GetNameFunction extends Function {
        public override Object apply(Object o) { return ((Person) o).getName(); }
    }
    public class GetAgeFunction extends Function {
        public override Object apply(Object o) { return ((Person) o).getAge(); }
    }
    public class GetAgeAsIntFunction extends ToIntFunction {
        public override Integer apply(Object o) { return ((Person) o).getAge(); }
    }
    public class GetProbabilityAsDoubleFunction extends ToDoubleFunction {
        public override Double apply(Object o) { return ((Person) o).getProbability(); }
    }
    public class GetActiveFunction extends Function {
        public override Object apply(Object o) { return ((Person) o).isActive(); }
    }
    public class IsAdultFunction extends Function {
        public override Object apply(Object o) { return ((Person) o).getAge() >= 18; }
    }
    public class IsAdultPredicate extends Predicate {
        public override Boolean test(Object o) { return ((Person) o).getAge() >= 18; }
    }
    public class IsActivePredicate extends Predicate {
        public override Boolean test(Object o) { return ((Person) o).isActive(); }
    }
    public class CreateAccountFromInts extends IntToSObjectFunction {
        public override SObject apply(Integer i) { return new Account(NumberOfEmployees = Math.abs(i)); }
    }
    public class CreateAccountFromLongs extends LongToSObjectFunction {
        public override SObject apply(Long i) { return new Account(NumberOfEmployees = (Integer) Math.abs(i)); }
    }
    public class CreateAccountFromDoubles extends DoubleToSObjectFunction {
        public override SObject apply(Double d) { return new Account(AnnualRevenue = Math.abs(d)); }
    }
    public class TestAccountGenerator extends SObjectSupplier {
        private Integer i = 0;
        public override SObject get() {
            return new Account(
                    Name = 'Test' + i,
                    NumberOfEmployees = 100 * i++
            );
        }
    }
    public class TestAccountIterate extends SObjectUnaryOperator {
        private Integer i = 0;
        public override SObject apply(SObject sObj) {
            Account seed = (Account) sObj;
            return new Account(
                    Name = seed.Name + i,
                    NumberOfEmployees = seed.NumberOfEmployees + 100 * i++
            );
        }
    }
    public class TestAccountOperator extends SObjectUnaryOperator {
        private Integer i = 0;
        public override SObject apply(SObject sObj) {
            return new Account(
                    Name = 'Test' + i,
                    NumberOfEmployees = 100 * i++
            );
        }
    }
    public class AccountToContactMapper extends SObjectUnaryOperator {
        public override SObject apply(SObject sObj) {
            return new Contact(AccountId = (Id) sObj.get('Id'));
        }
    }
    public class SumIntFieldReducer extends SObjectBinaryOperator {
        private final String fieldName;
        public SumIntFieldReducer(String fieldName) { this.fieldName = fieldName.contains('.') ? fieldName.substringAfter('.') : fieldName; }
        public override SObject apply(SObject seed, SObject sObj) {
            seed.put(fieldName, (Integer) seed.get(fieldName) + (Integer) sObj.get(fieldName));
            return seed;
        }
    }
    public class ConvertToNewPerson extends UnaryOperator {
        public override Object apply(Object o) {
            Person person = (Person) o;
            return new Person('new' + person.getName(), person.getAge() + 1, person.getSomeDate().addYears(1), person.getAutoId(), person.isActive());
        }
    }
    public class SetNameFromRight extends BiConsumer {
        public override void accept(Object o1, Object o2) {
            Person person1 = (Person) o1;
            Person person2 = (Person) o2;
            person1.setName(person2.getName());
        }
    }
    public class SetAgeFromLeft extends BiConsumer {
        public override void accept(Object o1, Object o2) {
            Person person1 = (Person) o1;
            Person person2 = (Person) o2;
            person2.setAge(person1.getAge());
        }
    }
    public class DoNothingRunnable implements IRunnable {
        public void run() {}
    }
    public class GetFieldsLength implements ISObjectFunction {
        private final ISObjectFunction iterableMapper;
        private final ISObjectFunction valueMapper;
        public GetFieldsLength(String relationshipFieldName, String fieldName) {
            iterableMapper = SObjectFunction.getSObjects(relationshipFieldName);
            valueMapper = SObjectFunction.get(fieldName);
        }
        public Object apply(SObject sObj) {
            List<SObject> children = (List<SObject>) iterableMapper.apply(sObj);
            List<Integer> results = new List<Integer>();
            if (children != null) {
                for (SObject child : children) {
                    results.add(((String) valueMapper.apply(child)).length());
                }
            }
            return results;
        }
    }
    public class GetDoublePair implements ISObjectFunction {
        private final ISObjectToDoubleFunction mapper1;
        private final ISObjectToDoubleFunction mapper2;
        public GetDoublePair(String fieldName1, String fieldName2) {
            mapper1 = SObjectToDoubleFunction.get(fieldName1);
            mapper2 = SObjectToDoubleFunction.get(fieldName2);
        }
        public Object apply(SObject sObj) {
            return new List<Double>{ mapper1.apply(sObj), mapper2.apply(sObj) };
        }
    }
    public class GetPair implements ISObjectFunction {
        private final ISObjectFunction mapper1;
        private final ISObjectFunction mapper2;
        public GetPair(String fieldName1, String fieldName2) {
            mapper1 = SObjectFunction.get(fieldName1);
            mapper2 = SObjectFunction.get(fieldName2);
        }
        public Object apply(SObject sObj) {
            return new List<Object>{ mapper1.apply(sObj), mapper2.apply(sObj) };
        }
    }
    public static SObject setSObjects(SObject parent, SObjectField childRelField, List<SObject> children) {
        return SObjectUnaryOperator.setSObjects(childRelField, children).apply(parent);
    }
    public static SObject deepClone(SObject sObj) {
        return sObj.clone(true, true, true, true);
    }
    public static List<SObject> deepClone(List<SObject> sObjs) {
        return sObjs.deepClone(true, true, true);
    }
    public static List<Object> deepClone(List<Object> objects) {
        return (List<Object>) JSON.deserializeUntyped(JSON.serialize(objects, false));
    }
    public static List<Object> deepClone(List<Object> objects, Type t) {
        return (List<Object>) JSON.deserialize(JSON.serialize(objects, false), t);
    }
    public static Object deepClone(Object objects, Type t) {
        return JSON.deserialize(JSON.serialize(objects, false), t);
    }
    public static List<Boolean> generateBools() {
        return new List<Boolean>{ true, false, true, null };
    }
    public static List<Id> generateIds() {
        Id id0 = IterTestUtils.generateId(Contact.SObjectType);
        Id id1 = IterTestUtils.generateId(Contact.SObjectType);
        Id id2 = IterTestUtils.generateId(Contact.SObjectType);
        Id id3 = IterTestUtils.generateId(Contact.SObjectType);
        Id id4 = IterTestUtils.generateId(Contact.SObjectType);
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
    public static List<Long> generateLongs() {
        return new List<Long>{ 1L, 2L, 3L, 4, 4L, 6L, -10L, -3L, 2154L, 0L, -4L, -0L, 323L, 55L, 2147483648L };
    }
    public static List<Long> generateLongs1() {
        return new List<Long>{ 200L, 100L, 0L, 400L, 3000L };
    }
    public static List<Double> generateDoubles() {
        return new List<Double>{ -5.5, 0, 1.0, 3, 8.99, Math.PI, 10.001, Math.E };
    }
    public static List<Double> generateDoubles1() {
        return new List<Double>{ 28.635308, 77.22496, 38.952101, 30.87415, 67.451453 };
    }
    public static List<String> generateStrings() {
        return new List<String>{
                'abcde', 'abc', 'fghi', 'hello', 'this', 'world', 'abba', 'abba xyz', 'hello ', ' this', 'world',
                'Hello Jason', 'Hello Freddy', 'Hello Sam', 'fGhi', 'ABCDE', 'abc 1', 'fG00hi', 'fG00hi$',
                'abcd1234!@#$%^&*()`~-_+={[}]|:<,>.?', '√', '1234567890', 'R32', '12.5', '', ' ', 'hello'
        };
    }
    public static List<String> generateStrings1() {
        String s0 = 'test.com';
        String s1 = 'test1.com';
        String s2 = 'test2.com';
        String s3 = 'test3.com';
        String s4 = 'test4.com';
        return new List<String>{ s0, s1, s2, s3, s4 };
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
        Id accId0 = IterTestUtils.generateId(Account.SObjectType);
        Id accId1 = IterTestUtils.generateId(Account.SObjectType);
        Id accId2 = IterTestUtils.generateId(Account.SObjectType);
        Id accId3 = IterTestUtils.generateId(Account.SObjectType);
        Id accId4 = IterTestUtils.generateId(Account.SObjectType);
        Id accId5 = IterTestUtils.generateId(Account.SObjectType);
        Id accId6 = IterTestUtils.generateId(Account.SObjectType);
        Id accId7 = IterTestUtils.generateId(Account.SObjectType);
        Id accId8 = IterTestUtils.generateId(Account.SObjectType);
        Id accId9 = IterTestUtils.generateId(Account.SObjectType);
        Account acc = new Account(Id = accId0, Name = 'Test Acc', Type = IterTestUtils.CONSTS.CUSTOMER, NumberOfEmployees = 0, BillingLatitude = 45.45);
        Account acc1 = new Account(Id = accId1, Name = 'Test Acc1', Type = IterTestUtils.CONSTS.CUSTOMER, BillingLatitude = -20.45);
        Account acc2 = new Account(Id = accId2, Name = 'CTest Acc2', Type = IterTestUtils.CONSTS.CUSTOMER, NumberOfEmployees = 301, BillingLatitude = -45.45);
        Account acc3 = new Account(Id = accId3, Name = 'Test Acc3', Type = IterTestUtils.CONSTS.PARTNER, NumberOfEmployees = 400, BillingLatitude = 10.00);
        Account acc4 = new Account(Id = accId4, Name = 'test Acc4', NumberOfEmployees = 500, BillingLatitude = 28.14);
        Account acc5 = new Account(Id = accId5, Name = 'Fest Acc4', Type = IterTestUtils.CONSTS.PARTNER, NumberOfEmployees = 605, BillingLatitude = -50.45);
        Account acc6 = new Account(Id = accId6, Name = 'BTest Acc6', Type = IterTestUtils.CONSTS.COMPETITOR, NumberOfEmployees = -50, BillingLatitude = -17.40);
        Account acc7 = new Account(Id = accId7, Name = 'Test Acc7', Type = IterTestUtils.CONSTS.COMPETITOR, NumberOfEmployees = 103, BillingLatitude = 63.80);
        Account acc8 = new Account(Id = accId8, Name = 'ATest Acc8', Type = IterTestUtils.CONSTS.COMPETITOR, NumberOfEmployees = 150, BillingLatitude = -80.13);
        Account acc9 = new Account(Id = accId9, Name = 'Parent Account');
        acc.putSObject('Parent', acc9);
        acc1.putSObject('Parent', acc9);
        acc2.putSObject('Parent', acc9);
        acc3.putSObject('Parent', acc9);
        acc4.putSObject('Parent', acc9);
        acc5.putSObject('Parent', acc9);
        Id conId0 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId1 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId2 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId3 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId4 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId5 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId6 = IterTestUtils.generateId(Contact.SObjectType);
        Contact con = new Contact(Id = conId0, AccountId = accId0, LastName = 'Test Name', Department = 'Finance');
        Contact con1 = new Contact(Id = conId1, AccountId = accId1, LastName = 'Test Name1', Department = 'Finance');
        Contact con2 = new Contact(Id = conId2, AccountId = accId2, LastName = 'Test Name2', Department = 'Finance');
        Contact con3 = new Contact(Id = conId3, AccountId = accId3, LastName = 'Test Name3', Department = 'HR');
        Contact con4 = new Contact(Id = conId4, AccountId = accId4, LastName = 'Test Name4', Department = 'HR');
        Contact con5 = new Contact(Id = conId5, AccountId = accId5, LastName = 'Test Name5', Department = 'Finance');
        Contact con6 = new Contact(Id = conId6, AccountId = accId5, LastName = 'Test Name5', Department = 'Finance');
        acc = (Account) IterTestUtils.setSObjects(acc, Contact.AccountId, new List<Contact>{ con });
        acc1 = (Account) IterTestUtils.setSObjects(acc1, Contact.AccountId, new List<Contact>{ con1 });
        acc2 = (Account) IterTestUtils.setSObjects(acc2, Contact.AccountId, new List<Contact>{ con2 });
        acc3 = (Account) IterTestUtils.setSObjects(acc3, Contact.AccountId, new List<Contact>{ con3 });
        acc4 = (Account) IterTestUtils.setSObjects(acc4, Contact.AccountId, new List<Contact>{ con4 });
        acc5 = (Account) IterTestUtils.setSObjects(acc5, Contact.AccountId, new List<Contact>{ con5, con6 });
        return new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5, acc6, acc7, acc8 };
    }
    public static List<Contact> generateContacts() {
        Id accId0 = IterTestUtils.generateId(Account.SObjectType);
        Id accId1 = IterTestUtils.generateId(Account.SObjectType);
        Id accId2 = IterTestUtils.generateId(Account.SObjectType);
        Id accId3 = IterTestUtils.generateId(Account.SObjectType);
        Id accId4 = IterTestUtils.generateId(Account.SObjectType);
        Id accId5 = IterTestUtils.generateId(Account.SObjectType);
        Id accId6 = IterTestUtils.generateId(Account.SObjectType);
        Account acc = new Account(Id = accId0, Name = 'Test Acc', Type = IterTestUtils.CONSTS.CUSTOMER, NumberOfEmployees = 200, BillingLatitude = 45.45, BillingCountry = IterTestUtils.CONSTS.FRANCE);
        Account acc1 = new Account(Id = accId1, Name = 'Test Acc1', Type = IterTestUtils.CONSTS.CUSTOMER, NumberOfEmployees = 180, BillingLatitude = 20.45, BillingCountry = IterTestUtils.CONSTS.FRANCE);
        Account acc2 = new Account(Id = accId2, Name = 'CTest Acc2', Type = IterTestUtils.CONSTS.PARTNER, NumberOfEmployees = 100, BillingLatitude = 45.50, BillingCountry = IterTestUtils.CONSTS.UK);
        Account acc3 = new Account(Id = accId3, Name = 'Test Acc3', Type = IterTestUtils.CONSTS.PARTNER, NumberOfEmployees = 0, BillingLatitude = 10.00, BillingCountry = IterTestUtils.CONSTS.UK);
        Account acc4 = new Account(Id = accId4, Name = 'test Acc4', BillingLatitude = 28.15);
        Account acc5 = new Account(Id = accId5, Name = 'Test Acc5', Type = IterTestUtils.CONSTS.PARTNER);
        Account acc6 = new Account(Id = accId6, Name = 'Parent Account');
        acc.putSObject('Parent', acc6);
        acc1.putSObject('Parent', acc6);
        acc2.putSObject('Parent', acc6);
        acc3.putSObject('Parent', acc6);
        acc4.putSObject('Parent', acc6);
        acc5.putSObject('Parent', acc6);
        Id conId0 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId1 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId2 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId3 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId4 = IterTestUtils.generateId(Contact.SObjectType);
        Id conId5 = IterTestUtils.generateId(Contact.SObjectType);
        Date d = Date.newInstance(1990, 1, 1);
        Date d1 = Date.newInstance(1990, 2, 2);
        Date d2 = Date.newInstance(1990, 3, 3);
        Date d3 = Date.newInstance(1990, 4, 4);
        Contact con = new Contact(Id = conId0, AccountId = acc.Id, FirstName = 'Test FirstName', LastName = 'Test Name',
                DoNotCall = true, HasOptedOutOfEmail = true, Birthdate = d, OtherCountry = IterTestUtils.CONSTS.FRANCE, OtherCity = IterTestUtils.CONSTS.PARIS, Department = IterTestUtils.CONSTS.HR);
        Contact con1 = new Contact(Id = conId1, AccountId = acc1.Id, FirstName = 'Test FirstName1', LastName = 'Test Name1',
                DoNotCall = false, HasOptedOutOfEmail = true, Birthdate = d1, OtherCountry = IterTestUtils.CONSTS.FRANCE, OtherCity = IterTestUtils.CONSTS.LYON, Department = IterTestUtils.CONSTS.HR);
        Contact con2 = new Contact(Id = conId2, AccountId = acc2.Id, FirstName = 'Test FirstName2', LastName = 'Test Name2',
                DoNotCall = true, HasOptedOutOfEmail = true, Birthdate = d2, OtherCountry = IterTestUtils.CONSTS.UK, OtherCity = IterTestUtils.CONSTS.LONDON, Department = IterTestUtils.CONSTS.FINANCE);
        Contact con3 = new Contact(Id = conId3, AccountId = acc3.Id, FirstName = 'Test FirstName3', LastName = 'Test Name3',
                DoNotCall = false, HasOptedOutOfEmail = false, OtherCountry = IterTestUtils.CONSTS.UK, OtherCity = IterTestUtils.CONSTS.BRISTOL, Department = IterTestUtils.CONSTS.FINANCE);
        Contact con4 = new Contact(Id = conId4, AccountId = acc4.Id, FirstName = 'Test FirstName4', LastName = 'Test Name4',
                HasOptedOutOfEmail = false, Birthdate = d3);
        Contact con5 = new Contact(Id = conId5, AccountId = accId5, LastName = 'Test Name5', Department = IterTestUtils.CONSTS.FINANCE);
        Asset as11 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId0, InstallDate = Date.today());
        Asset as12 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId0, InstallDate = Date.today());
        Asset as21 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId1, InstallDate = Date.today().addDays(-1));
        Asset as22 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId1, InstallDate = Date.today().addDays(-1));
        Asset as31 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId2, InstallDate = Date.today());
        Asset as32 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId2, InstallDate = Date.today().addDays(-1));
        Asset as41 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId3);
        Asset as42 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId3, InstallDate = Date.today().addDays(-1));
        Asset as5 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId4);
        Asset as6 = new Asset(Id = IterTestUtils.generateId(Asset.SObjectType), ContactId = conId5, InstallDate = Date.today().addDays(-1));
        con.putSObject('Account', acc);
        con1.putSObject('Account', acc1);
        con2.putSObject('Account', acc2);
        con3.putSObject('Account', acc3);
        con4.putSObject('Account', acc4);
        con5.putSObject('Account', acc5);
        con = (Contact) IterTestUtils.setSObjects(con, Asset.ContactId, new List<Asset>{ as11, as12 });
        con1 = (Contact) IterTestUtils.setSObjects(con1, Asset.ContactId, new List<Asset>{ as21, as22 });
        con2 = (Contact) IterTestUtils.setSObjects(con2, Asset.ContactId, new List<Asset>{ as31, as32 });
        con3 = (Contact) IterTestUtils.setSObjects(con3, Asset.ContactId, new List<Asset>{ as41, as42 });
        con4 = (Contact) IterTestUtils.setSObjects(con4, Asset.ContactId, new List<Asset>{ as5 });
        con5 = (Contact) IterTestUtils.setSObjects(con5, Asset.ContactId, new List<Asset>{ as6 });
        return new List<Contact>{ con, con1, con2, con3, con4, con5 };
    }
    public static List<Contact> generateContacts1() {
        List<Id> ids = generateIds();
        List<Date> ds = generateDates1();
        Id accId0 = IterTestUtils.generateId(Account.SObjectType);
        Id accId1 = IterTestUtils.generateId(Account.SObjectType);
        Contact con = new Contact(Id = ids[0], LastName = 'Test Name', Birthdate = ds[0], Department = IterTestUtils.CONSTS.HR, AccountId = accId0, DoNotCall = true);
        Contact con1 = new Contact(Id = ids[1], LastName = 'Test Name1', Birthdate = ds[1], Department = IterTestUtils.CONSTS.HR, AccountId = accId1, DoNotCall = false);
        Contact con2 = new Contact(Id = ids[2], LastName = 'Test Name2', Birthdate = ds[2], Department = IterTestUtils.CONSTS.HR, AccountId = accId0, DoNotCall = true);
        Contact con3 = new Contact(Id = ids[3], LastName = 'Test Name3', Birthdate = ds[3], Department = IterTestUtils.CONSTS.FINANCE, AccountId = accId1, DoNotCall = false);
        Contact con4 = new Contact(Id = ids[4], LastName = 'Test Name4', Department = IterTestUtils.CONSTS.FINANCE, AccountId = accId0);
        return new List<Contact>{ con, con1, con2, con3, con4 };
    }
    public static List<Attachment> generateAttachments() {
        List<Blob> blobs = generateBlobs();
        Attachment att = new Attachment(Name = 'Test Att', ContentType = IterTestUtils.CONSTS.DOC, Body = blobs[0]);
        Attachment att1 = new Attachment(Name = 'Test Att1', ContentType = IterTestUtils.CONSTS.DOC, Body = blobs[1]);
        Attachment att2 = new Attachment(Name = 'Test Att2', ContentType = IterTestUtils.CONSTS.DOC, Body = blobs[2]);
        Attachment att3 = new Attachment(Name = 'Test Att3', ContentType = IterTestUtils.CONSTS.PDF, Body = blobs[3]);
        Attachment att4 = new Attachment(Name = 'Test Att4', ContentType = IterTestUtils.CONSTS.PDF, Body = blobs[4]);
        Attachment att5 = new Attachment(Name = 'Test Att5', ContentType = IterTestUtils.CONSTS.PDF);
        return new List<Attachment>{ att, att1, att2, att3, att4, att5 };
    }
    public static List<Event> generateEvents() {
        List<Datetime> dts = generateDatetimes1();
        Event ev = new Event(Description = 'Test Name', Type = IterTestUtils.CONSTS.CALL, ActivityDateTime = dts[0]);
        Event ev1 = new Event(Description = 'Test Name1', Type = IterTestUtils.CONSTS.CALL, ActivityDateTime = dts[1]);
        Event ev2 = new Event(Description = 'Test Name2', Type = IterTestUtils.CONSTS.CALL, ActivityDateTime = dts[2]);
        Event ev3 = new Event(Description = 'Test Name3', Type = IterTestUtils.CONSTS.EMAIL, ActivityDateTime = dts[3]);
        Event ev4 = new Event(Description = 'Test Name4', Type = IterTestUtils.CONSTS.EMAIL);
        return new List<Event>{ ev, ev1, ev2, ev3, ev4 };
    }
    public static List<TimeSlot> generateTimeSlots() {
        List<Time> ts = generateTimes();
        TimeSlot slot = new TimeSlot(StartTime = ts[0], EndTime = ts[0].addMinutes(15), Type = IterTestUtils.CONSTS.NORMAL);
        TimeSlot slot1 = new TimeSlot(StartTime = ts[1], EndTime = ts[1].addMinutes(15), Type = IterTestUtils.CONSTS.NORMAL);
        TimeSlot slot2 = new TimeSlot(StartTime = ts[2], EndTime = ts[2].addMinutes(15), Type = IterTestUtils.CONSTS.NORMAL);
        TimeSlot slot3 = new TimeSlot(StartTime = ts[3], EndTime = ts[3].addMinutes(15), Type = IterTestUtils.CONSTS.EXTENDED);
        TimeSlot slot4 = new TimeSlot(Type = IterTestUtils.CONSTS.EXTENDED);
        return new List<TimeSlot>{ slot, slot1, slot2, slot3, slot4 };
    }
    public static List<Account> generateAccounts1() {
        List<Integer> ints = generateInts1();
        List<Double> dbs = generateDoubles1();
        Account acc = new Account(Name = 'Test Acc', Type = IterTestUtils.CONSTS.CUSTOMER, NumberOfEmployees = ints[0], BillingLatitude = dbs[0]);
        Account acc1 = new Account(Name = 'Test Acc1', Type = IterTestUtils.CONSTS.CUSTOMER, NumberOfEmployees = ints[1], BillingLatitude = dbs[1]);
        Account acc2 = new Account(Name = 'Test Acc2', Type = IterTestUtils.CONSTS.CUSTOMER, NumberOfEmployees = ints[2], BillingLatitude = dbs[2]);
        Account acc3 = new Account(Name = 'Test Acc3', Type = IterTestUtils.CONSTS.PARTNER, NumberOfEmployees = ints[3], BillingLatitude = dbs[3]);
        Account acc4 = new Account(Name = 'Test Acc4', Type = IterTestUtils.CONSTS.PARTNER, NumberOfEmployees = ints[4], BillingLatitude = dbs[4]);
        return new List<Account>{ acc, acc1, acc2, acc3, acc4 };
    }
    public static List<Object> generateMix() {
        return new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true), Math.PI, 3, '0' };
    }
    public static List<IterTestUtils.Person> generatePersons() {
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        john.setProbability((Double) 99.0);
        jake.setProbability((Double) 0.0);
        sam.setProbability((Double) 50.0);
        lucy.setProbability((Double) 30.0);
        return new List<IterTestUtils.Person>{ john, jake, sam, lucy };
    }
    public static List<Comparable> generateComparables() {
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 0L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        john.setProbability((Double) 99.0);
        jake.setProbability((Double) 0.0);
        sam.setProbability((Double) 50.0);
        lucy.setProbability((Double) 30.0);
        return new List<Comparable>{ john, jake, sam, lucy };
    }
    public static List<Person> generateSimilarPersons() {
        List<Person> comparables = generatePersons();
        IterTestUtils.Person john = new IterTestUtils.Person('John', 25, Date.newInstance(1990, 1, 2), 4L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 30, Date.newInstance(1991, 2, 3), 5L, false);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 15, Date.newInstance(2005, 2, 3), 7L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person(null, 25, Date.newInstance(1991, 2, 3), 6L, true);
        john.setProbability((Double) 50.0);
        jake.setProbability((Double) 20.0);
        sam.setProbability((Double) 40.0);
        lucy.setProbability((Double) 70.0);
        comparables.add(john);
        comparables.add(jake);
        comparables.add(sam);
        comparables.add(lucy);
        return comparables;
    }
    public class Consts {
        public final AccountSObject Account = new AccountSObject();
        public final ContactSObject Contact = new ContactSObject();
        public final AttachmentSObject Attachment = new AttachmentSObject();
        public final EventSObject Event = new EventSObject();
        public final TimeSlotSObject TimeSlot = new TimeSlotSObject();

        public final String NAME = 'Name';
        public final String DO_NOT_CALL = 'DoNotCall';
        public final String ID = 'Id';
        public final String LAST_NAME = 'LastName';
        public final String BODY = 'Body';
        public final String CONTENT_TYPE = 'ContentType';
        public final String BIRTHDATE = 'Birthdate';
        public final String ACTIVITY_DATE_TIME = 'ActivityDateTime';
        public final String START_TIME = 'StartTime';
        public final String NUMBER_OF_EMPLOYEES = 'NumberOfEmployees';
        public final String BILLING_LATITUDE = 'BillingLatitude';
        public final String BILLING_LONGITUDE = 'BillingLongitude';
        public final String ACCOUNT_ID = 'AccountId';
        public final String FIRST_NAME = 'FirstName';
        public final String DESCRIPTION = 'Description';
        public final String END_TIME = 'EndTime';
        public final String DUPLICATE_KEY = 'Duplicate key';
        public final String HAS_OPTED_OUT_OF_EMAIL = 'HasOptedOutOfEmail';
        public final String OTHER_COUNTRY = 'OtherCountry';
        public final String OTHER_CITY = 'OtherCity';
        public final String DEPARTMENT = 'Department';
        public final String TYPE = 'Type';
        public final String BILLING_COUNTRY = 'BillingCountry';
        public final String PARENT = 'Parent';
        public final String FRANCE = 'France';
        public final String UK = 'Uk';
        public final String PARIS = 'Paris';
        public final String LYON = 'Lyon';
        public final String LONDON = 'London';
        public final String BRISTOL = 'Bristol';
        public final String DOC = '.doc';
        public final String PDF = '.pdf';
        public final String HR = 'HR';
        public final String FINANCE = 'Finance';
        public final String CALL = 'Call';
        public final String EMAIL = 'Email';
        public final String NORMAL = 'Normal';
        public final String EXTENDED = 'Extended';
        public final String CUSTOMER = 'Customer';
        public final String PARTNER = 'Partner';
        public final String COMPETITOR = 'Competitor';
        public final String ANNUAL_REVENUE = 'AnnualRevenue';
        public final String ACC = 'Account';
        public final String CONTACTS = 'Contacts';
    }
    private abstract class SObjectTypeConstants {
        public final SObjectType SOBJECT_TYPE;
        public final String SOBJECT_NAME;
    }
    public class AccountSObject extends SObjectTypeConstants {
        public final SObjectField Id = Account.Id;
        public final SObjectField Name = Account.Name;
        public final SObjectField NumberOfEmployees = Account.NumberOfEmployees;
        public final SObjectField BillingLatitude = Account.BillingLatitude;
        public final SObjectField BillingCountry = Account.BillingCountry;
        public final SObjectField AnnualRevenue = Account.AnnualRevenue;
        public final SObjectField Type = Account.Type;
        public final SObjectField ParentId = Account.ParentId;
        public AccountSObject() {
            this.SOBJECT_TYPE = Account.SObjectType;
            this.SOBJECT_NAME = 'Account';
        }
    }
    public class ContactSObject extends SObjectTypeConstants {
        public final SObjectField Id = Contact.Id;
        public final SObjectField DoNotCall = Contact.DoNotCall;
        public final SObjectField FirstName = Contact.FirstName;
        public final SObjectField LastName = Contact.LastName;
        public final SObjectField Birthdate = Contact.Birthdate;
        public final SObjectField AccountId = Contact.AccountId;
        public final SObjectField HasOptedOutOfEmail = Contact.HasOptedOutOfEmail;
        public final SObjectField OtherCountry = Contact.OtherCountry;
        public final SObjectField OtherCity = Contact.OtherCity;
        public final SObjectField Department = Contact.Department;
        public final SObjectField Description = Contact.Description;
        public ContactSObject() {
            this.SOBJECT_TYPE = Contact.SObjectType;
            this.SOBJECT_NAME = 'Contact';
        }
    }
    public class AttachmentSObject extends SObjectTypeConstants {
        public final SObjectField Id = Attachment.Id;
        public final SObjectField Body = Attachment.Body;
        public final SObjectField ContentType = Attachment.ContentType;
        public final SObjectField Name = Attachment.Name;
        public AttachmentSObject() {
            this.SOBJECT_TYPE = Attachment.SObjectType;
            this.SOBJECT_NAME = 'Attachment';
        }
    }
    public class EventSObject extends SObjectTypeConstants {
        public final SObjectField Id = Event.Id;
        public final SObjectField ActivityDateTime = Event.ActivityDateTime;
        public final SObjectField Description = Event.Description;
        public final SObjectField Type = Event.Type;
        public EventSObject() {
            this.SOBJECT_TYPE = Event.SObjectType;
            this.SOBJECT_NAME = 'Event';
        }
    }
    public class TimeSlotSObject extends SObjectTypeConstants {
        public final SObjectField Id = TimeSlot.Id;
        public final SObjectField StartTime = TimeSlot.StartTime;
        public final SObjectField EndTime = TimeSlot.EndTime;
        public final SObjectField Type = TimeSlot.Type;
        public TimeSlotSObject() {
            this.SOBJECT_TYPE = TimeSlot.SObjectType;
            this.SOBJECT_NAME = 'TimeSlot';
        }
    }
}
