/**
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@TestVisible
@SuppressWarnings('PMD.ExcessivePublicCount')
private class AsTestConsts {

    public static final AccountSObject Account = new AccountSObject();
    public static final ContactSObject Contact = new ContactSObject();
    public static final AttachmentSObject Attachment = new AttachmentSObject();
    public static final EventSObject Event = new EventSObject();
    public static final BusinessHoursSObject BusinessHours = new BusinessHoursSObject();

    public static final String NAME = 'Name';
    public static final String DO_NOT_CALL = 'DoNotCall';
    public static final String ID = 'Id';
    public static final String LAST_NAME = 'LastName';
    public static final String BODY = 'Body';
    public static final String CONTENT_TYPE = 'ContentType';
    public static final String BIRTHDATE = 'Birthdate';
    public static final String ACTIVITY_DATE_TIME = 'ActivityDateTime';
    public static final String START_TIME = 'StartTime';
    public static final String MONDAY_START_TIME = 'MondayStartTime';
    public static final String NUMBER_OF_EMPLOYEES = 'NumberOfEmployees';
    public static final String BILLING_LATITUDE = 'BillingLatitude';
    public static final String BILLING_LONGITUDE = 'BillingLongitude';
    public static final String ACCOUNT_ID = 'AccountId';
    public static final String FIRST_NAME = 'FirstName';
    public static final String DESCRIPTION = 'Description';
    public static final String END_TIME = 'EndTime';
    public static final String MONDAY_END_TIME = 'MondayEndTime';
    public static final String DUPLICATE_KEY = 'Duplicate key';
    public static final String HAS_OPTED_OUT_OF_EMAIL = 'HasOptedOutOfEmail';
    public static final String OTHER_COUNTRY = 'OtherCountry';
    public static final String OTHER_CITY = 'OtherCity';
    public static final String DEPARTMENT = 'Department';
    public static final String TYPE = 'Type';
    public static final String BILLING_COUNTRY = 'BillingCountry';
    public static final String PARENT = 'Parent';
    public static final String FRANCE = 'France';
    public static final String UK = 'Uk';
    public static final String PARIS = 'Paris';
    public static final String LYON = 'Lyon';
    public static final String LONDON = 'London';
    public static final String BRISTOL = 'Bristol';
    public static final String DOC = '.doc';
    public static final String PDF = '.pdf';
    public static final String HR = 'HR';
    public static final String FINANCE = 'Finance';
    public static final String CALL = 'Call';
    public static final String EMAIL = 'Email';
    public static final String NORMAL = 'Normal';
    public static final String EXTENDED = 'Extended';
    public static final String CUSTOMER = 'Customer';
    public static final String PARTNER = 'Partner';
    public static final String COMPETITOR = 'Competitor';
    public static final String ANNUAL_REVENUE = 'AnnualRevenue';
    public static final String ACC = 'Account';
    public static final String CONTACTS = 'Contacts';

    private abstract class SObjectTypeConstants {
        public SObjectType SOBJECT_TYPE;
        public String SOBJECT_NAME;
    }
    public class AccountSObject extends SObjectTypeConstants {
        public final SObjectField Id = Schema.Account.Id;
        public final SObjectField Name = Schema.Account.Name;
        public final SObjectField NumberOfEmployees = Schema.Account.NumberOfEmployees;
        public final SObjectField BillingLatitude = Schema.Account.BillingLatitude;
        public final SObjectField BillingCountry = Schema.Account.BillingCountry;
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
        public final SObjectField FirstName = Schema.Contact.FirstName;
        public final SObjectField LastName = Schema.Contact.LastName;
        public final SObjectField Birthdate = Schema.Contact.Birthdate;
        public final SObjectField AccountId = Schema.Contact.AccountId;
        public final SObjectField HasOptedOutOfEmail = Schema.Contact.HasOptedOutOfEmail;
        public final SObjectField OtherCountry = Schema.Contact.OtherCountry;
        public final SObjectField OtherCity = Schema.Contact.OtherCity;
        public final SObjectField Department = Schema.Contact.Department;
        public final SObjectField Description = Schema.Contact.Description;
        public ContactSObject() {
            this.SOBJECT_TYPE = Schema.Contact.SObjectType;
            this.SOBJECT_NAME = 'Contact';
        }
    }
    public class AttachmentSObject extends SObjectTypeConstants {
        public final SObjectField Id = Schema.Attachment.Id;
        public final SObjectField Body = Schema.Attachment.Body;
        public final SObjectField ContentType = Schema.Attachment.ContentType;
        public final SObjectField Name = Schema.Attachment.Name;
        public AttachmentSObject() {
            this.SOBJECT_TYPE = Schema.Attachment.SObjectType;
            this.SOBJECT_NAME = 'Attachment';
        }
    }
    public class EventSObject extends SObjectTypeConstants {
        public final SObjectField Id = Schema.Event.Id;
        public final SObjectField ActivityDateTime = Schema.Event.ActivityDateTime;
        public final SObjectField Description = Schema.Event.Description;
        public final SObjectField Type = Schema.Event.Type;
        public EventSObject() {
            this.SOBJECT_TYPE = Schema.Event.SObjectType;
            this.SOBJECT_NAME = 'Event';
        }
    }
    public class BusinessHoursSObject extends SObjectTypeConstants {
        public final SObjectField Id = Schema.BusinessHours.Id;
        public final SObjectField MondayStartTime = Schema.BusinessHours.MondayStartTime;
        public final SObjectField MondayEndTime = Schema.BusinessHours.MondayEndTime;
        public final SObjectField Name = Schema.BusinessHours.Name;
        public BusinessHoursSObject() {
            this.SOBJECT_TYPE = Schema.BusinessHours.SObjectType;
            this.SOBJECT_NAME = 'BusinessHours';
        }
    }

}
