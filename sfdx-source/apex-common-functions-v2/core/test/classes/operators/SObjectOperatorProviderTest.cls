/**
 * @see SObjectOperatorProvider
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
private class SObjectOperatorProviderTest {
    private static final List<Contact> INPUT = AfTestData.generateContacts2();
    private static final SObjectOperatorProvider OP = new SObjectOperatorProvider();

    /**
     * @see SObjectOperatorProvider.set
     */
    @IsTest
    static void set() {
        // Given
        SObjectField conDescriptionField = AfTestConsts.Contact.Description;
        SObjectField conDepartmentField = AfTestConsts.Contact.Department;
        String conDescriptionFieldName = AfTestConsts.DESCRIPTION;
        String conDepartmentFieldName = AfTestConsts.DEPARTMENT;
        Object constant = 'Value';
        // When
        IOperator setDescriptionFromDepartment = OP.set(conDescriptionField).val(new SObjectFunctionProvider().get(conDepartmentField));
        IOperator setDescriptionFromDepartment1 = OP.set(conDescriptionFieldName).val(new SObjectFunctionProvider().get(conDepartmentFieldName));
        IOperator setDescriptionFromDepartment2 = OP.set(conDescriptionField).val(conDepartmentField);
        IOperator setDescriptionFromDepartment3 = OP.set(conDescriptionField).val(conDepartmentFieldName);
        IOperator setDescriptionValue = OP.set(conDescriptionField).var(constant);
        IOperator setDescriptionValue1 = OP.set(conDescriptionFieldName).var(constant);
        // Then
        for (Contact con : INPUT) {
            SObject clone = AfTestCommons.deepClone(con);
            clone.put(conDescriptionField, clone.get(conDepartmentField));
            Assert.areEqual(clone, setDescriptionFromDepartment.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone, setDescriptionFromDepartment1.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone, setDescriptionFromDepartment2.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone, setDescriptionFromDepartment3.apply(AfTestCommons.deepClone(con)));
            SObject clone1 = AfTestCommons.deepClone(con);
            clone1.put(conDescriptionField, constant);
            Assert.areEqual(clone1, setDescriptionValue.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone1, setDescriptionValue1.apply(AfTestCommons.deepClone(con)));
        }
    }

    /**
     * @see SObjectOperatorProvider.setSObject
     */
    @IsTest
    static void setSObject() {
        // Given
        Account parent = new Account(Id = AfTestData.generateId(Account.SObjectType), Name = 'Parent Account');
        SObjectField conAccountIdField = AfTestConsts.Contact.AccountId;
        String conAccountFieldName = AfTestConsts.Account.SOBJECT_NAME;
        // When
        IOperator setSObjectOperator = OP.setSObject(conAccountIdField).val(Operator.constant(parent));
        IOperator setSObjectOperator1 = OP.setSObject(conAccountFieldName).val(Operator.constant(parent));
        IOperator setSObjectOperator2 = OP.setSObject(conAccountIdField).var(parent);
        IOperator setSObjectOperator3 = OP.setSObject(conAccountFieldName).var(parent);
        IOperator setGrandParentOperator = OP.setSObject('Account.Parent').var(parent);
        IOperator setGrandParentOperatorSafe = OP.setSObject('Account?.Parent').var(parent);
        IOperator setNullAccountOperator = OP.setSObject(conAccountFieldName).val('CreatedBy');
        IOperator setNullAccountOperator1 = OP.setSObject(conAccountIdField).val(Contact.CreatedById);
        // Then
        for (Contact con : INPUT) {
            SObject clone = AfTestCommons.deepClone(con);
            clone.putSObject(conAccountIdField, parent);
            Assert.areEqual(clone, setSObjectOperator.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone, setSObjectOperator1.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone, setSObjectOperator2.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone, setSObjectOperator3.apply(AfTestCommons.deepClone(con)));
            SObject clone1 = AfTestCommons.deepClone(con);
            clone1.getSObject(AfTestConsts.Account.SOBJECT_NAME)?.putSObject(AfTestConsts.PARENT, parent);
            Assert.areEqual(clone1, setGrandParentOperatorSafe.apply(AfTestCommons.deepClone(con)));
            SObject clone2 = AfTestCommons.deepClone(con);
            clone2.putSObject(conAccountIdField, null);
            Assert.areEqual(clone2, setNullAccountOperator.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone2, setNullAccountOperator1.apply(AfTestCommons.deepClone(con)));
            if (con.getSObject(AfTestConsts.Account.SOBJECT_NAME) == null) {
                SObject cloneToConsume7 = AfTestCommons.deepClone(con);
                Exception exc;
                try {
                    setGrandParentOperator.apply(cloneToConsume7);
                } catch (NullPointerException ex) {
                    exc = ex;
                }
                Assert.areEqual(NullPointerException.class.getName(), exc.getTypeName());
            }
        }
    }

    /**
     * @see SObjectOperatorProvider.setSObjects
     */
    @IsTest
    static void setSObjects() {
        // Given
        List<Event> children = new List<Event>{
            new Event(Id = AfTestData.generateId(Event.SObjectType)),
            new Event(Id = AfTestData.generateId(Event.SObjectType))
        };
        List<Event> children1 = new List<Event>();
        SObjectField eventContactIdField = Event.WhoId;
        String eventsFieldName = 'Events';
        // When
        IOperator setSObjectsOperator = OP.setSObjects(eventContactIdField).val(Function.constant(children));
        IOperator setSObjectsOperator1 = OP.setSObjects(eventsFieldName).val(Function.constant(children));
        IOperator setSObjectsOperator2 = OP.setSObjects(eventContactIdField).var(children);
        IOperator setSObjectsOperator3 = OP.setSObjects(eventsFieldName).var(children);
        IOperator setSObjectsOperator4 = OP.setSObjects(eventsFieldName).var(children1);
        IOperator setNullSObjectsOperator = OP.setSObjects(eventsFieldName).val('Cases');
        IOperator setNullSObjectsOperator1 = OP.setSObjects(eventContactIdField).val(Case.ContactId);
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(children, ((SObject) setSObjectsOperator.apply(AfTestCommons.deepClone(con))).getSObjects(eventsFieldName));
            Assert.areEqual(children, ((SObject) setSObjectsOperator1.apply(AfTestCommons.deepClone(con))).getSObjects(eventContactIdField));
            Assert.areEqual(children, ((SObject) setSObjectsOperator2.apply(AfTestCommons.deepClone(con))).getSObjects(eventsFieldName));
            Contact actual = (Contact) setSObjectsOperator3.apply(AfTestCommons.deepClone(con));
            Assert.areEqual(children, actual.getSObjects(eventContactIdField));
            Assert.areEqual(null, ((SObject) setSObjectsOperator4.apply(AfTestCommons.deepClone(actual))).getSObjects(eventsFieldName));
            Assert.areEqual(null, ((SObject) setNullSObjectsOperator.apply(AfTestCommons.deepClone(con))).getSObjects(eventsFieldName));
            Assert.areEqual(null, ((SObject) setNullSObjectsOperator1.apply(AfTestCommons.deepClone(con))).getSObjects(eventsFieldName));
        }
    }
}
