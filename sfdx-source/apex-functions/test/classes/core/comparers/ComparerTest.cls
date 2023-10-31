/**
 * @see Comparer
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD')
private class ComparerTest {

    private static final List<Account> ACCOUNTS = AfTestData.generateAccounts();
    private static final List<AfPerson> PEOPLE = AfTestData.generateSimilarPeople();

    /**
     * @see Comparer.comparing
     */
    @IsTest
    static void comparingByKeyComparer_sobject() {
        // Given
        IFunction keyExtractor = new AfTestCommons.GetFieldFunction(Account.Name);
        IComparer keyComparer = Comparer.defaultOrder().nullsLast();
        String fieldName = AfTestConsts.NAME;
        List<Account> input = ACCOUNTS;
        input[1].Name = null;
        input[3].Name = null;
        // When
        IComparer comparing = Comparer.comparing(keyExtractor, keyComparer);
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
            Assert.areEqual(expected, comparing.compare(acc, other));
            Assert.areEqual(expected1, comparing.compare(acc, other1));
        }
    }

    /**
     * @see Comparer.comparing
     */
    @IsTest
    static void comparing_sobject() {
        // Given
        IFunction keyExtractor = new AfTestCommons.GetFieldFunction(Account.Name);
        SObjectField field = Account.Name;
        String fieldName = AfTestConsts.NAME;
        // When
        IComparer comparing = Comparer.comparing(keyExtractor);
        IComparer comparing1 = Comparer.comparing(new AfTestCommons.GetFieldFunction(field));
        IComparer comparing2 = Comparer.comparing(new AfTestCommons.GetFieldFunction(fieldName));
        // Then
        for (Account acc : ACCOUNTS) {
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
            Assert.areEqual(expected, comparing.compare(acc, other));
            Assert.areEqual(expected1, comparing.compare(acc, other1));
            Assert.areEqual(expected, comparing1.compare(acc, other));
            Assert.areEqual(expected1, comparing1.compare(acc, other1));
            Assert.areEqual(expected, comparing2.compare(acc, other));
            Assert.areEqual(expected1, comparing2.compare(acc, other1));
        }
    }

    /**
     * @see Comparer.order
     * @see Comparer.reversed
     * @see Comparer.reverseOrder
     * @see Comparer.defaultOrder
     */
    @IsTest
    static void ordering_sobject() {
        // Given
        IOperator keyExtractor = Operator.identity();
        // When
        IComparer comparing = Comparer.defaultOrder();
        IComparer comparing1 = Comparer.reverseOrder().reversed();
        IComparer comparing2 = Comparer.comparing(keyExtractor).order(SortOrder.ASCENDING);
        IComparer comparing3 = Comparer.reverseOrder();
        IComparer comparing4 = Comparer.comparing(keyExtractor).reversed();
        IComparer comparing5 = Comparer.comparing(keyExtractor).order(SortOrder.DESCENDING);
        // Then
        for (Account acc : ACCOUNTS) {
            Account other = new Account(Name = 'test');
            List<SObject> pair = new List<SObject>{ acc, other };
            pair.sort();
            Integer expected = (acc == null || other == null)
                ? (acc == other ? 0 : acc == null ? -1 : 1)
                : (pair[0] == other ? 1 : -1);
            Integer expected1 = (acc == null || other == null)
                ? (acc == other ? 0 : acc == null ? 1 : -1)
                : (pair[0] == other ? -1 : 1);
            Assert.areEqual(expected, comparing.compare(acc, other));
            Assert.areEqual(expected, comparing1.compare(acc, other));
            Assert.areEqual(expected, comparing2.compare(acc, other));
            Assert.areEqual(expected1, comparing3.compare(acc, other));
            Assert.areEqual(expected1, comparing4.compare(acc, other));
            Assert.areEqual(expected1, comparing5.compare(acc, other));
        }
    }

    /**
     * @see Comparer.nullsFirst
     * @see Comparer.nullsLast
     */
    @IsTest
    static void nullsOrdering_sobject() {
        // Given
        IFunction keyExtractor = new AfTestCommons.GetFieldFunction(Account.Name);
        String fieldName = AfTestConsts.NAME;
        // When
        IComparer comparing = Comparer.comparing(keyExtractor).nullsFirst();
        IComparer comparing1 = Comparer.nullsFirst(Comparer.comparing(keyExtractor));
        IComparer comparing2 = Comparer.comparing(keyExtractor).nullsLast();
        IComparer comparing3 = Comparer.nullsLast(Comparer.comparing(keyExtractor));
        List<Account> input = ACCOUNTS;
        input.add(0, null);
        input.add(null);
        // Then
        for (Account acc : ACCOUNTS) {
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
            Assert.areEqual(expected, comparing.compare(acc, other));
            Assert.areEqual(expected, comparing1.compare(acc, other));
            Assert.areEqual(expected1, comparing2.compare(acc, other));
            Assert.areEqual(expected1, comparing3.compare(acc, other));
        }
    }

    /**
     * @see Comparer.thenComparing
     */
    @IsTest
    static void thenComparingByKeyComparer_sobject() {
        // Given
        List<Account> input = ACCOUNTS;
        input[6].Name = input[5].Name;
        IFunction keyExtractor = new AfTestCommons.GetFieldFunction(Account.Name);
        IFunction keyExtractor1 = new AfTestCommons.GetFieldFunction(Account.NumberOfEmployees);
        IComparer keyComparer = Comparer.defaultOrder().nullsLast();
        IComparer keyComparer1 = Comparer.reverseOrder();
        String fieldName = AfTestConsts.NAME;
        String fieldName1 = AfTestConsts.NUMBER_OF_EMPLOYEES;
        // When
        IComparer comparing = Comparer.comparing(keyExtractor, keyComparer).thenComparing(keyExtractor1, keyComparer1);
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
            Integer expected = Comparer.compareObjects(value, value1, true) == 0
                ? Comparer.compareObjects(value4, value3)
                : Comparer.compareObjects(value, value1, true);
            Integer expected1 = Comparer.compareObjects(value, value2, true) == 0
                ? Comparer.compareObjects(value5, value3)
                : Comparer.compareObjects(value, value2, true);
            Assert.areEqual(expected, comparing.compare(acc, other));
            Assert.areEqual(expected1, comparing.compare(acc, other1));
        }
    }

    /**
     * @see Comparer.thenComparing
     */
    @IsTest
    static void thenComparing_sobject() {
        // Given
        List<Account> input = ACCOUNTS;
        input[6].Name = input[5].Name;
        IFunction keyExtractor = new AfTestCommons.GetFieldFunction(Account.Name);
        IFunction keyExtractor1 = new AfTestCommons.GetFieldFunction(Account.Type);
        String fieldName = AfTestConsts.NAME;
        String fieldName1 = AfTestConsts.TYPE;
        // When
        IComparer comparing = Comparer.comparing(keyExtractor).thenComparing(keyExtractor1);
        // Then
        for (Account acc : input) {
            Account other = new Account(Name = input[6].Name, Type = AfTestConsts.COMPETITOR);
            Account other1 = new Account();
            String value = (String) acc.get(fieldName);
            String value1 = (String) other.get(fieldName);
            String value2 = (String) other1.get(fieldName);
            String value3 = (String) acc.get(fieldName1);
            String value4 = (String) other.get(fieldName1);
            String value5 = (String) other1.get(fieldName1);
            Integer expected = Comparer.compareObjects(value, value1) == 0
                ? Comparer.compareObjects(value3, value4)
                : Comparer.compareObjects(value, value1);
            Integer expected1 = Comparer.compareObjects(value, value2) == 0
                ? Comparer.compareObjects(value3, value5)
                : Comparer.compareObjects(value, value2);
            Assert.areEqual(expected, comparing.compare(acc, other));
            Assert.areEqual(expected1, comparing.compare(acc, other1));
        }
    }

    /**
     * @see Comparer.thenComparing
     */
    @IsTest
    static void thenComparingByComparer_sobject() {
        // Given
        List<Account> input = ACCOUNTS;
        input[6].Name = input[5].Name;
        input.add(0, null);
        input.add(null);
        IFunction keyExtractor = new AfTestCommons.GetFieldFunction(Account.Name);
        IFunction keyExtractor1 = new AfTestCommons.GetFieldFunction(Account.Type);
        String fieldName = AfTestConsts.NAME;
        String fieldName1 = AfTestConsts.TYPE;
        // When
        IComparer comparing = Comparer.comparing(keyExtractor)
            .nullsLast()
            .reversed()
            .thenComparing(Comparer.comparing(keyExtractor1));
        // Then
        for (Account acc : input) {
            Account other = new Account(Name = input[6].Name, Type = AfTestConsts.COMPETITOR);
            Account other1 = new Account();
            String value = (String) acc?.get(fieldName);
            String value1 = (String) other?.get(fieldName);
            String value2 = (String) other1.get(fieldName);
            String value3 = (String) acc?.get(fieldName1);
            String value4 = (String) other?.get(fieldName1);
            String value5 = (String) other1.get(fieldName1);
            Integer expected = (acc == null || other == null)
                ? Comparer.compareNulls(acc, other)
                : Comparer.compareObjects(value, value1) == 0
                    ? Comparer.compareObjects(value3, value4)
                    : Comparer.compareObjects(value1, value);
            Integer expected1 = (acc == null || other1 == null)
                ? Comparer.compareNulls(acc, other1)
                : Comparer.compareObjects(value, value2) == 0
                    ? Comparer.compareObjects(value3, value5)
                    : Comparer.compareObjects(value2, value);
            Assert.areEqual(expected, comparing.compare(acc, other));
            Assert.areEqual(expected1, comparing.compare(acc, other1));
        }
    }

    /**
     * @see Comparer.comparing
     */
    @IsTest
    static void comparingByKeyComparer() {
        // Given
        IFunction keyExtractor = new AfTestCommons.GetNameFunction();
        IComparer keyComparer = Comparer.defaultOrder().nullsLast();
        List<AfPerson> input = PEOPLE;
        input[1].setName(null);
        input[3].setName(null);
        // When
        IComparer comparing = Comparer.comparing(keyExtractor, keyComparer);
        // Then
        for (AfPerson person : input) {
            AfPerson other = new AfPerson('test', 17, Date.newInstance(1990, 1, 2), 0L, true);
            AfPerson other1 = new AfPerson(null, null, null, null, true);
            String value = person.getName();
            String value1 = other.getName();
            String value2 = other1.getName();
            Integer expected = (value == null || value1 == null)
                ? (value == value1 ? 0 : value == null ? 1 : -1)
                : (value > value1 ? 1 : value == value1 ? 0 : -1);
            Integer expected1 = (value == null || value2 == null)
                ? (value == value2 ? 0 : value == null ? 1 : -1)
                : (value > value2 ? 1 : value == value2 ? 0 : -1);
            Assert.areEqual(expected, comparing.compare(person, other));
            Assert.areEqual(expected1, comparing.compare(person, other1));
        }
    }

    /**
     * @see Comparer.comparing
     */
    @IsTest
    static void comparing() {
        // Given
        IFunction keyExtractor = new AfTestCommons.GetNameFunction();
        // When
        IComparer comparing = Comparer.comparing(keyExtractor);
        // Then
        for (AfPerson person : PEOPLE) {
            AfPerson other = new AfPerson('test', 17, Date.newInstance(1990, 1, 2), 0L, true);
            AfPerson other1 = new AfPerson(null, null, null, null, true);
            String value = person.getName();
            String value1 = other.getName();
            String value2 = other1.getName();
            Integer expected = (value == null || value1 == null)
                ? (value == value1 ? 0 : value == null ? -1 : 1)
                : (value > value1 ? 1 : value == value1 ? 0 : -1);
            Integer expected1 = (value == null || value2 == null)
                ? (value == value2 ? 0 : value == null ? -1 : 1)
                : (value > value2 ? 1 : value == value2 ? 0 : -1);
            Assert.areEqual(expected, comparing.compare(person, other));
            Assert.areEqual(expected1, comparing.compare(person, other1));
        }
    }

    /**
     * @see Comparer.order
     * @see Comparer.reversed
     * @see Comparer.reverseOrder
     * @see Comparer.defaultOrder
     */
    @IsTest
    static void ordering() {
        // Given
        IFunction keyExtractor = Function.identity();
        // When
        IComparer comparing = Comparer.defaultOrder();
        IComparer comparing1 = Comparer.reverseOrder().reversed();
        IComparer comparing2 = Comparer.comparing(keyExtractor).order(SortOrder.ASCENDING);
        IComparer comparing3 = Comparer.reverseOrder();
        IComparer comparing4 = Comparer.comparing(keyExtractor).reversed();
        IComparer comparing5 = Comparer.comparing(keyExtractor).order(SortOrder.DESCENDING);
        // Then
        for (AfPerson person : PEOPLE) {
            AfPerson other = new AfPerson('test', 17, Date.newInstance(1990, 1, 2), 0L, true);
            AfPerson other1 = new AfPerson(null, null, null, null, true);
            Integer value = person.compareTo(other);
            Integer value1 = other1.compareTo(person); // reversed
            Integer expected = (person == null || other == null)
                ? (person == other ? 0 : person == null ? -1 : 1)
                : value;
            Integer expected1 = (person == null || other == null)
                ? (person == other ? 0 : person == null ? 1 : -1)
                : value1;
            Assert.areEqual(expected, comparing.compare(person, other));
            Assert.areEqual(expected, comparing1.compare(person, other));
            Assert.areEqual(expected, comparing2.compare(person, other));
            Assert.areEqual(expected1, comparing3.compare(person, other1));
            Assert.areEqual(expected1, comparing4.compare(person, other1));
            Assert.areEqual(expected1, comparing5.compare(person, other1));
        }
    }

    /**
     * @see Comparer.nullsFirst
     * @see Comparer.nullsLast
     */
    @IsTest
    static void nullsOrdering() {
        // Given
        IFunction keyExtractor = new AfTestCommons.GetNameFunction();
        // When
        IComparer comparing = Comparer.comparing(keyExtractor).nullsFirst();
        IComparer comparing1 = Comparer.nullsFirst(Comparer.comparing(keyExtractor));
        IComparer comparing2 = Comparer.comparing(keyExtractor).nullsLast();
        IComparer comparing3 = Comparer.nullsLast(Comparer.comparing(keyExtractor));
        List<AfPerson> input = PEOPLE;
        input.add(0, null);
        input.add(null);
        // Then
        for (AfPerson person : input) {
            AfPerson other = new AfPerson('test', 17, Date.newInstance(1990, 1, 2), 0L, true);
            String value = person == null ? null : person.getName();
            String value1 = other == null ? null : other.getName();
            Integer expected =
                person == null ? -1 : (
                    (value == null || value1 == null)
                        ? (value == value1 ? 0 : value == null ? -1 : 1)
                        : (value > value1 ? 1 : value == value1 ? 0 : -1));
            Integer expected1 =
                person == null ? 1 : (
                    (value == null || value1 == null)
                        ? (value == value1 ? 0 : value == null ? -1 : 1)
                        : (value > value1 ? 1 : value == value1 ? 0 : -1));
            Assert.areEqual(expected, comparing.compare(person, other));
            Assert.areEqual(expected, comparing1.compare(person, other));
            Assert.areEqual(expected1, comparing2.compare(person, other));
            Assert.areEqual(expected1, comparing3.compare(person, other));
        }
    }

    /**
     * @see Comparer.thenComparing
     */
    @IsTest
    static void thenComparingByKeyComparer() {
        // Given
        List<AfPerson> input = PEOPLE;
        input[6].setName(input[5].getName());
        IFunction keyExtractor = new AfTestCommons.GetNameFunction();
        IFunction keyExtractor1 = new AfTestCommons.GetAgeFunction();
        IComparer keyComparer = Comparer.defaultOrder().nullsLast();
        IComparer keyComparer1 = Comparer.reverseOrder();
        // When
        IComparer comparing = Comparer.comparing(keyExtractor, keyComparer).thenComparing(keyExtractor1, keyComparer1);
        // Then
        for (AfPerson person : input) {
            AfPerson other = new AfPerson(input[6].getName(), 17, Date.newInstance(1990, 1, 2), 0L, true);
            AfPerson other1 = new AfPerson(null, null, null, null, true);
            String value = person.getName();
            String value1 = other.getName();
            String value2 = other1.getName();
            Integer value3 = person.getAge();
            Integer value4 = other.getAge();
            Integer value5 = other1.getAge();
            Integer expected = Comparer.compareObjects(value, value1, true) == 0
                ? Comparer.compareObjects(value4, value3)
                : Comparer.compareObjects(value, value1, true);
            Integer expected1 = Comparer.compareObjects(value, value2, true) == 0
                ? Comparer.compareObjects(value5, value3)
                : Comparer.compareObjects(value, value2, true);
            Assert.areEqual(expected, comparing.compare(person, other));
            Assert.areEqual(expected1, comparing.compare(person, other1));
        }
    }

    /**
    * @see Comparer.thenComparing
    */
    @IsTest
    static void thenComparing() {
        // Given
        List<AfPerson> input = PEOPLE;
        input[6].setName(input[5].getName());
        IFunction keyExtractor = new AfTestCommons.GetNameFunction();
        IFunction keyExtractor1 = new AfTestCommons.GetAgeFunction();
        // When
        IComparer comparing = Comparer.comparing(keyExtractor).thenComparing(keyExtractor1);
        // Then
        for (AfPerson person : input) {
            AfPerson other = new AfPerson(input[6].getName(), 17, Date.newInstance(1990, 1, 2), 0L, true);
            AfPerson other1 = new AfPerson(null, null, null, null, true);
            String value = person.getName();
            String value1 = other.getName();
            String value2 = other1.getName();
            Integer value3 = person.getAge();
            Integer value4 = other.getAge();
            Integer value5 = other1.getAge();
            Integer expected = Comparer.compareObjects(value, value1) == 0
                ? Comparer.compareObjects(value3, value4)
                : Comparer.compareObjects(value, value1);
            Integer expected1 = Comparer.compareObjects(value, value2) == 0
                ? Comparer.compareObjects(value3, value5)
                : Comparer.compareObjects(value, value2);
            Assert.areEqual(expected, comparing.compare(person, other));
            Assert.areEqual(expected1, comparing.compare(person, other1));
        }
    }

    /**
     * @see Comparer.thenComparing
     */
    @IsTest
    static void thenComparingByComparer() {
        // Given
        List<AfPerson> input = PEOPLE;
        input[6].setName(input[5].getName());
        input.add(0, null);
        input.add(null);
        IFunction keyExtractor = new AfTestCommons.GetNameFunction();
        IFunction keyExtractor1 = new AfTestCommons.GetAgeFunction();
        // When
        IComparer comparing = Comparer.comparing(keyExtractor)
            .nullsLast()
            .reversed()
            .thenComparing(Comparer.comparing(keyExtractor1));
        // Then
        for (AfPerson person : input) {
            AfPerson other = new AfPerson(input[6].getName(), 15, Date.newInstance(1990, 1, 2), 0L, true);
            AfPerson other1 = new AfPerson(null, null, null, null, true);
            String value = person?.getName();
            String value1 = other?.getName();
            String value2 = other1.getName();
            Integer value3 = person?.getAge();
            Integer value4 = other?.getAge();
            Integer value5 = other1.getAge();
            Integer expected = (person == null || other == null)
                ? Comparer.compareNulls(person, other)
                : Comparer.compareObjects(value, value1) == 0
                    ? Comparer.compareObjects(value3, value4)
                    : Comparer.compareObjects(value1, value);
            Integer expected1 = (person == null || other1 == null)
                ? Comparer.compareNulls(person, other1)
                : Comparer.compareObjects(value, value2) == 0
                    ? Comparer.compareObjects(value3, value5)
                    : Comparer.compareObjects(value2, value);
            Assert.areEqual(expected, comparing.compare(person, other));
            Assert.areEqual(expected1, comparing.compare(person, other1));
        }
    }

    /**
     * @see Comparer.compareNulls
     * @see Comparer.compareObjects
     */
    @IsTest
    static void default() {
        // Given
        Id id1 = AfTestData.generateId(Account.SObjectType);
        Id id2 = AfTestData.generateId(Account.SObjectType);
        AfPerson frank = new AfPerson('Frank', 20, Date.newInstance(1990, 1, 2), 1L, true);
        AfPerson tom = new AfPerson('Tom', 20, Date.newInstance(1990, 1, 2), 2L, true);
        // Then
        Assert.areEqual(-1, Comparer.compareNulls(null, 1));
        Assert.areEqual(0, Comparer.compareNulls(null, null));
        Assert.areEqual(1, Comparer.compareNulls(1, null));
        Assert.areEqual(1, Comparer.compareNonNullObjects(true, false));
        Assert.areEqual(1, Comparer.compareNonNullObjects(id2, id1));
        Assert.areEqual(1, Comparer.compareNonNullObjects('b', 'a'));
        Assert.areEqual(1, Comparer.compareNonNullObjects(Blob.valueOf('a'), Blob.valueOf('b')));
        Assert.areEqual(1, Comparer.compareNonNullObjects(Date.today().addDays(1), Date.today()));
        Assert.areEqual(1, Comparer.compareNonNullObjects(Datetime.now().addDays(1), Datetime.now()));
        Assert.areEqual(1, Comparer.compareNonNullObjects(Time.newInstance(22, 0, 0, 0), Time.newInstance(21, 0, 0, 0)));
        Assert.areEqual(1, Comparer.compareNonNullObjects(1, 0));
        Assert.areEqual(1, Comparer.compareNonNullObjects(1L, 0L));
        Assert.areEqual(1, Comparer.compareNonNullObjects((Double) 1.0, (Double) 0.0));
        Assert.areEqual(1, Comparer.compareNonNullObjects(new Account(Name = 'b'), new Account(Name = 'a')));
        Assert.areEqual(1, Comparer.compareNonNullObjects(tom, frank));
        Assert.areEqual(-1, Comparer.compareNonNullObjects(1, 'a'));
        Assert.areEqual(1, Comparer.compareNonNullObjects('a', 1));
        Assert.areEqual(0, Comparer.compareNonNullObjects('1', 1));
    }

}
