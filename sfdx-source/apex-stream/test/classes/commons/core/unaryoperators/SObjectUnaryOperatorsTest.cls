/**
 * @see SObjectUnaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectUnaryOperatorsTest {

    private static final List<Contact> INPUT = IterTestUtils.generateContacts2();

    static {
        new SObjectUnaryOperators();
    }

    /**
     * @see SObjectUnaryOperators.newSObject
     */
    @IsTest
    static void newSObject() {
        // Given
        SObjectType accSObjectType = Account.SObjectType;
        // When
        ISObjectUnaryOperator newAccountOperator = SObjectUnaryOperators.newSObject(accSObjectType);
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(accSObjectType.newSObject(), newAccountOperator.apply(con));
        }
    }

    /**
     * @see SObjectUnaryOperators.getSObject
     */
    @IsTest
    static void getSObject() {
        // Given
        String accFieldName = 'Account';
        SObjectField accIdField = Contact.AccountId;
        // When
        ISObjectUnaryOperator getAccount = SObjectUnaryOperators.getSObject(accFieldName);
        ISObjectUnaryOperator getAccount1 = SObjectUnaryOperators.getSObject(accIdField);
        ISObjectUnaryOperator getGrandAccount = SObjectUnaryOperators.getSObject('Account?.Parent');
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(con.getSObject(accFieldName), getAccount.apply(con));
            Assert.areEqual(con.getSObject(accFieldName), getAccount1.apply(con));
            Assert.areEqual(con.getSObject(accFieldName)?.getSObject('Parent'), getGrandAccount.apply(con));
        }
    }

    /**
     * @see SObjectUnaryOperators.newSObject
     */
    @IsTest
    static void toSObject() {
        // Given
        SObjectType leadSObjectType = Lead.SObjectType;
        SObjectField leadLastNameField = Lead.LastName;
        String leadLastNameFieldName = 'LastName';
        SObjectField conLastNameField = Contact.LastName;
        Object constant = 'Value';
        // When
        ISObjectUnaryOperator convertToLead = SObjectUnaryOperators.newSObject(leadSObjectType, SObjectBinaryOperator.forBiConsumer(SObjectBiConsumers.set(leadLastNameField, SObjectFunctions.get(conLastNameField))));
        ISObjectUnaryOperator convertToLead1 = SObjectUnaryOperators.newSObject(leadSObjectType, leadLastNameField, SObjectFunctions.get(conLastNameField));
        ISObjectUnaryOperator convertToLead2 = SObjectUnaryOperators.newSObject(leadSObjectType, leadLastNameFieldName, SObjectFunctions.get(leadLastNameFieldName));
        ISObjectUnaryOperator convertToLead5 = SObjectUnaryOperators.newSObject(leadSObjectType, leadLastNameField, constant);
        ISObjectUnaryOperator convertToLead6 = SObjectUnaryOperators.newSObject(leadSObjectType, leadLastNameFieldName, constant);
        // Then
        for (Contact con : INPUT) {
            SObject newSObject = leadSObjectType.newSObject();
            newSObject.put(leadLastNameField, con.get(conLastNameField));
            Assert.areEqual(newSObject, convertToLead.apply(con));
            Assert.areEqual(newSObject, convertToLead1.apply(con));
            Assert.areEqual(newSObject, convertToLead2.apply(con));
            SObject newSObject1 = leadSObjectType.newSObject();
            newSObject1.put(leadLastNameField, constant);
            Assert.areEqual(newSObject1, convertToLead5.apply(con));
            Assert.areEqual(newSObject1, convertToLead6.apply(con));
        }
    }

    /**
     * @see SObjectUnaryOperators.set
     */
    @IsTest
    static void set() {
        // Given
        SObjectField conDescriptionField = Contact.Description;
        SObjectField conDepartmentField = Contact.Department;
        String conDescriptionFieldName = 'Description';
        String conDepartmentFieldName = 'Department';
        Object constant = 'Value';
        // When
        ISObjectUnaryOperator setDescriptionFromDepartment = SObjectUnaryOperators.set(conDescriptionField, SObjectFunctions.get(conDepartmentField));
        ISObjectUnaryOperator setDescriptionFromDepartment1 = SObjectUnaryOperators.set(conDescriptionFieldName, SObjectFunctions.get(conDepartmentFieldName));
        ISObjectUnaryOperator setDescriptionValue = SObjectUnaryOperators.set(conDescriptionField, constant);
        ISObjectUnaryOperator setDescriptionValue1 = SObjectUnaryOperators.set(conDescriptionFieldName, constant);
        // Then
        for (Contact con : INPUT) {
            SObject clone = IterTestUtils.deepClone(con);
            clone.put(conDescriptionField, clone.get(conDepartmentField));
            Assert.areEqual(clone, setDescriptionFromDepartment.apply(IterTestUtils.deepClone(con)));
            Assert.areEqual(clone, setDescriptionFromDepartment1.apply(IterTestUtils.deepClone(con)));
            SObject clone1 = IterTestUtils.deepClone(con);
            clone1.put(conDescriptionField, constant);
            Assert.areEqual(clone1, setDescriptionValue.apply(IterTestUtils.deepClone(con)));
            Assert.areEqual(clone1, setDescriptionValue1.apply(IterTestUtils.deepClone(con)));
        }
    }

    /**
     * @see SObjectUnaryOperators.setSObject
     */
    @IsTest
    static void setSObject() {
        // Given
        Account parent = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Parent Account');
        SObjectField conAccountIdField = Contact.AccountId;
        String conAccountFieldName = 'Account';
        // When
        ISObjectUnaryOperator setSObjectOperator = SObjectUnaryOperators.setSObject(conAccountIdField, SObjectUnaryOperator.constant(parent));
        ISObjectUnaryOperator setSObjectOperator1 = SObjectUnaryOperators.setSObject(conAccountFieldName, SObjectUnaryOperator.constant(parent));
        ISObjectUnaryOperator setSObjectOperator2 = SObjectUnaryOperators.setSObject(conAccountIdField, parent);
        ISObjectUnaryOperator setSObjectOperator3 = SObjectUnaryOperators.setSObject(conAccountFieldName, parent);
        // Then
        for (Contact con : INPUT) {
            SObject clone = IterTestUtils.deepClone(con);
            clone.putSObject(conAccountIdField, parent);
            Assert.areEqual(clone, setSObjectOperator.apply(IterTestUtils.deepClone(con)));
            Assert.areEqual(clone, setSObjectOperator1.apply(IterTestUtils.deepClone(con)));
            Assert.areEqual(clone, setSObjectOperator2.apply(IterTestUtils.deepClone(con)));
            Assert.areEqual(clone, setSObjectOperator3.apply(IterTestUtils.deepClone(con)));
        }
    }

    /**
     * @see SObjectUnaryOperators.setSObjects
     */
    @IsTest
    static void setSObjects() {
        // Given
        List<Asset> children = new List<Asset>{
                new Asset(Id = IterTestUtils.generateId(Asset.SObjectType)),
                new Asset(Id = IterTestUtils.generateId(Asset.SObjectType))
        };
        List<Asset> children1 = new List<Asset>();
        SObjectField assetContactIdField = Asset.ContactId;
        String assetsFieldName = 'Assets';
        // When
        ISObjectUnaryOperator setSObjectsOperator = SObjectUnaryOperators.setSObjects(assetContactIdField, SObjectFunction.constant(children));
        ISObjectUnaryOperator setSObjectsOperator1 = SObjectUnaryOperators.setSObjects(assetsFieldName, SObjectFunction.constant(children));
        ISObjectUnaryOperator setSObjectsOperator2 = SObjectUnaryOperators.setSObjects(assetContactIdField, children);
        ISObjectUnaryOperator setSObjectsOperator3 = SObjectUnaryOperators.setSObjects(assetsFieldName, children);
        ISObjectUnaryOperator setSObjectsOperator4 = SObjectUnaryOperators.setSObjects(assetsFieldName, children1);
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(children, setSObjectsOperator.apply(IterTestUtils.deepClone(con)).getSObjects(assetsFieldName));
            Assert.areEqual(children, setSObjectsOperator1.apply(IterTestUtils.deepClone(con)).getSObjects(assetContactIdField));
            Assert.areEqual(children, setSObjectsOperator2.apply(IterTestUtils.deepClone(con)).getSObjects(assetsFieldName));
            Contact actual = (Contact) setSObjectsOperator3.apply(IterTestUtils.deepClone(con));
            Assert.areEqual(children, actual.getSObjects(assetContactIdField));
            Assert.areEqual(null, setSObjectsOperator4.apply(IterTestUtils.deepClone(actual)).getSObjects(assetsFieldName));
        }
    }
    
}
