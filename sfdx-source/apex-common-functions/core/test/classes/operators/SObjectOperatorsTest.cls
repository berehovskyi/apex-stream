/**
 * @see SObjectOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity')
private class SObjectOperatorsTest {

    private static final List<Contact> INPUT = AfTestData.generateContacts2();

    static {
        new SObjectOperators();
    }

    /**
     * @see SObjectOperators.newSObject
     */
    @IsTest
    static void newSObject() {
        // Given
        SObjectType accSObjectType = Account.SObjectType;
        // When
        IOperator newAccountOperator = SObjectOperators.newSObject(accSObjectType);
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(accSObjectType.newSObject(), newAccountOperator.apply(con));
        }
    }

    /**
     * @see SObjectOperators.getSObject
     */
    @IsTest
    static void getSObject() {
        // Given
        String accFieldName = 'Account';
        SObjectField accIdField = Contact.AccountId;
        // When
        IOperator getAccount = SObjectOperators.getSObject(accFieldName);
        IOperator getAccount1 = SObjectOperators.getSObject(accIdField);
        IOperator getGrandAccount = SObjectOperators.getSObject('Account?.Parent');
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(con.getSObject(accFieldName), getAccount.apply(con));
            Assert.areEqual(con.getSObject(accFieldName), getAccount1.apply(con));
            Assert.areEqual(con.getSObject(accFieldName)?.getSObject('Parent'), getGrandAccount.apply(con));
        }
    }

    /**
     * @see SObjectOperators.newSObject
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
        IOperator convertToLead = SObjectOperators.newSObject(leadSObjectType, BiOperator.combine(SObjectBiConsumers.set(leadLastNameField, SObjectFunctions.get(conLastNameField))));
        IOperator convertToLead1 = SObjectOperators.newSObject(leadSObjectType, leadLastNameField, SObjectFunctions.get(conLastNameField));
        IOperator convertToLead2 = SObjectOperators.newSObject(leadSObjectType, leadLastNameFieldName, SObjectFunctions.get(leadLastNameFieldName));
        IOperator convertToLead5 = SObjectOperators.newSObject(leadSObjectType, leadLastNameField, constant);
        IOperator convertToLead6 = SObjectOperators.newSObject(leadSObjectType, leadLastNameFieldName, constant);
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
     * @see SObjectOperators.set
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
        IOperator setDescriptionFromDepartment = SObjectOperators.set(conDescriptionField, SObjectFunctions.get(conDepartmentField));
        IOperator setDescriptionFromDepartment1 = SObjectOperators.set(conDescriptionFieldName, SObjectFunctions.get(conDepartmentFieldName));
        IOperator setDescriptionValue = SObjectOperators.set(conDescriptionField, constant);
        IOperator setDescriptionValue1 = SObjectOperators.set(conDescriptionFieldName, constant);
        // Then
        for (Contact con : INPUT) {
            SObject clone = AfTestCommons.deepClone(con);
            clone.put(conDescriptionField, clone.get(conDepartmentField));
            Assert.areEqual(clone, setDescriptionFromDepartment.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone, setDescriptionFromDepartment1.apply(AfTestCommons.deepClone(con)));
            SObject clone1 = AfTestCommons.deepClone(con);
            clone1.put(conDescriptionField, constant);
            Assert.areEqual(clone1, setDescriptionValue.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone1, setDescriptionValue1.apply(AfTestCommons.deepClone(con)));
        }
    }

    /**
     * @see SObjectOperators.setSObject
     */
    @IsTest
    static void setSObject() {
        // Given
        Account parent = new Account(Id = AfTestData.generateId(Account.SObjectType), Name = 'Parent Account');
        SObjectField conAccountIdField = Contact.AccountId;
        String conAccountFieldName = 'Account';
        // When
        IOperator setSObjectOperator = SObjectOperators.setSObject(conAccountIdField, Operator.constant(parent));
        IOperator setSObjectOperator1 = SObjectOperators.setSObject(conAccountFieldName, Operator.constant(parent));
        IOperator setSObjectOperator2 = SObjectOperators.setSObject(conAccountIdField, parent);
        IOperator setSObjectOperator3 = SObjectOperators.setSObject(conAccountFieldName, parent);
        // Then
        for (Contact con : INPUT) {
            SObject clone = AfTestCommons.deepClone(con);
            clone.putSObject(conAccountIdField, parent);
            Assert.areEqual(clone, setSObjectOperator.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone, setSObjectOperator1.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone, setSObjectOperator2.apply(AfTestCommons.deepClone(con)));
            Assert.areEqual(clone, setSObjectOperator3.apply(AfTestCommons.deepClone(con)));
        }
    }

    /**
     * @see SObjectOperators.setSObjects
     */
    @IsTest
    static void setSObjects() {
        // Given
        List<Asset> children = new List<Asset>{
                new Asset(Id = AfTestData.generateId(Asset.SObjectType)),
                new Asset(Id = AfTestData.generateId(Asset.SObjectType))
        };
        List<Asset> children1 = new List<Asset>();
        SObjectField assetContactIdField = Asset.ContactId;
        String assetsFieldName = 'Assets';
        // When
        IOperator setSObjectsOperator = SObjectOperators.setSObjects(assetContactIdField, Function.constant(children));
        IOperator setSObjectsOperator1 = SObjectOperators.setSObjects(assetsFieldName, Function.constant(children));
        IOperator setSObjectsOperator2 = SObjectOperators.setSObjects(assetContactIdField, children);
        IOperator setSObjectsOperator3 = SObjectOperators.setSObjects(assetsFieldName, children);
        IOperator setSObjectsOperator4 = SObjectOperators.setSObjects(assetsFieldName, children1);
        // Then
        for (Contact con : INPUT) {
            Assert.areEqual(children, ((SObject) setSObjectsOperator.apply(AfTestCommons.deepClone(con))).getSObjects(assetsFieldName));
            Assert.areEqual(children, ((SObject) setSObjectsOperator1.apply(AfTestCommons.deepClone(con))).getSObjects(assetContactIdField));
            Assert.areEqual(children, ((SObject) setSObjectsOperator2.apply(AfTestCommons.deepClone(con))).getSObjects(assetsFieldName));
            Contact actual = (Contact) setSObjectsOperator3.apply(AfTestCommons.deepClone(con));
            Assert.areEqual(children, actual.getSObjects(assetContactIdField));
            Assert.areEqual(null, ((SObject) setSObjectsOperator4.apply(AfTestCommons.deepClone(actual))).getSObjects(assetsFieldName));
        }
    }
    
}
