/**
 * @description Schema related utilities.
 *
 * @author Oleh Berehovskyi
 *
 * @group Utils
 */
public inherited sharing class Schemas {

    @TestVisible
    private Schemas() {}

    /**
     * @description Returns the name of the child relationship for the `SObjectField`.
     *
     * @param field the SObjectField
     *
     * @return the name of the child relationship if found or null otherwise
     * 
     * @throws IllegalArgumentException if `field` is not lookup or master-detail.
     *
     * @example
     * Schemas.findChildRelationshipName(Contact.AccountId); // 'Contacts'
     */
    public static String findChildRelationshipName(final SObjectField field) {
        final List<SObjectType> referenceTo = field.getDescribe().getReferenceTo();
        Validate.isTrue(!referenceTo.isEmpty(), Label.AF_ErrorMessage_NotReferenceField, new List<Object>{ field });
        String result;
        for (ChildRelationship relationship : referenceTo[0].getDescribe().getChildRelationships()) {
            if (relationship.getField() == field) {
                result = relationship.getRelationshipName();
                break;
            }
        }
        return result;
    }

//    /**
//     * @description Checks if `fieldName` may be a cross-reference field.
//     * @param fieldName the fiend name
//     *
//     * @return true if `fieldName` may be a cross-reference field, false otherwise
//     * 
//     * @example 
//     * Schemas.isXRef('Name'); // false
//     * Schemas.isXRef('Parent.Name'); // true
//     */
//    public static Boolean isXRef(final String fieldName) {
//        return fieldName.contains('.');
//    }
//
//    /**
//     * @description Checks if `fieldName` may be a safe navigated cross-reference field.
//     * @param fieldName the fiend name
//     *
//     * @return true if `fieldName` may be a safe navigated cross-reference field, false otherwise
//     * 
//     * @example 
//     * Schemas.isSaveNav('Name'); // false
//     * Schemas.isSaveNav('Parent.Name'); // false
//     * Schemas.isSaveNav('Parent?.Name'); // true
//     * Schemas.isSaveNav('Parent?.Parent.Name'); // false
//     * Schemas.isSaveNav('Parent.Parent?.Name'); // true
//     */
//    public static Boolean isSaveNav(final String fieldName) {
//        return fieldName.substringBeforeLast('.').endsWith('?');
//    }

    public static Type getType(final List<Object> sObjects, final String fieldName) {
        Validate.notNull(sObjects);
        Validate.notBlank(fieldName);
        Validate.isInstanceOfType(sObjects, List<SObject>.class);
        final SObjectType rootSObjectType = ((List<SObject>) sObjects).getSObjectType();
        System.debug(LoggingLevel.ERROR, ' ' + rootSObjectType);
        SObjectField sObjectField = findParentSObjectField(rootSObjectType, fieldName);
        System.debug(LoggingLevel.ERROR, ' ' +sObjectField);
        System.debug(LoggingLevel.ERROR, ' ' +  getType(sObjectField));
        return getType(sObjectField);
    }

    public static Type getType(SObjectField field) {
        Validate.notNull(field);
        SoapType soapType = field.getDescribe().getSoapType();
        switch on soapType {
            when BASE64BINARY { return Blob.class; }
            when else { return Type.forName(soapType.name()); }
        }
    }

    public static String parseTypeName(Iterable<Object> iterable) {
        System.JSON result;
        try {
            result = (System.JSON) iterable;
            return System.JSON.class.getName();
        } catch (TypeException exc) {
            String msg = exc.getMessage();
            System.debug(LoggingLevel.ERROR, msg);
            return msg.contains('<') ? msg.substringBetween('<', '>') : msg.substringBetween('type ', ' to');
        }
    }

    public static String parseTypeName(Iterator<Object> iterator) {
        System.JSON result;
        try {
            result = (System.JSON) iterator;
            return System.JSON.class.getName();
        } catch (TypeException exc) {
            String msg = exc.getMessage();
            System.debug(LoggingLevel.ERROR, msg);
            return msg.contains('<') ? msg.substringBetween('<', '>') : msg.substringBetween('type ', ' to');
        }
    }

    public static SObjectField getSObjectField(final SObjectType sObjectType, final String fieldName) {
        Validate.notNull(sObjectType);
        Validate.notBlank(fieldName);
        return sObjectType
            .getDescribe()
            .fields
            .getMap()
            .get(fieldName);
    }

    public static SObjectField findParentSObjectField(final SObjectType root, final String fieldName) {
        if (!fieldName.contains('.')) { return getSObjectField(root, fieldName); }
        final List<String> path = fieldName.split('\\.');
        SObjectType sObjectType = root;
        for (Integer i = 0, size = path.size() - 1; i < size; i++) {
            String f = path[i];
            if (f.endsWith('?')) { // Safe Navigation
                f = f.removeEnd('?');
                sObjectType = findParentSObjectType(root, f);
                if (sObjectType == null) {
                    return null;
                }
            } else {
                sObjectType = findParentSObjectType(root, f);
            }
        }
        System.debug(LoggingLevel.ERROR, sObjectType);
        System.debug(LoggingLevel.ERROR, path[path.size() - 1]);
        return getSObjectField(sObjectType, path[path.size() - 1]);
    }

    public static SObjectType findParentSObjectType(final SObjectType sObjectType, final String relationshipName) {
        System.debug(LoggingLevel.ERROR, sObjectType);
        System.debug(LoggingLevel.ERROR, relationshipName);
        for (SObjectField field : sObjectType.getDescribe().fields.getMap().values()) {
            DescribeFieldResult dfr = field.getDescribe();
            if (dfr.getType() == DisplayType.REFERENCE && dfr.getRelationshipName() == relationshipName) {
                System.debug(LoggingLevel.ERROR, dfr.getReferenceTo()[0]);
                return dfr.getReferenceTo()[0];
            }
        }
        return null;
    }

}
