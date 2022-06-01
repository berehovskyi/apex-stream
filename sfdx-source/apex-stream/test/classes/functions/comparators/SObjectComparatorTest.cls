/**
 * @author Oleh Berehovskyi
 * @see SObjectComparator
 */
@IsTest(IsParallel = true)
private class SObjectComparatorTest {

    private static List<Account> accounts = IterTestUtils.generateAccounts();

    /**
     * @see SObjectComparator.comparing
     */
    @IsTest
    static void comparingByKeyComparator() {
        // Given
        ISObjectFunction keyExtractor = SObjectFunction.get(IterTestUtils.CONSTS.Account.Name);
        IComparator keyComparator = Comparator.defaultOrder().nullsLast();
        String fieldName = IterTestUtils.CONSTS.NAME;
        List<Account> input = accounts;
        input[1].Name = null;
        input[3].Name = null;
        // When
        ISObjectComparator comparing = SObjectComparator.comparing(keyExtractor, keyComparator);
        // Then
        for (Account acc : input) {
            Account other = new Account(Name = 'test');
            Account other1 = new Account();
            String value = (String) acc.get(fieldName);
            String value1 = (String) other.get(fieldName);
            String value2 = (String) other1.get(fieldName);
            Integer expected = (value == null || value1 == null)
                    ? (value == value1 ? 0 : value == null ? 1 : -1)
                    : (value > value1 ? 1 : value == value1 ? 0 : -1);
            Integer expected1 = (value == null || value2 == null)
                    ? (value == value2 ? 0 : value == null ? 1 : -1)
                    : (value > value2 ? 1 : value == value2 ? 0 : -1);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
        }
    }

    /**
     * @see SObjectComparator.comparing
     */
    @IsTest
    static void comparing() {
        // Given
        ISObjectFunction keyExtractor = SObjectFunction.get(IterTestUtils.CONSTS.Account.Name);
        SObjectField field = IterTestUtils.CONSTS.Account.Name;
        String fieldName = IterTestUtils.CONSTS.NAME;
        // When
        ISObjectComparator comparing = SObjectComparator.comparing(keyExtractor);
        ISObjectComparator comparing1 = SObjectComparator.comparing(field);
        ISObjectComparator comparing2 = SObjectComparator.comparing(fieldName);
        // Then
        for (Account acc : accounts) {
            Account other = new Account(Name = 'test');
            Account other1 = new Account();
            String value = (String) acc.get(fieldName);
            String value1 = (String) other.get(fieldName);
            String value2 = (String) other1.get(fieldName);
            Integer expected = (value == null || value1 == null)
                    ? (value == value1 ? 0 : value == null ? -1 : 1)
                    : (value > value1 ? 1 : value == value1 ? 0 : -1);
            Integer expected1 = (value == null || value2 == null)
                    ? (value == value2 ? 0 : value == null ? -1 : 1)
                    : (value > value2 ? 1 : value == value2 ? 0 : -1);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
            Validate.assertEquals(expected, comparing1.compare(acc, other));
            Validate.assertEquals(expected1, comparing1.compare(acc, other1));
            Validate.assertEquals(expected, comparing2.compare(acc, other));
            Validate.assertEquals(expected1, comparing2.compare(acc, other1));
        }
    }

    /**
     * @see SObjectComparator.comparingInt
     */
    @IsTest
    static void comparingInt() {
        // Given
        ISObjectToIntFunction keyExtractor = SObjectToIntFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        // When
        ISObjectComparator comparing = SObjectComparator.comparingInt(keyExtractor);
        ISObjectComparator comparing1 = SObjectComparator.comparingInt(field);
        ISObjectComparator comparing2 = SObjectComparator.comparingInt(fieldName);
        // Then
        for (Account acc : accounts) {
            Account other = new Account(NumberOfEmployees = 103);
            Account other1 = new Account();
            Integer value = (Integer) acc.get(fieldName);
            Integer value1 = (Integer) other.get(fieldName);
            Integer value2 = (Integer) other1.get(fieldName);
            Integer expected = (value == null || value1 == null)
                    ? (value == value1 ? 0 : value == null ? -1 : 1)
                    : (value > value1 ? 1 : value == value1 ? 0 : -1);
            Integer expected1 = (value == null || value2 == null)
                    ? (value == value2 ? 0 : value == null ? -1 : 1)
                    : (value > value2 ? 1 : value == value2 ? 0 : -1);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
            Validate.assertEquals(expected, comparing1.compare(acc, other));
            Validate.assertEquals(expected1, comparing1.compare(acc, other1));
            Validate.assertEquals(expected, comparing2.compare(acc, other));
            Validate.assertEquals(expected1, comparing2.compare(acc, other1));
        }
    }

    /**
     * @see SObjectComparator.comparingLong
     */
    @IsTest
    static void comparingLong() {
        // Given
        ISObjectToLongFunction keyExtractor = SObjectToLongFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        // When
        ISObjectComparator comparing = SObjectComparator.comparingLong(keyExtractor);
        ISObjectComparator comparing1 = SObjectComparator.comparingLong(field);
        ISObjectComparator comparing2 = SObjectComparator.comparingLong(fieldName);
        // Then
        for (Account acc : accounts) {
            Account other = new Account(NumberOfEmployees = 103);
            Account other1 = new Account();
            Long value = (Long) acc.get(fieldName);
            Long value1 = (Long) other.get(fieldName);
            Long value2 = (Long) other1.get(fieldName);
            Integer expected = (value == null || value1 == null)
                    ? (value == value1 ? 0 : value == null ? -1 : 1)
                    : (value > value1 ? 1 : value == value1 ? 0 : -1);
            Integer expected1 = (value == null || value2 == null)
                    ? (value == value2 ? 0 : value == null ? -1 : 1)
                    : (value > value2 ? 1 : value == value2 ? 0 : -1);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
            Validate.assertEquals(expected, comparing1.compare(acc, other));
            Validate.assertEquals(expected1, comparing1.compare(acc, other1));
            Validate.assertEquals(expected, comparing2.compare(acc, other));
            Validate.assertEquals(expected1, comparing2.compare(acc, other1));
        }
    }

    /**
     * @see SObjectComparator.comparingDouble
     */
    @IsTest
    static void comparingDouble() {
        // Given
        ISObjectToDoubleFunction keyExtractor = SObjectToDoubleFunction.get(IterTestUtils.CONSTS.Account.BillingLatitude);
        SObjectField field = IterTestUtils.CONSTS.Account.BillingLatitude;
        String fieldName = IterTestUtils.CONSTS.BILLING_LATITUDE;
        // When
        ISObjectComparator comparing = SObjectComparator.comparingDouble(keyExtractor);
        ISObjectComparator comparing1 = SObjectComparator.comparingDouble(field);
        ISObjectComparator comparing2 = SObjectComparator.comparingDouble(fieldName);
        // Then
        for (Account acc : accounts) {
            Account other = new Account(BillingLatitude = 10.00);
            Account other1 = new Account();
            Double value = (Double) acc.get(fieldName);
            Double value1 = (Double) other.get(fieldName);
            Double value2 = (Double) other1.get(fieldName);
            Integer expected = (value == null || value1 == null)
                    ? (value == value1 ? 0 : value == null ? -1 : 1)
                    : (value > value1 ? 1 : value == value1 ? 0 : -1);
            Integer expected1 = (value == null || value2 == null)
                    ? (value == value2 ? 0 : value == null ? -1 : 1)
                    : (value > value2 ? 1 : value == value2 ? 0 : -1);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
            Validate.assertEquals(expected, comparing1.compare(acc, other));
            Validate.assertEquals(expected1, comparing1.compare(acc, other1));
            Validate.assertEquals(expected, comparing2.compare(acc, other));
            Validate.assertEquals(expected1, comparing2.compare(acc, other1));
        }
    }

    /**
     * @see SObjectComparator.comparingSObject
     */
    @IsTest
    static void comparingSObject() {
        // Given
        ISObjectUnaryOperator keyExtractor = SObjectUnaryOperator.identity();
        // When
        ISObjectComparator comparing = SObjectComparator.comparingSObject(keyExtractor);
        ISObjectComparator comparing1 = SObjectComparator.comparingSObject('Parent');
        ISObjectComparator comparing2 = SObjectComparator.comparingSObject(Account.ParentId);
        // Then
        for (Account acc : accounts) {
            Account parent = new Account(Name = 'parent');
            Account other = new Account(Name = 'test');
            other.putSObject('Parent', parent);
            Account other1 = null;
            List<SObject> pair = new List<SObject>{ acc, other };
            List<SObject> pair1 = new List<SObject>{ acc, other1 };
            List<SObject> pair2 = new List<SObject>{ acc.Parent, other.Parent };
            pair.sort();
            pair1.sort();
            pair2.sort();
            Integer expected = (acc == null || other == null)
                    ? (acc == other ? 0 : acc == null ? -1 : 1)
                    : (pair[0] == other ? 1 : -1);
            Integer expected1 = (acc == null || other1 == null)
                    ? (acc == other1 ? 0 : acc == null ? -1 : 1)
                    : (pair1[0] == other1 ? 1 : -1);
            Integer expected2 = (acc.Parent == null || other.Parent == null)
                    ? (acc.Parent == other.Parent ? 0 : acc.Parent == null ? -1 : 1)
                    : (pair2[0] == other ? 1 : -1);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
            Validate.assertEquals(expected2, comparing1.compare(acc, other));
            Validate.assertEquals(expected2, comparing2.compare(acc, other));
        }
    }

    /**
     * @see SObjectComparator.order
     * @see SObjectComparator.reversed
     * @see SObjectComparator.reverseOrder
     * @see SObjectComparator.defaultOrder
     */
    @IsTest
    static void ordering() {
        // Given
        ISObjectUnaryOperator keyExtractor = SObjectUnaryOperator.identity();
        // When
        ISObjectComparator comparing = SObjectComparator.defaultOrder();
        ISObjectComparator comparing1 = SObjectComparator.reverseOrder().reversed();
        ISObjectComparator comparing2 = SObjectComparator.comparingSObject(keyExtractor).order(SortOrder.ASCENDING);
        ISObjectComparator comparing3 = SObjectComparator.reverseOrder();
        ISObjectComparator comparing4 = SObjectComparator.comparingSObject(keyExtractor).reversed();
        ISObjectComparator comparing5 = SObjectComparator.comparingSObject(keyExtractor).order(SortOrder.DESCENDING);
        // Then
        for (Account acc : accounts) {
            Account other = new Account(Name = 'test');
            List<SObject> pair = new List<SObject>{ acc, other };
            pair.sort();
            Integer expected = (acc == null || other == null)
                    ? (acc == other ? 0 : acc == null ? -1 : 1)
                    : (pair[0] == other ? 1 : -1);
            Integer expected1 = (acc == null || other == null)
                    ? (acc == other ? 0 : acc == null ? 1 : -1)
                    : (pair[0] == other ? -1 : 1);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected, comparing1.compare(acc, other));
            Validate.assertEquals(expected, comparing2.compare(acc, other));
            Validate.assertEquals(expected1, comparing3.compare(acc, other));
            Validate.assertEquals(expected1, comparing4.compare(acc, other));
            Validate.assertEquals(expected1, comparing5.compare(acc, other));
        }
    }

    /**
     * @see SObjectComparator.nullsFirst
     * @see SObjectComparator.nullsLast
     */
    @IsTest
    static void nullsOrdering() {
        // Given
        ISObjectFunction keyExtractor = SObjectFunction.get(IterTestUtils.CONSTS.Account.Name);
        String fieldName = IterTestUtils.CONSTS.NAME;
        // When
        ISObjectComparator comparing = SObjectComparator.comparing(keyExtractor).nullsFirst();
        ISObjectComparator comparing1 = SObjectComparator.nullsFirst(SObjectComparator.comparing(keyExtractor));
        ISObjectComparator comparing2 = SObjectComparator.comparing(keyExtractor).nullsLast();
        ISObjectComparator comparing3 = SObjectComparator.nullsLast(SObjectComparator.comparing(keyExtractor));
        List<Account> input = accounts;
        input.add(0, null);
        input.add(null);
        // Then
        for (Account acc : accounts) {
            Account other = new Account(Name = 'test');
            String value = (String) acc?.get(fieldName);
            String value1 = (String) other?.get(fieldName);
            Integer expected =
                    acc == null ? -1 : (
                    (value == null || value1 == null)
                    ? (value == value1 ? 0 : value == null ? -1 : 1)
                    : (value > value1 ? 1 : value == value1 ? 0 : -1));
            Integer expected1 =
                    acc == null ? 1 : (
                    (value == null || value1 == null)
                    ? (value == value1 ? 0 : value == null ? -1 : 1)
                    : (value > value1 ? 1 : value == value1 ? 0 : -1));
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected, comparing1.compare(acc, other));
            Validate.assertEquals(expected1, comparing2.compare(acc, other));
            Validate.assertEquals(expected1, comparing3.compare(acc, other));
        }
    }

    /**
    * @see SObjectComparator.thenComparing
    */
    @IsTest
    static void thenComparingByKeyComparator() {
        // Given
        List<Account> input = accounts;
        input[6].Name = input[5].Name;
        ISObjectFunction keyExtractor = SObjectFunction.get(IterTestUtils.CONSTS.Account.Name);
        ISObjectFunction keyExtractor1 = SObjectFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        IComparator keyComparator = Comparator.defaultOrder().nullsLast();
        IComparator keyComparator1 = Comparator.reverseOrder();
        String fieldName = IterTestUtils.CONSTS.NAME;
        String fieldName1 = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        // When
        ISObjectComparator comparing = SObjectComparator.comparing(keyExtractor, keyComparator).thenComparing(keyExtractor1, keyComparator1);
        // Then
        for (Account acc : input) {
            Account other = new Account(Name = input[6].Name, NumberOfEmployees = input[6].NumberOfEmployees + 5);
            Account other1 = new Account();
            String value = (String) acc.get(fieldName);
            String value1 = (String) other.get(fieldName);
            String value2 = (String) other1.get(fieldName);
            Integer value3 = (Integer) acc.get(fieldName1);
            Integer value4 = (Integer) other.get(fieldName1);
            Integer value5 = (Integer) other1.get(fieldName1);
            Integer expected = Comparator.compareNullSafeUntyped(value, value1, true) == 0
                    ? Comparator.compareNullSafeUntyped(value4, value3)
                    : Comparator.compareNullSafeUntyped(value, value1, true);
            Integer expected1 = Comparator.compareNullSafeUntyped(value, value2, true) == 0
                    ? Comparator.compareNullSafeUntyped(value5, value3)
                    : Comparator.compareNullSafeUntyped(value, value2, true);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
        }
    }

    /**
    * @see SObjectComparator.thenComparing
    */
    @IsTest
    static void thenComparing() {
        // Given
        List<Account> input = accounts;
        input[6].Name = input[5].Name;
        ISObjectFunction keyExtractor = SObjectFunction.get(IterTestUtils.CONSTS.Account.Name);
        ISObjectFunction keyExtractor1 = SObjectFunction.get(IterTestUtils.CONSTS.Account.Type);
        String fieldName = IterTestUtils.CONSTS.NAME;
        String fieldName1 = IterTestUtils.CONSTS.TYPE;
        // When
        ISObjectComparator comparing = SObjectComparator.comparing(keyExtractor).thenComparing(keyExtractor1);
        // Then
        for (Account acc : input) {
            Account other = new Account(Name = input[6].Name, Type = IterTestUtils.CONSTS.COMPETITOR);
            Account other1 = new Account();
            String value = (String) acc.get(fieldName);
            String value1 = (String) other.get(fieldName);
            String value2 = (String) other1.get(fieldName);
            String value3 = (String) acc.get(fieldName1);
            String value4 = (String) other.get(fieldName1);
            String value5 = (String) other1.get(fieldName1);
            Integer expected = Comparator.compareNullSafeUntyped(value, value1) == 0
                    ? Comparator.compareNullSafeUntyped(value3, value4)
                    : Comparator.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparator.compareNullSafeUntyped(value, value2) == 0
                    ? Comparator.compareNullSafeUntyped(value3, value5)
                    : Comparator.compareNullSafeUntyped(value, value2);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
        }
    }

    /**
    * @see SObjectComparator.thenComparingInt
    */
    @IsTest
    static void thenComparingInt() {
        // Given
        List<Account> input = accounts;
        input[6].Name = input[5].Name;
        ISObjectFunction keyExtractor = SObjectFunction.get(IterTestUtils.CONSTS.Account.Name);
        ISObjectToIntFunction keyExtractor1 = SObjectToIntFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        String fieldName = IterTestUtils.CONSTS.NAME;
        String fieldName1 = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        // When
        ISObjectComparator comparing = SObjectComparator.comparing(keyExtractor).thenComparingInt(keyExtractor1);
        // Then
        for (Account acc : input) {
            Account other = new Account(Name = input[6].Name, NumberOfEmployees = input[6].NumberOfEmployees + 5);
            Account other1 = new Account();
            String value = (String) acc.get(fieldName);
            String value1 = (String) other.get(fieldName);
            String value2 = (String) other1.get(fieldName);
            Integer value3 = (Integer) acc.get(fieldName1);
            Integer value4 = (Integer) other.get(fieldName1);
            Integer value5 = (Integer) other1.get(fieldName1);
            Integer expected = Comparator.compareNullSafeUntyped(value, value1) == 0
                    ? Comparator.compareNullSafeInts(value3, value4)
                    : Comparator.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparator.compareNullSafeUntyped(value, value2) == 0
                    ? Comparator.compareNullSafeInts(value3, value5)
                    : Comparator.compareNullSafeUntyped(value, value2);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
        }
    }

    /**
    * @see SObjectComparator.thenComparingLong
    */
    @IsTest
    static void thenComparingLong() {
        // Given
        List<Account> input = accounts;
        input[6].Name = input[5].Name;
        ISObjectFunction keyExtractor = SObjectFunction.get(IterTestUtils.CONSTS.Account.Name);
        ISObjectToLongFunction keyExtractor1 = SObjectToLongFunction.get(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        String fieldName = IterTestUtils.CONSTS.NAME;
        String fieldName1 = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        // When
        ISObjectComparator comparing = SObjectComparator.comparing(keyExtractor).thenComparingLong(keyExtractor1);
        // Then
        for (Account acc : input) {
            Account other = new Account(Name = input[6].Name, NumberOfEmployees = input[6].NumberOfEmployees + 5);
            Account other1 = new Account();
            String value = (String) acc.get(fieldName);
            String value1 = (String) other.get(fieldName);
            String value2 = (String) other1.get(fieldName);
            Long value3 = (Long) acc.get(fieldName1);
            Long value4 = (Long) other.get(fieldName1);
            Long value5 = (Long) other1.get(fieldName1);
            Integer expected = Comparator.compareNullSafeUntyped(value, value1) == 0
                    ? Comparator.compareNullSafeLongs(value3, value4)
                    : Comparator.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparator.compareNullSafeUntyped(value, value2) == 0
                    ? Comparator.compareNullSafeLongs(value3, value5)
                    : Comparator.compareNullSafeUntyped(value, value2);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
        }
    }

    /**
    * @see SObjectComparator.thenComparingDouble
    */
    @IsTest
    static void thenComparingDouble() {
        // Given
        List<Account> input = accounts;
        input[6].Name = input[5].Name;
        ISObjectFunction keyExtractor = SObjectFunction.get(IterTestUtils.CONSTS.Account.Name);
        ISObjectToDoubleFunction keyExtractor1 = SObjectToDoubleFunction.get(IterTestUtils.CONSTS.Account.BillingLatitude);
        String fieldName = IterTestUtils.CONSTS.NAME;
        String fieldName1 = IterTestUtils.CONSTS.BILLING_LATITUDE;
        // When
        ISObjectComparator comparing = SObjectComparator.comparing(keyExtractor).thenComparingDouble(keyExtractor1);
        // Then
        for (Account acc : input) {
            Account other = new Account(Name = input[6].Name, BillingLatitude = input[6].BillingLatitude + 5);
            Account other1 = new Account();
            String value = (String) acc.get(fieldName);
            String value1 = (String) other.get(fieldName);
            String value2 = (String) other1.get(fieldName);
            Double value3 = (Double) acc.get(fieldName1);
            Double value4 = (Double) other.get(fieldName1);
            Double value5 = (Double) other1.get(fieldName1);
            Integer expected = Comparator.compareNullSafeUntyped(value, value1) == 0
                    ? Comparator.compareNullSafeDoubles(value3, value4)
                    : Comparator.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparator.compareNullSafeUntyped(value, value2) == 0
                    ? Comparator.compareNullSafeDoubles(value3, value5)
                    : Comparator.compareNullSafeUntyped(value, value2);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
        }
    }

    /**
    * @see SObjectComparator.thenComparingSObject
    */
    @IsTest
    static void thenComparingSObject() {
        // Given
        List<Account> input = accounts;
        input[6].Name = input[5].Name;
        ISObjectFunction keyExtractor = SObjectFunction.get(IterTestUtils.CONSTS.Account.Name);
        ISObjectUnaryOperator keyExtractor1 = SObjectUnaryOperator.getSObject(IterTestUtils.CONSTS.PARENT);
        String fieldName = IterTestUtils.CONSTS.NAME;
        String fieldName1 = IterTestUtils.CONSTS.PARENT;
        // When
        ISObjectComparator comparing = SObjectComparator.comparing(keyExtractor).thenComparingSObject(keyExtractor1);
        // Then
        for (Account acc : input) {
            Account other = new Account(Name = input[6].Name);
            Account other1 = new Account();
            String value = (String) acc.get(fieldName);
            String value1 = (String) other.get(fieldName);
            String value2 = (String) other1.get(fieldName);
            SObject value3 = (SObject) acc.getSObject(fieldName1);
            SObject value4 = (SObject) other.getSObject(fieldName1);
            SObject value5 = (SObject) other1.getSObject(fieldName1);
            Integer expected = Comparator.compareNullSafeUntyped(value, value1) == 0
                    ? Comparator.compareNullSafeSObjects(value3, value4)
                    : Comparator.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparator.compareNullSafeUntyped(value, value2) == 0
                    ? Comparator.compareNullSafeSObjects(value3, value5)
                    : Comparator.compareNullSafeUntyped(value, value2);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
        }
    }

    /**
    * @see SObjectComparator.thenComparing
    */
    @IsTest
    static void thenComparingByComparator() {
        // Given
        List<Account> input = accounts;
        input[6].Name = input[5].Name;
        input.add(0, null);
        input.add(null);
        ISObjectFunction keyExtractor = SObjectFunction.get(IterTestUtils.CONSTS.Account.Name);
        ISObjectFunction keyExtractor1 = SObjectFunction.get(IterTestUtils.CONSTS.Account.Type);
        String fieldName = IterTestUtils.CONSTS.NAME;
        String fieldName1 = IterTestUtils.CONSTS.TYPE;
        // When
        ISObjectComparator comparing = SObjectComparator.comparing(keyExtractor)
                .nullsLast()
                .reversed()
                    .thenComparing(SObjectComparator.comparing(keyExtractor1));
        // Then
        for (Account acc : input) {
            Account other = new Account(Name = input[6].Name, Type = IterTestUtils.CONSTS.COMPETITOR);
            Account other1 = new Account();
            String value = (String) acc?.get(fieldName);
            String value1 = (String) other?.get(fieldName);
            String value2 = (String) other1.get(fieldName);
            String value3 = (String) acc?.get(fieldName1);
            String value4 = (String) other?.get(fieldName1);
            String value5 = (String) other1.get(fieldName1);
            Integer expected = (acc == null || other == null)
                    ? Comparator.compareNullables(acc, other)
                    : Comparator.compareNullSafeUntyped(value, value1) == 0
                            ? Comparator.compareNullSafeUntyped(value3, value4)
                            : Comparator.compareNullSafeUntyped(value1, value);
            Integer expected1 = (acc == null || other1 == null)
                    ? Comparator.compareNullables(acc, other1)
                    : Comparator.compareNullSafeUntyped(value, value2) == 0
                            ? Comparator.compareNullSafeUntyped(value3, value5)
                            : Comparator.compareNullSafeUntyped(value2, value);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
        }
    }

}
