/**
 * @see SObjectIterablePredicateProvider
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
private class SObjectIterablePredicateProviderTest {
    private static final List<Account> INPUT = AfTestData.generateAccounts();
    private static final SObjectIterablePredicateProvider PRED = new SObjectIterablePredicateProvider();

    /**
     * @see SObjectIterablePredicateProvider.SObjectIterableOperator.inx
     */
    @IsTest
    static void isIn() {
        // Given
        SObjectField accTypeField = AfTestConsts.Account.Type;
        String typeNameFieldName = 'Type';
        List<Object> types = new List<String>{ 'Customer', 'Competitor' };
        // When
        IFunction getTypeFunction = new SObjectFunctionProvider().get(accTypeField);
        IPredicate typeInPredicate = PRED.is(getTypeFunction).inx(types);
        IPredicate typeInPredicate1 = PRED.is(typeNameFieldName).inx(types);
        IPredicate typeInPredicate2 = PRED.is(accTypeField).inx(types);
        // Then
        for (Account acc : INPUT) {
            String type = ((String) acc.get(accTypeField));
            String type1 = ((String) acc.get(typeNameFieldName));
            Assert.areEqual(types.contains(type), typeInPredicate.test(acc));
            Assert.areEqual(types.contains(type1), typeInPredicate1.test(acc));
            Assert.areEqual(types.contains(type), typeInPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectIterablePredicateProvider.SObjectIterableOperator.nin
     */
    @IsTest
    static void isNotIn() {
        // Given
        SObjectField accTypeField = AfTestConsts.Account.Type;
        String typeNameFieldName = 'Type';
        List<Object> types = new List<String>{ 'Customer', 'Competitor' };
        // When
        IFunction getTypeFunction = new SObjectFunctionProvider().get(accTypeField);
        IPredicate typeNotInPredicate = PRED.is(getTypeFunction).nin(types);
        IPredicate typeNotInPredicate1 = PRED.is(typeNameFieldName).nin(types);
        IPredicate typeNotInPredicate2 = PRED.is(accTypeField).nin(types);
        // Then
        for (Account acc : INPUT) {
            String type = ((String) acc.get(accTypeField));
            String type1 = ((String) acc.get(typeNameFieldName));
            Assert.areEqual(!types.contains(type), typeNotInPredicate.test(acc));
            Assert.areEqual(!types.contains(type1), typeNotInPredicate1.test(acc));
            Assert.areEqual(!types.contains(type), typeNotInPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectIterablePredicateProvider.SObjectIterableOperator.inc
     */
    @IsTest
    static void includes() {
        // Given
        Account acc1 = new Account(Name = 'foo');
        Account acc2 = new Account(Name = 'bar');
        Account acc3 = new Account(Name = 'baz');
        Account acc4 = new Account(Name = 'thud');
        Account acc5 = new Account(Name = 'foo;bar');
        Account acc6 = new Account(Name = 'foo;baz');
        Account acc7 = new Account(Name = 'baz;bar');
        Account acc8 = new Account(Name = 'for;bar;baz');
        Account acc9 = new Account(Name = 'thud;baz');
        Account acc10 = new Account(Name = '');
        Account acc11 = new Account();
        List<Account> input = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6, acc7, acc8, acc9, acc10, acc11 };
        List<String> expectedValues = new List<String>{ 'foo;bar', 'baz' };
        List<String> expectedValues1 = new List<String>{ '' };
        SObjectField accNameField = AfTestConsts.Account.Name;
        String nameFieldName = 'Name';
        // When
        IFunction getNameFunction = new SObjectFunctionProvider().get(accNameField);
        IPredicate includesPredicate = PRED.is(getNameFunction).inc(expectedValues);
        IPredicate includesPredicate1 = PRED.is(nameFieldName).inc(expectedValues);
        IPredicate includesPredicate2 = PRED.is(accNameField).inc(expectedValues);
        IPredicate includesEmptyPredicate = PRED.is(getNameFunction).inc(expectedValues1);
        // Then
        for (Account acc : input) {
            String name = (String) acc.get(nameFieldName);
            Boolean expected = false;
            if (name != null) {
                Set<String> actualValues = new Set<String>(name.split(';'));
                for (String value : expectedValues) {
                    if (String.isBlank(name)) { break; }
                    if (actualValues.containsAll(new Set<String>(value.split(';')))) {
                        expected = true;
                        break;
                    }
                }
            }
            Boolean expected1 = name == '';
            Assert.areEqual(expected, includesPredicate.test(acc));
            Assert.areEqual(expected, includesPredicate1.test(acc));
            Assert.areEqual(expected, includesPredicate2.test(acc));
            Assert.areEqual(expected1, includesEmptyPredicate.test(acc));
        }
    }

    /**
     * @see SObjectIterablePredicateProvider.SObjectIterableOperator.exc
     */
    @IsTest
    static void excludes() {
        // Given
        Account acc1 = new Account(Name = 'foo');
        Account acc2 = new Account(Name = 'bar');
        Account acc3 = new Account(Name = 'baz');
        Account acc4 = new Account(Name = 'thud');
        Account acc5 = new Account(Name = 'foo;bar');
        Account acc6 = new Account(Name = 'foo;baz');
        Account acc7 = new Account(Name = 'baz;bar');
        Account acc8 = new Account(Name = 'for;bar;baz');
        Account acc9 = new Account(Name = 'thud;baz');
        Account acc10 = new Account(Name = '');
        Account acc11 = new Account();
        List<Account> input = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6, acc7, acc8, acc9, acc10, acc11 };
        List<String> expectedValues = new List<String>{ 'foo;bar', 'baz' };
        List<String> expectedValues1 = new List<String>{ '' };
        SObjectField accNameField = AfTestConsts.Account.Name;
        String nameFieldName = 'Name';
        // When
        IFunction getNameFunction = new SObjectFunctionProvider().get(accNameField);
        IPredicate excludesPredicate = PRED.is(getNameFunction).exc(expectedValues);
        IPredicate excludesPredicate1 = PRED.is(nameFieldName).exc(expectedValues);
        IPredicate excludesPredicate2 = PRED.is(accNameField).exc(expectedValues);
        IPredicate excludesEmptyPredicate = PRED.is(getNameFunction).exc(expectedValues1);
        // Then
        for (Account acc : input) {
            String name = (String) acc.get(nameFieldName);
            Boolean expected = true;
            if (name != null) {
                Set<String> actualValues = new Set<String>(name.split(';'));
                for (String value : expectedValues) {
                    if (String.isBlank(name)) { break; }
                    if (actualValues.containsAll(new Set<String>(value.split(';')))) {
                        expected = false;
                        break;
                    }
                }
            }
            Boolean expected1 = name != '';
            Assert.areEqual(expected, excludesPredicate.test(acc));
            Assert.areEqual(expected, excludesPredicate1.test(acc));
            Assert.areEqual(expected, excludesPredicate2.test(acc));
            Assert.areEqual(expected1, excludesEmptyPredicate.test(acc));
        }
    }

    /**
     * @see SObjectIterablePredicateProvider.SObjectIterableOperator.inx
     */
    @IsTest
    static void subset() {
        // Given
        List<Account> inputWithNull = new List<Account>(INPUT);
        inputWithNull.add(null);
        List<Account> subset = new List<Account>{ INPUT[0], INPUT[3], INPUT[7] };
        // When
        IPredicate accInPredicate = PRED.is().inx(subset);
        IPredicate accNotInPredicate = PRED.is().nin(subset);
        // When
        for (Account acc : INPUT) {
            Assert.areEqual(subset.contains(acc), accInPredicate.test(acc));
            Assert.areEqual(!subset.contains(acc), accNotInPredicate.test(acc));
        }
    }
}
