/**
 * @see SObjectPredicate
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectPredicateTest {

    private static final List<Account> INPUT = IterTestUtils.generateAccounts();

    /**
     * @see SObjectPredicate.orElse
     * @see SObjectPredicate.andAlso
     * @see SObjectPredicate.negate
     * @see SObjectPredicate.always
     */
    @IsTest
    static void default() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        Object value2 = 'Competitor';
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        Boolean value3 = true;
        // When
        ISObjectPredicate alwaysPredicate = SObjectPredicate.always(value3);
        SObjectPredicate bigAccPredicate = SObjectPredicates.isGreater(accNumOfEmployeesField, value);
        SObjectPredicate customerPredicate = SObjectPredicates.isEqual(accTypeField, value1);
        SObjectPredicate competitorPredicate = SObjectPredicates.isEqual(accTypeField, value2);
        ISObjectPredicate bigCustomerPredicate = bigAccPredicate.andAlso(customerPredicate);
        ISObjectPredicate bigAccountOrCustomerPredicate = bigAccPredicate.orElse(customerPredicate);
        ISObjectPredicate notBigCustomerPredicate = bigAccPredicate.negate();
        ISObjectPredicate bigCustomerOrAnyCompetitorPredicate = bigAccPredicate.andAlso(customerPredicate).orElse(competitorPredicate); // (1 AND 2) OR 3
        ISObjectPredicate bigCustomerOrBigCompetitorPredicate = bigAccPredicate.andAlso(customerPredicate.orElse(competitorPredicate)); // 1 AND (2 OR 3)
        // Then
        for (Account acc : INPUT) {
            Boolean isNumOfEmployeesGreater = (Integer) acc.get(accNumOfEmployeesField) > value;
            Boolean isAccTypeCustomer = acc.get(accTypeField) == value1;
            Boolean isAccTypeCompetitor = acc.get(accTypeField) == value2;
            Validate.assertEquals(value3, alwaysPredicate.test(acc));
            Validate.assertEquals(isNumOfEmployeesGreater, bigAccPredicate.test(acc));
            Validate.assertEquals(isAccTypeCustomer, customerPredicate.test(acc));
            Validate.assertEquals(isAccTypeCompetitor, competitorPredicate.test(acc));
            Validate.assertEquals(isNumOfEmployeesGreater && isAccTypeCustomer, bigCustomerPredicate.test(acc));
            Validate.assertEquals(isNumOfEmployeesGreater || isAccTypeCustomer, bigAccountOrCustomerPredicate.test(acc));
            Validate.assertEquals(!(isNumOfEmployeesGreater), notBigCustomerPredicate.test(acc));
            Validate.assertEquals(
                    (isNumOfEmployeesGreater && isAccTypeCustomer) || isAccTypeCompetitor,
                    bigCustomerOrAnyCompetitorPredicate.test(acc)
            );
            Validate.assertEquals(
                    isNumOfEmployeesGreater && (isAccTypeCustomer || isAccTypeCompetitor),
                    bigCustomerOrBigCompetitorPredicate.test(acc)
            );
        }
    }

    /**
     * @see SObjectPredicate.some
     */
    @IsTest
    static void some() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        // When
        SObjectPredicate bigAccPredicate = SObjectPredicates.isGreater(accNumOfEmployeesField, value);
        SObjectPredicate customerPredicate = SObjectPredicates.isEqual(accTypeField, value1);
        ISObjectPredicate bigAccOrCustomer = SObjectPredicate.some(new List<ISObjectPredicate>{ bigAccPredicate, customerPredicate });
        // Then
        for (Account acc : INPUT) {
            Validate.assertEquals(
                    (Integer) acc.get(accNumOfEmployeesField) > value || acc.get(accTypeField) == value1,
                    bigAccOrCustomer.test(acc)
            );
        }
    }

    /**
     * @see SObjectPredicate.every
     */
    @IsTest
    static void every() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        // When
        SObjectPredicate bigAccPredicate = SObjectPredicates.isGreater(accNumOfEmployeesField, value);
        SObjectPredicate customerPredicate = SObjectPredicates.isEqual(accTypeField, value1);
        ISObjectPredicate bigAccAndCustomer = SObjectPredicate.every(new List<ISObjectPredicate>{ bigAccPredicate, customerPredicate });
        // Then
        for (Account acc : INPUT) {
            Validate.assertEquals(
                    (Integer) acc.get(accNumOfEmployeesField) > value && acc.get(accTypeField) == value1,
                    bigAccAndCustomer.test(acc)
            );
        }
    }

    /**
     * @see SObjectPredicate.negate
     */
    @IsTest
    static void negate() {
        // Given
        Integer value = 100;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        // When
        SObjectPredicate bigAccPredicate = SObjectPredicates.isGreater(accNumOfEmployeesField, value);
        ISObjectPredicate notBigAccPredicate = SObjectPredicate.negate(bigAccPredicate);
        // Then
        for (Account acc : INPUT) {
            Validate.assertEquals(!((Integer) acc.get(accNumOfEmployeesField) > value), notBigAccPredicate.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.compose
     */
    @IsTest
    static void compose() {
        // Given
        String value = 'T';
        SObjectField accNameField = IterTestUtils.CONSTS.Account.Name;
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accBillingLatitudeField = IterTestUtils.CONSTS.Account.BillingLatitude;
        // When
        ISObjectFunction getNameFunction = SObjectFunctions.get(accNameField);
        IPredicate startsWithTPredicate = new IterTestUtils.StartsWith(value);
        ISObjectPredicate nameStartsWithTPredicate = SObjectPredicate.compose(getNameFunction, startsWithTPredicate);
        ISObjectToIntFunction getNumberOfEmployeesAsIntFunction = SObjectToIntFunctions.get(accNumOfEmployeesField);
        IIntPredicate evenIntPredicate = IntPredicates.isEven();
        ISObjectPredicate numberOfEmployeesAsIntIsEvenPredicate = SObjectPredicate.compose(getNumberOfEmployeesAsIntFunction, evenIntPredicate);
        ISObjectToLongFunction getNumberOfEmployeesAsLongFunction = SObjectToLongFunctions.get(accNumOfEmployeesField);
        ILongPredicate evenLongPredicate = LongPredicates.isEven();
        ISObjectPredicate numberOfEmployeesAsLongIsEvenPredicate = SObjectPredicate.compose(getNumberOfEmployeesAsLongFunction, evenLongPredicate);
        ISObjectToDoubleFunction getLatFunction = SObjectToDoubleFunctions.get(accBillingLatitudeField);
        IDoublePredicate positiveDoublePredicate = DoublePredicates.isGreater(0);
        ISObjectPredicate latIsPositivePredicate = SObjectPredicate.compose(getLatFunction, positiveDoublePredicate);
        // Then
        for (Account acc : INPUT) {
            Validate.assertEquals(((String) acc.get(accNameField)).startsWith(value), nameStartsWithTPredicate.test(acc));
            Integer numOfEmployees = (Integer) acc.get(accNumOfEmployeesField);
            if (numOfEmployees != null) {
                Validate.assertEquals(
                        Math.mod(numOfEmployees, 2) == 0,
                        numberOfEmployeesAsIntIsEvenPredicate.test(acc)
                );
                Validate.assertEquals(
                        Math.mod((Long) numOfEmployees, 2) == 0,
                        numberOfEmployeesAsLongIsEvenPredicate.test(acc)
                );
            }
            Validate.assertEquals(((Double) acc.get(accBillingLatitudeField)) > 0, latIsPositivePredicate.test(acc));
        }
    }

}
