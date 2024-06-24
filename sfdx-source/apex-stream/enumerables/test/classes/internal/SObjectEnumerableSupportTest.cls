/**
 * @see SObjectEnumerableSupport
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexAssertionsShouldIncludeMessage, PMD.ApexUnitTestClassShouldHaveRunAs')
private class SObjectEnumerableSupportTest {

    private static final List<Contact> INPUT = AsTestData.generateContacts();
    private static final List<Contact> INPUT1 = AsTestData.generateContacts(false);
    private static final List<Account> INPUT2 = AsTestData.generateAccounts();

    /**
     * @see SObjectEnumerableSupport.set
     */
    @IsTest
    static void set() {
        // Given
        Object constant = AsTestConsts.FINANCE;
        // When
        IConsumer setFinanceToDepartmentConsumer = SObjectEnumerableSupport.set(AsTestConsts.Contact.Department, constant);
        IConsumer setFinanceToDepartmentConsumer1 = SObjectEnumerableSupport.set(AsTestConsts.DEPARTMENT, constant);
        IConsumer setFinanceToDepartmentConsumer2 = SObjectEnumerableSupport.set(AsTestConsts.Contact.Department, Function.constant(constant));
        IConsumer setFinanceToDepartmentConsumer3 = SObjectEnumerableSupport.set(AsTestConsts.DEPARTMENT, Function.constant(constant));
        IConsumer setDepartmentFromParentConsumer = SObjectEnumerableSupport.set(AsTestConsts.DEPARTMENT, SObjectEnumerableSupport.get('Account?.Type'));
        IConsumer setDepartmentFromParentConsumerUnsafe = SObjectEnumerableSupport.set(AsTestConsts.DEPARTMENT, SObjectEnumerableSupport.get('Account.Type'));
        IConsumer setDescriptionOnParentConsumer = SObjectEnumerableSupport.set('Account?.Description', SObjectEnumerableSupport.get(AsTestConsts.DEPARTMENT));
        IConsumer setDescriptionOnParentConsumerUnsafe = SObjectEnumerableSupport.set('Account.Description', SObjectEnumerableSupport.get(AsTestConsts.DEPARTMENT));
        // Then
        for (Contact con : INPUT) {
            SObject clone = AsTestCommons.deepClone(con);
            clone.put(AsTestConsts.Contact.Department, constant);
            SObject cloneToConsume = AsTestCommons.deepClone(con);
            setFinanceToDepartmentConsumer.accept(cloneToConsume);
            SObject cloneToConsume1 = AsTestCommons.deepClone(con);
            setFinanceToDepartmentConsumer1.accept(cloneToConsume1);
            SObject cloneToConsume2 = AsTestCommons.deepClone(con);
            setFinanceToDepartmentConsumer2.accept(cloneToConsume2);
            SObject cloneToConsume3 = AsTestCommons.deepClone(con);
            setFinanceToDepartmentConsumer3.accept(cloneToConsume3);
            Assert.areEqual(clone, cloneToConsume);
            Assert.areEqual(clone, cloneToConsume1);
            Assert.areEqual(clone, cloneToConsume2);
            Assert.areEqual(clone, cloneToConsume3);
            SObject clone1 = AsTestCommons.deepClone(con);
            clone1.put(AsTestConsts.DEPARTMENT, con.getSObject(AsTestConsts.Account.SOBJECT_NAME)?.get(AsTestConsts.TYPE));
            SObject cloneToConsume4 = AsTestCommons.deepClone(con);
            setDepartmentFromParentConsumer.accept(cloneToConsume4);
            Assert.areEqual(clone1, cloneToConsume4);
            SObject clone2 = AsTestCommons.deepClone(con);
            clone2.getSObject(AsTestConsts.Account.SOBJECT_NAME)?.put(AsTestConsts.DESCRIPTION, con.get(AsTestConsts.DEPARTMENT));
            SObject cloneToConsume5 = AsTestCommons.deepClone(con);
            setDescriptionOnParentConsumer.accept(cloneToConsume5);
            Assert.areEqual(clone2, cloneToConsume5);
            String expectedException = NullPointerException.class.getName();
            try {
                setDepartmentFromParentConsumerUnsafe.accept(con);
            } catch (Exception exc) {
                Assert.areEqual(expectedException, exc.getTypeName());
            }
            try {
                setDescriptionOnParentConsumerUnsafe.accept(con);
            } catch (Exception exc) {
                Assert.areEqual(expectedException, exc.getTypeName());
            }
        }
    }

    /**
     * @see SObjectEnumerableSupport.get
     */
    @IsTest
    static void get() {
        // Given
        String fieldName = 'Name';
        SObjectField field = Contact.Name;
        String accountNameSafe = 'Account?.Name';
        String accountName = 'Account.Name';
        // When
        IFunction getName = SObjectEnumerableSupport.get(field);
        IFunction getName1 = SObjectEnumerableSupport.get(fieldName);
        IFunction getParentNameSafe = SObjectEnumerableSupport.get(accountNameSafe);
        Function getParentName = SObjectEnumerableSupport.get(accountName);
        // Then
        for (Contact con : INPUT1) {
            Assert.areEqual(con.get(fieldName), getName.apply(con));
            Assert.areEqual(con.get(field), getName1.apply(con));
            Assert.areEqual(con.getSObject('Account')?.get('Name'), getParentNameSafe.apply(con));
            String actual;
            Exception exc;
            try {
                actual = (String) getParentName.apply(con);
            } catch (Exception ex) {
                exc = ex;
            }
            if (con.getSObject('Account') == null) {
                Assert.areEqual(NullPointerException.class.getName(), exc.getTypeName());
            } else {
                Assert.areEqual(null, exc);
                Assert.areEqual(con.getSObject('Account').get('Name'), actual);
            }
        }
    }

    /**
     * @see SObjectEnumerableSupport.getSObjects
     */
    @IsTest
    static void getSObjects() {
        // Given
        String fieldName = 'Events';
        SObjectField field = Event.WhoId;
        String accountContactsSafe = 'Account?.Contacts';
        String accountContacts = 'Account.Contacts';
        // When
        IFunction getSObjects = SObjectEnumerableSupport.getSObjects(field);
        IFunction getSObjects1 = SObjectEnumerableSupport.getSObjects(fieldName);
        IFunction getParentSObjectsSafe = SObjectEnumerableSupport.getSObjects(accountContactsSafe);
        Function getParentSObjects = SObjectEnumerableSupport.getSObjects(accountContacts);
        // Then
        for (Contact con : INPUT1) {
            Assert.areEqual(con.getSObjects(fieldName), getSObjects.apply(con));
            Assert.areEqual(con.getSObjects(field), getSObjects1.apply(con));
            Assert.areEqual(con.getSObject('Account')?.getSObjects('Contacts'), getParentSObjectsSafe.apply(con));
            List<Contact> actual;
            Exception exc;
            try {
                actual = (List<Contact>) getParentSObjects.apply(con);
            } catch (Exception ex) {
                exc = ex;
            }
            if (con.getSObject('Account') == null) {
                Assert.areEqual(NullPointerException.class.getName(), exc.getTypeName());
            } else {
                Assert.areEqual(null, exc);
                Assert.areEqual(con.getSObject('Account').getSObjects('Contacts'), actual);
            }
        }
    }

    /**
     * @see SObjectEnumerableSupport.getSObject
     */
    @IsTest
    static void getSObject() {
        // Given
        String accFieldName = 'Account';
        SObjectField accIdField = Contact.AccountId;
        String accParentFieldSafe = 'Account?.Parent';
        String accParentField = 'Account.Parent';
        // When
        IOperator getAccount = SObjectEnumerableSupport.getSObject(accFieldName);
        IOperator getAccount1 = SObjectEnumerableSupport.getSObject(accIdField);
        Operator getGrandAccountSafe = SObjectEnumerableSupport.getSObject(accParentFieldSafe);
        Operator getGrandAccount = SObjectEnumerableSupport.getSObject(accParentField);
        // Then
        for (Contact con : INPUT1) {
            Account acc = (Account) con.getSObject(accFieldName);
            Assert.areEqual(acc, getAccount.apply(con));
            Assert.areEqual(acc, getAccount1.apply(con));
            Assert.areEqual(acc?.getSObject('Parent'), getGrandAccountSafe.apply(con));
            Account actual;
            Exception exc;
            try {
                actual = (Account) getGrandAccount.apply(con);
            } catch (Exception ex) {
                exc = ex;
            }
            if (acc == null) {
                Assert.areEqual(NullPointerException.class.getName(), exc.getTypeName());
            } else {
                Assert.areEqual(null, exc);
                Assert.areEqual(acc.getSObject('Parent'), actual);
            }
        }
    }

    /**
     * @see SObjectEnumerableSupport.isEqual
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
        IPredicate bigAccPredicate = EnumerableSupport.isEqual(SObjectEnumerableSupport.get(numberOfEmployeesFieldName), Function.constant(value));
        IPredicate bigAccPredicate1 = SObjectEnumerableSupport.isEqual(numberOfEmployeesFieldName, Function.constant(value));
        IPredicate bigAccPredicate2 = SObjectEnumerableSupport.isEqual(accNumberOfEmployeesField, Function.constant(value));
        IPredicate bigAccPredicate3 = SObjectEnumerableSupport.isEqual(numberOfEmployeesFieldName, value);
        IPredicate bigAccPredicate4 = SObjectEnumerableSupport.isEqual(accNumberOfEmployeesField, value);
        IPredicate nameGTTypePredicate = SObjectEnumerableSupport.isEqual(nameFieldName, SObjectEnumerableSupport.get(typeFieldName));
        IPredicate nameGTTypePredicate1 = SObjectEnumerableSupport.isEqual(accNameField, SObjectEnumerableSupport.get(accTypeField));
        IPredicate hasNoParentPredicate = EnumerableSupport.isEqual(SObjectEnumerableSupport.getSObject(parentFieldName), Operator.constant(null));
        Predicate parentIsIdentityPredicate = EnumerableSupport.isEqual(Function.identity(), SObjectEnumerableSupport.getSObject(parentFieldName));
        // Then
        for (Account acc : INPUT2) {
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
