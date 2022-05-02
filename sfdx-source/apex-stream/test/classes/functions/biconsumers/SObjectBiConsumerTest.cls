/**
 * @author O. Berehovskyi
 * @see SObjectBiConsumer
 */
@IsTest(IsParallel = true)
private class SObjectBiConsumerTest {

    private static List<Contact> input = IterTestUtils.generateContacts();

    /**
     * @see SObjectBiConsumer.andThen
     * @see SObjectBiConsumer.compose
     */
    @IsTest
    static void defaultMethods() {
        // Given
        Object constant = true;
        // When
        SObjectBiConsumer setDescFromDepartment = SObjectBiConsumer.set(IterTestUtils.CONSTS.Contact.Description, SObjectFunction.get(IterTestUtils.CONSTS.Contact.Department));
        SObjectBiConsumer setDoNotCall = SObjectBiConsumer.set(IterTestUtils.CONSTS.DO_NOT_CALL, constant);
        ISObjectBiConsumer consumer = setDescFromDepartment.andThen(setDoNotCall);
        ISObjectBiConsumer consumer1 = SObjectBiConsumer.compose(new List<ISObjectBiConsumer>{ setDescFromDepartment, setDoNotCall });
        // Then
        for (Contact con : input) {
            Contact expected = new Contact(Description = con.Department, DoNotCall = true);
            SObject src = IterTestUtils.deepClone(con);
            SObject target = new Contact();
            consumer.accept(src, target);
            Validate.assertEquals(expected, target);
            SObject src1 = IterTestUtils.deepClone(con);
            SObject target1 = new Contact();
            consumer1.accept(src1, target1);
            Validate.assertEquals(expected, target1);
        }
    }

    /**
     * @see SObjectBiConsumer.set
     */
    @IsTest
    static void set() {
        // Given
        Object constant = IterTestUtils.CONSTS.FINANCE;
        // When
        ISObjectBiConsumer setFinanceToDepartment = SObjectBiConsumer.set(IterTestUtils.CONSTS.Contact.Department, constant);
        ISObjectBiConsumer setFinanceToDepartment1 = SObjectBiConsumer.set(IterTestUtils.CONSTS.DEPARTMENT, constant);
        ISObjectBiConsumer setFinanceToDepartment2 = SObjectBiConsumer.set(IterTestUtils.CONSTS.Contact.Department, SObjectFunction.constant(constant));
        ISObjectBiConsumer setFinanceToDepartment3 = SObjectBiConsumer.set(IterTestUtils.CONSTS.DEPARTMENT, SObjectFunction.constant(constant));
        ISObjectBiConsumer setDepartmentFromParent = SObjectBiConsumer.set(IterTestUtils.CONSTS.DEPARTMENT, SObjectFunction.get('Account?.Type'));
        ISObjectBiConsumer setDepartmentFromParentUnsafe = SObjectBiConsumer.set(IterTestUtils.CONSTS.DEPARTMENT, SObjectFunction.get('Account.Type'));
        ISObjectBiConsumer setDescriptionOnParent = SObjectBiConsumer.set('Account?.Description', SObjectFunction.get(IterTestUtils.CONSTS.DEPARTMENT));
        ISObjectBiConsumer setDescriptionOnParentUnsafe = SObjectBiConsumer.set('Account.Description', SObjectFunction.get(IterTestUtils.CONSTS.DEPARTMENT));
        ISObjectBiConsumer setDescriptionAndAccountId = SObjectBiConsumer.set(IterTestUtils.CONSTS.Contact.Description, SObjectFunction.get(IterTestUtils.CONSTS.Contact.Department))
                .andThen(SObjectBiConsumer.set(IterTestUtils.CONSTS.ACCOUNT_ID, SObjectFunction.get('Account?.Id')));
        // Then
        for (Contact con : input) {
            Contact expected = new Contact(Department = IterTestUtils.CONSTS.FINANCE);
            SObject src = IterTestUtils.deepClone(con);
            SObject target = new Contact();
            setFinanceToDepartment.accept(src, target);
            Validate.assertEquals(expected, target);
            SObject src1 = IterTestUtils.deepClone(con);
            SObject target1 = new Contact();
            setFinanceToDepartment1.accept(src1, target1);
            Validate.assertEquals(expected, target1);
            SObject src2 = IterTestUtils.deepClone(con);
            SObject target2 = new Contact();
            setFinanceToDepartment2.accept(src2, target2);
            Validate.assertEquals(expected, target2);
            SObject src3 = IterTestUtils.deepClone(con);
            SObject target3 = new Contact();
            setFinanceToDepartment3.accept(src3, target3);
            Validate.assertEquals(expected, target3);

            Contact expected1 = new Contact(Department = con.Account?.Type);
            SObject src4 = IterTestUtils.deepClone(con);
            SObject target4 = new Contact();
            setDepartmentFromParent.accept(src4, target4);
            Validate.assertEquals(expected1, target4);

            Contact expected2 = new Contact(Account = new Account());
            expected2.getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)?.put(IterTestUtils.CONSTS.DESCRIPTION, con.get(IterTestUtils.CONSTS.DEPARTMENT));
            SObject src5 = IterTestUtils.deepClone(con);
            SObject target5 = new Contact(Account = new Account());
            setDescriptionOnParent.accept(src5, target5);
            Validate.assertEquals(expected2, target5);

            Contact expected3 = new Contact(Description = con.Department, AccountId = con.Account?.Id);
            SObject src6 = IterTestUtils.deepClone(con);
            SObject target6 = new Contact();
            setDescriptionAndAccountId.accept(src6, target6);
            Validate.assertEquals(expected3, target6);
            String expectedException = 'System.NullPointerException';
            try {
                setDepartmentFromParentUnsafe.accept(con, new Contact());
            } catch (Exception exc) {
                Validate.assertEquals(expectedException, exc.getTypeName());
            }
            try {
                setDescriptionOnParentUnsafe.accept(con, new Contact());
            } catch (Exception exc) {
                Validate.assertEquals(expectedException, exc.getTypeName());
            }
        }
    }

    /**
     * @see SObjectBiConsumer.setSObject
     */
    @IsTest
    static void setSObject() {
        // Given
        Account constant = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Account');
        // When
        ISObjectBiConsumer setParentConsumer = SObjectBiConsumer.setSObject(IterTestUtils.CONSTS.Contact.AccountId, constant);
        ISObjectBiConsumer setParentConsumer1 = SObjectBiConsumer.setSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, constant);
        ISObjectBiConsumer setParentConsumerByOperator = SObjectBiConsumer.setSObject(IterTestUtils.CONSTS.Contact.AccountId, new IterTestUtils.TestAccountOperator());
        ISObjectBiConsumer setParentConsumerByOperator1 = SObjectBiConsumer.setSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME, new IterTestUtils.TestAccountOperator());
        ISObjectBiConsumer setGrandParentConsumer = SObjectBiConsumer.setSObject('Account?.Parent', constant);
        // Then
        IterTestUtils.TestAccountOperator testAccountOperator = new IterTestUtils.TestAccountOperator();
        for (Contact con : input) {
            Contact expected = new Contact();
            expected.putSObject(IterTestUtils.CONSTS.Contact.AccountId, constant);
            SObject src = IterTestUtils.deepClone(con);
            SObject target = new Contact();
            setParentConsumer.accept(src, target);
            Validate.assertEquals(expected, target);

            SObject src1 = IterTestUtils.deepClone(con);
            SObject target1 = new Contact();
            setParentConsumer1.accept(src1, target1);
            Validate.assertEquals(expected, target1);

            Contact expected1 = new Contact();
            expected1.putSObject(IterTestUtils.CONSTS.Contact.AccountId, testAccountOperator.apply(con));
            SObject src2 = IterTestUtils.deepClone(con);
            SObject target2 = new Contact();
            setParentConsumerByOperator.accept(src2, target2);
            Validate.assertEquals(expected1, target2);
            SObject src3 = IterTestUtils.deepClone(con);
            SObject target3 = new Contact();
            setParentConsumerByOperator1.accept(src3, target3);
            Validate.assertEquals(expected1, target3);

            Contact expected2 = new Contact();
            expected2.getSObject(IterTestUtils.CONSTS.Account.SOBJECT_NAME)?.putSObject(IterTestUtils.CONSTS.PARENT, constant);
            SObject src4 = IterTestUtils.deepClone(con);
            SObject target4 = new Contact();
            setGrandParentConsumer.accept(src4, target4);
            Validate.assertEquals(expected2, target4);
        }
    }

}
