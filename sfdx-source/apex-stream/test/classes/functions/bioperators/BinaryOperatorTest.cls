/**
 * @see BinaryOperator
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class BinaryOperatorTest {

    private static final List<IterTestUtils.Person> PEOPLE = IterTestUtils.generatePersons();
    private static final List<Object> INTS = IterTestUtils.generateInts();
    private static final List<Object> LONGS = IterTestUtils.generateLongs();
    private static final List<Object> DOUBLES = IterTestUtils.generateDoubles();
    private static final List<Object> CONTACTS = IterTestUtils.generateContacts();

    /**
     * @see BinaryOperator.left
     * @see BinaryOperator.right
     * @see BinaryOperator.minBy
     * @see BinaryOperator.maxBy
     */
    @IsTest
    static void default() {
        // When
        IComparator comparator = Comparator.comparing(new IterTestUtils.GetAgeFunction());
        IBinaryOperator left = BinaryOperator.left();
        IBinaryOperator right = BinaryOperator.right();
        IBinaryOperator minBy = BinaryOperator.minBy(comparator);
        IBinaryOperator maxBy = BinaryOperator.maxBy(comparator);
        // Then
        for (IterTestUtils.Person person : PEOPLE) {
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
    static void upcast() {
        // Given
        Integer i = 1;
        Contact con = new Contact(LastName = 'Other');
        // When
        IBinaryOperator ofIntSum = BinaryOperator.upcast(IntBinaryOperators.sum());
        IBinaryOperator ofLongSum = BinaryOperator.upcast(LongBinaryOperators.sum());
        IBinaryOperator ofDoubleSum = BinaryOperator.upcast(DoubleBinaryOperators.sum());
        IBinaryOperator getLeftArg = BinaryOperator.upcast(SObjectBinaryOperator.left());
        // Then
        for (Object o : INTS) {
            Validate.assertEquals((Integer) o + i, ofIntSum.apply(o, i));
        }
        for (Object o : LONGS) {
            Validate.assertEquals((Long) o + i, ofLongSum.apply(o, i));
        }
        for (Object o : DOUBLES) {
            Validate.assertEquals((Double) o + i, ofDoubleSum.apply(o, i));
        }
        for (Object o : CONTACTS) {
            Validate.assertEquals(o, getLeftArg.apply(o, con));
        }
    }

}
