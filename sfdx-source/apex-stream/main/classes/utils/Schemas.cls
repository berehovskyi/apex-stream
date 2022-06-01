/**
 * @description Schema related utilities.
 *
 * @author Oleh Berehovskyi
 *
 * @group Utils
 */
public virtual inherited sharing class Schemas {

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
        Validate.isTrue(!referenceTo.isEmpty(), Label.NotReferenceFieldErrorMessage, new List<Object>{ field });
        for (ChildRelationship relationship : referenceTo[0].getDescribe().getChildRelationships()) {
            if (relationship.getField() == field) {
                return relationship.getRelationshipName();
            }
        }
        return null;
    }

    /**
     * @description Checks if `fieldName` may be a cross-reference field.
     * @param fieldName the fiend name
     *
     * @return true if `fieldName` may be a cross-reference field, false otherwise
     * 
     * @example 
     * Schemas.isXRef('Name'); // false
     * Schemas.isXRef('Parent.Name'); // true
     */
    public static Boolean isXRef(final String fieldName) {
        return fieldName.contains('.');
    }

    /**
     * @description Checks if `fieldName` may be a safe navigated cross-reference field.
     * @param fieldName the fiend name
     *
     * @return true if `fieldName` may be a safe navigated cross-reference field, false otherwise
     * 
     * @example 
     * Schemas.isSaveNav('Name'); // false
     * Schemas.isSaveNav('Parent.Name'); // false
     * Schemas.isSaveNav('Parent?.Name'); // true
     * Schemas.isSaveNav('Parent?.Parent.Name'); // false
     * Schemas.isSaveNav('Parent.Parent?.Name'); // true
     */
    public static Boolean isSaveNav(final String fieldName) {
        return fieldName.substringBeforeLast('.').endsWith('?');
    }

}
