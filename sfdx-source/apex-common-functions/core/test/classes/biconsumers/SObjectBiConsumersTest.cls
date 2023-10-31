/**
 * @see SObjectBiConsumers
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class SObjectBiConsumersTest {

    private static final List<Contact> INPUT = AfTestData.generateContacts();
    
    static {
        new SObjectBiConsumers();
    }
    
    /**
     * @see SObjectBiConsumers.set
     */
    @IsTest
    static void set() {
        // Given
        Object constant = AfTestConsts.FINANCE;
        // When
        IBiConsumer setFinanceToDepartment = SObjectBiConsumers.set(AfTestConsts.Contact.Department, constant);
        IBiConsumer setFinanceToDepartment1 = SObjectBiConsumers.set(AfTestConsts.DEPARTMENT, constant);
        IBiConsumer setFinanceToDepartment2 = SObjectBiConsumers.set(AfTestConsts.Contact.Department, Function.constant(constant));
        IBiConsumer setFinanceToDepartment3 = SObjectBiConsumers.set(AfTestConsts.DEPARTMENT, Function.constant(constant));
        IBiConsumer setDepartmentFromParent = SObjectBiConsumers.set(AfTestConsts.DEPARTMENT, SObjectFunctions.get('Account?.Type'));
        IBiConsumer setDepartmentFromParentUnsafe = SObjectBiConsumers.set(AfTestConsts.DEPARTMENT, SObjectFunctions.get('Account.Type'));
        IBiConsumer setDescriptionOnParent = SObjectBiConsumers.set('Account?.Description', SObjectFunctions.get(AfTestConsts.DEPARTMENT));
        IBiConsumer setDescriptionOnParentUnsafe = SObjectBiConsumers.set('Account.Description', SObjectFunctions.get(AfTestConsts.DEPARTMENT));
        IBiConsumer setDescriptionAndAccountId = SObjectBiConsumers.set(AfTestConsts.Contact.Description, SObjectFunctions.get(AfTestConsts.Contact.Department))
            .andThen(SObjectBiConsumers.set(AfTestConsts.ACCOUNT_ID, SObjectFunctions.get('Account?.Id')));
        // Then
        for (Contact con : INPUT) {
            Contact expected = new Contact(Department = AfTestConsts.FINANCE);
            SObject src = AfTestCommons.deepClone(con);
            SObject target = new Contact();
            setFinanceToDepartment.accept(src, target);
            Assert.areEqual(expected, target);
            SObject src1 = AfTestCommons.deepClone(con);
            SObject target1 = new Contact();
            setFinanceToDepartment1.accept(src1, target1);
            Assert.areEqual(expected, target1);
            SObject src2 = AfTestCommons.deepClone(con);
            SObject target2 = new Contact();
            setFinanceToDepartment2.accept(src2, target2);
            Assert.areEqual(expected, target2);
            SObject src3 = AfTestCommons.deepClone(con);
            SObject target3 = new Contact();
            setFinanceToDepartment3.accept(src3, target3);
            Assert.areEqual(expected, target3);

            Contact expected1 = new Contact(Department = con.Account?.Type);
            SObject src4 = AfTestCommons.deepClone(con);
            SObject target4 = new Contact();
            setDepartmentFromParent.accept(src4, target4);
            Assert.areEqual(expected1, target4);

            Contact expected2 = new Contact(Account = new Account());
            expected2.getSObject(AfTestConsts.Account.SOBJECT_NAME)?.put(AfTestConsts.DESCRIPTION, con.get(AfTestConsts.DEPARTMENT));
            SObject src5 = AfTestCommons.deepClone(con);
            SObject target5 = new Contact(Account = new Account());
            setDescriptionOnParent.accept(src5, target5);
            Assert.areEqual(expected2, target5);

            Contact expected3 = new Contact(Description = con.Department, AccountId = con.Account?.Id);
            SObject src6 = AfTestCommons.deepClone(con);
            SObject target6 = new Contact();
            setDescriptionAndAccountId.accept(src6, target6);
            Assert.areEqual(expected3, target6);
            String expectedException = NullPointerException.class.getName();
            try {
                setDepartmentFromParentUnsafe.accept(con, new Contact());
            } catch (Exception exc) {
                Assert.areEqual(expectedException, exc.getTypeName());
            }
            try {
                setDescriptionOnParentUnsafe.accept(con, new Contact());
            } catch (Exception exc) {
                Assert.areEqual(expectedException, exc.getTypeName());
            }
        }
    }

    /**
     * @see SObjectBiConsumers.setSObject
     */
    @IsTest
    static void setSObject() {
        // Given
        Account constant = new Account(Id = AfTestData.generateId(Account.SObjectType), Name = 'Test Account');
        // When
        IBiConsumer setParentConsumer = SObjectBiConsumers.setSObject(AfTestConsts.Contact.AccountId, constant);
        IBiConsumer setParentConsumer1 = SObjectBiConsumers.setSObject(AfTestConsts.Account.SOBJECT_NAME, constant);
        IBiConsumer setParentConsumerByOperator = SObjectBiConsumers.setSObject(AfTestConsts.Contact.AccountId, new AfTestCommons.TestAccountOperator());
        IBiConsumer setParentConsumerByOperator1 = SObjectBiConsumers.setSObject(AfTestConsts.Account.SOBJECT_NAME, new AfTestCommons.TestAccountOperator());
        IBiConsumer setGrandParentConsumerSafe = SObjectBiConsumers.setSObject('Account?.Parent', constant);
        IBiConsumer setGrandParentConsumer = SObjectBiConsumers.setSObject('Account.Parent', constant);
        // Then
        IOperator testAccountOperator = new AfTestCommons.TestAccountOperator();
        for (Contact con : INPUT) {
            Contact expected = new Contact();
            expected.putSObject(AfTestConsts.Contact.AccountId, constant);
            SObject src = AfTestCommons.deepClone(con);
            SObject target = new Contact();
            setParentConsumer.accept(src, target);
            Assert.areEqual(expected, target);

            SObject src1 = AfTestCommons.deepClone(con);
            SObject target1 = new Contact();
            setParentConsumer1.accept(src1, target1);
            Assert.areEqual(expected, target1);

            Contact expected1 = new Contact();
            expected1.putSObject(AfTestConsts.Contact.AccountId, (SObject) testAccountOperator.apply(con));
            SObject src2 = AfTestCommons.deepClone(con);
            SObject target2 = new Contact();
            setParentConsumerByOperator.accept(src2, target2);
            Assert.areEqual(expected1, target2);
            SObject src3 = AfTestCommons.deepClone(con);
            SObject target3 = new Contact();
            setParentConsumerByOperator1.accept(src3, target3);
            Assert.areEqual(expected1, target3);

            Contact expected2 = new Contact();
            expected2.getSObject(AfTestConsts.Account.SOBJECT_NAME)?.putSObject(AfTestConsts.PARENT, constant);
            SObject src4 = AfTestCommons.deepClone(con);
            SObject target4 = new Contact();
            setGrandParentConsumerSafe.accept(src4, target4);
            Assert.areEqual(expected2, target4);

            SObject src5 = AfTestCommons.deepClone(con);
            SObject target5 = new Contact();
            String expectedException = NullPointerException.class.getName();
            try {
                setGrandParentConsumer.accept(src5, target5);
                Assert.areEqual(expected2, target5);
            } catch (Exception exc) {
                Assert.areEqual(expectedException, exc.getTypeName());
            }
        }
    }
    
}
