/**
 * @see SObjectBiPredicate
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectBiPredicateTest {

    private static final List<Account> INPUT = IterTestUtils.generateAccounts();
    private static final Account DELTA = new Account(Type = IterTestUtils.CONSTS.PARTNER, NumberOfEmployees = 100, BillingLatitude = -50.45);

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
        for (Account acc : INPUT) {
            Boolean areSameTypes = acc.get(accTypeField) == DELTA.get(accTypeField);
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) DELTA.get(accNumOfEmployeesField);
            Validate.assertEquals(value, valueBiPredicate.test(acc, DELTA));
            Validate.assertEquals(areSameTypes && isDecreasedNum, decreasedNumOfEmployeesAndWithTheSameTypesBiPredicate.test(acc, DELTA));
            Validate.assertEquals(areSameTypes || isDecreasedNum, decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate.test(acc, DELTA));
            Validate.assertEquals(!isDecreasedNum, numOfEmployeesIsNotGreaterBiPredicate.test(acc, DELTA));
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
        for (Account acc : INPUT) {
            Boolean areSameTypes = acc.get(accTypeField) == DELTA.get(accTypeField);
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) DELTA.get(accNumOfEmployeesField);
            Validate.assertEquals(
                    areSameTypes || isDecreasedNum,
                    decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate.test(acc, DELTA)
            );
            Boolean isLeftTypeCustomer = acc.get(accTypeField) == value1;
            Boolean isRightNumOfEmployees = DELTA.get(accNumOfEmployeesField) == value;
            Validate.assertEquals(
                    isLeftTypeCustomer || isRightNumOfEmployees,
                    isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(acc, DELTA)
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
        for (Account acc : INPUT) {
            Boolean areSameTypes = acc.get(accTypeField) == DELTA.get(accTypeField);
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) DELTA.get(accNumOfEmployeesField);
            Validate.assertEquals(
                    areSameTypes && isDecreasedNum,
                    decreasedNumOfEmployeesAndOrTheSameTypesBiPredicate.test(acc, DELTA)
            );
            Boolean isLeftTypeCustomer = acc.get(accTypeField) == value1;
            Boolean isRightNumOfEmployees = DELTA.get(accNumOfEmployeesField) == value;
            Validate.assertEquals(
                    isLeftTypeCustomer && isRightNumOfEmployees,
                    isLeftTypeCustomerOrRightNumOfEmployeesBiPredicate.test(acc, DELTA)
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
        for (Account acc : INPUT) {
            Boolean isDecreasedNum = (Integer) acc.get(accNumOfEmployeesField) > (Integer) DELTA.get(accNumOfEmployeesField);
            Validate.assertEquals(!isDecreasedNum, numOfEmployeesIsNotGreaterBiPredicate.test(acc, DELTA));
        }
    }

}
