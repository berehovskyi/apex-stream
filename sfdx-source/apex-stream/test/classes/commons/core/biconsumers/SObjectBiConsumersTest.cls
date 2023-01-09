/**
 * @see SObjectBiConsumers
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectBiConsumersTest {

    private static final List<Contact> INPUT = IterTestUtils.generateContacts();
    
    static {
        new SObjectBiConsumers();
    }
    
    /**
     * @see SObjectBiConsumers.set
     */
    @IsTest
    static void set() {
        // Given
        Object constant = IterTestUtils.CONSTS.FINANCE;
        // When
        ISObjectBiConsumer setFinanceToDepartment = SObjectBiConsumers.set(IterTestUtils.CONSTS.Contact.Department, constant);
        ISObjectBiConsumer setFinanceToDepartment1 = SObjectBiConsumers.set(IterTestUtils.CONSTS.DEPARTMENT, constant);
        ISObjectBiConsumer setFinanceToDepartment2 = SObjectBiConsumers.set(IterTestUtils.CONSTS.Contact.Department, SObjectFunction.constant(constant));
        ISObjectBiConsumer setFinanceToDepartment3 = SObjectBiConsumers.set(IterTestUtils.CONSTS.DEPARTMENT, SObjectFunction.constant(constant));
        ISObjectBiConsumer setDepartmentFromParent = SObjectBiConsumers.set(IterTestUtils.CONSTS.DEPARTMENT, SObjectFunctions.get('Account?.Type'));
        ISObjectBiConsumer setDepartmentFromParentUnsafe = SObjectBiConsumers.set(IterTestUtils.CONSTS.DEPARTMENT, SObjectFunctions.get('Account.Type'));
        ISObjectBiConsumer setDescriptionOnParent = SObjectBiConsumers.set('Account?.Description', SObjectFunctions.get(IterTestUtils.CONSTS.DEPARTMENT));
        ISObjectBiConsumer setDescriptionOnParentUnsafe = SObjectBiConsumers.set('Account.Description', SObjectFunctions.get(IterTestUtils.CONSTS.DEPARTMENT));
        ISObjectBiConsumer setDescriptionAndAccountId = SObjectBiConsumers.set(IterTestUtils.CONSTS.Contact.Description, SObjectFunctions.get(IterTestUtils.CONSTS.Contact.Department))
                .andThen(SObjectBiConsumers.set(IterTestUtils.CONSTS.ACCOUNT_ID, SObjectFunctions.get('Account?.Id')));
        // Then
        for (Contact con : INPUT) {
            Contact expected = new Contact(Department = IterTestUtils.CONSTS.FINANCE);
            SObject src = IterTestUtils.deepClone(con);
            SObject target = new Contact();
            setFinanceToDepartment.accept(src, target);
            Assert.areEqual(expected, target);
            SObject src1 = IterTestUtils.deepClone(con);
            SObject target1 = new Contact();
            setFinanceToDepartment1.accept(src1, target1);
            Assert.areEqual(expected, target1);
            SObject src2 = IterTestUtils.deepClone(con);
            SObject target2 = new Contact();
            setFinanceToDepartment2.accept(src2, target2);
            Assert.areEqual(expected, target2);
            SObject src3 = IterTestUtils.deepClone(con);
            SObject target3 = new Contact();
            setFinanceToDepartment3.accept(src3, target3);
            Assert.areEqual(expected, target3);

            Contact expected1 = new Contact(Department = con.Account?.Type);
            SObject src4 = IterTestUtils.deepClone(con);
            SObject target4 = new Contact();
            setDepartmentFromParent.accept(src4, target4);
            Assert.areEqual(expected1, target4);

            Contact expected2 = new Contact(Account = new Account());
            expected2.getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)?.put(IterTestUtils.CONSTS.DESCRIPTION, con.get(IterTestUtils.CONSTS.DEPARTMENT));
            SObject src5 = IterTestUtils.deepClone(con);
            SObject target5 = new Contact(Account = new Account());
            setDescriptionOnParent.accept(src5, target5);
            Assert.areEqual(expected2, target5);

            Contact expected3 = new Contact(Description = con.Department, AccountId = con.Account?.Id);
            SObject src6 = IterTestUtils.deepClone(con);
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
        Account constant = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Account');
        // When
        ISObjectBiConsumer setParentConsumer = SObjectBiConsumers.setSObject(IterTestUtils.CONSTS.Contact.AccountId, constant);
        ISObjectBiConsumer setParentConsumer1 = SObjectBiConsumers.setSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, constant);
        ISObjectBiConsumer setParentConsumerByOperator = SObjectBiConsumers.setSObject(IterTestUtils.CONSTS.Contact.AccountId, new IterTestUtils.TestAccountOperator());
        ISObjectBiConsumer setParentConsumerByOperator1 = SObjectBiConsumers.setSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, new IterTestUtils.TestAccountOperator());
        ISObjectBiConsumer setGrandParentConsumerSafe = SObjectBiConsumers.setSObject('Account?.Parent', constant);
        ISObjectBiConsumer setGrandParentConsumer = SObjectBiConsumers.setSObject('Account.Parent', constant);
        // Then
        IterTestUtils.TestAccountOperator testAccountOperator = new IterTestUtils.TestAccountOperator();
        for (Contact con : INPUT) {
            Contact expected = new Contact();
            expected.putSObject(IterTestUtils.CONSTS.Contact.AccountId, constant);
            SObject src = IterTestUtils.deepClone(con);
            SObject target = new Contact();
            setParentConsumer.accept(src, target);
            Assert.areEqual(expected, target);

            SObject src1 = IterTestUtils.deepClone(con);
            SObject target1 = new Contact();
            setParentConsumer1.accept(src1, target1);
            Assert.areEqual(expected, target1);

            Contact expected1 = new Contact();
            expected1.putSObject(IterTestUtils.CONSTS.Contact.AccountId, testAccountOperator.apply(con));
            SObject src2 = IterTestUtils.deepClone(con);
            SObject target2 = new Contact();
            setParentConsumerByOperator.accept(src2, target2);
            Assert.areEqual(expected1, target2);
            SObject src3 = IterTestUtils.deepClone(con);
            SObject target3 = new Contact();
            setParentConsumerByOperator1.accept(src3, target3);
            Assert.areEqual(expected1, target3);

            Contact expected2 = new Contact();
            expected2.getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)?.putSObject(IterTestUtils.CONSTS.PARENT, constant);
            SObject src4 = IterTestUtils.deepClone(con);
            SObject target4 = new Contact();
            setGrandParentConsumerSafe.accept(src4, target4);
            Assert.areEqual(expected2, target4);

            SObject src5 = IterTestUtils.deepClone(con);
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
