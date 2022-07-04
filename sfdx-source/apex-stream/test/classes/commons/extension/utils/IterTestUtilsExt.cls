/**
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
public class IterTestUtilsExt {
    public static List<Boolean> generateBools() {
        return new List<Boolean>{ true, false, true, null };
    }
    public static List<Long> generateLongs1() {
        return new List<Long>{ 200L, 100L, 0L, 400L, 3000L };
    }
    public static List<String> generateStrings1() {
        String s0 = 'test.com';
        String s1 = 'test1.com';
        String s2 = 'test2.com';
        String s3 = 'test3.com';
        String s4 = 'test4.com';
        return new List<String>{ s0, s1, s2, s3, s4 };
    }
    public static List<Contact> generateContacts1() {
        List<Id> ids = IterTestUtils.generateIds();
        List<Date> ds = IterTestUtils.generateDates1();
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
        List<Blob> blobs = IterTestUtils.generateBlobs();
        Attachment att = new Attachment(Name = 'Test Att', ContentType = IterTestUtils.CONSTS.DOC, Body = blobs[0]);
        Attachment att1 = new Attachment(Name = 'Test Att1', ContentType = IterTestUtils.CONSTS.DOC, Body = blobs[1]);
        Attachment att2 = new Attachment(Name = 'Test Att2', ContentType = IterTestUtils.CONSTS.DOC, Body = blobs[2]);
        Attachment att3 = new Attachment(Name = 'Test Att3', ContentType = IterTestUtils.CONSTS.PDF, Body = blobs[3]);
        Attachment att4 = new Attachment(Name = 'Test Att4', ContentType = IterTestUtils.CONSTS.PDF, Body = blobs[4]);
        Attachment att5 = new Attachment(Name = 'Test Att5', ContentType = IterTestUtils.CONSTS.PDF);
        return new List<Attachment>{ att, att1, att2, att3, att4, att5 };
    }
    public static List<Event> generateEvents() {
        List<Datetime> dts = IterTestUtils.generateDatetimes1();
        Event ev = new Event(Description = 'Test Name', Type = IterTestUtils.CONSTS.CALL, ActivityDateTime = dts[0]);
        Event ev1 = new Event(Description = 'Test Name1', Type = IterTestUtils.CONSTS.CALL, ActivityDateTime = dts[1]);
        Event ev2 = new Event(Description = 'Test Name2', Type = IterTestUtils.CONSTS.CALL, ActivityDateTime = dts[2]);
        Event ev3 = new Event(Description = 'Test Name3', Type = IterTestUtils.CONSTS.EMAIL, ActivityDateTime = dts[3]);
        Event ev4 = new Event(Description = 'Test Name4', Type = IterTestUtils.CONSTS.EMAIL);
        return new List<Event>{ ev, ev1, ev2, ev3, ev4 };
    }
    public static List<TimeSlot> generateTimeSlots() {
        List<Time> ts = IterTestUtils.generateTimes();
        TimeSlot slot = new TimeSlot(StartTime = ts[0], EndTime = ts[0].addMinutes(15), Type = IterTestUtils.CONSTS.NORMAL);
        TimeSlot slot1 = new TimeSlot(StartTime = ts[1], EndTime = ts[1].addMinutes(15), Type = IterTestUtils.CONSTS.NORMAL);
        TimeSlot slot2 = new TimeSlot(StartTime = ts[2], EndTime = ts[2].addMinutes(15), Type = IterTestUtils.CONSTS.NORMAL);
        TimeSlot slot3 = new TimeSlot(StartTime = ts[3], EndTime = ts[3].addMinutes(15), Type = IterTestUtils.CONSTS.EXTENDED);
        TimeSlot slot4 = new TimeSlot(Type = IterTestUtils.CONSTS.EXTENDED);
        return new List<TimeSlot>{ slot, slot1, slot2, slot3, slot4 };
    }
    public static List<Object> generateMix() {
        return new List<Object>{ -5.1, '0', 10L, 3, true, new Account(), null, new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true), Math.PI, 3, '0' };
    }
    
}
