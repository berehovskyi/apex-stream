/**
 * @see Function
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class FunctionTest {

    // Given
    private static List<String> stringInput = IterTestUtils.generateStrings();
    private static List<Integer> intInput = IterTestUtils.generateInts();
    private static List<Long> longInput = IterTestUtils.generateLongs();
    private static List<Double> doubleInput = IterTestUtils.generateDoubles();
    private static List<Object> accounts = IterTestUtils.generateAccounts();

    /**
     * @see Function.identity
     * @see Function.compose
     * @see Function.constant
     * @see Function.andThen
     * @see Function.compose
     * @see Function.forPredicate
     */
    @IsTest
    static void default() {
        // Given
        Object constant = 42;
        Integer maxWidth = 5;
        Integer val = 4;
        String val1 = 's';
        Account acc = new Account();
        // When
        IFunction identity = Function.identity();
        IFunction get42 = Function.constant(constant);
        IFunction startsWithS = Function.compose(new IterTestUtils.StartsWith('s'));
        IFunction isGreaterThan4Int = Function.compose(Predicate.compose(IntPredicates.isGreater(val)));
        IFunction isGreaterThan4Long = Function.compose(Predicate.compose(LongPredicates.isGreater(val)));
        IFunction isGreaterThan4Double = Function.compose(Predicate.compose(DoublePredicates.isGreater(val)));
        IFunction isEmptyAcc = Function.compose(Predicate.compose(SObjectPredicates.isEqual(acc)));
        Function capitalize = new IterTestUtils.Capitalize();
        Function abbreviate5 = new IterTestUtils.Abbreviate(maxWidth);
        IFunction capitalizeAndAbbreviate = capitalize.andThen(abbreviate5);
        IFunction capitalizeAndAbbreviate1 = abbreviate5.compose(capitalize);
        IFunction capitalizeAndAbbreviate2 = Function.compose(new List<IFunction>{ capitalize, abbreviate5 });
        IFunction getName = Function.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Account.Name));
        // Then
        for (String str : stringInput) {
            Validate.assertEquals(str, identity.apply(str));
            Validate.assertEquals(constant, get42.apply(str));
            Validate.assertEquals(str.startsWith(val1), startsWithS.apply(str));
            Validate.assertEquals(str.capitalize().abbreviate(maxWidth), capitalizeAndAbbreviate.apply(str));
            Validate.assertEquals(str.capitalize().abbreviate(maxWidth), capitalizeAndAbbreviate1.apply(str));
            Validate.assertEquals(str.capitalize().abbreviate(maxWidth), capitalizeAndAbbreviate2.apply(str));
        }
        for (Integer i : intInput) {
            Validate.assertEquals(i > 4, isGreaterThan4Int.apply(i));
        }
        for (Long l : longInput) {
            Validate.assertEquals(l > 4, isGreaterThan4Long.apply(l));
        }
        for (Double d : doubleInput) {
            Validate.assertEquals(d > 4, isGreaterThan4Double.apply(d));
        }
        for (Object a : accounts) {
            Validate.assertEquals(((Account) a).get(IterTestUtils.CONSTS.Account.Name), getName.apply(a));
        }
        Validate.assert((Boolean) isEmptyAcc.apply(new Account()));
    }

}
