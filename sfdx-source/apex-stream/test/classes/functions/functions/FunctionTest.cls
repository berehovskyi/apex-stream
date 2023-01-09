/**
 * @see Function
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class FunctionTest {

    // Given
    private static final List<String> STRINGS = IterTestUtils.generateStrings();
    private static final List<Integer> INTS = IterTestUtils.generateInts();
    private static final List<Long> LONGS = IterTestUtils.generateLongs();
    private static final List<Double> DOUBLES = IterTestUtils.generateDoubles();
    private static final List<Object> ACCOUNTS = IterTestUtils.generateAccounts();

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
        for (String str : STRINGS) {
            Assert.areEqual(str, identity.apply(str));
            Assert.areEqual(constant, get42.apply(str));
            Assert.areEqual(str.startsWith(val1), startsWithS.apply(str));
            Assert.areEqual(str.capitalize().abbreviate(maxWidth), capitalizeAndAbbreviate.apply(str));
            Assert.areEqual(str.capitalize().abbreviate(maxWidth), capitalizeAndAbbreviate1.apply(str));
            Assert.areEqual(str.capitalize().abbreviate(maxWidth), capitalizeAndAbbreviate2.apply(str));
        }
        for (Integer i : INTS) {
            Assert.areEqual(i > 4, isGreaterThan4Int.apply(i));
        }
        for (Long l : LONGS) {
            Assert.areEqual(l > 4, isGreaterThan4Long.apply(l));
        }
        for (Double d : DOUBLES) {
            Assert.areEqual(d > 4, isGreaterThan4Double.apply(d));
        }
        for (Object a : ACCOUNTS) {
            Assert.areEqual(((Account) a).get(IterTestUtils.CONSTS.Account.Name), getName.apply(a));
        }
        Assert.isTrue((Boolean) isEmptyAcc.apply(new Account()));
    }

}
