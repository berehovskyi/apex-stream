/**
 * @author O. Berehovskyi
 * @see SObjectPredicate
 */
@IsTest(IsParallel = true)
private class SObjectPredicateTest {

    private static List<Account> input = IterTestUtils.generateAccounts();

    /**
     * @see SObjectPredicate.orElse
     * @see SObjectPredicate.andAlso
     * @see SObjectPredicate.negate
     * @see SObjectPredicate.always
     */
    @IsTest
    static void defaultMethods() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        Object value2 = 'Competitor';
        SObjectField accNumOfEmployeesField = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        Boolean value3 = true;
        // When
        ISObjectPredicate alwaysPredicate = SObjectPredicate.always(value3);
        SObjectPredicate bigAccPredicate = SObjectPredicate.isGreater(accNumOfEmployeesField, value);
        SObjectPredicate customerPredicate = SObjectPredicate.isEqual(accTypeField, value1);
        SObjectPredicate competitorPredicate = SObjectPredicate.isEqual(accTypeField, value2);
        ISObjectPredicate bigCustomerPredicate = bigAccPredicate.andAlso(customerPredicate);
        ISObjectPredicate bigAccountOrCustomerPredicate = bigAccPredicate.orElse(customerPredicate);
        ISObjectPredicate notBigCustomerPredicate = bigAccPredicate.negate();
        ISObjectPredicate bigCustomerOrAnyCompetitorPredicate = bigAccPredicate.andAlso(customerPredicate).orElse(competitorPredicate); // (1 AND 2) OR 3
        ISObjectPredicate bigCustomerOrBigCompetitorPredicate = bigAccPredicate.andAlso(customerPredicate.orElse(competitorPredicate)); // 1 AND (2 OR 3)
        // Then
        for (Account acc : input) {
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
        SObjectPredicate bigAccPredicate = SObjectPredicate.isGreater(accNumOfEmployeesField, value);
        SObjectPredicate customerPredicate = SObjectPredicate.isEqual(accTypeField, value1);
        ISObjectPredicate bigAccOrCustomer = SObjectPredicate.some(new List<ISObjectPredicate>{ bigAccPredicate, customerPredicate });
        ISObjectPredicate bigAccOrCustomer1 = SObjectPredicate.some(bigAccPredicate, customerPredicate);
        // Then
        for (Account acc : input) {
            Validate.assertEquals(
                    (Integer) acc.get(accNumOfEmployeesField) > value || acc.get(accTypeField) == value1,
                    bigAccOrCustomer.test(acc)
            );
            Validate.assertEquals(
                    (Integer) acc.get(accNumOfEmployeesField) > value || acc.get(accTypeField) == value1,
                    bigAccOrCustomer1.test(acc)
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
        SObjectPredicate bigAccPredicate = SObjectPredicate.isGreater(accNumOfEmployeesField, value);
        SObjectPredicate customerPredicate = SObjectPredicate.isEqual(accTypeField, value1);
        ISObjectPredicate bigAccAndCustomer = SObjectPredicate.every(new List<ISObjectPredicate>{ bigAccPredicate, customerPredicate });
        ISObjectPredicate bigAccAndCustomer1 = SObjectPredicate.every(bigAccPredicate, customerPredicate);
        // Then
        for (Account acc : input) {
            Validate.assertEquals(
                    (Integer) acc.get(accNumOfEmployeesField) > value && acc.get(accTypeField) == value1,
                    bigAccAndCustomer.test(acc)
            );
            Validate.assertEquals(
                    (Integer) acc.get(accNumOfEmployeesField) > value && acc.get(accTypeField) == value1,
                    bigAccAndCustomer1.test(acc)
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
        SObjectPredicate bigAccPredicate = SObjectPredicate.isGreater(accNumOfEmployeesField, value);
        ISObjectPredicate notBigAccPredicate = SObjectPredicate.negate(bigAccPredicate);
        // Then
        for (Account acc : input) {
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
        ISObjectFunction getNameFunction = SObjectFunction.get(accNameField);
        IPredicate startsWithTPredicate = StringPredicate.startsWith(value);
        ISObjectPredicate nameStartsWithTPredicate = SObjectPredicate.compose(getNameFunction, startsWithTPredicate);
        ISObjectToIntFunction getNumberOfEmployeesAsIntFunction = SObjectToIntFunction.get(accNumOfEmployeesField);
        IIntPredicate evenIntPredicate = IntPredicate.isEven();
        ISObjectPredicate numberOfEmployeesAsIntIsEvenPredicate = SObjectPredicate.compose(getNumberOfEmployeesAsIntFunction, evenIntPredicate);
        ISObjectToLongFunction getNumberOfEmployeesAsLongFunction = SObjectToLongFunction.get(accNumOfEmployeesField);
        ILongPredicate evenLongPredicate = LongPredicate.isEven();
        ISObjectPredicate numberOfEmployeesAsLongIsEvenPredicate = SObjectPredicate.compose(getNumberOfEmployeesAsLongFunction, evenLongPredicate);
        ISObjectToDoubleFunction getLatFunction = SObjectToDoubleFunction.get(accBillingLatitudeField);
        IDoublePredicate positiveDoublePredicate = DoublePredicate.isPositive();
        ISObjectPredicate latIsPositivePredicate = SObjectPredicate.compose(getLatFunction, positiveDoublePredicate);
        // Then
        for (Account acc : input) {
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

    /**
     * @see SObjectPredicate.isCompared
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
        ISObjectPredicate bigAccPredicate = SObjectPredicate.isCompared(SObjectFunction.get(numberOfEmployeesFieldName), SObjectFunction.constant(value), comp, result);
        ISObjectPredicate bigAccPredicate1 = SObjectPredicate.isCompared(SObjectFunction.get(accNumberOfEmployeesField), SObjectFunction.constant(value), comp1, result);
        // Then
        for (Account acc : input) {
            Integer numOfEmployees = (Integer) acc.get(numberOfEmployeesFieldName);
            Validate.assertEquals((numOfEmployees == null ? false : numOfEmployees > value), bigAccPredicate.test(acc));
            Validate.assertEquals((numOfEmployees == null ? true : numOfEmployees > value), bigAccPredicate1.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.isGreater
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
        ISObjectPredicate bigAccPredicate = SObjectPredicate.isGreater(SObjectFunction.get(numberOfEmployeesFieldName), SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate1 = SObjectPredicate.isGreater(numberOfEmployeesFieldName, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate2 = SObjectPredicate.isGreater(accNumberOfEmployeesField, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate3 = SObjectPredicate.isGreater(numberOfEmployeesFieldName, value);
        ISObjectPredicate bigAccPredicate4 = SObjectPredicate.isGreater(accNumberOfEmployeesField, value);
        ISObjectPredicate nameGTTypePredicate = SObjectPredicate.isGreater(nameFieldName, SObjectFunction.get(typeFieldName));
        ISObjectPredicate nameGTTypePredicate1 = SObjectPredicate.isGreater(accNameField, SObjectFunction.get(accTypeField));
        // Then
        for (Account acc : input) {
            Integer numOfEmployees = ((Integer) acc.get(numberOfEmployeesFieldName));
            String name = ((String) acc.get(nameFieldName));
            String type = ((String) acc.get(typeFieldName));
            Validate.assertEquals(numOfEmployees > value, bigAccPredicate.test(acc));
            Validate.assertEquals(numOfEmployees > value, bigAccPredicate1.test(acc));
            Validate.assertEquals(numOfEmployees > value, bigAccPredicate2.test(acc));
            Validate.assertEquals(numOfEmployees > value, bigAccPredicate3.test(acc));
            Validate.assertEquals(numOfEmployees > value, bigAccPredicate4.test(acc));
            Validate.assertEquals(name > type, nameGTTypePredicate.test(acc));
            Validate.assertEquals(name > type, nameGTTypePredicate1.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.isGreaterOrEqual
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
        ISObjectPredicate bigAccPredicate = SObjectPredicate.isGreaterOrEqual(SObjectFunction.get(numberOfEmployeesFieldName), SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate1 = SObjectPredicate.isGreaterOrEqual(numberOfEmployeesFieldName, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate2 = SObjectPredicate.isGreaterOrEqual(accNumberOfEmployeesField, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate3 = SObjectPredicate.isGreaterOrEqual(numberOfEmployeesFieldName, value);
        ISObjectPredicate bigAccPredicate4 = SObjectPredicate.isGreaterOrEqual(accNumberOfEmployeesField, value);
        ISObjectPredicate nameGTTypePredicate = SObjectPredicate.isGreaterOrEqual(nameFieldName, SObjectFunction.get(typeFieldName));
        ISObjectPredicate nameGTTypePredicate1 = SObjectPredicate.isGreaterOrEqual(accNameField, SObjectFunction.get(accTypeField));
        // Then
        for (Account acc : input) {
            Integer numOfEmployees = ((Integer) acc.get(numberOfEmployeesFieldName));
            String name = ((String) acc.get(nameFieldName));
            String type = ((String) acc.get(typeFieldName));
            Validate.assertEquals(numOfEmployees >= value, bigAccPredicate.test(acc));
            Validate.assertEquals(numOfEmployees >= value, bigAccPredicate1.test(acc));
            Validate.assertEquals(numOfEmployees >= value, bigAccPredicate2.test(acc));
            Validate.assertEquals(numOfEmployees >= value, bigAccPredicate3.test(acc));
            Validate.assertEquals(numOfEmployees >= value, bigAccPredicate4.test(acc));
            Validate.assertEquals(name >= type, nameGTTypePredicate.test(acc));
            Validate.assertEquals(name >= type, nameGTTypePredicate1.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.isEqual
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
        ISObjectPredicate bigAccPredicate = SObjectPredicate.isEqual(SObjectFunction.get(numberOfEmployeesFieldName), SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate1 = SObjectPredicate.isEqual(numberOfEmployeesFieldName, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate2 = SObjectPredicate.isEqual(accNumberOfEmployeesField, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate3 = SObjectPredicate.isEqual(numberOfEmployeesFieldName, value);
        ISObjectPredicate bigAccPredicate4 = SObjectPredicate.isEqual(accNumberOfEmployeesField, value);
        ISObjectPredicate nameGTTypePredicate = SObjectPredicate.isEqual(nameFieldName, SObjectFunction.get(typeFieldName));
        ISObjectPredicate nameGTTypePredicate1 = SObjectPredicate.isEqual(accNameField, SObjectFunction.get(accTypeField));
        ISObjectPredicate hasNoParentPredicate = SObjectPredicate.isEqual(SObjectUnaryOperator.getSObject(parentFieldName), SObjectUnaryOperator.constant(null));
        ISObjectPredicate parentIsIdentityPredicate = SObjectPredicate.isEqual(SObjectUnaryOperator.getSObject(parentFieldName));
        // Then
        for (Account acc : input) {
            Integer numOfEmployees = ((Integer) acc.get(numberOfEmployeesFieldName));
            String name = ((String) acc.get(nameFieldName));
            String type = ((String) acc.get(typeFieldName));
            Account parent = (Account) acc.getSObject(parentFieldName);
            Validate.assertEquals(numOfEmployees == value, bigAccPredicate.test(acc));
            Validate.assertEquals(numOfEmployees == value, bigAccPredicate1.test(acc));
            Validate.assertEquals(numOfEmployees == value, bigAccPredicate2.test(acc));
            Validate.assertEquals(numOfEmployees == value, bigAccPredicate3.test(acc));
            Validate.assertEquals(numOfEmployees == value, bigAccPredicate4.test(acc));
            Validate.assertEquals(name == type, nameGTTypePredicate.test(acc));
            Validate.assertEquals(name == type, nameGTTypePredicate1.test(acc));
            Validate.assertEquals(parent == null, hasNoParentPredicate.test(acc));
            Validate.assertEquals(parent == acc, parentIsIdentityPredicate.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.isNotEqual
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
        ISObjectPredicate bigAccPredicate = SObjectPredicate.isNotEqual(SObjectFunction.get(numberOfEmployeesFieldName), SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate1 = SObjectPredicate.isNotEqual(numberOfEmployeesFieldName, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate2 = SObjectPredicate.isNotEqual(accNumberOfEmployeesField, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate3 = SObjectPredicate.isNotEqual(numberOfEmployeesFieldName, value);
        ISObjectPredicate bigAccPredicate4 = SObjectPredicate.isNotEqual(accNumberOfEmployeesField, value);
        ISObjectPredicate nameGTTypePredicate = SObjectPredicate.isNotEqual(nameFieldName, SObjectFunction.get(typeFieldName));
        ISObjectPredicate nameGTTypePredicate1 = SObjectPredicate.isNotEqual(accNameField, SObjectFunction.get(accTypeField));
        ISObjectPredicate hasParentPredicate = SObjectPredicate.isNotEqual(SObjectUnaryOperator.getSObject(parentFieldName), SObjectUnaryOperator.constant(null));
        ISObjectPredicate parentIsNotIdentityPredicate = SObjectPredicate.isNotEqual(SObjectUnaryOperator.getSObject(parentFieldName));
        // Then
        for (Account acc : input) {
            Integer numOfEmployees = ((Integer) acc.get(numberOfEmployeesFieldName));
            String name = ((String) acc.get(nameFieldName));
            String type = ((String) acc.get(typeFieldName));
            Account parent = (Account) acc.getSObject(parentFieldName);
            Validate.assertEquals(numOfEmployees != value, bigAccPredicate.test(acc));
            Validate.assertEquals(numOfEmployees != value, bigAccPredicate1.test(acc));
            Validate.assertEquals(numOfEmployees != value, bigAccPredicate2.test(acc));
            Validate.assertEquals(numOfEmployees != value, bigAccPredicate3.test(acc));
            Validate.assertEquals(numOfEmployees != value, bigAccPredicate4.test(acc));
            Validate.assertEquals(name != type, nameGTTypePredicate.test(acc));
            Validate.assertEquals(name != type, nameGTTypePredicate1.test(acc));
            Validate.assertEquals(parent != null, hasParentPredicate.test(acc));
            Validate.assertEquals(parent != acc, parentIsNotIdentityPredicate.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.isLess
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
        ISObjectPredicate bigAccPredicate = SObjectPredicate.isLess(SObjectFunction.get(numberOfEmployeesFieldName), SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate1 = SObjectPredicate.isLess(numberOfEmployeesFieldName, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate2 = SObjectPredicate.isLess(accNumberOfEmployeesField, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate3 = SObjectPredicate.isLess(numberOfEmployeesFieldName, value);
        ISObjectPredicate bigAccPredicate4 = SObjectPredicate.isLess(accNumberOfEmployeesField, value);
        ISObjectPredicate nameGTTypePredicate = SObjectPredicate.isLess(nameFieldName, SObjectFunction.get(typeFieldName));
        ISObjectPredicate nameGTTypePredicate1 = SObjectPredicate.isLess(accNameField, SObjectFunction.get(accTypeField));
        // Then
        for (Account acc : input) {
            Integer numOfEmployees = ((Integer) acc.get(numberOfEmployeesFieldName));
            String name = ((String) acc.get(nameFieldName));
            String type = ((String) acc.get(typeFieldName));
            Validate.assertEquals(numOfEmployees == null ? true : numOfEmployees < value, bigAccPredicate.test(acc));
            Validate.assertEquals(numOfEmployees == null ? true : numOfEmployees < value, bigAccPredicate1.test(acc));
            Validate.assertEquals(numOfEmployees == null ? true : numOfEmployees < value, bigAccPredicate2.test(acc));
            Validate.assertEquals(numOfEmployees == null ? true : numOfEmployees < value, bigAccPredicate3.test(acc));
            Validate.assertEquals(numOfEmployees == null ? true : numOfEmployees < value, bigAccPredicate4.test(acc));
            Validate.assertEquals(name == null ? true : name < type, nameGTTypePredicate.test(acc));
            Validate.assertEquals(name == null ? true : name < type, nameGTTypePredicate1.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.isLessOrEqual
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
        ISObjectPredicate bigAccPredicate = SObjectPredicate.isLessOrEqual(SObjectFunction.get(numberOfEmployeesFieldName), SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate1 = SObjectPredicate.isLessOrEqual(numberOfEmployeesFieldName, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate2 = SObjectPredicate.isLessOrEqual(accNumberOfEmployeesField, SObjectFunction.constant(value));
        ISObjectPredicate bigAccPredicate3 = SObjectPredicate.isLessOrEqual(numberOfEmployeesFieldName, value);
        ISObjectPredicate bigAccPredicate4 = SObjectPredicate.isLessOrEqual(accNumberOfEmployeesField, value);
        ISObjectPredicate nameGTTypePredicate = SObjectPredicate.isLessOrEqual(nameFieldName, SObjectFunction.get(typeFieldName));
        ISObjectPredicate nameGTTypePredicate1 = SObjectPredicate.isLessOrEqual(accNameField, SObjectFunction.get(accTypeField));
        // Then
        for (Account acc : input) {
            Integer numOfEmployees = ((Integer) acc.get(numberOfEmployeesFieldName));
            String name = ((String) acc.get(nameFieldName));
            String type = ((String) acc.get(typeFieldName));
            Validate.assertEquals(numOfEmployees == null ? true : numOfEmployees <= value, bigAccPredicate.test(acc));
            Validate.assertEquals(numOfEmployees == null ? true : numOfEmployees <= value, bigAccPredicate1.test(acc));
            Validate.assertEquals(numOfEmployees == null ? true : numOfEmployees <= value, bigAccPredicate2.test(acc));
            Validate.assertEquals(numOfEmployees == null ? true : numOfEmployees <= value, bigAccPredicate3.test(acc));
            Validate.assertEquals(numOfEmployees == null ? true : numOfEmployees <= value, bigAccPredicate4.test(acc));
            Validate.assertEquals(name == null ? true : name <= type, nameGTTypePredicate.test(acc));
            Validate.assertEquals(name == null ? true : name <= type, nameGTTypePredicate1.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.isLike
     */
    @IsTest
    static void isLike() {
        // Given
        String likeString = 'T%';
        SObjectField accNameField = IterTestUtils.CONSTS.Account.Name;
        String nameFieldName = 'Name';
        // When
        ISObjectFunction getNameFunction = SObjectFunction.get(accNameField);
        ISObjectPredicate nameStartsWithTPredicate = SObjectPredicate.isLike(getNameFunction, likeString);
        ISObjectPredicate nameStartsWithTPredicate1 = SObjectPredicate.isLike(nameFieldName, likeString);
        ISObjectPredicate nameStartsWithTPredicate2 = SObjectPredicate.isLike(accNameField, likeString);
        // Then
        for (Account acc : input) {
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
            Validate.assertEquals(isLikeName, nameStartsWithTPredicate.test(acc));
            Validate.assertEquals(isLikeName1, nameStartsWithTPredicate1.test(acc));
            Validate.assertEquals(isLikeName, nameStartsWithTPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.isIn
     */
    @IsTest
    static void isIn() {
        // Given
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        String typeNameFieldName = 'Type';
        List<String> types = new List<String>{ 'Customer', 'Competitor' };
        // When
        ISObjectFunction getTypeFunction = SObjectFunction.get(accTypeField);
        ISObjectPredicate typeInPredicate = SObjectPredicate.isIn(getTypeFunction, types);
        ISObjectPredicate typeInPredicate1 = SObjectPredicate.isIn(typeNameFieldName, types);
        ISObjectPredicate typeInPredicate2 = SObjectPredicate.isIn(accTypeField, types);
        // Then
        for (Account acc : input) {
            String type = ((String) acc.get(accTypeField));
            String type1 = ((String) acc.get(typeNameFieldName));
            Validate.assertEquals(types.contains(type), typeInPredicate.test(acc));
            Validate.assertEquals(types.contains(type1), typeInPredicate1.test(acc));
            Validate.assertEquals(types.contains(type), typeInPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.isNotIn
     */
    @IsTest
    static void isNotIn() {
        // Given
        SObjectField accTypeField = IterTestUtils.CONSTS.Account.Type;
        String typeNameFieldName = 'Type';
        List<String> types = new List<String>{ 'Customer', 'Competitor' };
        // When
        ISObjectFunction getTypeFunction = SObjectFunction.get(accTypeField);
        ISObjectPredicate typeNotInPredicate = SObjectPredicate.isNotIn(getTypeFunction, types);
        ISObjectPredicate typeNotInPredicate1 = SObjectPredicate.isNotIn(typeNameFieldName, types);
        ISObjectPredicate typeNotInPredicate2 = SObjectPredicate.isNotIn(accTypeField, types);
        // Then
        for (Account acc : input) {
            String type = ((String) acc.get(accTypeField));
            String type1 = ((String) acc.get(typeNameFieldName));
            Validate.assertEquals(!types.contains(type), typeNotInPredicate.test(acc));
            Validate.assertEquals(!types.contains(type1), typeNotInPredicate1.test(acc));
            Validate.assertEquals(!types.contains(type), typeNotInPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.isNull
     * @see SObjectPredicate.isNotNull
     * @see SObjectPredicate.isEqual
     * @see SObjectPredicate.isNotEqual
     * @see SObjectPredicate.isIn
     * @see SObjectPredicate.isNotIn
     */
    @IsTest
    static void comparisonPredicates() {
        // Given
        List<Account> inputWithNull = new List<Account>(input);
        inputWithNull.add(null);
        List<Account> subset = new List<Account>{ input[0], input[3], input[7] };
        // When
        ISObjectPredicate nullPredicate = SObjectPredicate.isNull();
        ISObjectPredicate notNullPredicate = SObjectPredicate.isNotNull();
        ISObjectPredicate accEqualPredicate = SObjectPredicate.isEqual(input[2]);
        ISObjectPredicate accNotEqualPredicate = SObjectPredicate.isNotEqual(input[2]);
        ISObjectPredicate accInPredicate = SObjectPredicate.isIn(subset);
        ISObjectPredicate accNotInPredicate = SObjectPredicate.isNotIn(subset);
        // When
        for (Account acc : input) {
            Validate.assertEquals(acc == null, nullPredicate.test(acc));
            Validate.assertEquals(acc != null, notNullPredicate.test(acc));
            Validate.assertEquals(acc == input[2], accEqualPredicate.test(acc));
            Validate.assertEquals(acc != input[2], accNotEqualPredicate.test(acc));
            Validate.assertEquals(subset.contains(acc), accInPredicate.test(acc));
            Validate.assertEquals(!subset.contains(acc), accNotInPredicate.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.has
     * @see SObjectPredicate.hasSObject
     * @see SObjectPredicate.hasSObjects
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
        ISObjectPredicate has = SObjectPredicate.has(SObjectFunction.get(accNumberOfEmployeesField));
        ISObjectPredicate has1 = SObjectPredicate.has(accNumberOfEmployeesField);
        ISObjectPredicate has2 = SObjectPredicate.has(numberOfEmployeesFieldName);
        ISObjectPredicate hasSObject = SObjectPredicate.hasSObject(SObjectUnaryOperator.getSObject(parentFieldName));
        ISObjectPredicate hasSObject1 = SObjectPredicate.hasSObject(accParentField);
        ISObjectPredicate hasSObject2 = SObjectPredicate.hasSObject(parentFieldName);
        ISObjectPredicate hasSObjects = SObjectPredicate.hasSObjects(conAccountIdField);
        ISObjectPredicate hasSObjects1 = SObjectPredicate.hasSObjects(accountsFieldName);
        // When
        for (Account acc : input) {
            Validate.assertEquals(acc.get(accNumberOfEmployeesField) != null, has.test(acc));
            Validate.assertEquals(acc.get(accNumberOfEmployeesField) != null, has1.test(acc));
            Validate.assertEquals(acc.get(numberOfEmployeesFieldName) != null, has2.test(acc));
            Validate.assertEquals(acc.getSObject(parentFieldName) != null, hasSObject.test(acc));
            Validate.assertEquals(acc.getSObject(accParentField) != null, hasSObject1.test(acc));
            Validate.assertEquals(acc.getSObject(parentFieldName) != null, hasSObject2.test(acc));
            Validate.assertEquals(acc.getSObjects(accountsFieldName) != null, hasSObjects1.test(acc));
            Validate.assertEquals(acc.getSObjects(accountsFieldName) != null, hasSObjects.test(acc));
        }
    }

    /**
     * @see SObjectPredicate.hasErrors
     * @see SObjectPredicate.isClone
     * @see SObjectPredicate.isSet
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
        input[0].addError(error);
        input[4].addError(error);
        input[6].addError(error);
        input[8] = input[7].clone();
        ISObjectPredicate hasErrorsPredicate = SObjectPredicate.hasErrors();
        ISObjectPredicate clonePredicate = SObjectPredicate.isClone();
        ISObjectPredicate setTypePredicate = SObjectPredicate.isSet(typeFieldName);
        ISObjectPredicate setTypePredicate1 = SObjectPredicate.isSet(accTypeField);
        ISObjectPredicate setParentTypePredicate = SObjectPredicate.isSet(parentTypeFieldName);
        ISObjectPredicate setParentTypePredicateSafe = SObjectPredicate.isSet(parentTypeFieldNameSafe);
        // Then
        for (Account acc : input) {
            Validate.assertEquals(acc.hasErrors(), hasErrorsPredicate.test(acc));
            Validate.assertEquals(acc.isClone(), clonePredicate.test(acc));
            Validate.assertEquals(acc.isSet(typeFieldName), setTypePredicate.test(acc));
            Validate.assertEquals(acc.isSet(accTypeField), setTypePredicate1.test(acc));
            Validate.assertEquals(acc.getSObject('Parent')?.isSet(accTypeField), setParentTypePredicateSafe.test(acc));
            if (acc.getSObject('Parent') != null) {
                Validate.assertEquals(acc.getSObject('Parent').isSet(accTypeField), setParentTypePredicate.test(acc));
            }
        }
    }

}
