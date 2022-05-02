/**
 * @author O. Berehovskyi
 * @see BinaryOperator
 */
@IsTest(IsParallel = true)
private class BinaryOperatorTest {

    private static List<IterTestUtils.Person> persons = IterTestUtils.generatePersons();
    private static List<Object> ints = IterTestUtils.generateInts();
    private static List<Object> longs = IterTestUtils.generateLongs();
    private static List<Object> doubles = IterTestUtils.generateDoubles();
    private static List<String> strings = IterTestUtils.generateStrings();
    private static List<Object> contacts = IterTestUtils.generateContacts();

    /**
     * @see BinaryOperator.left
     * @see BinaryOperator.right
     * @see BinaryOperator.minBy
     * @see BinaryOperator.maxBy
     * @see BinaryOperator.upcast
     */
    @IsTest
    static void defaultMethods() {
        // When
        IComparator comparator = Comparator.comparing(new IterTestUtils.GetAgeFunction());
        IBinaryOperator left = BinaryOperator.left();
        IBinaryOperator right = BinaryOperator.right();
        IBinaryOperator minBy = BinaryOperator.minBy(comparator);
        IBinaryOperator maxBy = BinaryOperator.maxBy(comparator);
        // Then
        for (IterTestUtils.Person person : persons) {
            IterTestUtils.Person jhene = new IterTestUtils.Person('Jhene', 18, Date.newInstance(1990, 1, 2), 5L, true);
            Validate.assertEquals(person, left.apply(person, jhene));
            Validate.assertEquals(jhene, right.apply(person, jhene));
            Object actual = minBy.apply(person, jhene);
            Object actual1 = maxBy.apply(person, jhene);
            IterTestUtils.Person expected = person.getAge() == null
                    ? person
                    : person.getAge() >= (Integer) jhene.getAge() ? jhene : person;
            IterTestUtils.Person expected1 = person.getAge() == null
                    ? jhene
                    : person.getAge() <= (Integer) jhene.getAge() ? jhene : person;
            Validate.assertEquals(expected, actual);
            Validate.assertEquals(expected1, actual1);
        }
    }

    /**
     * @see BinaryOperator.upcast
     */
    @IsTest
    static void of() {
        // Given
        Integer i = 1;
        Contact con = new Contact(LastName = 'Other');
        // When
        IBinaryOperator ofIntSum = BinaryOperator.upcast(IntBinaryOperator.sum());
        IBinaryOperator ofLongSum = BinaryOperator.upcast(LongBinaryOperator.sum());
        IBinaryOperator ofDoubleSum = BinaryOperator.upcast(DoubleBinaryOperator.sum());
        IBinaryOperator getLeftArg = BinaryOperator.upcast(SObjectBinaryOperator.left());
        // Then
        for (Object o : ints) {
            Validate.assertEquals((Integer) o + i, ofIntSum.apply(o, i));
        }
        for (Object o : longs) {
            Validate.assertEquals((Long) o + i, ofLongSum.apply(o, i));
        }
        for (Object o : doubles) {
            Validate.assertEquals((Double) o + i, ofDoubleSum.apply(o, i));
        }
        for (Object o : contacts) {
            Validate.assertEquals(o, getLeftArg.apply(o, con));
        }
    }

    /**
     * @see BinaryOperator.upcast
     */
    @IsTest
    static void concat() {
        // Given
        String s = 'Str';
        String delimiter = ';';
        // When
        IBinaryOperator concat = StringBinaryOperator.concat();
        IBinaryOperator concat1 = StringBinaryOperator.concat(delimiter);
        // Then
        for (String o : strings) {
            Validate.assertEquals(o + s, concat.apply(o, s));
        }
        for (String o : strings) {
            Validate.assertEquals(o + delimiter + s, concat1.apply(o, s));
        }
    }

}
