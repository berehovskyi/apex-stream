/**
 * @see SObjectPredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings(
    'PMD.ApexAssertionsShouldIncludeMessage, PMD.ApexUnitTestClassShouldHaveRunAs, PMD.CognitiveComplexity, PMD.CyclomaticComplexity'
)
private class SObjectPredicatesTest {

    private static final List<Account> INPUT = AfTestData.generateAccounts();

    static {
        new SObjectPredicates();
    }

    /**
     * @see SObjectPredicates.isCompared
     */
    @IsTest
    static void isCompared() {
        // Given
        Integer value = 100;
        SObjectField accNumberOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        IComparer comp = Comparer.defaultOrder();
        IComparer comp1 = Comparer.defaultOrder().nullsLast();
        Integer result = 1;
        // When
        IPredicate bigAccPredicate = SObjectPredicates.isCompared(SObjectFunctions.get(numberOfEmployeesFieldName), Function.constant(value), comp, result);
        IPredicate bigAccPredicate1 = SObjectPredicates.isCompared(SObjectFunctions.get(accNumberOfEmployeesField), Function.constant(value), comp1, result);
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = (Integer) acc.get(numberOfEmployeesFieldName);
            Assert.areEqual((numOfEmployees == null ? false : numOfEmployees > value), bigAccPredicate.test(acc));
            Assert.areEqual((numOfEmployees == null ? true : numOfEmployees > value), bigAccPredicate1.test(acc));
        }
    }

    /**
     * @see SObjectPredicates.isGreater
     */
    @IsTest
    static void isGreater() {
        // Given
        Integer value = 100;
        SObjectField accNameField = AfTestConsts.Account.Name;
        SObjectField accNumberOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        SObjectField accTypeField = AfTestConsts.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        // When
        IPredicate bigAccPredicate = SObjectPredicates.isGreater(SObjectFunctions.get(numberOfEmployeesFieldName), Function.constant(value));
        IPredicate bigAccPredicate1 = SObjectPredicates.isGreater(numberOfEmployeesFieldName, Function.constant(value));
        IPredicate bigAccPredicate2 = SObjectPredicates.isGreater(accNumberOfEmployeesField, Function.constant(value));
        IPredicate bigAccPredicate3 = SObjectPredicates.isGreater(numberOfEmployeesFieldName, value);
        IPredicate bigAccPredicate4 = SObjectPredicates.isGreater(accNumberOfEmployeesField, value);
        IPredicate nameGTTypePredicate = SObjectPredicates.isGreater(nameFieldName, SObjectFunctions.get(typeFieldName));
        IPredicate nameGTTypePredicate1 = SObjectPredicates.isGreater(accNameField, SObjectFunctions.get(accTypeField));
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = ((Integer) acc.get(numberOfEmployeesFieldName));
            String name = ((String) acc.get(nameFieldName));
            String type = ((String) acc.get(typeFieldName));
            Assert.areEqual(numOfEmployees > value, bigAccPredicate.test(acc));
            Assert.areEqual(numOfEmployees > value, bigAccPredicate1.test(acc));
            Assert.areEqual(numOfEmployees > value, bigAccPredicate2.test(acc));
            Assert.areEqual(numOfEmployees > value, bigAccPredicate3.test(acc));
            Assert.areEqual(numOfEmployees > value, bigAccPredicate4.test(acc));
            Assert.areEqual(name > type, nameGTTypePredicate.test(acc));
            Assert.areEqual(name > type, nameGTTypePredicate1.test(acc));
        }
    }

    /**
     * @see SObjectPredicates.isGreaterOrEqual
     */
    @IsTest
    static void isGreaterOrEqual() {
        // Given
        Integer value = 100;
        SObjectField accNameField = AfTestConsts.Account.Name;
        SObjectField accNumberOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        SObjectField accTypeField = AfTestConsts.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        // When
        IPredicate bigAccPredicate = SObjectPredicates.isGreaterOrEqual(SObjectFunctions.get(numberOfEmployeesFieldName), Function.constant(value));
        IPredicate bigAccPredicate1 = SObjectPredicates.isGreaterOrEqual(numberOfEmployeesFieldName, Function.constant(value));
        IPredicate bigAccPredicate2 = SObjectPredicates.isGreaterOrEqual(accNumberOfEmployeesField, Function.constant(value));
        IPredicate bigAccPredicate3 = SObjectPredicates.isGreaterOrEqual(numberOfEmployeesFieldName, value);
        IPredicate bigAccPredicate4 = SObjectPredicates.isGreaterOrEqual(accNumberOfEmployeesField, value);
        IPredicate nameGTTypePredicate = SObjectPredicates.isGreaterOrEqual(nameFieldName, SObjectFunctions.get(typeFieldName));
        IPredicate nameGTTypePredicate1 = SObjectPredicates.isGreaterOrEqual(accNameField, SObjectFunctions.get(accTypeField));
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = ((Integer) acc.get(numberOfEmployeesFieldName));
            String name = ((String) acc.get(nameFieldName));
            String type = ((String) acc.get(typeFieldName));
            Assert.areEqual(numOfEmployees >= value, bigAccPredicate.test(acc));
            Assert.areEqual(numOfEmployees >= value, bigAccPredicate1.test(acc));
            Assert.areEqual(numOfEmployees >= value, bigAccPredicate2.test(acc));
            Assert.areEqual(numOfEmployees >= value, bigAccPredicate3.test(acc));
            Assert.areEqual(numOfEmployees >= value, bigAccPredicate4.test(acc));
            Assert.areEqual(name >= type, nameGTTypePredicate.test(acc));
            Assert.areEqual(name >= type, nameGTTypePredicate1.test(acc));
        }
    }

    /**
     * @see SObjectPredicates.isEqual
     */
    @IsTest
    static void isEqual() {
        // Given
        Integer value = 100;
        SObjectField accNameField = AfTestConsts.Account.Name;
        SObjectField accNumberOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        SObjectField accTypeField = AfTestConsts.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        String parentFieldName = 'Parent';
        // When
        IPredicate bigAccPredicate = SObjectPredicates.isEqual(SObjectFunctions.get(numberOfEmployeesFieldName), Function.constant(value));
        IPredicate bigAccPredicate1 = SObjectPredicates.isEqual(numberOfEmployeesFieldName, Function.constant(value));
        IPredicate bigAccPredicate2 = SObjectPredicates.isEqual(accNumberOfEmployeesField, Function.constant(value));
        IPredicate bigAccPredicate3 = SObjectPredicates.isEqual(numberOfEmployeesFieldName, value);
        IPredicate bigAccPredicate4 = SObjectPredicates.isEqual(accNumberOfEmployeesField, value);
        IPredicate nameGTTypePredicate = SObjectPredicates.isEqual(nameFieldName, SObjectFunctions.get(typeFieldName));
        IPredicate nameGTTypePredicate1 = SObjectPredicates.isEqual(accNameField, SObjectFunctions.get(accTypeField));
        IPredicate hasNoParentPredicate = SObjectPredicates.isEqual(SObjectOperators.getSObject(parentFieldName), Operator.constant(null));
        IPredicate parentIsIdentityPredicate = SObjectPredicates.isEqual(Function.identity(), SObjectOperators.getSObject(parentFieldName));
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = ((Integer) acc.get(numberOfEmployeesFieldName));
            String name = ((String) acc.get(nameFieldName));
            String type = ((String) acc.get(typeFieldName));
            Account parent = (Account) acc.getSObject(parentFieldName);
            Assert.areEqual(numOfEmployees == value, bigAccPredicate.test(acc));
            Assert.areEqual(numOfEmployees == value, bigAccPredicate1.test(acc));
            Assert.areEqual(numOfEmployees == value, bigAccPredicate2.test(acc));
            Assert.areEqual(numOfEmployees == value, bigAccPredicate3.test(acc));
            Assert.areEqual(numOfEmployees == value, bigAccPredicate4.test(acc));
            Assert.areEqual(name == type, nameGTTypePredicate.test(acc));
            Assert.areEqual(name == type, nameGTTypePredicate1.test(acc));
            Assert.areEqual(parent == null, hasNoParentPredicate.test(acc));
            Assert.areEqual(parent == acc, parentIsIdentityPredicate.test(acc));
        }
    }

    /**
     * @see SObjectPredicates.isNotEqual
     */
    @IsTest
    static void isNotEqual() {
        // Given
        Integer value = 100;
        SObjectField accNameField = AfTestConsts.Account.Name;
        SObjectField accNumberOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        SObjectField accTypeField = AfTestConsts.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        String parentFieldName = 'Parent';
        // When
        IPredicate bigAccPredicate = SObjectPredicates.isNotEqual(SObjectFunctions.get(numberOfEmployeesFieldName), Function.constant(value));
        IPredicate bigAccPredicate1 = SObjectPredicates.isNotEqual(numberOfEmployeesFieldName, Function.constant(value));
        IPredicate bigAccPredicate2 = SObjectPredicates.isNotEqual(accNumberOfEmployeesField, Function.constant(value));
        IPredicate bigAccPredicate3 = SObjectPredicates.isNotEqual(numberOfEmployeesFieldName, value);
        IPredicate bigAccPredicate4 = SObjectPredicates.isNotEqual(accNumberOfEmployeesField, value);
        IPredicate nameGTTypePredicate = SObjectPredicates.isNotEqual(nameFieldName, SObjectFunctions.get(typeFieldName));
        IPredicate nameGTTypePredicate1 = SObjectPredicates.isNotEqual(accNameField, SObjectFunctions.get(accTypeField));
        IPredicate hasParentPredicate = SObjectPredicates.isNotEqual(SObjectOperators.getSObject(parentFieldName), Operator.constant(null));
        IPredicate parentIsNotIdentityPredicate = SObjectPredicates.isNotEqual(Function.identity(), SObjectOperators.getSObject(parentFieldName));
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = ((Integer) acc.get(numberOfEmployeesFieldName));
            String name = ((String) acc.get(nameFieldName));
            String type = ((String) acc.get(typeFieldName));
            Account parent = (Account) acc.getSObject(parentFieldName);
            Assert.areEqual(numOfEmployees != value, bigAccPredicate.test(acc));
            Assert.areEqual(numOfEmployees != value, bigAccPredicate1.test(acc));
            Assert.areEqual(numOfEmployees != value, bigAccPredicate2.test(acc));
            Assert.areEqual(numOfEmployees != value, bigAccPredicate3.test(acc));
            Assert.areEqual(numOfEmployees != value, bigAccPredicate4.test(acc));
            Assert.areEqual(name != type, nameGTTypePredicate.test(acc));
            Assert.areEqual(name != type, nameGTTypePredicate1.test(acc));
            Assert.areEqual(parent != null, hasParentPredicate.test(acc));
            Assert.areEqual(parent != acc, parentIsNotIdentityPredicate.test(acc));
        }
    }

    /**
     * @see SObjectPredicates.isLess
     */
    @IsTest
    static void isLess() {
        // Given
        Integer value = 100;
        SObjectField accNameField = AfTestConsts.Account.Name;
        SObjectField accNumberOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        SObjectField accTypeField = AfTestConsts.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        // When
        IPredicate bigAccPredicate = SObjectPredicates.isLess(SObjectFunctions.get(numberOfEmployeesFieldName), Function.constant(value));
        IPredicate bigAccPredicate1 = SObjectPredicates.isLess(numberOfEmployeesFieldName, Function.constant(value));
        IPredicate bigAccPredicate2 = SObjectPredicates.isLess(accNumberOfEmployeesField, Function.constant(value));
        IPredicate bigAccPredicate3 = SObjectPredicates.isLess(numberOfEmployeesFieldName, value);
        IPredicate bigAccPredicate4 = SObjectPredicates.isLess(accNumberOfEmployeesField, value);
        IPredicate nameGTTypePredicate = SObjectPredicates.isLess(nameFieldName, SObjectFunctions.get(typeFieldName));
        IPredicate nameGTTypePredicate1 = SObjectPredicates.isLess(accNameField, SObjectFunctions.get(accTypeField));
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = ((Integer) acc.get(numberOfEmployeesFieldName));
            String name = ((String) acc.get(nameFieldName));
            String type = ((String) acc.get(typeFieldName));
            Assert.areEqual(numOfEmployees == null ? true : numOfEmployees < value, bigAccPredicate.test(acc));
            Assert.areEqual(numOfEmployees == null ? true : numOfEmployees < value, bigAccPredicate1.test(acc));
            Assert.areEqual(numOfEmployees == null ? true : numOfEmployees < value, bigAccPredicate2.test(acc));
            Assert.areEqual(numOfEmployees == null ? true : numOfEmployees < value, bigAccPredicate3.test(acc));
            Assert.areEqual(numOfEmployees == null ? true : numOfEmployees < value, bigAccPredicate4.test(acc));
            Assert.areEqual(name == null ? true : name < type, nameGTTypePredicate.test(acc));
            Assert.areEqual(name == null ? true : name < type, nameGTTypePredicate1.test(acc));
        }
    }

    /**
     * @see SObjectPredicates.isLessOrEqual
     */
    @IsTest
    static void isLessOrEqual() {
        // Given
        Integer value = 100;
        SObjectField accNameField = AfTestConsts.Account.Name;
        SObjectField accNumberOfEmployeesField = AfTestConsts.Account.NumberOfEmployees;
        SObjectField accTypeField = AfTestConsts.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        // When
        IPredicate bigAccPredicate = SObjectPredicates.isLessOrEqual(SObjectFunctions.get(numberOfEmployeesFieldName), Function.constant(value));
        IPredicate bigAccPredicate1 = SObjectPredicates.isLessOrEqual(numberOfEmployeesFieldName, Function.constant(value));
        IPredicate bigAccPredicate2 = SObjectPredicates.isLessOrEqual(accNumberOfEmployeesField, Function.constant(value));
        IPredicate bigAccPredicate3 = SObjectPredicates.isLessOrEqual(numberOfEmployeesFieldName, value);
        IPredicate bigAccPredicate4 = SObjectPredicates.isLessOrEqual(accNumberOfEmployeesField, value);
        IPredicate nameGTTypePredicate = SObjectPredicates.isLessOrEqual(nameFieldName, SObjectFunctions.get(typeFieldName));
        IPredicate nameGTTypePredicate1 = SObjectPredicates.isLessOrEqual(accNameField, SObjectFunctions.get(accTypeField));
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = ((Integer) acc.get(numberOfEmployeesFieldName));
            String name = ((String) acc.get(nameFieldName));
            String type = ((String) acc.get(typeFieldName));
            Assert.areEqual(numOfEmployees == null ? true : numOfEmployees <= value, bigAccPredicate.test(acc));
            Assert.areEqual(numOfEmployees == null ? true : numOfEmployees <= value, bigAccPredicate1.test(acc));
            Assert.areEqual(numOfEmployees == null ? true : numOfEmployees <= value, bigAccPredicate2.test(acc));
            Assert.areEqual(numOfEmployees == null ? true : numOfEmployees <= value, bigAccPredicate3.test(acc));
            Assert.areEqual(numOfEmployees == null ? true : numOfEmployees <= value, bigAccPredicate4.test(acc));
            Assert.areEqual(name == null ? true : name <= type, nameGTTypePredicate.test(acc));
            Assert.areEqual(name == null ? true : name <= type, nameGTTypePredicate1.test(acc));
        }
    }

    /**
     * @see SObjectPredicates.isLike
     */
    @IsTest
    static void isLike() {
        // Given
        String likeString = 'T%';
        SObjectField accNameField = AfTestConsts.Account.Name;
        String nameFieldName = 'Name';
        // When
        IFunction getNameFunction = SObjectFunctions.get(accNameField);
        IPredicate nameStartsWithTPredicate = SObjectPredicates.isLike(getNameFunction, likeString);
        IPredicate nameStartsWithTPredicate1 = SObjectPredicates.isLike(nameFieldName, likeString);
        IPredicate nameStartsWithTPredicate2 = SObjectPredicates.isLike(accNameField, likeString);
        // Then
        for (Account acc : INPUT) {
            String name = ((String) acc.get(accNameField));
            String name1 = ((String) acc.get(nameFieldName));
            Boolean isLikeName = Pattern.matches(
                '(?i)^' + likeString.replaceAll('([^\\w%_ ])', '\\\\$1')
                    .replace('%', '.*?').replace('_', '.{1}?') + '$', name
            );
            Boolean isLikeName1 = Pattern.matches(
                '(?i)^' + likeString.replaceAll('([^\\w%_ ])', '\\\\$1')
                    .replace('%', '.*?').replace('_', '.{1}?') + '$', name1
            );
            Assert.areEqual(isLikeName, nameStartsWithTPredicate.test(acc));
            Assert.areEqual(isLikeName1, nameStartsWithTPredicate1.test(acc));
            Assert.areEqual(isLikeName, nameStartsWithTPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectPredicates.isIn
     */
    @IsTest
    static void isIn() {
        // Given
        SObjectField accTypeField = AfTestConsts.Account.Type;
        String typeNameFieldName = 'Type';
        List<Object> types = new List<String>{ 'Customer', 'Competitor' };
        // When
        IFunction getTypeFunction = SObjectFunctions.get(accTypeField);
        IPredicate typeInPredicate = SObjectPredicates.isIn(getTypeFunction, types);
        IPredicate typeInPredicate1 = SObjectPredicates.isIn(typeNameFieldName, types);
        IPredicate typeInPredicate2 = SObjectPredicates.isIn(accTypeField, types);
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
     * @see SObjectPredicates.isNotIn
     */
    @IsTest
    static void isNotIn() {
        // Given
        SObjectField accTypeField = AfTestConsts.Account.Type;
        String typeNameFieldName = 'Type';
        List<Object> types = new List<String>{ 'Customer', 'Competitor' };
        // When
        IFunction getTypeFunction = SObjectFunctions.get(accTypeField);
        IPredicate typeNotInPredicate = SObjectPredicates.isNotIn(getTypeFunction, types);
        IPredicate typeNotInPredicate1 = SObjectPredicates.isNotIn(typeNameFieldName, types);
        IPredicate typeNotInPredicate2 = SObjectPredicates.isNotIn(accTypeField, types);
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
     * @see SObjectPredicates.isNull
     * @see SObjectPredicates.isNotNull
     * @see SObjectPredicates.isEqual
     * @see SObjectPredicates.isNotEqual
     * @see SObjectPredicates.isIn
     * @see SObjectPredicates.isNotIn
     */
    @IsTest
    static void comparisonPredicates() {
        // Given
        List<Account> inputWithNull = new List<Account>(INPUT);
        inputWithNull.add(null);
        List<Account> subset = new List<Account>{ INPUT[0], INPUT[3], INPUT[7] };
        // When
        IPredicate nullPredicate = SObjectPredicates.isNull();
        IPredicate notNullPredicate = SObjectPredicates.isNotNull();
        IPredicate accEqualPredicate = SObjectPredicates.isEqual(INPUT[2]);
        IPredicate accNotEqualPredicate = SObjectPredicates.isNotEqual(INPUT[2]);
        IPredicate accInPredicate = SObjectPredicates.isIn(subset);
        IPredicate accNotInPredicate = SObjectPredicates.isNotIn(subset);
        // When
        for (Account acc : INPUT) {
            Assert.areEqual(acc == null, nullPredicate.test(acc));
            Assert.areEqual(acc != null, notNullPredicate.test(acc));
            Assert.areEqual(acc == INPUT[2], accEqualPredicate.test(acc));
            Assert.areEqual(acc != INPUT[2], accNotEqualPredicate.test(acc));
            Assert.areEqual(subset.contains(acc), accInPredicate.test(acc));
            Assert.areEqual(!subset.contains(acc), accNotInPredicate.test(acc));
        }
    }

    /**
     * @see SObjectPredicates.includes
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
        IFunction getNameFunction = SObjectFunctions.get(accNameField);
        IPredicate includesPredicate = SObjectPredicates.includes(getNameFunction, expectedValues);
        IPredicate includesPredicate1 = SObjectPredicates.includes(nameFieldName, expectedValues);
        IPredicate includesPredicate2 = SObjectPredicates.includes(accNameField, expectedValues);
        IPredicate includesEmptyPredicate = SObjectPredicates.includes(getNameFunction, expectedValues1);
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
     * @see SObjectPredicates.excludes
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
        IFunction getNameFunction = SObjectFunctions.get(accNameField);
        IPredicate excludesPredicate = SObjectPredicates.excludes(getNameFunction, expectedValues);
        IPredicate excludesPredicate1 = SObjectPredicates.excludes(nameFieldName, expectedValues);
        IPredicate excludesPredicate2 = SObjectPredicates.excludes(accNameField, expectedValues);
        IPredicate excludesEmptyPredicate = SObjectPredicates.excludes(getNameFunction, expectedValues1);
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

}
