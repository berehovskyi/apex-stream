/**
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@TestVisible
@SuppressWarnings('PMD.ExcessivePublicCount, PMD.FieldNamingConventions')
private class AsTestConsts {

    public static final AccountSObject Account = new AccountSObject();
    public static final ContactSObject Contact = new ContactSObject();

    public static final String NAME = 'Name';
    public static final String ID = 'Id';
    public static final String LAST_NAME = 'LastName';
    public static final String BIRTHDATE = 'Birthdate';
    public static final String NUMBER_OF_EMPLOYEES = 'NumberOfEmployees';
    public static final String BILLING_LATITUDE = 'BillingLatitude';
    public static final String BILLING_LONGITUDE = 'BillingLongitude';
    public static final String ACCOUNT_ID = 'AccountId';
    public static final String DESCRIPTION = 'Description';
    public static final String DEPARTMENT = 'Department';
    public static final String TYPE = 'Type';
    public static final String PARENT = 'Parent';
    public static final String FRANCE = 'France';
    public static final String UK = 'Uk';
    public static final String PARIS = 'Paris';
    public static final String LYON = 'Lyon';
    public static final String LONDON = 'London';
    public static final String BRISTOL = 'Bristol';
    public static final String HR = 'HR';
    public static final String FINANCE = 'Finance';
    public static final String CUSTOMER = 'Customer';
    public static final String PARTNER = 'Partner';
    public static final String COMPETITOR = 'Competitor';
    public static final String ANNUAL_REVENUE = 'AnnualRevenue';
    public static final String CONTACTS = 'Contacts';

    private abstract class SObjectTypeConstants {
        public SObjectType SOBJECT_TYPE;
        public String SOBJECT_NAME;
    }
    public class AccountSObject extends SObjectTypeConstants {
        public final SObjectField Id = Schema.Account.Id;
        public final SObjectField Name = Schema.Account.Name;
        public final SObjectField NumberOfEmployees = Schema.Account.NumberOfEmployees;
        public final SObjectField AnnualRevenue = Schema.Account.AnnualRevenue;
        public final SObjectField Type = Schema.Account.Type;
        public final SObjectField ParentId = Schema.Account.ParentId;
        public AccountSObject() {
            this.SOBJECT_TYPE = Schema.Account.SObjectType;
            this.SOBJECT_NAME = 'Account';
        }
    }
    public class ContactSObject extends SObjectTypeConstants {
        public final SObjectField Id = Schema.Contact.Id;
        public final SObjectField DoNotCall = Schema.Contact.DoNotCall;
        public final SObjectField LastName = Schema.Contact.LastName;
        public final SObjectField Birthdate = Schema.Contact.Birthdate;
        public final SObjectField AccountId = Schema.Contact.AccountId;
        public final SObjectField Department = Schema.Contact.Department;
        public final SObjectField Description = Schema.Contact.Description;
        public ContactSObject() {
            this.SOBJECT_TYPE = Schema.Contact.SObjectType;
            this.SOBJECT_NAME = 'Contact';
        }
    }

}
