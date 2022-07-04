/**
 * @see SObjectBiPredicate
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectBiPredicateTest {

    private static List<Account> input = IterTestUtils.generateAccounts();
    private static Account delta = new Account(Type = IterTestUtils.CONSTS.PARTNER, NumberOfEmployees = 100, BillingLatitude = -50.45);

    /**
     * @see SObjectBiPredicate.orElse
     * @see SObjectBiPredicate.andAlso
     * @see SObjectBiPredicate.negate
     * @see SObjectBiPredicate.always
     */
    @IsTest
    static void default() {
        // Given
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        Boolean value = true;
        // When
        ISObjectBiPredicate valueBiPredicate = SObjectBiPredicate.always(value);
        SObjectBiPredicate numOfEmployeesIsGreaterBiPredicate = SObjectBiPredicates.isGreater(accNumOfEmployeesField);
        SObjectBiPredicate typesAreEqualBiPredicate = SObjectBiPredicates.areEqual(accTypeField);
        ISObjectBiPredicate decreasedNumOfEmployeesAndWithTheSameTypesBiPredicate = numOfEmployeesIsGreaterBiPredicate.andAlso(typesAreEqualBiPredicate);
        ISObjectBiPredicate decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate = numOfEmployeesIsGreaterBiPredicate.orElse(typesAreEqualBiPredicate);
        ISObjectBiPredicate numOfEmployeesIsNotGreaterBiPredicate = numOfEmployeesIsGreaterBiPredicate.negate();
        // Then
        for (Account acc : input) {
            Boolean areSameTypes = acc.get(accTypeField) == delta.get(accTypeField);
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) delta.get(accNumOfEmployeesField);
            Validate.assertEquals(value, valueBiPredicate.test(acc, delta));
            Validate.assertEquals(areSameTypes && isDecreasedNum, decreasedNumOfEmployeesAndWithTheSameTypesBiPredicate.test(acc, delta));
            Validate.assertEquals(areSameTypes || isDecreasedNum, decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate.test(acc, delta));
            Validate.assertEquals(!isDecreasedNum, numOfEmployeesIsNotGreaterBiPredicate.test(acc, delta));
        }
    }

    /**
     * @see SObjectBiPredicate.some
     */
    @IsTest
    static void some() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        // When
        SObjectBiPredicate numOfEmployeesIsGreaterBiPredicate = SObjectBiPredicates.isGreater(accNumOfEmployeesField);
        SObjectBiPredicate typesAreEqualBiPredicate = SObjectBiPredicates.areEqual(accTypeField);
        ISObjectBiPredicate decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate = SObjectBiPredicate.some(
                new List<ISObjectBiPredicate>{ numOfEmployeesIsGreaterBiPredicate, typesAreEqualBiPredicate }
        );
        ISObjectPredicate isNumOfEmployeesEquals = SObjectPredicates.isEqual(accNumOfEmployeesField, value);
        ISObjectPredicate isTypeEquals = SObjectPredicates.isEqual(accTypeField, value1);
        ISObjectBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = SObjectBiPredicate.some(isTypeEquals, isNumOfEmployeesEquals);
        // Then
        for (Account acc : input) {
            Boolean areSameTypes = acc.get(accTypeField) == delta.get(accTypeField);
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) delta.get(accNumOfEmployeesField);
            Validate.assertEquals(
                    areSameTypes || isDecreasedNum,
                    decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate.test(acc, delta)
            );
            Boolean isLeftTypeCustomer = acc.get(accTypeField) == value1;
            Boolean isRightNumOfEmployees = delta.get(accNumOfEmployeesField) == value;
            Validate.assertEquals(
                    isLeftTypeCustomer || isRightNumOfEmployees,
                    isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(acc, delta)
            );
        }
    }

    /**
     * @see SObjectBiPredicate.every
     */
    @IsTest
    static void every() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        // When
        SObjectBiPredicate numOfEmployeesIsGreaterBiPredicate = SObjectBiPredicates.isGreater(accNumOfEmployeesField);
        SObjectBiPredicate typesAreEqualBiPredicate = SObjectBiPredicates.areEqual(accTypeField);
        ISObjectBiPredicate decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate = SObjectBiPredicate.every(new List<ISObjectBiPredicate>{ numOfEmployeesIsGreaterBiPredicate, typesAreEqualBiPredicate });
        ISObjectPredicate isNumOfEmployeesEquals = SObjectPredicates.isEqual(accNumOfEmployeesField, value);
        ISObjectPredicate isTypeEquals = SObjectPredicates.isEqual(accTypeField, value1);
        ISObjectBiPredicate isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate = SObjectBiPredicate.every(isTypeEquals, isNumOfEmployeesEquals);
        // Then
        for (Account acc : input) {
            Boolean areSameTypes = acc.get(accTypeField) == delta.get(accTypeField);
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) delta.get(accNumOfEmployeesField);
            Validate.assertEquals(
                    areSameTypes && isDecreasedNum,
                    decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate.test(acc, delta)
            );
            Boolean isLeftTypeCustomer = acc.get(accTypeField) == value1;
            Boolean isRightNumOfEmployees = delta.get(accNumOfEmployeesField) == value;
            Validate.assertEquals(
                    isLeftTypeCustomer && isRightNumOfEmployees,
                    isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(acc, delta)
            );
        }
    }

    /**
     * @see SObjectBiPredicate.negate
     */
    @IsTest
    static void negate() {
        // Given
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        SObjectBiPredicate numOfEmployeesIsGreaterBiPredicate = SObjectBiPredicates.isGreater(accNumOfEmployeesField);
        ISObjectBiPredicate numOfEmployeesIsNotGreaterBiPredicate = SObjectBiPredicate.negate(numOfEmployeesIsGreaterBiPredicate);
        // Then
        for (Account acc : input) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) delta.get(accNumOfEmployeesField);
            Validate.assertEquals(!isDecreasedNum, numOfEmployeesIsNotGreaterBiPredicate.test(acc, delta));
        }
    }

}
