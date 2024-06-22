/**
 * @description Provides utility methods for common functions.
 * <p><strong>Note: </strong></p>
 * <p>This is an internal class and should not be referenced outside of this package.</p>
 *
 * @author Oleh Berehovskyi
 */
public inherited sharing class CsfSupport {

    /**
     * @description Finds the relationship name for a given SObject field that is a reference field.
     *
     * @param field The SObjectField to find the relationship name for. This field must be a reference field.
     *
     * @return The relationship name of the given SObject field.
     *
     * @throws IllegalArgumentException if the provided field is not a reference field.
     * @throws NullPointerException if no relationship name is found for the provided field.
     */
    public static String findRelationshipField(final SObjectField field) {
        final List<SObjectType> referenceTo = field.getDescribe().getReferenceTo();
        Validate.isTrue(!referenceTo.isEmpty(), Label.AF_ErrorMessage_NotReferenceField, new List<Object>{ field });
        String result;
        for (ChildRelationship relationship : referenceTo[0].getDescribe().getChildRelationships()) {
            if (relationship.getField() == field) {
                result = relationship.getRelationshipName();
                break;
            }
        }
        Validate.isNotNull(result);
        return result;
    }

    /**
     * @description Checks if the given field name is a cross-reference field.
     * A cross-reference field is identified by the presence of a dot ('.') in its name.
     *
     * @param fieldName the field to check.
     *
     * @return true if the field name contains a dot, indicating it is a cross-reference field; false otherwise.
     *
     * @throws IllegalArgumentException if the provided field name is blank.
     */
    public static Boolean isXRefField(String fieldName) {
        Validate.notBlank(fieldName);
        return fieldName.contains('.');
    }

    /**
     * @description Checks if the given field name represents a safe path.
     * A safe path is identified by a question mark ('?') immediately preceding the last dot ('.') in the field name.
     *
     * @param fieldName the field to check.
     *
     * @return true if the field name ends with a question mark before the last dot, indicating it is a safe path;
     * false otherwise.
     *
     * @throws IllegalArgumentException if the provided field name is blank.
     */
    public static Boolean isSafePath(String fieldName) {
        Validate.notBlank(fieldName);
        return fieldName.substringBeforeLast('.').endsWith('?');
    }

}
