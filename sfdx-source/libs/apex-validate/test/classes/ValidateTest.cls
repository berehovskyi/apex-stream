/**
 * @see Validate
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD')
private class ValidateTest {

    private static final List<Object> NULL_LIST = null;
    private static final List<Object> EMPTY_LIST = new List<Object>();
    private static final List<Object> LIST_WITH_NULL = new List<Object>{ null };
    private static final List<Object> LIST_WITH_VALUES = new List<Object>{ 'a', 'b', '', 0, new Account() };
    private static final List<Object> LIST_WITH_VALUES_AND_NULL = new List<Object>{
        'a',
        'b',
        '',
        0,
        null,
        new Account()
    };
    private static final Set<String> NULL_SET = null;
    private static final Set<String> EMPTY_SET = new Set<String>();
    private static final Set<String> SET_WITH_NULL = new Set<String>{ null };
    private static final Set<String> SET_WITH_VALUES = new Set<String>{ 'a', 'b', '' };
    private static final Set<Object> SET_WITH_VALUES_AND_NULL = new Set<Object>{ 'a', 'b', '', 0 };
    private static final String NULL_STRING = null;
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
        Exception actual8;
        try {
            Validate.notNull(NULL_LIST, null);
        } catch (Exception exc) {
            actual8 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(NullPointerException.class.getName(), actual1.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual1.getMessage());
        Assert.areEqual(null, actual2);
        Assert.areEqual(null, actual3);
        Assert.areEqual(null, actual4);
        Assert.areEqual(null, actual5);
        Assert.areEqual(null, actual6);
        Assert.areEqual(null, actual7);
        Assert.areEqual(NullPointerException.class.getName(), actual8.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_NullMessage, actual8.getMessage());
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
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(null, actual1);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual2.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_FalseCondition, actual2.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual3.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_FalseCondition, actual3.getMessage());
        Assert.areEqual(null, actual4);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual5.getTypeName());
        Assert.areEqual(MESSAGE, actual5.getMessage());
        Assert.areEqual(NullPointerException.class.getName(), actual6.getTypeName());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual7.getTypeName());
        Assert.areEqual(String.format(MESSAGE, ARGUMENTS), actual7.getMessage());
    }

    /**
     * @see Validate.notEmpty
     */
    @IsTest
    static void notEmptyIterable() {
        // When
        Exception actual;
        try {
            Validate.notEmpty(NULL_LIST);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.notEmpty(EMPTY_LIST);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.notEmpty(LIST_WITH_NULL);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.notEmpty(LIST_WITH_VALUES);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.notEmpty(LIST_WITH_VALUES_AND_NULL);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.notEmpty((Iterable<String>) NULL_SET);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.notEmpty((Iterable<String>) EMPTY_SET);
        } catch (Exception exc) {
            actual6 = exc;
        }
        Exception actual7;
        try {
            Validate.notEmpty((Iterable<String>) SET_WITH_NULL);
        } catch (Exception exc) {
            actual7 = exc;
        }
        Exception actual8;
        try {
            Validate.notEmpty((Iterable<String>) SET_WITH_VALUES);
        } catch (Exception exc) {
            actual8 = exc;
        }
        Exception actual9;
        try {
            Validate.notEmpty((Iterable<Object>) SET_WITH_VALUES_AND_NULL);
        } catch (Exception exc) {
            actual9 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_EmptyList, actual1.getMessage());
        Assert.areEqual(null, actual2);
        Assert.areEqual(null, actual3);
        Assert.areEqual(null, actual4);
        Assert.areEqual(NullPointerException.class.getName(), actual5.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual5.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual6.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_EmptyIterable, actual6.getMessage());
        Assert.areEqual(null, actual7);
        Assert.areEqual(null, actual8);
        Assert.areEqual(null, actual9);
    }

    /**
     * @see Validate.noNullElements
     */
    @IsTest
    static void noNullElements() {
        // When
        Exception actual;
        try {
            Validate.noNullElements(NULL_LIST);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.noNullElements(EMPTY_LIST);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.noNullElements(LIST_WITH_NULL);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.noNullElements(LIST_WITH_VALUES);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.noNullElements(LIST_WITH_VALUES_AND_NULL);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.noNullElements((Iterable<String>) NULL_SET);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.noNullElements((Iterable<String>) EMPTY_SET);
        } catch (Exception exc) {
            actual6 = exc;
        }
        Exception actual7;
        try {
            Validate.noNullElements((Iterable<String>) SET_WITH_NULL);
        } catch (Exception exc) {
            actual7 = exc;
        }
        Exception actual8;
        try {
            Validate.noNullElements((Iterable<String>) SET_WITH_VALUES);
        } catch (Exception exc) {
            actual8 = exc;
        }
        Exception actual9;
        try {
            Validate.noNullElements((Iterable<Object>) SET_WITH_VALUES_AND_NULL);
        } catch (Exception exc) {
            actual9 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(null, actual1);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual2.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_NullElementList, actual2.getMessage());
        Assert.areEqual(null, actual3);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual4.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_NullElementList, actual4.getMessage());
    }

    /**
     * @see Validate.index
     */
    @IsTest
    static void indexList() {
        // Given
        Integer index = 0;
        Integer index1 = 10;
        // When
        Exception actual;
        try {
            Validate.index(NULL_LIST, index);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.index(EMPTY_LIST, null);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.index(EMPTY_LIST, index);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.index(LIST_WITH_NULL, index);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.index(LIST_WITH_VALUES, index);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.index(LIST_WITH_VALUES_AND_NULL, index1);
        } catch (Exception exc) {
            actual5 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage()); 
        Assert.areEqual(NullPointerException.class.getName(), actual1.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual1.getMessage());
        Assert.areEqual(IndexOutOfBoundsException.class.getName(), actual2.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InvalidIndexList, index),
            actual2.getMessage()
        );
        Assert.areEqual(null, actual3);
        Assert.areEqual(null, actual4);
        Assert.areEqual(IndexOutOfBoundsException.class.getName(), actual5.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InvalidIndexList, index1),
            actual5.getMessage()
        );
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
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_BlankString, actual1.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual2.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_BlankString, actual2.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual3.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_BlankString, actual3.getMessage());
        Assert.areEqual(null, actual4);
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
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_EmptyString, actual1.getMessage());
        Assert.areEqual(null, actual2);
        Assert.areEqual(null, actual3);
        Assert.areEqual(null, actual4);
    }

    /**
     * @see Validate.index
     */
    @IsTest
    static void indexString() {
        // Given
        Integer index = 0;
        Integer index1 = 20;
        // When
        Exception actual;
        try {
            Validate.index(NULL_STRING, index);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.index(EMPTY, null);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.index(EMPTY, index);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.index(WHITESPACE, index);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.index(MESSAGE, index);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.index(MESSAGE, index1);
        } catch (Exception exc) {
            actual5 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(NullPointerException.class.getName(), actual1.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual1.getMessage());
        Assert.areEqual(IndexOutOfBoundsException.class.getName(), actual2.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InvalidIndexString, index),
            actual2.getMessage()
        );
        Assert.areEqual(null, actual3);
        Assert.areEqual(null, actual4);
        Assert.areEqual(IndexOutOfBoundsException.class.getName(), actual5.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InvalidIndexString, index1),
            actual5.getMessage()
        );
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
        Exception actual6;
        try {
            Validate.matches(input, regex);
        } catch (Exception exc) {
            actual6 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Assert.areEqual(String.format(MESSAGE, ARGUMENTS), actual1.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual2.getTypeName());
        Assert.areEqual(String.format(MESSAGE, ARGUMENTS), actual2.getMessage());
        Assert.areEqual(null, actual3);
        Assert.areEqual(null, actual4);
        Assert.areEqual(null, actual5);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual6.getTypeName());
        Assert.areEqual(
            Validate.format(
                Label.AV_ErrorMessage_PatternMismatch,
                Validate.escapeBraces(input),
                Validate.escapeBraces(regex)
            ),
            actual6.getMessage()
        );
    }

    /**
     * @see Validate.email
     */
    @IsTest
    static void email() {
        // Given
        String input = '@';
        String input1 = 'testemail';
        String input2 = 'firstname.lastname@gmail..com';        
        String input3 = 'firstname.lastname.gmail.com';
        String input4 = '\"Abc\\@def\"@example.com';
        String input5 = '\"Fred Bloggs\"@example.com';
        String input6 = '@example.com';
        String input7 = 'name@some~domain.com';
        String input8 = 'name@someDomain\uFFEF.com';
        String input9 = '@name@example.com';
        String input10 = 'firstname.lastname';
        String input11 = 'firstname.lastname@';
        String input12 = 'firstname.lastname@gm@il.com';
        String input13 = '\u00A0@example.com';
        
        String input14 = 'firstname.lastname@gmail.com';
        String input15 = 'FirstnameLastname@gmail.com';
        String input16 = 'firstname+lastname@gmail.com';
        String input17 = 'customer/department=shipping@example.com';
        String input18 = '$A12345@example.com';
        String input19 = '!def!xyz%abc@example.com';
        String input20 = '__somename@example.com';
        String input21 = 'firstname.lastname@test.co.uk';
        String input22 = '1234@someDomain.com';
        String input23 = '!#$%&\'*+-/=?^_`|~@gmail.com';
        String input24 = 'firstname.lastname@1234.com';
        // When
        Exception actual;
        try {
            Validate.email(NULL_STRING);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.email(EMPTY);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.email(WHITESPACE);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.email(input);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.email(input1);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.email(input2);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.email(input3);
        } catch (Exception exc) {
            actual6 = exc;
        }
        Exception actual7;
        try {
            Validate.email(input4);
        } catch (Exception exc) {
            actual7 = exc;
        }
        Exception actual8;
        try {
            Validate.email(input5);
        } catch (Exception exc) {
            actual8 = exc;
        }
        Exception actual9;
        try {
            Validate.email(input6);
        } catch (Exception exc) {
            actual9 = exc;
        }
        Exception actual10;
        try {
            Validate.email(input7);
        } catch (Exception exc) {
            actual10 = exc;
        }
        Exception actual11;
        try {
            Validate.email(input8);
        } catch (Exception exc) {
            actual11 = exc;
        }
        Exception actual12;
        try {
            Validate.email(input9);
        } catch (Exception exc) {
            actual12 = exc;
        }
        Exception actual13;
        try {
            Validate.email(input10);
        } catch (Exception exc) {
            actual13 = exc;
        }
        Exception actual14;
        try {
            Validate.email(input11);
        } catch (Exception exc) {
            actual14 = exc;
        }
        Exception actual15;
        try {
            Validate.email(input12);
        } catch (Exception exc) {
            actual15 = exc;
        }
        Exception actual16;
        try {
            Validate.email(input13);
        } catch (Exception exc) {
            actual16 = exc;
        }
        Exception actual17;
        try {
            Validate.email(input14);
        } catch (Exception exc) {
            actual17 = exc;
        }
        Exception actual18;
        try {
            Validate.email(input15);
        } catch (Exception exc) {
            actual18 = exc;
        }
        Exception actual19;
        try {
            Validate.email(input16);
        } catch (Exception exc) {
            actual19 = exc;
        }
        Exception actual20;
        try {
            Validate.email(input17);
        } catch (Exception exc) {
            actual20 = exc;
        }
        Exception actual21;
        try {
            Validate.email(input18);
        } catch (Exception exc) {
            actual21 = exc;
        }
        Exception actual22;
        try {
            Validate.email(input19);
        } catch (Exception exc) {
            actual22 = exc;
        }
        Exception actual23;
        try {
            Validate.email(input20);
        } catch (Exception exc) {
            actual23 = exc;
        }
        Exception actual24;
        try {
            Validate.email(input21);
        } catch (Exception exc) {
            actual24 = exc;
        }
        Exception actual25;
        try {
            Validate.email(input22);
        } catch (Exception exc) {
            actual25 = exc;
        }
        Exception actual26;
        try {
            Validate.email(input23);
        } catch (Exception exc) {
            actual26 = exc;
        }
        Exception actual27;
        try {
            Validate.email(input24);
        } catch (Exception exc) {
            actual27 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, EMPTY), actual1.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual2.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InvalidEmail, WHITESPACE),
            actual2.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual3.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input), actual3.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual4.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input1), actual4.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual5.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input2), actual5.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual6.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input3), actual6.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual7.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input4), actual7.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual8.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input5), actual8.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual9.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input6), actual9.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual10.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input7), actual10.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual11.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input8), actual11.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual12.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input9), actual12.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual13.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input10), actual13.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual14.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input11), actual14.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual15.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input12), actual15.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual16.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InvalidEmail, input13), actual16.getMessage());
        Assert.areEqual(null, actual17);
        Assert.areEqual(null, actual18);
        Assert.areEqual(null, actual19);
        Assert.areEqual(null, actual20);
        Assert.areEqual(null, actual21);
        Assert.areEqual(null, actual22);
        Assert.areEqual(null, actual23);
        Assert.areEqual(null, actual24);
        Assert.areEqual(null, actual25);
        Assert.areEqual(null, actual26);
        Assert.areEqual(null, actual27);
    }

    /**
     * @see Validate.creditCard
     */
    @IsTest
    static void creditCard() {
        // Given
        String input = '12345678901234567890';
        String input1 = '0000000000000001';
        String input2 = '1234-5678-9O12-3452';
        
        String input3 = '0000000000000000';
        String input4 = '1234567890123452';
        String input5 = '1234-5678-9012-3452';
        String input6 = '1234 5678 9012 3452';
        String input7 = '4417123456789113';
        String input8 = '4222222222222';
        String input9 = '5105-1051-0510-5100';
        // When
        Exception actual;
        try {
            Validate.creditCard(NULL_STRING);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.creditCard(EMPTY);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.creditCard(WHITESPACE);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.creditCard(input);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.creditCard(input1);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.creditCard(input2);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.creditCard(input3);
        } catch (Exception exc) {
            actual6 = exc;
        }
        Exception actual7;
        try {
            Validate.creditCard(input4);
        } catch (Exception exc) {
            actual7 = exc;
        }
        Exception actual8;
        try {
            Validate.creditCard(input5);
        } catch (Exception exc) {
            actual8 = exc;
        }
        Exception actual9;
        try {
            Validate.creditCard(input6);
        } catch (Exception exc) {
            actual9 = exc;
        }
        Exception actual10;
        try {
            Validate.creditCard(input7);
        } catch (Exception exc) {
            actual10 = exc;
        }
        Exception actual11;
        try {
            Validate.creditCard(input8);
        } catch (Exception exc) {
            actual11 = exc;
        }
        Exception actual12;
        try {
            Validate.creditCard(input9);
        } catch (Exception exc) {
            actual12 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_BlankString, actual1.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual2.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_BlankString, actual2.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual3.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InvalidCreditCard, input), 
            actual3.getMessage()
        );
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InvalidCreditCard, input1),
            actual4.getMessage()
        );
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InvalidCreditCard, input2),
            actual5.getMessage()
        );
        Assert.areEqual(null, actual6);
        Assert.areEqual(null, actual7);
        Assert.areEqual(null, actual8);
        Assert.areEqual(null, actual9);
        Assert.areEqual(null, actual10);
        Assert.areEqual(null, actual11);
        Assert.areEqual(null, actual12);
    }

    /**
     * @see Validate.state
     */
    @IsTest
    static void state() {
        // When
        Exception actual;
        try {
            Validate.state(null, MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.state(!new Map<String, String> { null => 'val' }.containsKey(null), MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.state(!new Map<String, String> { null => 'val' }.containsKey(null));
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.state(!new Map<String, String> { 'key' => 'val' }.containsKey(null), MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual3 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(IllegalStateException.class.getName(), actual1.getTypeName());
        Assert.areEqual(String.format(MESSAGE, ARGUMENTS), actual1.getMessage());
        Assert.areEqual(IllegalStateException.class.getName(), actual2.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_InvalidState, actual2.getMessage());
        Assert.areEqual(null, actual3);
    }
    
    @IsTest
    static void between() {
        // Given
        Long startLong = 0L;
        Long endLong = 3L;
        Long inputLong = 2L;
        Long inputLong1 = 3L;
        Long inputLong2 = 4L;
        Long inputLong3 = -1L;
        Integer startInt = 0;
        Integer endInt = 3;
        Integer inputInt = 2;
        Integer inputInt1 = 3;
        Integer inputInt2 = 4;
        Integer inputInt3 = -1;
        Double startDouble = 0;
        Double endDouble = 3;
        Double inputDouble = 2;
        Double inputDouble1 = 3;
        Double inputDouble2 = 4;
        Double inputDouble3 = -1;
        Date startDate = Date.today();
        Date endDate = startDate.addDays(3);
        Date inputDate = startDate.addDays(2);
        Date inputDate1 = startDate.addDays(3);
        Date inputDate2 = startDate.addDays(4);
        Date inputDate3 = startDate.addDays(-1);
        Datetime startDt = Datetime.now();
        Datetime endDt = startDt.addHours(3);
        Datetime inputDt = startDt.addHours(2);
        Datetime inputDt1 = startDt.addHours(3);
        Datetime inputDt2 = startDt.addHours(4);
        Datetime inputDt3 = startDt.addHours(-1);
        Time startTime = Time.newInstance(0, 0, 0, 1);
        Time endTime = Time.newInstance(3, 3, 3, 3);
        Time inputTime = Time.newInstance(2, 2, 2, 2);
        Time inputTime1 = Time.newInstance(3, 3, 3, 3);
        Time inputTime2 = Time.newInstance(4, 4, 4, 4);
        Time inputTime3 = Time.newInstance(0, 0, 0, 0);
        // When
        Exception actual;
        try {
            Validate.between((Long) null, null, null);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.between((Integer) null, null, null);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.between((Double) null, null, null);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.between((Date) null, null, null);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.between((Datetime) null, null, null);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.between((Time) null, null, null);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.between(startLong, endLong, inputLong);
        } catch (Exception exc) {
            actual6 = exc;
        }
        Exception actual7;
        try {
            Validate.between(startLong, endLong, inputLong1);
        } catch (Exception exc) {
            actual7 = exc;
        }
        Exception actual8;
        try {
            Validate.between(startLong, endLong, inputLong2);
        } catch (Exception exc) {
            actual8 = exc;
        }
        Exception actual9;
        try {
            Validate.between(startLong, endLong, inputLong3);
        } catch (Exception exc) {
            actual9 = exc;
        }
        Exception actual10;
        try {
            Validate.between(startInt, endInt, inputInt);
        } catch (Exception exc) {
            actual10 = exc;
        }
        Exception actual11;
        try {
            Validate.between(startInt, endInt, inputInt1);
        } catch (Exception exc) {
            actual11 = exc;
        }
        Exception actual12;
        try {
            Validate.between(startInt, endInt, inputInt2);
        } catch (Exception exc) {
            actual12 = exc;
        }
        Exception actual13;
        try {
            Validate.between(startInt, endInt, inputInt3);
        } catch (Exception exc) {
            actual13 = exc;
        }
        Exception actual14;
        try {
            Validate.between(startDouble, endDouble, inputDouble);
        } catch (Exception exc) {
            actual14 = exc;
        }
        Exception actual15;
        try {
            Validate.between(startDouble, endDouble, inputDouble1);
        } catch (Exception exc) {
            actual15 = exc;
        }
        Exception actual16;
        try {
            Validate.between(startDouble, endDouble, inputDouble2);
        } catch (Exception exc) {
            actual16 = exc;
        }
        Exception actual17;
        try {
            Validate.between(startDouble, endDouble, inputDouble3);
        } catch (Exception exc) {
            actual17 = exc;
        }
        Exception actual18;
        try {
            Validate.between(startDate, endDate, inputDate);
        } catch (Exception exc) {
            actual18 = exc;
        }
        Exception actual19;
        try {
            Validate.between(startDate, endDate, inputDate1);
        } catch (Exception exc) {
            actual19 = exc;
        }
        Exception actual20;
        try {
            Validate.between(startDate, endDate, inputDate2);
        } catch (Exception exc) {
            actual20 = exc;
        }
        Exception actual21;
        try {
            Validate.between(startDate, endDate, inputDate3);
        } catch (Exception exc) {
            actual21 = exc;
        }
        Exception actual22;
        try {
            Validate.between(startDt, endDt, inputDt);
        } catch (Exception exc) {
            actual22 = exc;
        }
        Exception actual23;
        try {
            Validate.between(startDt, endDt, inputDt1);
        } catch (Exception exc) {
            actual23 = exc;
        }
        Exception actual24;
        try {
            Validate.between(startDt, endDt, inputDt2);
        } catch (Exception exc) {
            actual24 = exc;
        }
        Exception actual25;
        try {
            Validate.between(startDt, endDt, inputDt3);
        } catch (Exception exc) {
            actual25 = exc;
        }
        Exception actual26;
        try {
            Validate.between(startTime, endTime, inputTime);
        } catch (Exception exc) {
            actual26 = exc;
        }
        Exception actual27;
        try {
            Validate.between(startTime, endTime, inputTime1);
        } catch (Exception exc) {
            actual27 = exc;
        }
        Exception actual28;
        try {
            Validate.between(startTime, endTime, inputTime2);
        } catch (Exception exc) {
            actual28 = exc;
        }
        Exception actual29;
        try {
            Validate.between(startTime, endTime, inputTime3);
        } catch (Exception exc) {
            actual29 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(NullPointerException.class.getName(), actual1.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual1.getMessage());
        Assert.areEqual(NullPointerException.class.getName(), actual2.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual2.getMessage());
        Assert.areEqual(NullPointerException.class.getName(), actual3.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual3.getMessage());
        Assert.areEqual(NullPointerException.class.getName(), actual4.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual4.getMessage());
        Assert.areEqual(NullPointerException.class.getName(), actual5.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual5.getMessage());
        Assert.areEqual(null, actual6);
        Assert.areEqual(null, actual7);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual8.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotBetween, inputLong2, startLong, endLong),
            actual8.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual9.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotBetween, inputLong3, startLong, endLong),
            actual9.getMessage()
        );
        Assert.areEqual(null, actual10);
        Assert.areEqual(null, actual11);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual12.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotBetween, inputInt2, startInt, endInt),
            actual12.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual13.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotBetween, inputInt3, startInt, endInt),
            actual13.getMessage()
        );
        Assert.areEqual(null, actual14);
        Assert.areEqual(null, actual15);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual16.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotBetween, inputDouble2, startDouble, endDouble),
            actual16.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual17.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotBetween, inputDouble3, startDouble, endDouble),
            actual17.getMessage()
        );
        Assert.areEqual(null, actual18);
        Assert.areEqual(null, actual19);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual20.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotBetween, inputDate2, startDate, endDate),
            actual20.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual21.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotBetween, inputDate3, startDate, endDate),
            actual21.getMessage()
        );
        Assert.areEqual(null, actual22);
        Assert.areEqual(null, actual23);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual24.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotBetween, inputDt2, startDt, endDt),
            actual24.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual25.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotBetween, inputDt3, startDt, endDt),
            actual25.getMessage()
        );
        Assert.areEqual(null, actual26);
        Assert.areEqual(null, actual27);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual28.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotBetween, inputTime2, startTime, endTime),
            actual28.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual29.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotBetween, inputTime3, startTime, endTime),
            actual29.getMessage()
        );
    }

    /**
     * @see Validate.areEqual
     */
    @IsTest
    static void areEqual() {
        // Given
        Object o1 = 1;
        Object o2 = 1;
        Object o3 = 2;
        // When
        Exception actual;
        try {
            Validate.areEqual(o1, o2);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.areEqual(o1, o3);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.areEqual(NULL_STRING, NULL_STRING);
        } catch (Exception exc) {
            actual2 = exc;
        }
        // Then
        Assert.areEqual(null, actual);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_NotEqual, o1, o3), actual1.getMessage());
        Assert.areEqual(null, actual2);
    }

    /**
     * @see Validate.areNotEqual
     */
    @IsTest
    static void areNotEqual() {
        // Given
        Object o1 = 1;
        Object o2 = 1;
        Object o3 = 2;
        // When
        Exception actual;
        try {
            Validate.areNotEqual(o1, o2);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.areNotEqual(o1, o3);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.areNotEqual(NULL_STRING, NULL_STRING);
        } catch (Exception exc) {
            actual2 = exc;
        }
        // Then
        Assert.areEqual(IllegalArgumentException.class.getName(), actual.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_Equal, o1, o2), actual.getMessage());
        Assert.areEqual(null, actual1);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual2.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_Equal, NULL_STRING, NULL_STRING),
            actual2.getMessage()
        );
    }

    /**
     * @see Validate.isFalse
     */
    @IsTest
    static void isFalse() {
        // When
        Exception actual;
        try {
            Validate.isFalse(null);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.isFalse(true);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.isFalse(false);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.isFalse(2 < 3);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.isFalse(2 > 3);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.isFalse(2 == 2, MESSAGE);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.isFalse(2 == 2, MESSAGE, ARGUMENTS);
        } catch (Exception exc) {
            actual6 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_TrueCondition, actual1.getMessage());
        Assert.areEqual(null, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual3.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_TrueCondition, actual3.getMessage());
        Assert.areEqual(null, actual4);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual5.getTypeName());
        Assert.areEqual(MESSAGE, actual5.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual6.getTypeName());
        Assert.areEqual(String.format(MESSAGE, ARGUMENTS), actual6.getMessage());
    }

    /**
     * @see Validate.isInstanceOfType
     */
    @IsTest
    static void isInstanceOfType() {
        // Given
        Object input;
        Object input1 = 1L;
        Object input2 = 1;
        Object input3 = (Double) 1.0;
        // When
        Exception actual;
        try {
            Validate.isInstanceOfType(input, null);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.isInstanceOfType(input, Object.class);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.isInstanceOfType(input, String.class);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.isInstanceOfType(input1, Long.class);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.isInstanceOfType(input1, Double.class);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.isInstanceOfType(input1, Integer.class);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.isInstanceOfType(input2, Double.class);
        } catch (Exception exc) {
            actual6 = exc;
        }
        Exception actual7;
        try {
            Validate.isInstanceOfType(input2, Integer.class);
        } catch (Exception exc) {
            actual7 = exc;
        }
        Exception actual8;
        try {
            Validate.isInstanceOfType(input3, Double.class);
        } catch (Exception exc) {
            actual8 = exc;
        }
        Exception actual9;
        try {
            Validate.isInstanceOfType(input3, Integer.class);
        } catch (Exception exc) {
            actual9 = exc;
        }
        Exception actual10;
        try {
            Validate.isInstanceOfType(SET_WITH_VALUES, Set<Integer>.class);
        } catch (Exception exc) {
            actual10 = exc;
        }
        Exception actual11;
        try {
            Validate.isInstanceOfType(NULL_STRING, Set<Integer>.class);
        } catch (Exception exc) {
            actual11 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(null, actual1);
        Assert.areEqual(null, actual2);
        Assert.areEqual(null, actual3);
        Assert.areEqual(null, actual4);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual5.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotInstanceOf, Integer.class, Long.class),
            actual5.getMessage()
        );
        Assert.areEqual(null, actual6);
        Assert.areEqual(null, actual7);
        Assert.areEqual(null, actual8);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual9.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotInstanceOf, Integer.class, Double.class),
            actual9.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual10.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotInstanceOf, Set<Integer>.class, Set<String>.class),
            actual10.getMessage()
        );
        Assert.areEqual(null, actual11);
    }

    /**
     * @see Validate.isNotInstanceOfType
     */
    @IsTest
    static void isNotInstanceOfType() {
        // Given
        Object input;
        Object input1 = 1L;
        Object input2 = 1;
        Object input3 = (Double) 1.0;
        // When
        Exception actual;
        try {
            Validate.isNotInstanceOfType(input, null);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.isNotInstanceOfType(input, Object.class);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.isNotInstanceOfType(input, String.class);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.isNotInstanceOfType(input1, Long.class);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.isNotInstanceOfType(input1, Double.class);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.isNotInstanceOfType(input1, Integer.class);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.isNotInstanceOfType(input2, Double.class);
        } catch (Exception exc) {
            actual6 = exc;
        }
        Exception actual7;
        try {
            Validate.isNotInstanceOfType(input2, Integer.class);
        } catch (Exception exc) {
            actual7 = exc;
        }
        Exception actual8;
        try {
            Validate.isNotInstanceOfType(input3, Double.class);
        } catch (Exception exc) {
            actual8 = exc;
        }
        Exception actual9;
        try {
            Validate.isNotInstanceOfType(input3, Integer.class);
        } catch (Exception exc) {
            actual9 = exc;
        }
        Exception actual10;
        try {
            Validate.isNotInstanceOfType(SET_WITH_VALUES, Set<Integer>.class);
        } catch (Exception exc) {
            actual10 = exc;
        }
        Exception actual11;
        try {
            Validate.isNotInstanceOfType(NULL_STRING, Set<Integer>.class);
        } catch (Exception exc) {
            actual11 = exc;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InstanceOf, Object.class),
            actual1.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual2.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InstanceOf, String.class),
            actual2.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual3.getTypeName());
        Assert.areEqual(Validate.format(Label.AV_ErrorMessage_InstanceOf, Long.class), actual3.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual4.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InstanceOf, Double.class),
            actual4.getMessage()
        );
        Assert.areEqual(null, actual5);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual6.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InstanceOf, Double.class), 
            actual6.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual7.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InstanceOf, Integer.class),
            actual7.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual8.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InstanceOf, Double.class),
            actual8.getMessage()
        );
        Assert.areEqual(null, actual9);
        Assert.areEqual(null, actual10);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual11.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_InstanceOf, Set<Integer>.class),
            actual11.getMessage()
        );
    }

    /**
     * @see Validate.isNotNull
     */
    @IsTest
    static void isNotNull() {
        // When
        Exception actual;
        try {
            Validate.isNotNull(null);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.isNotNull(NULL_LIST);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.isNotNull(EMPTY_LIST);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.isNotNull(LIST_WITH_NULL);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.isNotNull(LIST_WITH_VALUES);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.isNotNull(LIST_WITH_VALUES_AND_NULL);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.isNotNull(EMPTY);
        } catch (Exception exc) {
            actual6 = exc;
        }
        Exception actual7;
        try {
            Validate.isNotNull(WHITESPACE);
        } catch (Exception exc) {
            actual7 = exc;
        }
        // Then
        Assert.areEqual(IllegalArgumentException.class.getName(), actual.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual.getMessage());
        Assert.areEqual(IllegalArgumentException.class.getName(), actual1.getTypeName());
        Assert.areEqual(Label.AV_ErrorMessage_Null, actual1.getMessage());
        Assert.areEqual(null, actual2);
        Assert.areEqual(null, actual3);
        Assert.areEqual(null, actual4);
        Assert.areEqual(null, actual5);
        Assert.areEqual(null, actual6);
        Assert.areEqual(null, actual7);
    }

    /**
     * @see Validate.isNull
     */
    @IsTest
    static void isNull() {
        // When
        Exception actual;
        try {
            Validate.isNull(null);
        } catch (Exception exc) {
            actual = exc;
        }
        Exception actual1;
        try {
            Validate.isNull(NULL_LIST);
        } catch (Exception exc) {
            actual1 = exc;
        }
        Exception actual2;
        try {
            Validate.isNull(EMPTY_LIST);
        } catch (Exception exc) {
            actual2 = exc;
        }
        Exception actual3;
        try {
            Validate.isNull(LIST_WITH_NULL);
        } catch (Exception exc) {
            actual3 = exc;
        }
        Exception actual4;
        try {
            Validate.isNull(LIST_WITH_VALUES);
        } catch (Exception exc) {
            actual4 = exc;
        }
        Exception actual5;
        try {
            Validate.isNull(LIST_WITH_VALUES_AND_NULL);
        } catch (Exception exc) {
            actual5 = exc;
        }
        Exception actual6;
        try {
            Validate.isNull(EMPTY);
        } catch (Exception exc) {
            actual6 = exc;
        }
        Exception actual7;
        try {
            Validate.isNull(WHITESPACE);
        } catch (Exception exc) {
            actual7 = exc;
        }
        // Then
        Assert.areEqual(null, actual);
        Assert.areEqual(null, actual1);
        Assert.areEqual(IllegalArgumentException.class.getName(), actual2.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotNull, (Object) EMPTY_LIST),
            actual2.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual3.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotNull, (Object) LIST_WITH_NULL),
            actual3.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual4.getTypeName());
        Assert.areEqual(
            Validate.escapeBraces(Validate.format(Label.AV_ErrorMessage_NotNull, (Object) LIST_WITH_VALUES)),
            actual4.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual5.getTypeName());
        Assert.areEqual(
            Validate.escapeBraces(
                Validate.format(Label.AV_ErrorMessage_NotNull, (Object) LIST_WITH_VALUES_AND_NULL)
            ),
            actual5.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual6.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotNull, EMPTY),
            actual6.getMessage()
        );
        Assert.areEqual(IllegalArgumentException.class.getName(), actual7.getTypeName());
        Assert.areEqual(
            Validate.format(Label.AV_ErrorMessage_NotNull, WHITESPACE),
            actual7.getMessage()
        );
    }

}
