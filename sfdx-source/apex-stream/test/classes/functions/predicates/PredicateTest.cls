/**
 * @see Predicate
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class PredicateTest {

    private static final List<IterTestUtils.Person> INPUT;

    static {
        IterTestUtils.Person john = new IterTestUtils.Person('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        IterTestUtils.Person jake = new IterTestUtils.Person('Jake', 33, Date.newInstance(1991, 2, 3), 2L, false);
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 16, Date.newInstance(2005, 2, 3), 3L, false);
        IterTestUtils.Person lucy = new IterTestUtils.Person('Lucy', 25, Date.newInstance(1991, 2, 3), 4L, true);
        IterTestUtils.Person victor = new IterTestUtils.Person('Victor', 18, Date.newInstance(1993, 2, 3), 5L, true);
        IterTestUtils.Person richard = new IterTestUtils.Person('Richard', 6, Date.newInstance(1991, 2, 3), 6L, true);
        IterTestUtils.Person chris = new IterTestUtils.Person('Chris', 60, Date.newInstance(1991, 2, 3), 7L, false);
        IterTestUtils.Person jhene = new IterTestUtils.Person('Jhene', 30, Date.newInstance(1991, 2, 3), 8L, true);
        john.setProbability((Double) 99.0);
        jake.setProbability((Double) 0.0);
        sam.setProbability((Double) 50.0);
        lucy.setProbability((Double) 30.0);
        victor.setProbability((Double) 70.0);
        richard.setProbability((Double) 10.0);
        chris.setProbability((Double) 50.1);
        jhene.setProbability((Double) 80.0);
        INPUT = new List<IterTestUtils.Person>{ john, jake, sam, lucy, victor, richard, chris, jhene };
    }

    /**
     * @see Predicate.orElse
     * @see Predicate.andAlso
     * @see Predicate.negate
     * @see Predicate.always
     */
    @IsTest
    static void default() {
        // Given
        Integer value = 18;
        String j = 'J';
        Boolean value1 = true;
        // When
        IPredicate alwaysPredicate = Predicate.always(value1);
        IFunction getAgeFunction = new IterTestUtils.GetAgeFunction();
        IFunction getNameFunction = new IterTestUtils.GetNameFunction();
        IFunction valueFunction = Function.constant(value);
        Predicate activePredicate = new IterTestUtils.IsActivePredicate();
        Predicate adultPredicate = Predicates.isGreaterOrEqual(getAgeFunction, valueFunction);
        Predicate startsWithJPredicate = new IterTestUtils.StartsWith(j);
        Predicate nameStartsWithJPredicate = Predicate.compose(getNameFunction, startsWithJPredicate);
        IPredicate adultActivePredicate = adultPredicate.andAlso(activePredicate);
        IPredicate adultOrActivePredicate = adultPredicate.orElse(activePredicate);
        IPredicate notAdultPredicate = adultPredicate.negate();
        IPredicate adultActiveOrWithNameStartsWithJPredicate = adultPredicate.andAlso(activePredicate).orElse(nameStartsWithJPredicate); // (1 AND 2) OR 3
        IPredicate adultActiveWithNameStartsWithJPredicate = adultPredicate.andAlso(activePredicate.orElse(nameStartsWithJPredicate)); // 1 AND (2 OR 3)
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Assert.areEqual(value1, alwaysPredicate.test(person));
            Assert.areEqual(person.getAge() >= value, adultPredicate.test(person));
            Assert.areEqual(person.isActive(), activePredicate.test(person));
            Assert.areEqual(person.getAge() >= value && person.isActive(), adultActivePredicate.test(person));
            Assert.areEqual(person.getAge() >= value && person.isActive(), adultPredicate.andAlso(activePredicate).test(person));
            Assert.areEqual(person.getAge() >= value || person.isActive(), adultOrActivePredicate.test(person));
            Assert.areEqual(!(person.getAge() >= value), notAdultPredicate.test(person));
            Assert.areEqual(person.getAge() >= value && person.isActive() || person.getName().startsWith(j), adultActiveOrWithNameStartsWithJPredicate.test(person));
            Assert.areEqual(person.getAge() >= value && (person.isActive() || person.getName().startsWith(j)), adultActiveWithNameStartsWithJPredicate.test(person));
        }
    }

    /**
     * @see Predicate.some
     */
    @IsTest
    static void some() {
        // Given
        Integer value = 18;
        // When
        IFunction getAgeFunction = new IterTestUtils.GetAgeFunction();
        IFunction valueFunction = Function.constant(value);
        Predicate activePredicate = new IterTestUtils.IsActivePredicate();
        Predicate adultPredicate = Predicates.isGreaterOrEqual(getAgeFunction, valueFunction);
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Assert.areEqual(person.getAge() >= value || person.isActive(), Predicate.some(new List<IPredicate>{ adultPredicate, activePredicate }).test(person));
        }
    }

    /**
     * @see Predicate.every
     */
    @IsTest
    static void every() {
        // Given
        Integer value = 18;
        // When
        IFunction getAgeFunction = new IterTestUtils.GetAgeFunction();
        IFunction valueFunction = Function.constant(value);
        Predicate activePredicate = new IterTestUtils.IsActivePredicate();
        Predicate adultPredicate = Predicates.isGreaterOrEqual(getAgeFunction, valueFunction);
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Assert.areEqual(person.getAge() >= value && person.isActive(), Predicate.every(new List<IPredicate>{ adultPredicate, activePredicate }).test(person));
        }
    }

    /**
     * @see Predicate.negate
     */
    @IsTest
    static void negate() {
        // Given
        Integer value = 18;
        // When
        IFunction getAgeFunction = new IterTestUtils.GetAgeFunction();
        IFunction valueFunction = Function.constant(value);
        Predicate adultPredicate = Predicates.isGreaterOrEqual(getAgeFunction, valueFunction);
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Assert.areEqual(!(person.getAge() >= value), Predicate.negate(adultPredicate).test(person));
        }
    }

    /**
     * @see Predicate.compose
     */
    @IsTest
    static void compose() {
        // Given
        Integer value = 18;
        Long value1 = 5L;
        Double value2 = 50.0;
        Boolean value3 = true;
        SObjectField userIsActiveField = User.IsActive;
        // When
        IFunction getAgeFunction = new IterTestUtils.GetAgeFunction();
        IToIntFunction getAgeAsIntFunction = new IterTestUtils.GetAgeAsIntFunction();
        IToLongFunction getIdAsLongFunction = new IterTestUtils.GetIdAsLongFunction();
        IToDoubleFunction getProbAsDoubleFunction = new IterTestUtils.GetProbabilityAsDoubleFunction();
        IToSObjectFunction getAsUserFunction = new IterTestUtils.ConvertToUser();
        Predicate agePredicate = Predicate.compose(getAgeFunction, Predicates.isGreater(value));
        Predicate ageAsIntPredicate = Predicate.compose(getAgeAsIntFunction, IntPredicates.isGreater(value));
        Predicate numberPredicate = Predicate.compose(getIdAsLongFunction, LongPredicates.isGreater(value1));
        Predicate probPredicate = Predicate.compose(getProbAsDoubleFunction, DoublePredicates.isGreater(value2));
        Predicate isActivePredicate = Predicate.compose(getAsUserFunction, SObjectPredicates.isEqual(userIsActiveField, value3));
        // Then
        for (IterTestUtils.Person person : INPUT) {
            Assert.areEqual(person.getAge() > value, agePredicate.test(person));
            Assert.areEqual(person.getAge() > value, ageAsIntPredicate.test(person));
            Assert.areEqual(person.getAutoId() > value1, numberPredicate.test(person));
            Assert.areEqual(person.getProbability() > value2, probPredicate.test(person));
            Assert.areEqual(person.isActive(), isActivePredicate.test(person));
        }
    }

}
