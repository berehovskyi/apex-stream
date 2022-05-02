/**
 * @author O. Berehovskyi
 * @see Comparator
 */
@IsTest(IsParallel = true)
private class ComparatorTest {

    private static List<IterTestUtils.Person> persons = IterTestUtils.generateSimilarPersons();

    /**
     * @see Comparator.comparing
     */
    @IsTest
    static void comparingByKeyComparator() {
        // Given
        IFunction keyExtractor = new IterTestUtils.GetNameFunction();
        IComparator keyComparator = Comparator.defaultOrder().nullsLast();
        List<IterTestUtils.Person> input = persons;
        input[1].setName(null);
        input[3].setName(null);
        // When
        IComparator comparing = Comparator.comparing(keyExtractor, keyComparator);
        // Then
        for (IterTestUtils.Person person : input) {
            IterTestUtils.Person other = new IterTestUtils.Person('test', 17, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            String value = person.getName();
            String value1 = other.getName();
            String value2 = other1.getName();
            Integer expected = (value == null || value1 == null)
                    ? (value == value1 ? 0 : value == null ? 1 : -1)
                    : (value > value1 ? 1 : value == value1 ? 0 : -1);
            Integer expected1 = (value == null || value2 == null)
                    ? (value == value2 ? 0 : value == null ? 1 : -1)
                    : (value > value2 ? 1 : value == value2 ? 0 : -1);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

    /**
     * @see Comparator.comparing
     */
    @IsTest
    static void comparing() {
        // Given
        IFunction keyExtractor = new IterTestUtils.GetNameFunction();
        // When
        IComparator comparing = Comparator.comparing(keyExtractor);
        // Then
        for (IterTestUtils.Person person : persons) {
            IterTestUtils.Person other = new IterTestUtils.Person('test', 17, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            String value = person.getName();
            String value1 = other.getName();
            String value2 = other1.getName();
            Integer expected = (value == null || value1 == null)
                    ? (value == value1 ? 0 : value == null ? -1 : 1)
                    : (value > value1 ? 1 : value == value1 ? 0 : -1);
            Integer expected1 = (value == null || value2 == null)
                    ? (value == value2 ? 0 : value == null ? -1 : 1)
                    : (value > value2 ? 1 : value == value2 ? 0 : -1);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

    /**
     * @see Comparator.comparingInt
     */
    @IsTest
    static void comparingInt() {
        // Given
        IToIntFunction keyExtractor = new IterTestUtils.GetAgeAsIntFunction();
        // When
        IComparator comparing = Comparator.comparingInt(keyExtractor);
        // Then
        for (IterTestUtils.Person person : persons) {
            IterTestUtils.Person other = new IterTestUtils.Person('test', 17, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            Integer value = (Integer) person.getAge();
            Integer value1 = (Integer) other.getAge();
            Integer value2 = (Integer) other1.getAge();
            Integer expected = (value == null || value1 == null)
                    ? (value == value1 ? 0 : value == null ? -1 : 1)
                    : (value > value1 ? 1 : value == value1 ? 0 : -1);
            Integer expected1 = (value == null || value2 == null)
                    ? (value == value2 ? 0 : value == null ? -1 : 1)
                    : (value > value2 ? 1 : value == value2 ? 0 : -1);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

    /**
     * @see Comparator.comparingLong
     */
    @IsTest
    static void comparingLong() {
        // Given
        IToLongFunction keyExtractor = new IterTestUtils.GetIdAsLongFunction();
        // When
        IComparator comparing = Comparator.comparingLong(keyExtractor);
        // Then
        for (IterTestUtils.Person person : persons) {
            IterTestUtils.Person other = new IterTestUtils.Person('test', 17, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            Long value = (Long) person.getAutoId();
            Long value1 = (Long) other.getAutoId();
            Long value2 = (Long) other1.getAutoId();
            Integer expected = (value == null || value1 == null)
                    ? (value == value1 ? 0 : value == null ? -1 : 1)
                    : (value > value1 ? 1 : value == value1 ? 0 : -1);
            Integer expected1 = (value == null || value2 == null)
                    ? (value == value2 ? 0 : value == null ? -1 : 1)
                    : (value > value2 ? 1 : value == value2 ? 0 : -1);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

    /**
     * @see Comparator.comparingDouble
     */
    @IsTest
    static void comparingDouble() {
        // Given
        IToDoubleFunction keyExtractor = new IterTestUtils.GetProbabilityAsDoubleFunction();
        // When
        IComparator comparing = Comparator.comparingDouble(keyExtractor);
        // Then
        for (IterTestUtils.Person person : persons) {
            IterTestUtils.Person other = new IterTestUtils.Person('test', 17, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            Double value = (Double) person.getProbability();
            Double value1 = (Double) other.getProbability();
            Double value2 = (Double) other1.getProbability();
            Integer expected = (value == null || value1 == null)
                    ? (value == value1 ? 0 : value == null ? -1 : 1)
                    : (value > value1 ? 1 : value == value1 ? 0 : -1);
            Integer expected1 = (value == null || value2 == null)
                    ? (value == value2 ? 0 : value == null ? -1 : 1)
                    : (value > value2 ? 1 : value == value2 ? 0 : -1);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

    /**
     * @see Comparator.comparingSObject
     */
    @IsTest
    static void comparingSObject() {
        // Given
        List<Account> accounts = IterTestUtils.generateAccounts();
        IToSObjectFunction keyExtractor = ToSObjectFunction.asSObject();
        // When
        IComparator comparing = Comparator.comparingSObject(keyExtractor);
        // Then
        for (Account acc : accounts) {
            Account other = new Account(Name = 'test');
            Account other1 = null;
            List<SObject> pair = new List<SObject>{ acc, other };
            List<SObject> pair1 = new List<SObject>{ acc, other1 };
            pair.sort();
            pair1.sort();
            Integer expected = (acc == null || other == null)
                    ? (acc == other ? 0 : acc == null ? -1 : 1)
                    : (pair[0] == other ? 1 : -1);
            Integer expected1 = (acc == null || other1 == null)
                    ? (acc == other1 ? 0 : acc == null ? -1 : 1)
                    : (pair1[0] == other1 ? 1 : -1);
            Validate.assertEquals(expected, comparing.compare(acc, other));
            Validate.assertEquals(expected1, comparing.compare(acc, other1));
        }
    }

    /**
     * @see Comparator.order
     * @see Comparator.reversed
     * @see Comparator.reverseOrder
     * @see Comparator.defaultOrder
     */
    @IsTest
    static void ordering() {
        // Given
        IFunction keyExtractor = Function.identity();
        // When
        IComparator comparing = Comparator.defaultOrder();
        IComparator comparing1 = Comparator.reverseOrder().reversed();
        IComparator comparing2 = Comparator.comparing(keyExtractor).order(SortOrder.ASCENDING);
        IComparator comparing3 = Comparator.reverseOrder();
        IComparator comparing4 = Comparator.comparing(keyExtractor).reversed();
        IComparator comparing5 = Comparator.comparing(keyExtractor).order(SortOrder.DESCENDING);
        // Then
        for (IterTestUtils.Person person : persons) {
            IterTestUtils.Person other = new IterTestUtils.Person('test', 17, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            Integer value = person.compareTo(other);
            Integer value1 = other1.compareTo(person); // reversed
            Integer expected = (person == null || other == null)
                    ? (person == other ? 0 : person == null ? -1 : 1)
                    : value;
            Integer expected1 = (person == null || other == null)
                    ? (person == other ? 0 : person == null ? 1 : -1)
                    : value1;
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected, comparing1.compare(person, other));
            Validate.assertEquals(expected, comparing2.compare(person, other));
            Validate.assertEquals(expected1, comparing3.compare(person, other1));
            Validate.assertEquals(expected1, comparing4.compare(person, other1));
            Validate.assertEquals(expected1, comparing5.compare(person, other1));
        }
    }

    /**
     * @see Comparator.nullsFirst
     * @see Comparator.nullsLast
     */
    @IsTest
    static void nullsOrdering() {
        // Given
        IFunction keyExtractor = new IterTestUtils.GetNameFunction();
        // When
        IComparator comparing = Comparator.comparing(keyExtractor).nullsFirst();
        IComparator comparing1 = Comparator.nullsFirst(Comparator.comparing(keyExtractor));
        IComparator comparing2 = Comparator.comparing(keyExtractor).nullsLast();
        IComparator comparing3 = Comparator.nullsLast(Comparator.comparing(keyExtractor));
        List<IterTestUtils.Person> input = persons;
        input.add(0, null);
        input.add(null);
        // Then
        for (IterTestUtils.Person person : input) {
            IterTestUtils.Person other = new IterTestUtils.Person('test', 17, Date.newInstance(1990, 1, 2), 0L, true);
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
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected, comparing1.compare(person, other));
            Validate.assertEquals(expected1, comparing2.compare(person, other));
            Validate.assertEquals(expected1, comparing3.compare(person, other));
        }
    }

    /**
    * @see Comparator.thenComparing
    */
    @IsTest
    static void thenComparingByKeyComparator() {
        // Given
        List<IterTestUtils.Person> input = persons;
        input[6].setName(input[5].getName());
        IFunction keyExtractor = new IterTestUtils.GetNameFunction();
        IFunction keyExtractor1 = new IterTestUtils.GetAgeFunction();
        IComparator keyComparator = Comparator.defaultOrder().nullsLast();
        IComparator keyComparator1 = Comparator.reverseOrder();
        // When
        IComparator comparing = Comparator.comparing(keyExtractor, keyComparator).thenComparing(keyExtractor1, keyComparator1);
        // Then
        for (IterTestUtils.Person person : input) {
            IterTestUtils.Person other = new IterTestUtils.Person(input[6].getName(), 17, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            String value = person.getName();
            String value1 = other.getName();
            String value2 = other1.getName();
            Integer value3 = person.getAge();
            Integer value4 = other.getAge();
            Integer value5 = other1.getAge();
            Integer expected = Comparator.compareNullSafeUntyped(value, value1, true) == 0
                    ? Comparator.compareNullSafeUntyped(value4, value3)
                    : Comparator.compareNullSafeUntyped(value, value1, true);
            Integer expected1 = Comparator.compareNullSafeUntyped(value, value2, true) == 0
                    ? Comparator.compareNullSafeUntyped(value5, value3)
                    : Comparator.compareNullSafeUntyped(value, value2, true);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

    /**
    * @see Comparator.thenComparing
    */
    @IsTest
    static void thenComparing() {
        // Given
        List<IterTestUtils.Person> input = persons;
        input[6].setName(input[5].getName());
        IFunction keyExtractor = new IterTestUtils.GetNameFunction();
        IFunction keyExtractor1 = new IterTestUtils.GetAgeFunction();
        // When
        IComparator comparing = Comparator.comparing(keyExtractor).thenComparing(keyExtractor1);
        // Then
        for (IterTestUtils.Person person : input) {
            IterTestUtils.Person other = new IterTestUtils.Person(input[6].getName(), 17, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            String value = person.getName();
            String value1 = other.getName();
            String value2 = other1.getName();
            Integer value3 = person.getAge();
            Integer value4 = other.getAge();
            Integer value5 = other1.getAge();
            Integer expected = Comparator.compareNullSafeUntyped(value, value1) == 0
                    ? Comparator.compareNullSafeUntyped(value3, value4)
                    : Comparator.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparator.compareNullSafeUntyped(value, value2) == 0
                    ? Comparator.compareNullSafeUntyped(value3, value5)
                    : Comparator.compareNullSafeUntyped(value, value2);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

    /**
    * @see Comparator.thenComparingInt
    */
    @IsTest
    static void thenComparingInt() {
        // Given
        List<IterTestUtils.Person> input = persons;
        input[6].setName(input[5].getName());
        IFunction keyExtractor = new IterTestUtils.GetNameFunction();
        IToIntFunction keyExtractor1 = new IterTestUtils.GetAgeAsIntFunction();
        // When
        IComparator comparing = Comparator.comparing(keyExtractor).thenComparingInt(keyExtractor1);
        // Then
        for (IterTestUtils.Person person : input) {
            IterTestUtils.Person other = new IterTestUtils.Person(input[6].getName(), 17, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            String value = person.getName();
            String value1 = other.getName();
            String value2 = other1.getName();
            Integer value3 = person.getAge();
            Integer value4 = other.getAge();
            Integer value5 = other1.getAge();
            Integer expected = Comparator.compareNullSafeUntyped(value, value1) == 0
                    ? Comparator.compareNullSafeInts(value3, value4)
                    : Comparator.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparator.compareNullSafeUntyped(value, value2) == 0
                    ? Comparator.compareNullSafeInts(value3, value5)
                    : Comparator.compareNullSafeUntyped(value, value2);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

    /**
    * @see Comparator.thenComparingLong
    */
    @IsTest
    static void thenComparingLong() {
        // Given
        List<IterTestUtils.Person> input = persons;
        input[6].setName(input[5].getName());
        IFunction keyExtractor = new IterTestUtils.GetNameFunction();
        IToLongFunction keyExtractor1 = new IterTestUtils.GetIdAsLongFunction();
        // When
        IComparator comparing = Comparator.comparing(keyExtractor).thenComparingLong(keyExtractor1);
        // Then
        for (IterTestUtils.Person person : input) {
            IterTestUtils.Person other = new IterTestUtils.Person(input[6].getName(), 17, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            String value = person.getName();
            String value1 = other.getName();
            String value2 = other1.getName();
            Long value3 = person.getAutoId();
            Long value4 = other.getAutoId();
            Long value5 = other1.getAutoId();
            Integer expected = Comparator.compareNullSafeUntyped(value, value1) == 0
                    ? Comparator.compareNullSafeLongs(value3, value4)
                    : Comparator.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparator.compareNullSafeUntyped(value, value2) == 0
                    ? Comparator.compareNullSafeLongs(value3, value5)
                    : Comparator.compareNullSafeUntyped(value, value2);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

    /**
    * @see Comparator.thenComparingDouble
    */
    @IsTest
    static void thenComparingDouble() {
        // Given
        List<IterTestUtils.Person> input = persons;
        input[6].setName(input[5].getName());
        IFunction keyExtractor = new IterTestUtils.GetNameFunction();
        IToDoubleFunction keyExtractor1 = new IterTestUtils.GetProbabilityAsDoubleFunction();
        // When
        IComparator comparing = Comparator.comparing(keyExtractor).thenComparingDouble(keyExtractor1);
        // Then
        for (IterTestUtils.Person person : input) {
            IterTestUtils.Person other = new IterTestUtils.Person(input[6].getName(), 17, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            String value = person.getName();
            String value1 = other.getName();
            String value2 = other1.getName();
            Double value3 = person.getProbability();
            Double value4 = other.getProbability();
            Double value5 = other1.getProbability();
            Integer expected = Comparator.compareNullSafeUntyped(value, value1) == 0
                    ? Comparator.compareNullSafeDoubles(value3, value4)
                    : Comparator.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparator.compareNullSafeUntyped(value, value2) == 0
                    ? Comparator.compareNullSafeDoubles(value3, value5)
                    : Comparator.compareNullSafeUntyped(value, value2);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

    /**
     * @see Comparator.thenComparingSObject
     */
    @IsTest
    static void thenComparingSObject() {
        // Given
        List<IterTestUtils.Person> input = persons;
        input[6].setName(input[5].getName());
        IFunction keyExtractor = new IterTestUtils.GetNameFunction();
        IToSObjectFunction keyExtractor1 = new IterTestUtils.ConvertToUser();
        // When
        IComparator comparing = Comparator.comparing(keyExtractor).thenComparingSObject(keyExtractor1);
        // Then
        for (IterTestUtils.Person person : input) {
            IterTestUtils.Person other = new IterTestUtils.Person(input[6].getName(), 17, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            String value = person.getName();
            String value1 = other.getName();
            String value2 = other1.getName();
            SObject value3 = keyExtractor1.apply(person);
            SObject value4 = keyExtractor1.apply(other);
            SObject value5 = keyExtractor1.apply(other1);
            Integer expected = Comparator.compareNullSafeUntyped(value, value1) == 0
                    ? Comparator.compareNullSafeSObjects(value3, value4)
                    : Comparator.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparator.compareNullSafeUntyped(value, value2) == 0
                    ? Comparator.compareNullSafeSObjects(value3, value5)
                    : Comparator.compareNullSafeUntyped(value, value2);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

    /**
    * @see Comparator.thenComparing
    */
    @IsTest
    static void thenComparingByComparator() {
        // Given
        List<IterTestUtils.Person> input = persons;
        input[6].setName(input[5].getName());
        input.add(0, null);
        input.add(null);
        IFunction keyExtractor = new IterTestUtils.GetNameFunction();
        IFunction keyExtractor1 = new IterTestUtils.GetAgeFunction();
        // When
        IComparator comparing = Comparator.comparing(keyExtractor)
                .nullsLast()
                .reversed()
                    .thenComparing(Comparator.comparing(keyExtractor1));
        // Then
        for (IterTestUtils.Person person : input) {
            IterTestUtils.Person other = new IterTestUtils.Person(input[6].getName(), 15, Date.newInstance(1990, 1, 2), 0L, true);
            IterTestUtils.Person other1 = new IterTestUtils.Person(null, null, null, null, true);
            String value = person?.getName();
            String value1 = other?.getName();
            String value2 = other1.getName();
            Integer value3 = person?.getAge();
            Integer value4 = other?.getAge();
            Integer value5 = other1.getAge();
            Integer expected = (person == null || other == null)
                    ? Comparator.compareNullables(person, other)
                    : Comparator.compareNullSafeUntyped(value, value1) == 0
                            ? Comparator.compareNullSafeUntyped(value3, value4)
                            : Comparator.compareNullSafeUntyped(value1, value);
            Integer expected1 = (person == null || other1 == null)
                    ? Comparator.compareNullables(person, other1)
                    : Comparator.compareNullSafeUntyped(value, value2) == 0
                            ? Comparator.compareNullSafeUntyped(value3, value5)
                            : Comparator.compareNullSafeUntyped(value2, value);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

    /**
    * @see Comparator.compareNullables
    * @see Comparator.bools
    * @see Comparator.ids
    * @see Comparator.strings
    * @see Comparator.blobs
    * @see Comparator.dates
    * @see Comparator.datetimes
    * @see Comparator.times
    * @see Comparator.ints
    * @see Comparator.longs
    * @see Comparator.doubles
    * @see Comparator.sObjects
    * @see Comparator.comparables
    * @see Comparator.compareNullSafeUntyped
    */
    @IsTest
    static void compare() {
        // Then
        Validate.assertEquals(-1, Comparator.compareNullables(null, 1));
        Validate.assertEquals(0, Comparator.compareNullables(null, null));
        Validate.assertEquals(1, Comparator.compareNullables(1, null));
        Validate.assertEquals(1, Comparator.bools().compare(true, false));
        Id id1 = IterTestUtils.generateId(Account.SObjectType);
        Id id2 = IterTestUtils.generateId(Account.SObjectType);
        Validate.assertEquals(1, Comparator.ids().compare(id2, id1));
        Validate.assertEquals(1, Comparator.ids().compare(id2, id1));
        Validate.assertEquals(1, Comparator.strings().compare('b', 'a'));
        Validate.assertEquals(1, Comparator.blobs().compare(Blob.valueOf('a'), Blob.valueOf('b')));
        Validate.assertEquals(1, Comparator.dates().compare(Date.today().addDays(1), Date.today()));
        Validate.assertEquals(1, Comparator.datetimes().compare(Date.today().addDays(1), Date.today()));
        Validate.assertEquals(1, Comparator.times().compare(Time.newInstance(22, 0, 0, 0), Time.newInstance(21, 0, 0, 0)));
        Validate.assertEquals(1, Comparator.ints().compare(1, 0));
        Validate.assertEquals(1, Comparator.longs().compare(1L, 0L));
        Validate.assertEquals(1, Comparator.doubles().compare((Double) 1.0, (Double) 0.0));
        Validate.assertEquals(1, Comparator.sObjects().compare(new Account(Name = 'b'), new Account(Name = 'a')));
        IterTestUtils.Person frank = new IterTestUtils.Person('Frank', 20, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person tom = new IterTestUtils.Person('Tom', 20, Date.newInstance(1990, 1, 2), 2L, true);
        Validate.assertEquals(1, Comparator.comparables().compare(tom, frank));
        try {
            Comparator.compareUntyped(1, 'a');
        } catch (TypeException exc) {
            Validate.assertEquals('Types of comparing objects (Integer, String) mismatch or do not support comparison operators.', exc.getMessage());
        }
    }

}
