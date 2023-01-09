/**
 * @see Validate
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ValidateTest {
    
    // Given
    private static final List<Object> NULL_LIST = null;
    private static final List<Object> EMPTY_LIST = new List<Object>();
    private static final List<Object> LIST_WITH_NULL = new List<Object>{ null };
    private static final List<Object> LIST_WITH_VALUES = new List<Object>{ 'a', 'b', '', 0, new Account() };
    private static final List<Object> LIST_WITH_VALUES_AND_NULL = new List<Object>{ 'a', 'b', '', 0, null, new Account() };
    private static final String EMPTY = '';
    private static final String WHITESPACE = ' ';
    private static final String DOUBLE_WHITESPACE = '  ';
    private static final String MESSAGE = 'Test Message {0}';
    private static final List<String> ARGUMENTS = new List<String> { 'Test Argument' };
    
    static {
        new Validate();
    }

    /**
     * @see Validate.notNull
     */
    @IsTest
    static void notNull() {
        // When
        Exception actual;
        try {
            Validate.notNull(null);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.notNull(NULL_LIST);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.notNull(EMPTY_LIST);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.notNull(LIST_WITH_NULL);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.notNull(LIST_WITH_VALUES);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.notNull(LIST_WITH_VALUES_AND_NULL);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.notNull(EMPTY);
        } catch (Exception exc) {
            actual6 = exc;
        }
        Exception actual7;
        try {
            Validate.notNull(WHITESPACE);
        } catch (Exception exc) {
            actual7 = exc;
        }
        // Then
        Validate.assertEquals(NullPointerException.class.getName(), actual.getTypeName());
        Validate.assertEquals(NullPointerException.class.getName(), actual1.getTypeName());
        Validate.assertEquals(null, actual2);
        Validate.assertEquals(null, actual3);
        Validate.assertEquals(null, actual4);
        Validate.assertEquals(null, actual5);
        Validate.assertEquals(null, actual6);
        Validate.assertEquals(null, actual7);
    }

    /**
     * @see Validate.notBlank
     */
    @IsTest
    static void notBlank() {
        // When
        Exception actual;
        try {
            Validate.notBlank(null);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.notBlank(EMPTY);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.notBlank(WHITESPACE);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.notBlank(DOUBLE_WHITESPACE);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.notBlank('a');
        } catch (Exception exc) {
            actual4 = exc;
        }
        // Then
        Validate.assertEquals(NullPointerException.class.getName(), actual.getTypeName());
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual2.getTypeName());
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual3.getTypeName());
        Validate.assertEquals(null, actual4);
    }

    /**
     * @see Validate.notEmpty
     */
    @IsTest
    static void notEmpty() {
        // When
        Exception actual;
        try {
            Validate.notEmpty((String) null);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.notEmpty(EMPTY);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.notEmpty(WHITESPACE);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.notEmpty(DOUBLE_WHITESPACE);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.notEmpty('a');
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.notEmpty(NULL_LIST);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.notEmpty(EMPTY_LIST);
        } catch (Exception exc) {
            actual6 = exc;
        }
        Exception actual7;
        try {
            Validate.notEmpty(LIST_WITH_NULL);
        } catch (Exception exc) {
            actual7 = exc;
        }
        Exception actual8;
        try {
            Validate.notEmpty(LIST_WITH_VALUES);
        } catch (Exception exc) {
            actual8 = exc;
        }
        Exception actual9;
        try {
            Validate.notEmpty(LIST_WITH_VALUES_AND_NULL);
        } catch (Exception exc) {
            actual9 = exc;
        }
        // Then
        Validate.assertEquals(NullPointerException.class.getName(), actual.getTypeName());
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Validate.assertEquals(null, actual2);
        Validate.assertEquals(null, actual3);
        Validate.assertEquals(null, actual4);
        Validate.assertEquals(NullPointerException.class.getName(), actual5.getTypeName());
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual6.getTypeName());
        Validate.assertEquals(null, actual7);
        Validate.assertEquals(null, actual8);
        Validate.assertEquals(null, actual9);
    }

    /**
     * @see Validate.noNullElements
     */
    @IsTest
    static void noNullElements() {
        // When
        Exception actual;
        try {
            Validate.noNullElements(null);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.noNullElements(NULL_LIST);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.noNullElements(EMPTY_LIST);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.noNullElements(LIST_WITH_NULL);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.noNullElements(LIST_WITH_VALUES);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.noNullElements(LIST_WITH_VALUES_AND_NULL);
        } catch (Exception exc) {
            actual5 = exc;
        }
        // Then
        Validate.assertEquals(NullPointerException.class.getName(), actual.getTypeName());
        Validate.assertEquals(NullPointerException.class.getName(), actual1.getTypeName());
        Validate.assertEquals(null, actual2);
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual3.getTypeName());
        Validate.assertEquals(null, actual4);
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual5.getTypeName());
    }

    /**
     * @see Validate.isTrue
     */
    @IsTest
    static void isTrue() {
        // When
        Exception actual;
        try {
            Validate.isTrue(null);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.isTrue(true);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.isTrue(false);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.isTrue(2 > 3);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.isTrue(2 < 3);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.isTrue(2 == 3, MESSAGE);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.isTrue(2 == 3, new NullPointerException());
        } catch (Exception exc) {
            actual6 = exc;
        }
        Exception actual7;
        try {
            Validate.isTrue(2 == 3, MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual7 = exc;
        }
        // Then
        Validate.assertEquals(NullPointerException.class.getName(), actual.getTypeName());
        Validate.assertEquals(null, actual1);
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual2.getTypeName());
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual3.getTypeName());
        Validate.assertEquals(null, actual4);
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual5.getTypeName());
        Validate.assertEquals(MESSAGE, actual5.getMessage());
        Validate.assertEquals(NullPointerException.class.getName(), actual6.getTypeName());
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual7.getTypeName());
        Validate.assertEquals(String.format(MESSAGE, ARGUMENTS), actual7.getMessage());
    }

    /**
     * @see Validate.matches
     */
    @IsTest
    static void matches() {
        // Given
        String regex = '\\S*\\{\\d+\\}\\S*';
        String input = '{}';
        String input1 = 'A-{}';
        String input2 = '{0}';
        String input3 = 'A-{00001}';
        String input4 = 'A-{00010}-M';
        // When
        Exception actual;
        try {
            Validate.matches(null, null, MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.matches(input, regex, MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.matches(input1, regex, MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.matches(input2, regex, MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.matches(input3, regex, MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.matches(input4, regex, MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual5 = exc;
        }
        // Then
        Validate.assertEquals(NullPointerException.class.getName(), actual.getTypeName());
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Validate.assertEquals(String.format(MESSAGE, ARGUMENTS), actual1.getMessage());
        Validate.assertEquals(IllegalArgumentException.class.getName(), actual2.getTypeName());
        Validate.assertEquals(String.format(MESSAGE, ARGUMENTS), actual2.getMessage());
        Validate.assertEquals(null, actual3);
        Validate.assertEquals(null, actual4);
        Validate.assertEquals(null, actual5);
    }

    /**
     * @see Validate.validState
     */
    @IsTest
    static void validState() {
        // When
        Exception actual;
        try {
            Validate.validState(null, MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.validState(!new Map<String, String> { null => 'val' }.containsKey(null), MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.validState(!new Map<String, String> { 'key' => 'val' }.containsKey(null), MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual2 = exc;
        }
        // Then
        Validate.assertEquals(NullPointerException.class.getName(), actual.getTypeName());
        Validate.assertEquals(IllegalStateException.class.getName(), actual1.getTypeName());
        Validate.assertEquals(String.format(MESSAGE, ARGUMENTS), actual1.getMessage());
        Validate.assertEquals(null, actual2);
    }
    
}