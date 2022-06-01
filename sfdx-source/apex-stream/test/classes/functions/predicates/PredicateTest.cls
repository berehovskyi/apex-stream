/**
 * @author Oleh Berehovskyi
 * @see Predicate
 */
@IsTest(IsParallel = true)
private class PredicateTest {

    private static List<IterTestUtils.Person> input;
    private static List<Object> intInput = new List<Object>{ 5, 1, 3, 8, -3, 4, null, -6, 0, 4 };
    private static List<String> stringInput = new List<String>{
            'abcde', 'abc', 'fghi', 'hello', 'this', 'world', 'abba', 'abba xyz', 'hello ', ' this', 'world',
            'Hello Jason', 'Hello Freddy', 'Hello Sam', 'fGhi', 'ABCDE', 'abc 1', 'fG00hi', 'fG00hi$',
            'abcd1234!@#$%^&*()`~-_+={[}]|:<,>.?', '√', '1234567890', 'R32', '12.5', '', ' ', 'hello'
    };
    private static List<Date> dateInput = new List<Date>{
            Date.newInstance(2020, 1, 1),
            Date.newInstance(2021, 2, 2),
            Date.newInstance(2023, 3, 3),
            Date.newInstance(2024, 4, 4)
    };
    private static List<Datetime> datetimeInput = new List<Datetime>{
            Datetime.newInstance(2020, 1, 1, 1, 1, 1),
            Datetime.newInstance(2021, 2, 2, 2, 2, 2),
            Datetime.newInstance(2023, 3, 3, 3, 3, 3),
            Datetime.newInstance(2024, 4, 4, 4, 4, 4)
    };

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
        input = new List<IterTestUtils.Person>{ john, jake, sam, lucy, victor, richard, chris, jhene };
    }

    /**
     * @see Predicate.orElse
     * @see Predicate.andAlso
     * @see Predicate.negate
     * @see Predicate.always
     */
    @IsTest
    static void defaultMethods() {
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
        Predicate adultPredicate = Predicate.isGreaterOrEqual(getAgeFunction, valueFunction);
        Predicate startsWithJPredicate = StringPredicate.startsWith(j);
        Predicate nameStartsWithJPredicate = Predicate.compose(getNameFunction, startsWithJPredicate);
        IPredicate adultActivePredicate = adultPredicate.andAlso(activePredicate);
        IPredicate adultOrActivePredicate = adultPredicate.orElse(activePredicate);
        IPredicate notAdultPredicate = adultPredicate.negate();
        IPredicate adultActiveOrWithNameStartsWithJPredicate = adultPredicate.andAlso(activePredicate).orElse(nameStartsWithJPredicate); // (1 AND 2) OR 3
        IPredicate adultActiveWithNameStartsWithJPredicate = adultPredicate.andAlso(activePredicate.orElse(nameStartsWithJPredicate)); // 1 AND (2 OR 3)
        // Then
        for (IterTestUtils.Person person : input) {
            Validate.assertEquals(value1, alwaysPredicate.test(person));
            Validate.assertEquals(person.getAge() >= value, adultPredicate.test(person));
            Validate.assertEquals(person.isActive(), activePredicate.test(person));
            Validate.assertEquals(person.getAge() >= value && person.isActive(), adultActivePredicate.test(person));
            Validate.assertEquals(person.getAge() >= value && person.isActive(), adultPredicate.andAlso(activePredicate).test(person));
            Validate.assertEquals(person.getAge() >= value || person.isActive(), adultOrActivePredicate.test(person));
            Validate.assertEquals(!(person.getAge() >= value), notAdultPredicate.test(person));
            Validate.assertEquals(person.getAge() >= value && person.isActive() || person.getName().startsWith(j), adultActiveOrWithNameStartsWithJPredicate.test(person));
            Validate.assertEquals(person.getAge() >= value && (person.isActive() || person.getName().startsWith(j)), adultActiveWithNameStartsWithJPredicate.test(person));
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
        Predicate adultPredicate = Predicate.isGreaterOrEqual(getAgeFunction, valueFunction);
        // Then
        for (IterTestUtils.Person person : input) {
            Validate.assertEquals(person.getAge() >= value || person.isActive(), Predicate.some(new List<IPredicate>{ adultPredicate, activePredicate }).test(person));
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
        Predicate adultPredicate = Predicate.isGreaterOrEqual(getAgeFunction, valueFunction);
        // Then
        for (IterTestUtils.Person person : input) {
            Validate.assertEquals(person.getAge() >= value && person.isActive(), Predicate.every(new List<IPredicate>{ adultPredicate, activePredicate }).test(person));
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
        Predicate adultPredicate = Predicate.isGreaterOrEqual(getAgeFunction, valueFunction);
        // Then
        for (IterTestUtils.Person person : input) {
            Validate.assertEquals(!(person.getAge() >= value), Predicate.negate(adultPredicate).test(person));
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
        Predicate agePredicate = Predicate.compose(getAgeFunction, Predicate.isGreater(value));
        Predicate ageAsIntPredicate = Predicate.compose(getAgeAsIntFunction, IntPredicate.isGreater(value));
        Predicate numberPredicate = Predicate.compose(getIdAsLongFunction, LongPredicate.isGreater(value1));
        Predicate probPredicate = Predicate.compose(getProbAsDoubleFunction, DoublePredicate.isGreater(value2));
        Predicate isActivePredicate = Predicate.compose(getAsUserFunction, SObjectPredicate.isEqual(userIsActiveField, value3));
        // Then
        for (IterTestUtils.Person person : input) {
            Validate.assertEquals(person.getAge() > value, agePredicate.test(person));
            Validate.assertEquals(person.getAge() > value, ageAsIntPredicate.test(person));
            Validate.assertEquals(person.getAutoId() > value1, numberPredicate.test(person));
            Validate.assertEquals(person.getProbability() > value2, probPredicate.test(person));
            Validate.assertEquals(person.isActive(), isActivePredicate.test(person));
        }
    }

    /**
     * @see Predicate.isGreater
     * @see Predicate.isGreaterOrEqual
     * @see Predicate.isEqual
     * @see Predicate.isLess
     * @see Predicate.isLessOrEqual
     * @see Predicate.isIn
     * @see Predicate.isNotEqual
     * @see Predicate.isNotIn
     * @see Predicate.isNull
     * @see Predicate.isNotNull
     */
    @IsTest
    static void comparisonPredicates() {
        // Given
        Integer value = 1;
        Integer value1 = 4;
        List<Object> subList = new List<Object>{ 5, null, 10 };
        // When
        IPredicate isNullPredicate = Predicate.isNull();
        IPredicate isNotNullPredicate = Predicate.isNotNull();
        IPredicate greaterThan1Predicate = Predicate.isGreater(value);
        IPredicate greaterOrEqual1Predicate = Predicate.isGreaterOrEqual(value);
        IPredicate lessThan1Predicate = Predicate.isLess(value);
        IPredicate lessOrEqual1Predicate = Predicate.isLessOrEqual(value);
        IPredicate lessOrEqual1Predicate1 = Predicate.isLessOrEqual(Function.identity(), Function.constant(value));
        IPredicate equal4Predicate = Predicate.isEqual(value1);
        IPredicate notEqual4Predicate = Predicate.isNotEqual(value1);
        IPredicate notEqual4Predicate1 = Predicate.isNotEqual(Function.identity(), Function.constant(value1));
        IPredicate inInput1Predicate = Predicate.isIn(subList);
        IPredicate notInInput1Predicate = Predicate.isNotIn(subList);
        IPredicate notInInput1Predicate1 = Predicate.isNotIn(Function.identity(), subList);
        // Then
        for (Object i : intInput) {
            Validate.assertEquals(i == null, isNullPredicate.test(i));
            Validate.assertEquals(i != null, isNotNullPredicate.test(i));
            Validate.assertEquals(((Integer) i) > value, greaterThan1Predicate.test(i));
            Validate.assertEquals(((Integer) i) >= value, greaterOrEqual1Predicate.test(i));
            Validate.assertEquals(i == null ? true : ((Integer) i) < value, lessThan1Predicate.test(i));
            Validate.assertEquals(i == null ? true : ((Integer) i) <= value, lessOrEqual1Predicate.test(i));
            Validate.assertEquals(i == null ? true : ((Integer) i) <= value, lessOrEqual1Predicate1.test(i));
            Validate.assertEquals(((Integer) i) == value1, equal4Predicate.test(i));
            Validate.assertEquals(((Integer) i) != value1, notEqual4Predicate.test(i));
            Validate.assertEquals(((Integer) i) != value1, notEqual4Predicate1.test(i));
            Validate.assertEquals(subList.contains(i), inInput1Predicate.test(i));
            Validate.assertEquals(!subList.contains(i), notInInput1Predicate.test(i));
            Validate.assertEquals(!subList.contains(i), notInInput1Predicate1.test(i));
        }
    }

    /**
     * @see StringPredicate.contains
     * @see StringPredicate.containsAny
     * @see StringPredicate.containsIgnoreCase
     * @see StringPredicate.containsNone
     * @see StringPredicate.containsOnly
     * @see StringPredicate.containsWhitespace
     * @see StringPredicate.endsWith
     * @see StringPredicate.endsWithIgnoreCase
     * @see StringPredicate.equalsIgnoreCase
     * @see StringPredicate.isAllLowerCase
     * @see StringPredicate.isAllUpperCase
     * @see StringPredicate.isAlpha
     * @see StringPredicate.isAlphaNumeric
     * @see StringPredicate.isAlphaNumericSpace
     * @see StringPredicate.isAsciiPrintable
     * @see StringPredicate.isBlank
     * @see StringPredicate.isEmpty
     * @see StringPredicate.isLike
     * @see StringPredicate.isNotBlank
     * @see StringPredicate.isNotEmpty
     * @see StringPredicate.isNumeric
     * @see StringPredicate.isNumericSpace
     * @see StringPredicate.isWhitespace
     * @see StringPredicate.startsWith
     * @see StringPredicate.startsWithIgnoreCase
     */
    @IsTest
    static void stringPredicates() {
        // Given
        String s1 = 'abcd';
        String s2 = 'hx';
        String s3 = 'HE';
        String s4 = 'fg';
        String s5 = 'abba';
        String s6 = 'Jason';
        String s7 = 'jason';
        String s8 = 'hello jason';
        String s9 = '%o J%';
        String s10 = 'Hello';
        String s11 = 'hello';
        // When
        IPredicate contains = StringPredicate.contains(s1);
        IPredicate containsAny = StringPredicate.containsAny(s2);
        IPredicate containsIgnoreCase = StringPredicate.containsIgnoreCase(s3);
        IPredicate containsNone = StringPredicate.containsNone(s4);
        IPredicate containsOnly = StringPredicate.containsOnly(s5);
        IPredicate containsWhitespace = StringPredicate.containsWhitespace();
        IPredicate endsWith = StringPredicate.endsWith(s6);
        IPredicate endsWithIgnoreCase = StringPredicate.endsWithIgnoreCase(s7);
        IPredicate equalsIgnoreCase = StringPredicate.equalsIgnoreCase(s8);
        IPredicate isAllLowerCase = StringPredicate.isAllLowerCase();
        IPredicate isAllUpperCase = StringPredicate.isAllUpperCase();
        IPredicate isAlpha = StringPredicate.isAlpha();
        IPredicate isAlphaSpace = StringPredicate.isAlphaSpace();
        IPredicate isAlphaNumeric = StringPredicate.isAlphaNumeric();
        IPredicate isAlphaNumericSpace = StringPredicate.isAlphaNumericSpace();
        IPredicate isAsciiPrintable = StringPredicate.isAsciiPrintable();
        IPredicate isBlank = StringPredicate.isBlank();
        IPredicate isEmpty = StringPredicate.isEmpty();
        IPredicate isNotBlank = StringPredicate.isNotBlank();
        IPredicate isNotEmpty = StringPredicate.isNotEmpty();
        IPredicate isLike = StringPredicate.isLike(s9);
        IPredicate isNumeric = StringPredicate.isNumeric();
        IPredicate isNumericSpace = StringPredicate.isNumericSpace();
        IPredicate isWhitespace = StringPredicate.isWhitespace();
        IPredicate startsWith = StringPredicate.startsWith(s10);
        IPredicate startsWithIgnoreCase = StringPredicate.startsWithIgnoreCase(s11);
        // Then
        for (String s : stringInput) {
            Validate.assertEquals(s.contains(s1), contains.test(s));
            Validate.assertEquals(s.containsAny(s2), containsAny.test(s));
            Validate.assertEquals(s.containsIgnoreCase(s3), containsIgnoreCase.test(s));
            Validate.assertEquals(s.containsNone(s4), containsNone.test(s));
            Validate.assertEquals(s.containsOnly(s5), containsOnly.test(s));
            Validate.assertEquals(s.containsWhitespace(), containsWhitespace.test(s));
            Validate.assertEquals(s.endsWith(s6), endsWith.test(s));
            Validate.assertEquals(s.endsWithIgnoreCase(s7), endsWithIgnoreCase.test(s));
            Validate.assertEquals(s.equalsIgnoreCase(s8), equalsIgnoreCase.test(s));
            Validate.assertEquals(s.isAllLowerCase(), isAllLowerCase.test(s));
            Validate.assertEquals(s.isAllUpperCase(), isAllUpperCase.test(s));
            Validate.assertEquals(s.isAlpha(), isAlpha.test(s));
            Validate.assertEquals(s.isAlphaSpace(), isAlphaSpace.test(s));
            Validate.assertEquals(s.isAlphanumeric(), isAlphaNumeric.test(s));
            Validate.assertEquals(s.isAlphanumericSpace(), isAlphaNumericSpace.test(s));
            Validate.assertEquals(s.isAsciiPrintable(), isAsciiPrintable.test(s));
            Validate.assertEquals(String.isBlank(s), isBlank.test(s));
            Validate.assertEquals(String.isEmpty(s), isEmpty.test(s));
            Validate.assertEquals(String.isNotBlank(s), isNotBlank.test(s));
            Validate.assertEquals(String.isNotEmpty(s), isNotEmpty.test(s));
            Validate.assertEquals(Pattern.matches(
                    '(?i)^' + s9.replaceAll('([^\\w%_ ])', '\\\\$1')
                            .replace('%', '.*?').replace('_', '.{1}?') + '$', s
            ), isLike.test(s));
            Validate.assertEquals(s.isNumeric(), isNumeric.test(s));
            Validate.assertEquals(s.isNumericSpace(), isNumericSpace.test(s));
            Validate.assertEquals(s.isWhitespace(), isWhitespace.test(s));
            Validate.assertEquals(s.startsWith(s10), startsWith.test(s));
            Validate.assertEquals(s.startsWithIgnoreCase(s11), startsWithIgnoreCase.test(s));
        }
    }

    /**
     * @see DatePredicate.isSameDay
     * @see DatePredicate.isLeapYear
     */
    @IsTest
    static void datePredicates() {
        // Given
        Date d1 = Date.newInstance(2020, 1, 1);
        // When
        IPredicate isSameDay = DatePredicate.isSameDay(d1);
        IPredicate isLeapYear = DatePredicate.isLeapYear();
        // Then
        for (Date d : dateInput) {
            Validate.assertEquals(d.isSameDay(d1), isSameDay.test(d));
            Validate.assertEquals(Date.isLeapYear(d.year()), isLeapYear.test(d));
        }
    }

    /**
     * @see DatetimePredicate.isSameDay
     */
    @IsTest
    static void datetimePredicates() {
        // Given
        Datetime dt1 = Datetime.newInstance(2020, 1, 1, 2, 2, 2);
        // When
        IPredicate isSameDay = DatetimePredicate.isSameDay(dt1);
        // Then
        for (Datetime dt : datetimeInput) {
            Validate.assertEquals(dt.isSameDay(dt1), isSameDay.test(dt));
        }
    }

    /**
     * @see Predicate.isInstanceOfBool
     * @see Predicate.isInstanceOfId
     * @see Predicate.isInstanceOfString
     * @see Predicate.isInstanceOfBlob
     * @see Predicate.isInstanceOfDate
     * @see Predicate.isInstanceOfDatetime
     * @see Predicate.isInstanceOfTime
     * @see Predicate.isInstanceOfInt
     * @see Predicate.isInstanceOfLong
     * @see Predicate.isInstanceOfDouble
     * @see Predicate.isInstanceOfSObject
     * @see Predicate.isInstanceOfComparable
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
        List<Object> inp = new List<Object>{ null, b, accId, str, bl, d, dt, t, i, l1, l2, db, acc, con, john };
        // When
        IPredicate isInstanceOfBoolean = Predicate.isInstanceOfBool();
        IPredicate isInstanceOfId = Predicate.isInstanceOfId();
        IPredicate isInstanceOfString = Predicate.isInstanceOfString();
        IPredicate isInstanceOfBlob = Predicate.isInstanceOfBlob();
        IPredicate isInstanceOfDate = Predicate.isInstanceOfDate();
        IPredicate isInstanceOfDatetime = Predicate.isInstanceOfDatetime();
        IPredicate isInstanceOfTime = Predicate.isInstanceOfTime();
        IPredicate isInstanceOfInt = Predicate.isInstanceOfInt();
        IPredicate isInstanceOfLong = Predicate.isInstanceOfLong();
        IPredicate isInstanceOfDouble = Predicate.isInstanceOfDouble();
        IPredicate isInstanceOfSObject = Predicate.isInstanceOfSObject();
        IPredicate isInstanceOfComparable = Predicate.isInstanceOfComparable();
        // Then
        for (Object o : inp) {
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
