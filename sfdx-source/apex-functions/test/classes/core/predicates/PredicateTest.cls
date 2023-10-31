/**
 * @see Predicate
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class PredicateTest {

    private static final List<Account> ACCOUNTS = AfTestData.generateAccounts();
    private static final List<AfPerson> PEOPLE = AfTestData.generatePersons2();

    /**
     * @see Predicate.orElse
     * @see Predicate.andAlso
     * @see Predicate.negate
     * @see Predicate.always
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void default_sobject() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        Object value2 = 'Competitor';
        SObjectField accNumOfEmployeesField = Account.NumberOfEmployees;
        SObjectField accTypeField = Account.Type;
        Boolean value3 = true;
        // When
        IPredicate alwaysPredicate = Predicate.always(value3);
        Predicate bigAccPredicate = new AfTestCommons.IsGreaterPredicate(accNumOfEmployeesField, value);
        Predicate customerPredicate = new AfTestCommons.IsEqualPredicate(accTypeField, value1);
        Predicate competitorPredicate = new AfTestCommons.IsEqualPredicate(accTypeField, value2);
        IPredicate bigCustomerPredicate = bigAccPredicate.andAlso(customerPredicate);
        IPredicate bigAccountOrCustomerPredicate = bigAccPredicate.orElse(customerPredicate);
        IPredicate notBigCustomerPredicate = bigAccPredicate.negate();
        IPredicate bigCustomerOrAnyCompetitorPredicate
            = bigAccPredicate.andAlso(customerPredicate).orElse(competitorPredicate); // (1 AND 2) OR 3
        IPredicate bigCustomerOrBigCompetitorPredicate
            = bigAccPredicate.andAlso(customerPredicate.orElse(competitorPredicate)); // 1 AND (2 OR 3)
        // Then
        for (Account acc : ACCOUNTS) {
            Boolean isNumOfEmployeesGreater = (Integer) acc.get(accNumOfEmployeesField) > value;
            Boolean isAccTypeCustomer = acc.get(accTypeField) == value1;
            Boolean isAccTypeCompetitor = acc.get(accTypeField) == value2;
            Assert.areEqual(value3, alwaysPredicate.test(acc));
            Assert.areEqual(isNumOfEmployeesGreater, bigAccPredicate.test(acc));
            Assert.areEqual(isAccTypeCustomer, customerPredicate.test(acc));
            Assert.areEqual(isAccTypeCompetitor, competitorPredicate.test(acc));
            Assert.areEqual(isNumOfEmployeesGreater && isAccTypeCustomer, bigCustomerPredicate.test(acc));
            Assert.areEqual(isNumOfEmployeesGreater || isAccTypeCustomer, bigAccountOrCustomerPredicate.test(acc));
            Assert.areEqual(!(isNumOfEmployeesGreater), notBigCustomerPredicate.test(acc));
            Assert.areEqual(
                (isNumOfEmployeesGreater && isAccTypeCustomer) || isAccTypeCompetitor,
                bigCustomerOrAnyCompetitorPredicate.test(acc)
            );
            Assert.areEqual(
                isNumOfEmployeesGreater && (isAccTypeCustomer || isAccTypeCompetitor),
                bigCustomerOrBigCompetitorPredicate.test(acc)
            );
        }
    }

    /**
     * @see Predicate.some
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void some_sobject() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        SObjectField accNumOfEmployeesField = Account.NumberOfEmployees;
        SObjectField accTypeField = Account.Type;
        // When
        Predicate bigAccPredicate = new AfTestCommons.IsGreaterPredicate(accNumOfEmployeesField, value);
        Predicate customerPredicate = new AfTestCommons.IsEqualPredicate(accTypeField, value1);
        IPredicate bigAccOrCustomer = Predicate.some(new List<IPredicate>{ bigAccPredicate, customerPredicate });
        // Then
        for (Account acc : ACCOUNTS) {
            Assert.areEqual(
                (Integer) acc.get(accNumOfEmployeesField) > value || acc.get(accTypeField) == value1,
                bigAccOrCustomer.test(acc)
            );
        }
    }

    /**
     * @see Predicate.every
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void every_sobject() {
        // Given
        Integer value = 100;
        Object value1 = 'Customer';
        SObjectField accNumOfEmployeesField = Account.NumberOfEmployees;
        SObjectField accTypeField = Account.Type;
        // When
        Predicate bigAccPredicate = new AfTestCommons.IsGreaterPredicate(accNumOfEmployeesField, value);
        Predicate customerPredicate = new AfTestCommons.IsEqualPredicate(accTypeField, value1);
        IPredicate bigAccAndCustomer = Predicate.every(new List<IPredicate>{ bigAccPredicate, customerPredicate });
        // Then
        for (Account acc : ACCOUNTS) {
            Assert.areEqual(
                (Integer) acc.get(accNumOfEmployeesField) > value && acc.get(accTypeField) == value1,
                bigAccAndCustomer.test(acc)
            );
        }
    }

    /**
     * @see Predicate.negate
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void negate_sobject() {
        // Given
        Integer value = 100;
        SObjectField accNumOfEmployeesField = Account.NumberOfEmployees;
        // When
        Predicate bigAccPredicate = new AfTestCommons.IsGreaterPredicate(accNumOfEmployeesField, value);
        IPredicate notBigAccPredicate = Predicate.negate(bigAccPredicate);
        // Then
        for (Account acc : ACCOUNTS) {
            Assert.areEqual(!((Integer) acc.get(accNumOfEmployeesField) > value), notBigAccPredicate.test(acc));
        }
    }

    /**
     * @see Predicate.compose
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void compose_sobject() {
        // Given
        String value = 'T';
        SObjectField accNameField = Account.Name;
        SObjectField accBillingLatitudeField = Account.BillingLatitude;
        // When
        IFunction getNameFunction = new AfTestCommons.GetFieldFunction(accNameField);
        IPredicate startsWithTPredicate = new AfTestCommons.StartsWith(value);
        IPredicate nameStartsWithTPredicate = Predicate.compose(getNameFunction, startsWithTPredicate);
        IFunction getLatFunction = new AfTestCommons.GetFieldFunction(accBillingLatitudeField);
        IPredicate positivePredicate = new AfTestCommons.IsGreaterPredicate(Function.identity(), Function.constant(0));
        IPredicate latIsPositivePredicate = Predicate.compose(getLatFunction, positivePredicate);
        // Then
        for (Account acc : ACCOUNTS) {
            Assert.areEqual(((String) acc.get(accNameField)).startsWith(value), nameStartsWithTPredicate.test(acc));
            Assert.areEqual(((Double) acc.get(accBillingLatitudeField)) > 0, latIsPositivePredicate.test(acc));
        }
    }

    /**
     * @see Predicate.orElse
     * @see Predicate.andAlso
     * @see Predicate.negate
     * @see Predicate.always
     */
    @IsTest
    static void default() {
        // Given
        Integer value = 18;
        String j = 'J';
        Boolean value1 = true;
        // When
        IPredicate alwaysPredicate = Predicate.always(value1);
        IFunction getAgeFunction = new AfTestCommons.GetAgeFunction();
        IFunction getNameFunction = new AfTestCommons.GetNameFunction();
        IFunction valueFunction = Function.constant(value);
        Predicate activePredicate = new AfTestCommons.IsActivePredicate();
        Predicate adultPredicate = new AfTestCommons.IsGreaterPredicate(getAgeFunction, valueFunction).orElse(new AfTestCommons.IsEqualPredicate(getAgeFunction, valueFunction));
        Predicate startsWithJPredicate = new AfTestCommons.StartsWith(j);
        Predicate nameStartsWithJPredicate = Predicate.compose(getNameFunction, startsWithJPredicate);
        IPredicate adultActivePredicate = adultPredicate.andAlso(activePredicate);
        IPredicate adultOrActivePredicate = adultPredicate.orElse(activePredicate);
        IPredicate notAdultPredicate = adultPredicate.negate();
        IPredicate adultActiveOrWithNameStartsWithJPredicate
            = adultPredicate.andAlso(activePredicate).orElse(nameStartsWithJPredicate); // (1 AND 2) OR 3
        IPredicate adultActiveWithNameStartsWithJPredicate
            = adultPredicate.andAlso(activePredicate.orElse(nameStartsWithJPredicate)); // 1 AND (2 OR 3)
        // Then
        for (AfPerson person : PEOPLE) {
            Assert.areEqual(value1, alwaysPredicate.test(person));
            Assert.areEqual(person.getAge() >= value, adultPredicate.test(person));
            Assert.areEqual(person.isActive(), activePredicate.test(person));
            Assert.areEqual(person.getAge() >= value && person.isActive(), adultActivePredicate.test(person));
            Assert.areEqual(
                person.getAge() >= value && person.isActive(), 
                adultPredicate.andAlso(activePredicate).test(person)
            );
            Assert.areEqual(person.getAge() >= value || person.isActive(), adultOrActivePredicate.test(person));
            Assert.areEqual(!(person.getAge() >= value), notAdultPredicate.test(person));
            Assert.areEqual(
                person.getAge() >= value && person.isActive() || person.getName().startsWith(j), 
                adultActiveOrWithNameStartsWithJPredicate.test(person)
            );
            Assert.areEqual(
                person.getAge() >= value && (person.isActive() || person.getName().startsWith(j)), 
                adultActiveWithNameStartsWithJPredicate.test(person)
            );
        }
    }

    /**
     * @see Predicate.some
     */
    @IsTest
    static void some() {
        // Given
        Integer value = 18;
        // When
        IFunction getAgeFunction = new AfTestCommons.GetAgeFunction();
        IFunction valueFunction = Function.constant(value);
        Predicate activePredicate = new AfTestCommons.IsActivePredicate();
        Predicate adultPredicate = new AfTestCommons.IsGreaterPredicate(getAgeFunction, valueFunction).orElse(new AfTestCommons.IsEqualPredicate(getAgeFunction, valueFunction));
        // Then
        for (AfPerson person : PEOPLE) {
            Assert.areEqual(
                person.getAge() >= value || person.isActive(), 
                Predicate.some(new List<IPredicate>{ adultPredicate, activePredicate }).test(person)
            );
        }
    }

    /**
     * @see Predicate.every
     */
    @IsTest
    static void every() {
        // Given
        Integer value = 18;
        // When
        IFunction getAgeFunction = new AfTestCommons.GetAgeFunction();
        IFunction valueFunction = Function.constant(value);
        Predicate activePredicate = new AfTestCommons.IsActivePredicate();
        Predicate adultPredicate = new AfTestCommons.IsGreaterPredicate(getAgeFunction, valueFunction).orElse(new AfTestCommons.IsEqualPredicate(getAgeFunction, valueFunction));
        // Then
        for (AfPerson person : PEOPLE) {
            Assert.areEqual(
                person.getAge() >= value && person.isActive(), 
                Predicate.every(new List<IPredicate>{ adultPredicate, activePredicate }).test(person)
            );
        }
    }

    /**
     * @see Predicate.negate
     */
    @IsTest
    static void negate() {
        // Given
        Integer value = 18;
        // When
        IFunction getAgeFunction = new AfTestCommons.GetAgeFunction();
        IFunction valueFunction = Function.constant(value);
        Predicate adultPredicate = new AfTestCommons.IsGreaterPredicate(getAgeFunction, valueFunction).orElse(new AfTestCommons.IsEqualPredicate(getAgeFunction, valueFunction));
        // Then
        for (AfPerson person : PEOPLE) {
            Assert.areEqual(!(person.getAge() >= value), Predicate.negate(adultPredicate).test(person));
        }
    }

    /**
     * @see Predicate.compose
     */
    @IsTest
    static void compose() {
        // Given
        Integer value = 18;
        // When
        IFunction getAgeFunction = new AfTestCommons.GetAgeFunction();
        Predicate agePredicate = Predicate.compose(getAgeFunction, new AfTestCommons.IsGreaterPredicate(Function.identity(), Function.constant(value)));
        // Then
        for (AfPerson person : PEOPLE) {
            Assert.areEqual(person.getAge() > value, agePredicate.test(person));
        }
    }

}
