/**
 * @see SObjectPredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectPredicatesTest {

    private static final List<Account> INPUT = IterTestUtils.generateAccounts();

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
        SObjectField accNumberOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        IComparator comp = Comparator.defaultOrder();
        IComparator comp1 = Comparator.defaultOrder().nullsLast();
        Integer result = 1;
        // When
        ISObjectPredicate bigAccPredicate = SObjectPredicates.isCompared(SObjectFunctions.get(numberOfEmployeesFieldName), SObjectFunction.constant(value), comp, result);
        ISObjectPredicate bigAccPredicate1 = SObjectPredicates.isCompared(SObjectFunctions.get(accNumberOfEmployeesField), SObjectFunction.constant(value), comp1, result);
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
        SObjectField accNameField = IterTestUtils.CONSTS.Account.Name;
        SObjectField accNumberOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        // When
        ISObjectPredicate bigAccPredicate = SObjectPredicates.isGreater(SObjectFunctions.get(numberOfEmployeesFieldName), SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate1 = SObjectPredicates.isGreater(numberOfEmployeesFieldName, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate2 = SObjectPredicates.isGreater(accNumberOfEmployeesField, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate3 = SObjectPredicates.isGreater(numberOfEmployeesFieldName, value);
        ISObjectPredicate bigAccPredicate4 = SObjectPredicates.isGreater(accNumberOfEmployeesField, value);
        ISObjectPredicate nameGTTypePredicate = SObjectPredicates.isGreater(nameFieldName, SObjectFunctions.get(typeFieldName));
        ISObjectPredicate nameGTTypePredicate1 = SObjectPredicates.isGreater(accNameField, SObjectFunctions.get(accTypeField));
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
        SObjectField accNameField = IterTestUtils.CONSTS.Account.Name;
        SObjectField accNumberOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        // When
        ISObjectPredicate bigAccPredicate = SObjectPredicates.isGreaterOrEqual(SObjectFunctions.get(numberOfEmployeesFieldName), SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate1 = SObjectPredicates.isGreaterOrEqual(numberOfEmployeesFieldName, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate2 = SObjectPredicates.isGreaterOrEqual(accNumberOfEmployeesField, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate3 = SObjectPredicates.isGreaterOrEqual(numberOfEmployeesFieldName, value);
        ISObjectPredicate bigAccPredicate4 = SObjectPredicates.isGreaterOrEqual(accNumberOfEmployeesField, value);
        ISObjectPredicate nameGTTypePredicate = SObjectPredicates.isGreaterOrEqual(nameFieldName, SObjectFunctions.get(typeFieldName));
        ISObjectPredicate nameGTTypePredicate1 = SObjectPredicates.isGreaterOrEqual(accNameField, SObjectFunctions.get(accTypeField));
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
        SObjectField accNameField = IterTestUtils.CONSTS.Account.Name;
        SObjectField accNumberOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        String parentFieldName = 'Parent';
        // When
        ISObjectPredicate bigAccPredicate = SObjectPredicates.isEqual(SObjectFunctions.get(numberOfEmployeesFieldName), SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate1 = SObjectPredicates.isEqual(numberOfEmployeesFieldName, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate2 = SObjectPredicates.isEqual(accNumberOfEmployeesField, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate3 = SObjectPredicates.isEqual(numberOfEmployeesFieldName, value);
        ISObjectPredicate bigAccPredicate4 = SObjectPredicates.isEqual(accNumberOfEmployeesField, value);
        ISObjectPredicate nameGTTypePredicate = SObjectPredicates.isEqual(nameFieldName, SObjectFunctions.get(typeFieldName));
        ISObjectPredicate nameGTTypePredicate1 = SObjectPredicates.isEqual(accNameField, SObjectFunctions.get(accTypeField));
        ISObjectPredicate hasNoParentPredicate = SObjectPredicates.isEqual(SObjectUnaryOperators.getSObject(parentFieldName), SObjectUnaryOperator.constant(null));
        ISObjectPredicate parentIsIdentityPredicate = SObjectPredicates.isEqual(SObjectUnaryOperators.getSObject(parentFieldName));
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
        SObjectField accNameField = IterTestUtils.CONSTS.Account.Name;
        SObjectField accNumberOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        String parentFieldName = 'Parent';
        // When
        ISObjectPredicate bigAccPredicate = SObjectPredicates.isNotEqual(SObjectFunctions.get(numberOfEmployeesFieldName), SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate1 = SObjectPredicates.isNotEqual(numberOfEmployeesFieldName, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate2 = SObjectPredicates.isNotEqual(accNumberOfEmployeesField, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate3 = SObjectPredicates.isNotEqual(numberOfEmployeesFieldName, value);
        ISObjectPredicate bigAccPredicate4 = SObjectPredicates.isNotEqual(accNumberOfEmployeesField, value);
        ISObjectPredicate nameGTTypePredicate = SObjectPredicates.isNotEqual(nameFieldName, SObjectFunctions.get(typeFieldName));
        ISObjectPredicate nameGTTypePredicate1 = SObjectPredicates.isNotEqual(accNameField, SObjectFunctions.get(accTypeField));
        ISObjectPredicate hasParentPredicate = SObjectPredicates.isNotEqual(SObjectUnaryOperators.getSObject(parentFieldName), SObjectUnaryOperator.constant(null));
        ISObjectPredicate parentIsNotIdentityPredicate = SObjectPredicates.isNotEqual(SObjectUnaryOperators.getSObject(parentFieldName));
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
        SObjectField accNameField = IterTestUtils.CONSTS.Account.Name;
        SObjectField accNumberOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        // When
        ISObjectPredicate bigAccPredicate = SObjectPredicates.isLess(SObjectFunctions.get(numberOfEmployeesFieldName), SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate1 = SObjectPredicates.isLess(numberOfEmployeesFieldName, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate2 = SObjectPredicates.isLess(accNumberOfEmployeesField, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate3 = SObjectPredicates.isLess(numberOfEmployeesFieldName, value);
        ISObjectPredicate bigAccPredicate4 = SObjectPredicates.isLess(accNumberOfEmployeesField, value);
        ISObjectPredicate nameGTTypePredicate = SObjectPredicates.isLess(nameFieldName, SObjectFunctions.get(typeFieldName));
        ISObjectPredicate nameGTTypePredicate1 = SObjectPredicates.isLess(accNameField, SObjectFunctions.get(accTypeField));
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
        SObjectField accNameField = IterTestUtils.CONSTS.Account.Name;
        SObjectField accNumberOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        // When
        ISObjectPredicate bigAccPredicate = SObjectPredicates.isLessOrEqual(SObjectFunctions.get(numberOfEmployeesFieldName), SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate1 = SObjectPredicates.isLessOrEqual(numberOfEmployeesFieldName, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate2 = SObjectPredicates.isLessOrEqual(accNumberOfEmployeesField, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate3 = SObjectPredicates.isLessOrEqual(numberOfEmployeesFieldName, value);
        ISObjectPredicate bigAccPredicate4 = SObjectPredicates.isLessOrEqual(accNumberOfEmployeesField, value);
        ISObjectPredicate nameGTTypePredicate = SObjectPredicates.isLessOrEqual(nameFieldName, SObjectFunctions.get(typeFieldName));
        ISObjectPredicate nameGTTypePredicate1 = SObjectPredicates.isLessOrEqual(accNameField, SObjectFunctions.get(accTypeField));
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
        SObjectField accNameField = IterTestUtils.CONSTS.Account.Name;
        String nameFieldName = 'Name';
        // When
        ISObjectFunction getNameFunction = SObjectFunctions.get(accNameField);
        ISObjectPredicate nameStartsWithTPredicate = SObjectPredicates.isLike(getNameFunction, likeString);
        ISObjectPredicate nameStartsWithTPredicate1 = SObjectPredicates.isLike(nameFieldName, likeString);
        ISObjectPredicate nameStartsWithTPredicate2 = SObjectPredicates.isLike(accNameField, likeString);
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
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        String typeNameFieldName = 'Type';
        List<Object> types = new List<String>{ 'Customer', 'Competitor' };
        // When
        ISObjectFunction getTypeFunction = SObjectFunctions.get(accTypeField);
        ISObjectPredicate typeInPredicate = SObjectPredicates.isIn(getTypeFunction, types);
        ISObjectPredicate typeInPredicate1 = SObjectPredicates.isIn(typeNameFieldName, types);
        ISObjectPredicate typeInPredicate2 = SObjectPredicates.isIn(accTypeField, types);
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
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        String typeNameFieldName = 'Type';
        List<Object> types = new List<String>{ 'Customer', 'Competitor' };
        // When
        ISObjectFunction getTypeFunction = SObjectFunctions.get(accTypeField);
        ISObjectPredicate typeNotInPredicate = SObjectPredicates.isNotIn(getTypeFunction, types);
        ISObjectPredicate typeNotInPredicate1 = SObjectPredicates.isNotIn(typeNameFieldName, types);
        ISObjectPredicate typeNotInPredicate2 = SObjectPredicates.isNotIn(accTypeField, types);
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
        ISObjectPredicate nullPredicate = SObjectPredicates.isNull();
        ISObjectPredicate notNullPredicate = SObjectPredicates.isNotNull();
        ISObjectPredicate accEqualPredicate = SObjectPredicates.isEqual(INPUT[2]);
        ISObjectPredicate accNotEqualPredicate = SObjectPredicates.isNotEqual(INPUT[2]);
        ISObjectPredicate accInPredicate = SObjectPredicates.isIn(subset);
        ISObjectPredicate accNotInPredicate = SObjectPredicates.isNotIn(subset);
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
     * @see SObjectPredicates.has
     * @see SObjectPredicates.hasSObject
     * @see SObjectPredicates.hasSObjects
     */
    @IsTest
    static void has() {
        // Given
        SObjectField accNumberOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        SObjectField accParentField = IterTestUtils.CONSTS.Account.ParentId;
        String parentFieldName = 'Parent';
        SObjectField conAccountIdField = IterTestUtils.CONSTS.Contact.AccountId;
        String accountsFieldName = 'Contacts';
        // When
        ISObjectPredicate has = SObjectPredicates.has(SObjectFunctions.get(accNumberOfEmployeesField));
        ISObjectPredicate has1 = SObjectPredicates.has(accNumberOfEmployeesField);
        ISObjectPredicate has2 = SObjectPredicates.has(numberOfEmployeesFieldName);
        ISObjectPredicate hasSObject = SObjectPredicates.hasSObject(SObjectUnaryOperators.getSObject(parentFieldName));
        ISObjectPredicate hasSObject1 = SObjectPredicates.hasSObject(accParentField);
        ISObjectPredicate hasSObject2 = SObjectPredicates.hasSObject(parentFieldName);
        ISObjectPredicate hasSObjects = SObjectPredicates.hasSObjects(conAccountIdField);
        ISObjectPredicate hasSObjects1 = SObjectPredicates.hasSObjects(accountsFieldName);
        // When
        for (Account acc : INPUT) {
            Assert.areEqual(acc.get(accNumberOfEmployeesField) != null, has.test(acc));
            Assert.areEqual(acc.get(accNumberOfEmployeesField) != null, has1.test(acc));
            Assert.areEqual(acc.get(numberOfEmployeesFieldName) != null, has2.test(acc));
            Assert.areEqual(acc.getSObject(parentFieldName) != null, hasSObject.test(acc));
            Assert.areEqual(acc.getSObject(accParentField) != null, hasSObject1.test(acc));
            Assert.areEqual(acc.getSObject(parentFieldName) != null, hasSObject2.test(acc));
            Assert.areEqual(acc.getSObjects(accountsFieldName) != null, hasSObjects1.test(acc));
            Assert.areEqual(acc.getSObjects(accountsFieldName) != null, hasSObjects.test(acc));
        }
    }

    /**
     * @see SObjectPredicates.hasErrors
     * @see SObjectPredicates.isClone
     * @see SObjectPredicates.isSet
     */
    @IsTest
    static void propertyPredicates() {
        // Given
        String error = 'Error';
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        String typeFieldName = 'Type';
        String parentTypeFieldName = 'Parent.Type';
        String parentTypeFieldNameSafe = 'Parent?.Type';
        // When
        INPUT[0].addError(error);
        INPUT[4].addError(error);
        INPUT[6].addError(error);
        INPUT[8] = INPUT[7].clone();
        ISObjectPredicate hasErrorsPredicate = SObjectPredicates.hasErrors();
        ISObjectPredicate clonePredicate = SObjectPredicates.isClone();
        ISObjectPredicate setTypePredicate = SObjectPredicates.isSet(typeFieldName);
        ISObjectPredicate setTypePredicate1 = SObjectPredicates.isSet(accTypeField);
        ISObjectPredicate setParentTypePredicate = SObjectPredicates.isSet(parentTypeFieldName);
        ISObjectPredicate setParentTypePredicateSafe = SObjectPredicates.isSet(parentTypeFieldNameSafe);
        // Then
        for (Account acc : INPUT) {
            Assert.areEqual(acc.hasErrors(), hasErrorsPredicate.test(acc));
            Assert.areEqual(acc.isClone(), clonePredicate.test(acc));
            Assert.areEqual(acc.isSet(typeFieldName), setTypePredicate.test(acc));
            Assert.areEqual(acc.isSet(accTypeField), setTypePredicate1.test(acc));
            Assert.areEqual(acc.getSObject('Parent')?.isSet(accTypeField), setParentTypePredicateSafe.test(acc));
            if (acc.getSObject('Parent') != null) {
                Assert.areEqual(acc.getSObject('Parent').isSet(accTypeField), setParentTypePredicate.test(acc));
            }
        }
    }
    
}
