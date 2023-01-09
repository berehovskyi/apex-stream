/**
 * @see Comparator
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ComparatorTest {

    private static final List<IterTestUtils.Person> PEOPLE = IterTestUtils.generateSimilarPersons();

    /**
     * @see Comparator.comparing
     */
    @IsTest
    static void comparingByKeyComparator() {
        // Given
        IFunction keyExtractor = new IterTestUtils.GetNameFunction();
        IComparator keyComparator = Comparator.defaultOrder().nullsLast();
        List<IterTestUtils.Person> input = PEOPLE;
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
        for (IterTestUtils.Person person : PEOPLE) {
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
        for (IterTestUtils.Person person : PEOPLE) {
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
        for (IterTestUtils.Person person : PEOPLE) {
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
        for (IterTestUtils.Person person : PEOPLE) {
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
        IToSObjectFunction keyExtractor = new IterTestUtils.ToSObject();
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
        for (IterTestUtils.Person person : PEOPLE) {
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
        List<IterTestUtils.Person> input = PEOPLE;
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
        List<IterTestUtils.Person> input = PEOPLE;
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
            Integer expected = Comparators.compareNullSafeUntyped(value, value1, true) == 0
                    ? Comparators.compareNullSafeUntyped(value4, value3)
                    : Comparators.compareNullSafeUntyped(value, value1, true);
            Integer expected1 = Comparators.compareNullSafeUntyped(value, value2, true) == 0
                    ? Comparators.compareNullSafeUntyped(value5, value3)
                    : Comparators.compareNullSafeUntyped(value, value2, true);
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
        List<IterTestUtils.Person> input = PEOPLE;
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
            Integer expected = Comparators.compareNullSafeUntyped(value, value1) == 0
                    ? Comparators.compareNullSafeUntyped(value3, value4)
                    : Comparators.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparators.compareNullSafeUntyped(value, value2) == 0
                    ? Comparators.compareNullSafeUntyped(value3, value5)
                    : Comparators.compareNullSafeUntyped(value, value2);
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
        List<IterTestUtils.Person> input = PEOPLE;
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
            Integer expected = Comparators.compareNullSafeUntyped(value, value1) == 0
                    ? Comparators.compareNullSafeInts(value3, value4)
                    : Comparators.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparators.compareNullSafeUntyped(value, value2) == 0
                    ? Comparators.compareNullSafeInts(value3, value5)
                    : Comparators.compareNullSafeUntyped(value, value2);
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
        List<IterTestUtils.Person> input = PEOPLE;
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
            Integer expected = Comparators.compareNullSafeUntyped(value, value1) == 0
                    ? Comparators.compareNullSafeLongs(value3, value4)
                    : Comparators.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparators.compareNullSafeUntyped(value, value2) == 0
                    ? Comparators.compareNullSafeLongs(value3, value5)
                    : Comparators.compareNullSafeUntyped(value, value2);
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
        List<IterTestUtils.Person> input = PEOPLE;
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
            Integer expected = Comparators.compareNullSafeUntyped(value, value1) == 0
                    ? Comparators.compareNullSafeDoubles(value3, value4)
                    : Comparators.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparators.compareNullSafeUntyped(value, value2) == 0
                    ? Comparators.compareNullSafeDoubles(value3, value5)
                    : Comparators.compareNullSafeUntyped(value, value2);
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
        List<IterTestUtils.Person> input = PEOPLE;
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
            Integer expected = Comparators.compareNullSafeUntyped(value, value1) == 0
                    ? Comparators.compareNullSafeSObjects(value3, value4)
                    : Comparators.compareNullSafeUntyped(value, value1);
            Integer expected1 = Comparators.compareNullSafeUntyped(value, value2) == 0
                    ? Comparators.compareNullSafeSObjects(value3, value5)
                    : Comparators.compareNullSafeUntyped(value, value2);
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
        List<IterTestUtils.Person> input = PEOPLE;
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
                    ? Comparators.compareNullables(person, other)
                    : Comparators.compareNullSafeUntyped(value, value1) == 0
                            ? Comparators.compareNullSafeUntyped(value3, value4)
                            : Comparators.compareNullSafeUntyped(value1, value);
            Integer expected1 = (person == null || other1 == null)
                    ? Comparators.compareNullables(person, other1)
                    : Comparators.compareNullSafeUntyped(value, value2) == 0
                            ? Comparators.compareNullSafeUntyped(value3, value5)
                            : Comparators.compareNullSafeUntyped(value2, value);
            Validate.assertEquals(expected, comparing.compare(person, other));
            Validate.assertEquals(expected1, comparing.compare(person, other1));
        }
    }

}
