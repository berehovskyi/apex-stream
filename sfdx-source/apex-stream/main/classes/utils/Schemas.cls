/**
 * @author O. Berehovskyi
 * @group Utils
 * @description Schema related utilities.
 */
public virtual inherited sharing class Schemas {

    /**
     * @description Returns the name of the relationship for the `SObjectField`.
     * @param field the SObjectField
     * @example
     * Schemas.findRelationshipName(Contact.AccountId); // 'Contacts'
     * @return the name of the relationship if found or null otherwise
     */
    public static String findRelationshipName(final SObjectField field) {
        final List<SObjectType> referenceTo = field.getDescribe().getReferenceTo();
        if (referenceTo.isEmpty()) { return null; }
        for (ChildRelationship relationship : referenceTo[0].getDescribe().getChildRelationships()) {
            if (relationship.getField() == field) {
                return relationship.getRelationshipName();
            }
        }
        return null;
    }

}
