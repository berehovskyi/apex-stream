/**
 * @see SObjectApexComparerPredicateProvider
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
private class SObjectApexComparerPredicateBuildTest {
    private static final List<Account> INPUT = AfTestData.generateAccounts();
    private static final SObjectComparerPredicateProvider PRED = new SObjectApexComparerPredicateProvider();
    // Given
    private static final Integer VALUE = 100;
    private static final SObjectField ACC_NAME_FIELD = AfTestConsts.Account.Name;
    private static final SObjectField ACC_NUM_OF_EMPLOYEES_FIELD = AfTestConsts.Account.NumberOfEmployees;
    private static final SObjectField ACC_TYPE_FIELD = AfTestConsts.Account.Type;
    private static final String NAME_FIELD_NAME = 'Name';
    private static final String NUM_OF_EMPLOYEES_FIELD_NAME = 'NumberOfEmployees';
    private static final String TYPE_FIELD_NAME = 'Type';
    private static final String PARENT_FIELD_NAME = 'Parent';

    /**
     * @see SObjectComparerPredicateProvider.ComparisonOperator.gt
     */
    @IsTest
    static void isGreater() {
        // When
        IPredicate majorAccPredicate = PRED.is(new SObjectFunctionProvider().get(NUM_OF_EMPLOYEES_FIELD_NAME)).gt().val(Function.constant(VALUE));
        IPredicate majorAccPredicate1 = PRED.is(NUM_OF_EMPLOYEES_FIELD_NAME).gt().val(Function.constant(VALUE));
        IPredicate majorAccPredicate2 = PRED.is(ACC_NUM_OF_EMPLOYEES_FIELD).gt().val(Function.constant(VALUE));
        IPredicate majorAccPredicate3 = PRED.is(NUM_OF_EMPLOYEES_FIELD_NAME).gt().var(VALUE);
        IPredicate majorAccPredicate4 = PRED.is(ACC_NUM_OF_EMPLOYEES_FIELD).gt().var(VALUE);
        IPredicate nameGTTypePredicate = PRED.is(NAME_FIELD_NAME).gt().val(TYPE_FIELD_NAME);
        IPredicate nameGTTypePredicate1 = PRED.is(ACC_NAME_FIELD).gt().val(ACC_TYPE_FIELD);
        IPredicate minorAccPredicate = PRED.isVar(VALUE).gt().val(NUM_OF_EMPLOYEES_FIELD_NAME);
        IPredicate accGtNullPredicate = PRED.is().gt().var(null);
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = ((Integer) acc.get(NUM_OF_EMPLOYEES_FIELD_NAME));
            String name = ((String) acc.get(NAME_FIELD_NAME));
            String type = ((String) acc.get(TYPE_FIELD_NAME));
            Assert.areEqual(numOfEmployees > VALUE, majorAccPredicate.test(acc));
            Assert.areEqual(numOfEmployees > VALUE, majorAccPredicate1.test(acc));
            Assert.areEqual(numOfEmployees > VALUE, majorAccPredicate2.test(acc));
            Assert.areEqual(numOfEmployees > VALUE, majorAccPredicate3.test(acc));
            Assert.areEqual(numOfEmployees > VALUE, majorAccPredicate4.test(acc));
            Assert.areEqual(name > type, nameGTTypePredicate.test(acc));
            Assert.areEqual(name > type, nameGTTypePredicate1.test(acc));
            Assert.areEqual(VALUE > numOfEmployees, minorAccPredicate.test(acc));
            Assert.areEqual(false, accGtNullPredicate.test(acc));
        }
    }

    /**
     * @see SObjectComparerPredicateProvider.ComparisonOperator.ge
     */
    @IsTest
    static void isGreaterOrEqual() {
        // When
        IPredicate majorAccPredicate = PRED.is(new SObjectFunctionProvider().get(NUM_OF_EMPLOYEES_FIELD_NAME)).ge().val(Function.constant(VALUE));
        IPredicate majorAccPredicate1 = PRED.is(NUM_OF_EMPLOYEES_FIELD_NAME).ge().val(Function.constant(VALUE));
        IPredicate majorAccPredicate2 = PRED.is(ACC_NUM_OF_EMPLOYEES_FIELD).ge().val(Function.constant(VALUE));
        IPredicate majorAccPredicate3 = PRED.is(NUM_OF_EMPLOYEES_FIELD_NAME).ge().var(VALUE);
        IPredicate majorAccPredicate4 = PRED.is(ACC_NUM_OF_EMPLOYEES_FIELD).ge().var(VALUE);
        IPredicate nameGteTypePredicate = PRED.is(NAME_FIELD_NAME).ge().val(TYPE_FIELD_NAME);
        IPredicate nameGteTypePredicate1 = PRED.is(ACC_NAME_FIELD).ge().val(ACC_TYPE_FIELD);
        IPredicate minorAccPredicate = PRED.isVar(VALUE).ge().val(NUM_OF_EMPLOYEES_FIELD_NAME);
        IPredicate accGteNullPredicate = PRED.is().ge().var(null);
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = ((Integer) acc.get(NUM_OF_EMPLOYEES_FIELD_NAME));
            String name = ((String) acc.get(NAME_FIELD_NAME));
            String type = ((String) acc.get(TYPE_FIELD_NAME));
            Assert.areEqual(numOfEmployees >= VALUE, majorAccPredicate.test(acc));
            Assert.areEqual(numOfEmployees >= VALUE, majorAccPredicate1.test(acc));
            Assert.areEqual(numOfEmployees >= VALUE, majorAccPredicate2.test(acc));
            Assert.areEqual(numOfEmployees >= VALUE, majorAccPredicate3.test(acc));
            Assert.areEqual(numOfEmployees >= VALUE, majorAccPredicate4.test(acc));
            Assert.areEqual(name >= type, nameGteTypePredicate.test(acc));
            Assert.areEqual(name >= type, nameGteTypePredicate1.test(acc));
            Assert.areEqual(VALUE >= numOfEmployees, minorAccPredicate.test(acc));
            Assert.areEqual(false, accGteNullPredicate.test(acc));
        }
    }

    /**
     * @see SObjectComparerPredicateProvider.ComparisonOperator.eq
     */
    @IsTest
    static void isEqual() {
        // When
        IPredicate majorAccPredicate = PRED.is(new SObjectFunctionProvider().get(NUM_OF_EMPLOYEES_FIELD_NAME)).eq().val(Function.constant(VALUE));
        IPredicate majorAccPredicate1 = PRED.is(NUM_OF_EMPLOYEES_FIELD_NAME).eq().val(Function.constant(VALUE));
        IPredicate majorAccPredicate2 = PRED.is(ACC_NUM_OF_EMPLOYEES_FIELD).eq().val(Function.constant(VALUE));
        IPredicate majorAccPredicate3 = PRED.is(NUM_OF_EMPLOYEES_FIELD_NAME).eq().var(VALUE);
        IPredicate majorAccPredicate4 = PRED.is(ACC_NUM_OF_EMPLOYEES_FIELD).eq().var(VALUE);
        IPredicate nameGTTypePredicate = PRED.is(NAME_FIELD_NAME).eq().val(TYPE_FIELD_NAME);
        IPredicate nameGTTypePredicate1 = PRED.is(ACC_NAME_FIELD).eq().val(ACC_TYPE_FIELD);
        IPredicate hasNoParentPredicate = PRED.is(new SObjectFunctionProvider().getSObject(PARENT_FIELD_NAME)).eq().val(Operator.constant(null));
        IPredicate parentIsIdentityPredicate = PRED.is(Function.identity()).eq().val(new SObjectFunctionProvider().getSObject(PARENT_FIELD_NAME));
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = ((Integer) acc.get(NUM_OF_EMPLOYEES_FIELD_NAME));
            String name = ((String) acc.get(NAME_FIELD_NAME));
            String type = ((String) acc.get(TYPE_FIELD_NAME));
            Account parent = (Account) acc.getSObject(PARENT_FIELD_NAME);
            Assert.areEqual(numOfEmployees == VALUE, majorAccPredicate.test(acc));
            Assert.areEqual(numOfEmployees == VALUE, majorAccPredicate1.test(acc));
            Assert.areEqual(numOfEmployees == VALUE, majorAccPredicate2.test(acc));
            Assert.areEqual(numOfEmployees == VALUE, majorAccPredicate3.test(acc));
            Assert.areEqual(numOfEmployees == VALUE, majorAccPredicate4.test(acc));
            Assert.areEqual(name == type, nameGTTypePredicate.test(acc));
            Assert.areEqual(name == type, nameGTTypePredicate1.test(acc));
            Assert.areEqual(parent == null, hasNoParentPredicate.test(acc));
            Assert.areEqual(parent == acc, parentIsIdentityPredicate.test(acc));
        }
    }

    /**
     * @see SObjectComparerPredicateProvider.ComparisonOperator.ne
     */
    @IsTest
    static void isNotEqual() {
        // When
        IPredicate accPredicate = PRED.is(new SObjectFunctionProvider().get(NUM_OF_EMPLOYEES_FIELD_NAME)).ne().val(Function.constant(VALUE));
        IPredicate accPredicate1 = PRED.is(NUM_OF_EMPLOYEES_FIELD_NAME).ne().val(Function.constant(VALUE));
        IPredicate accPredicate2 = PRED.is(ACC_NUM_OF_EMPLOYEES_FIELD).ne().val(Function.constant(VALUE));
        IPredicate accPredicate3 = PRED.is(NUM_OF_EMPLOYEES_FIELD_NAME).ne().var(VALUE);
        IPredicate accPredicate4 = PRED.is(ACC_NUM_OF_EMPLOYEES_FIELD).ne().var(VALUE);
        IPredicate nameGTTypePredicate = PRED.is(NAME_FIELD_NAME).ne().val(TYPE_FIELD_NAME);
        IPredicate nameGTTypePredicate1 = PRED.is(ACC_NAME_FIELD).ne().val(ACC_TYPE_FIELD);
        IPredicate hasParentPredicate = PRED.is(new SObjectFunctionProvider().getSObject(PARENT_FIELD_NAME)).ne().val(Operator.constant(null));
        IPredicate parentIsNotIdentityPredicate = PRED.is(Function.identity()).ne().val(new SObjectFunctionProvider().getSObject(PARENT_FIELD_NAME));
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = ((Integer) acc.get(NUM_OF_EMPLOYEES_FIELD_NAME));
            String name = ((String) acc.get(NAME_FIELD_NAME));
            String type = ((String) acc.get(TYPE_FIELD_NAME));
            Account parent = (Account) acc.getSObject(PARENT_FIELD_NAME);
            Assert.areEqual(numOfEmployees != VALUE, accPredicate.test(acc));
            Assert.areEqual(numOfEmployees != VALUE, accPredicate1.test(acc));
            Assert.areEqual(numOfEmployees != VALUE, accPredicate2.test(acc));
            Assert.areEqual(numOfEmployees != VALUE, accPredicate3.test(acc));
            Assert.areEqual(numOfEmployees != VALUE, accPredicate4.test(acc));
            Assert.areEqual(name != type, nameGTTypePredicate.test(acc));
            Assert.areEqual(name != type, nameGTTypePredicate1.test(acc));
            Assert.areEqual(parent != null, hasParentPredicate.test(acc));
            Assert.areEqual(parent != acc, parentIsNotIdentityPredicate.test(acc));
        }
    }

    /**
     * @see SObjectComparerPredicateProvider.ComparisonOperator.lt
     */
    @IsTest
    static void isLess() {
        // When
        IPredicate minorAccPredicate = PRED.is(new SObjectFunctionProvider().get(NUM_OF_EMPLOYEES_FIELD_NAME)).lt().val(Function.constant(VALUE));
        IPredicate minorAccPredicate1 = PRED.is(NUM_OF_EMPLOYEES_FIELD_NAME).lt().val(Function.constant(VALUE));
        IPredicate minorAccPredicate2 = PRED.is(ACC_NUM_OF_EMPLOYEES_FIELD).lt().val(Function.constant(VALUE));
        IPredicate minorAccPredicate3 = PRED.is(NUM_OF_EMPLOYEES_FIELD_NAME).lt().var(VALUE);
        IPredicate minorAccPredicate4 = PRED.is(ACC_NUM_OF_EMPLOYEES_FIELD).lt().var(VALUE);
        IPredicate nameGTTypePredicate = PRED.is(NAME_FIELD_NAME).lt().val(TYPE_FIELD_NAME);
        IPredicate nameGTTypePredicate1 = PRED.is(ACC_NAME_FIELD).lt().val(ACC_TYPE_FIELD);
        IPredicate majorAccPredicate = PRED.isVar(VALUE).lt().val(NUM_OF_EMPLOYEES_FIELD_NAME);
        IPredicate accLtNullPredicate = PRED.is().lt().var(null);
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = ((Integer) acc.get(NUM_OF_EMPLOYEES_FIELD_NAME));
            String name = ((String) acc.get(NAME_FIELD_NAME));
            String type = ((String) acc.get(TYPE_FIELD_NAME));
            Assert.areEqual(numOfEmployees < VALUE, minorAccPredicate.test(acc));
            Assert.areEqual(numOfEmployees < VALUE, minorAccPredicate1.test(acc));
            Assert.areEqual(numOfEmployees < VALUE, minorAccPredicate2.test(acc));
            Assert.areEqual(numOfEmployees < VALUE, minorAccPredicate3.test(acc));
            Assert.areEqual(numOfEmployees < VALUE, minorAccPredicate4.test(acc));
            Assert.areEqual(name == null ? true : name < type, nameGTTypePredicate.test(acc));
            Assert.areEqual(name == null ? true : name < type, nameGTTypePredicate1.test(acc));
            Assert.areEqual(VALUE < numOfEmployees, majorAccPredicate.test(acc));
            Assert.areEqual(false, accLtNullPredicate.test(acc));
        }
    }

    /**
     * @see SObjectComparerPredicateProvider.ComparisonOperator.le
     */
    @IsTest
    static void isLessOrEqual() {
        // When
        IPredicate minorAccPredicate = PRED.is(new SObjectFunctionProvider().get(NUM_OF_EMPLOYEES_FIELD_NAME)).le().val(Function.constant(VALUE));
        IPredicate minorAccPredicate1 = PRED.is(NUM_OF_EMPLOYEES_FIELD_NAME).le().val(Function.constant(VALUE));
        IPredicate minorAccPredicate2 = PRED.is(ACC_NUM_OF_EMPLOYEES_FIELD).le().val(Function.constant(VALUE));
        IPredicate minorAccPredicate3 = PRED.is(NUM_OF_EMPLOYEES_FIELD_NAME).le().var(VALUE);
        IPredicate minorAccPredicate4 = PRED.is(ACC_NUM_OF_EMPLOYEES_FIELD).le().var(VALUE);
        IPredicate nameGTTypePredicate = PRED.is(NAME_FIELD_NAME).le().val(TYPE_FIELD_NAME);
        IPredicate nameGTTypePredicate1 = PRED.is(ACC_NAME_FIELD).le().val(ACC_TYPE_FIELD);
        IPredicate majorAccPredicate = PRED.isVar(VALUE).le().val(NUM_OF_EMPLOYEES_FIELD_NAME);
        IPredicate accLtNullPredicate = PRED.is().le().var(null);
        // Then
        for (Account acc : INPUT) {
            Integer numOfEmployees = ((Integer) acc.get(NUM_OF_EMPLOYEES_FIELD_NAME));
            String name = ((String) acc.get(NAME_FIELD_NAME));
            String type = ((String) acc.get(TYPE_FIELD_NAME));
            Assert.areEqual(numOfEmployees <= VALUE, minorAccPredicate.test(acc));
            Assert.areEqual(numOfEmployees <= VALUE, minorAccPredicate1.test(acc));
            Assert.areEqual(numOfEmployees <= VALUE, minorAccPredicate2.test(acc));
            Assert.areEqual(numOfEmployees <= VALUE, minorAccPredicate3.test(acc));
            Assert.areEqual(numOfEmployees <= VALUE, minorAccPredicate4.test(acc));
            Assert.areEqual(name == null ? true : name <= type, nameGTTypePredicate.test(acc));
            Assert.areEqual(name == null ? true : name <= type, nameGTTypePredicate1.test(acc));
            Assert.areEqual(VALUE <= numOfEmployees, majorAccPredicate.test(acc));
            Assert.areEqual(false, accLtNullPredicate.test(acc));
        }
    }

    /**
     * @see SObjectComparerPredicateProvider.ComparisonOperator.eqNull
     * @see SObjectComparerPredicateProvider.ComparisonOperator.neNull
     */
    @IsTest
    static void isNull() {
        // Given
        List<Account> inputWithNull = new List<Account>(INPUT);
        inputWithNull.add(null);
        // When
        IPredicate nullPredicate = PRED.is().eqNull();
        IPredicate nullPredicate1 = PRED.isVar((Object) null).eq().val();
        IPredicate notNullPredicate =  PRED.is().neNull();
        IPredicate notNullPredicate1 =  PRED.isVar((Object) null).ne().val();
        // When
        for (Account acc : INPUT) {
            Assert.areEqual(acc == null, nullPredicate.test(acc));
            Assert.areEqual(acc == null, nullPredicate1.test(acc));
            Assert.areEqual(acc != null, notNullPredicate.test(acc));
            Assert.areEqual(acc != null, notNullPredicate1.test(acc));
        }
    }
}
