/**
 * @see TypePredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class TypePredicatesTest {

    static {
        new TypePredicates();
    }
    
    /**
     * @see TypePredicates.isInstanceOfBool
     * @see TypePredicates.isInstanceOfId
     * @see TypePredicates.isInstanceOfString
     * @see TypePredicates.isInstanceOfBlob
     * @see TypePredicates.isInstanceOfDate
     * @see TypePredicates.isInstanceOfDatetime
     * @see TypePredicates.isInstanceOfTime
     * @see TypePredicates.isInstanceOfInt
     * @see TypePredicates.isInstanceOfLong
     * @see TypePredicates.isInstanceOfDouble
     * @see TypePredicates.isInstanceOfSObject
     * @see TypePredicates.isInstanceOfComparable
     */
    @IsTest
    static void typePredicate() {
        // Given
        Boolean b = true;
        Id accId = IterTestUtils.generateId(Account.SObjectType);
        String str = 'str';
        Blob bl = Blob.valueOf('blob');
        Date d = Date.newInstance(2020, 1, 1);
        Datetime dt = Datetime.newInstance(2020, 1, 1, 1, 1, 1);
        Time t = Time.newInstance(1, 1, 1, 1);
        Integer i = 0;
        Long l1 = 0L;
        Long l2 = 2147483648L;
        Double db = 1.0;
        Account acc = new Account();
        Contact con = new Contact();
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        List<Object> input = new List<Object>{ null, b, accId, str, bl, d, dt, t, i, l1, l2, db, acc, con, john };
        // When
        IPredicate isInstanceOfBoolean = TypePredicates.isInstanceOfBool();
        IPredicate isInstanceOfId = TypePredicates.isInstanceOfId();
        IPredicate isInstanceOfString = TypePredicates.isInstanceOfString();
        IPredicate isInstanceOfBlob = TypePredicates.isInstanceOfBlob();
        IPredicate isInstanceOfDate = TypePredicates.isInstanceOfDate();
        IPredicate isInstanceOfDatetime = TypePredicates.isInstanceOfDatetime();
        IPredicate isInstanceOfTime = TypePredicates.isInstanceOfTime();
        IPredicate isInstanceOfInt = TypePredicates.isInstanceOfInt();
        IPredicate isInstanceOfLong = TypePredicates.isInstanceOfLong();
        IPredicate isInstanceOfDouble = TypePredicates.isInstanceOfDouble();
        IPredicate isInstanceOfSObject = TypePredicates.isInstanceOfSObject();
        IPredicate isInstanceOfComparable = TypePredicates.isInstanceOfComparable();
        // Then
        for (Object o : input) {
            Validate.assertEquals(o instanceof Boolean, isInstanceOfBoolean.test(o));
            Validate.assertEquals(o instanceof Id, isInstanceOfId.test(o));
            Validate.assertEquals(o instanceof String, isInstanceOfString.test(o));
            Validate.assertEquals(o instanceof Blob, isInstanceOfBlob.test(o));
            Validate.assertEquals(o instanceof Date, isInstanceOfDate.test(o));
            Validate.assertEquals(o instanceof Datetime, isInstanceOfDatetime.test(o));
            Validate.assertEquals(o instanceof Time, isInstanceOfTime.test(o));
            Validate.assertEquals(o instanceof Integer, isInstanceOfInt.test(o));
            Validate.assertEquals(o instanceof Long, isInstanceOfLong.test(o));
            Validate.assertEquals(o instanceof Double, isInstanceOfDouble.test(o));
            Validate.assertEquals(o instanceof SObject, isInstanceOfSObject.test(o));
            Validate.assertEquals(o instanceof Comparable, isInstanceOfComparable.test(o));
        }
    }
    
}
