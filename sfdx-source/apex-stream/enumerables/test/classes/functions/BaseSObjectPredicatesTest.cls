/**
 * @see BaseSObjectPredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class BaseSObjectPredicatesTest {

    private static final List<Account> INPUT = AsTestData.generateAccounts();

    static {
        new BaseSObjectPredicates();
    }

    /**
     * @see BaseSObjectPredicates.isEqual
     */
    @IsTest
    static void isEqual() {
        // Given
        Integer value = 100;
        SObjectField accNameField = AsTestConsts.Account.Name;
        SObjectField accNumberOfEmployeesField = AsTestConsts.Account.NumberOfEmployees;
        SObjectField accTypeField = AsTestConsts.Account.Type;
        String nameFieldName = 'Name';
        String numberOfEmployeesFieldName = 'NumberOfEmployees';
        String typeFieldName = 'Type';
        String parentFieldName = 'Parent';
        // When
        IPredicate bigAccPredicate = BaseSObjectPredicates.isEqual(BaseSObjectFunctions.get(numberOfEmployeesFieldName), Function.constant(value));
        IPredicate bigAccPredicate1 = BaseSObjectPredicates.isEqual(numberOfEmployeesFieldName, Function.constant(value));
        IPredicate bigAccPredicate2 = BaseSObjectPredicates.isEqual(accNumberOfEmployeesField, Function.constant(value));
        IPredicate bigAccPredicate3 = BaseSObjectPredicates.isEqual(numberOfEmployeesFieldName, value);
        IPredicate bigAccPredicate4 = BaseSObjectPredicates.isEqual(accNumberOfEmployeesField, value);
        IPredicate nameGTTypePredicate = BaseSObjectPredicates.isEqual(nameFieldName, BaseSObjectFunctions.get(typeFieldName));
        IPredicate nameGTTypePredicate1 = BaseSObjectPredicates.isEqual(accNameField, BaseSObjectFunctions.get(accTypeField));
        IPredicate hasNoParentPredicate = BaseSObjectPredicates.isEqual(BaseSObjectOperators.getSObject(parentFieldName), Operator.constant(null));
        Predicate parentIsIdentityPredicate = BaseSObjectPredicates.isEqual(Function.identity(), BaseSObjectOperators.getSObject(parentFieldName));
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

}
