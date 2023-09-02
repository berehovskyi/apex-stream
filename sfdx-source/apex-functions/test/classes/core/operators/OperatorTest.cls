/**
 * @see Operator
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class OperatorTest {

    private static final List<Contact> CONTACTS = AfTestData.generateContacts2();
    private static final List<Integer> INTS = AfTestData.generateInts();

    /**
     * @see Operator.andThen
     * @see Operator.compose
     * @see Operator.identity
     * @see Operator.constant
     * @see Operator.combine
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void default_sobject() {
        // Given
        Object value = 'Value';
        SObject acc = new Account(Id = AfTestData.generateId(Account.SObjectType));
        SObjectField conAccIdField = Contact.AccountId;
        SObjectField conDepartmentField = Contact.Department;
        SObjectField accDescriptionField = Account.Description;
        String accFieldName = 'Account';
        String accDescriptionFieldName = 'Description';
        SObjectType newSObjectType = Account.SObjectType;
        String nameFieldName = 'Name';
        SObjectField conLastNameField = Contact.Name;
        // When
        IOperator identity = Operator.identity();
        IOperator constant = Operator.constant(acc);
        IOperator op = new AfTestCommons.GetSObjectOperator(conAccIdField)
            .andThen(new AfTestCommons.SetFieldOperator(accDescriptionField, value));
        IOperator operator1 = new AfTestCommons.SetFieldOperator(accDescriptionField, value)
            .compose(new AfTestCommons.GetSObjectOperator(conAccIdField));
        IOperator operator2 = Operator.compose(
            new List<IOperator>{
                new AfTestCommons.GetSObjectOperator(conAccIdField),
                new AfTestCommons.SetFieldOperator(accDescriptionFieldName, value)
            }
        );
        IOperator operator3 = Operator.compose(new AfTestCommons.SetFieldConsumer(conDepartmentField, value));
        IOperator operator4 = Operator.compose(Supplier.of(Account.class));
        IOperator operator5 = Operator.combine(operator4, BiOperator.combine(
            new AfTestCommons.SetFieldBiConsumer(
                nameFieldName, new AfTestCommons.GetFieldFunction(conLastNameField)
            )
        ));
        // Then
        for (Contact con : CONTACTS) {
            Assert.areEqual(con, identity.apply(con));
            Assert.areEqual(acc, constant.apply(con));
            Contact clone = (Contact) AfTestCommons.deepClone(con);
            clone.put(conDepartmentField, value);
            Assert.areEqual(clone, operator3.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(newSObjectType.newSObject(), operator4.apply(AfTestCommons.deepClone(con)));
            SObject sObj = newSObjectType.newSObject();
            sObj.put(nameFieldName, con.get(conLastNameField));
            Assert.areEqual(sObj, operator5.apply(AfTestCommons.deepClone(con)));
            if (con.Account != null) {
                Contact clone1 = (Contact) AfTestCommons.deepClone(con);
                clone1.getSObject(conAccIdField).put(accDescriptionField, value);
                Assert.areEqual(clone1.getSObject(accFieldName), op.apply(AfTestCommons.deepClone(con)));
                Assert.areEqual(clone1.getSObject(conAccIdField), operator1.apply(AfTestCommons.deepClone(con)));
                Assert.areEqual(clone1.getSObject(conAccIdField), operator2.apply(AfTestCommons.deepClone(con)));
            }
        }
    }

    /**
    * @see Operator.andThen
    * @see Operator.compose
    * @see Operator.identity
    * @see Operator.constant
    * @see Operator.combine
    */
    @IsTest
    static void default() {
        // Given
        Integer factor = 2;
        Object constant = '1';
        // When
        IOperator identity = Operator.identity();
        IOperator ofConst = Operator.constant(constant);
        Operator incOperator = new AfTestCommons.AddIntOperator(1);
        Operator x2IntOperator = new AfTestCommons.MultiplyIntOperator(factor);
        IOperator op = incOperator.andThen(x2IntOperator);
        IOperator operator1 = x2IntOperator.compose(incOperator);
        IOperator operator2 = Operator.compose(new List<IOperator>{ incOperator, x2IntOperator });
        // Then
        for (Object o : INTS) {
            Assert.areEqual(o, identity.apply(o));
            Assert.areEqual(constant, ofConst.apply(o));
            Assert.areEqual(((Integer) o) + 1, incOperator.apply(o));
            Assert.areEqual(((Integer) o) * factor, x2IntOperator.apply(o));
            Assert.areEqual((((Integer) o) + 1) * factor, op.apply(o));
            Assert.areEqual((((Integer) o) + 1) * factor, operator1.apply(o));
            Assert.areEqual((((Integer) o) + 1) * factor, operator2.apply(o));
        }
    }

}
