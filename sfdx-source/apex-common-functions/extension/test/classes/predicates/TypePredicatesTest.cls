/**
 * @see TypePredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
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
    @SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
    static void typePredicate() {
        // Given
        Boolean b = true;
        Id accId = AfTestData.generateId(Account.SObjectType);
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
        AfPerson john = new AfPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
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
            Assert.areEqual(o instanceof Boolean, isInstanceOfBoolean.test(o));
            Assert.areEqual(o instanceof Id, isInstanceOfId.test(o));
            Assert.areEqual(o instanceof String, isInstanceOfString.test(o));
            Assert.areEqual(o instanceof Blob, isInstanceOfBlob.test(o));
            Assert.areEqual(o instanceof Date, isInstanceOfDate.test(o));
            Assert.areEqual(o instanceof Datetime, isInstanceOfDatetime.test(o));
            Assert.areEqual(o instanceof Time, isInstanceOfTime.test(o));
            Assert.areEqual(o instanceof Integer, isInstanceOfInt.test(o));
            Assert.areEqual(o instanceof Long, isInstanceOfLong.test(o));
            Assert.areEqual(o instanceof Double, isInstanceOfDouble.test(o));
            Assert.areEqual(o instanceof SObject, isInstanceOfSObject.test(o));
            Assert.areEqual(o instanceof Comparable, isInstanceOfComparable.test(o));
        }
    }

}
