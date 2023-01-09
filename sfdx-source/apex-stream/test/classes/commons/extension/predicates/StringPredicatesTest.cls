/**
 * @see StringPredicates
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class StringPredicatesTest {

    private static final List<String> INPUT = IterTestUtils.generateStrings();

    static {
        new StringPredicates();
    }
    
    /**
     * @see StringPredicates.contains
     * @see StringPredicates.containsAny
     * @see StringPredicates.containsIgnoreCase
     * @see StringPredicates.containsNone
     * @see StringPredicates.containsOnly
     * @see StringPredicates.containsWhitespace
     * @see StringPredicates.endsWith
     * @see StringPredicates.endsWithIgnoreCase
     * @see StringPredicates.equalsIgnoreCase
     * @see StringPredicates.isAllLowerCase
     * @see StringPredicates.isAllUpperCase
     * @see StringPredicates.isAlpha
     * @see StringPredicates.isAlphaNumeric
     * @see StringPredicates.isAlphaNumericSpace
     * @see StringPredicates.isAsciiPrintable
     * @see StringPredicates.isBlank
     * @see StringPredicates.isEmpty
     * @see StringPredicates.isLike
     * @see StringPredicates.isNotBlank
     * @see StringPredicates.isNotEmpty
     * @see StringPredicates.isNumeric
     * @see StringPredicates.isNumericSpace
     * @see StringPredicates.isWhitespace
     * @see StringPredicates.startsWith
     * @see StringPredicates.startsWithIgnoreCase
     */
    @IsTest
    static void stringPredicates() {
        // Given
        String s1 = 'abcd';
        String s2 = 'hx';
        String s3 = 'HE';
        String s4 = 'fg';
        String s5 = 'abba';
        String s6 = 'Jason';
        String s7 = 'jason';
        String s8 = 'hello jason';
        String s9 = '%o J%';
        String s10 = 'Hello';
        String s11 = 'hello';
        // When
        IPredicate contains = StringPredicates.contains(s1);
        IPredicate containsAny = StringPredicates.containsAny(s2);
        IPredicate containsIgnoreCase = StringPredicates.containsIgnoreCase(s3);
        IPredicate containsNone = StringPredicates.containsNone(s4);
        IPredicate containsOnly = StringPredicates.containsOnly(s5);
        IPredicate containsWhitespace = StringPredicates.containsWhitespace();
        IPredicate endsWith = StringPredicates.endsWith(s6);
        IPredicate endsWithIgnoreCase = StringPredicates.endsWithIgnoreCase(s7);
        IPredicate equalsIgnoreCase = StringPredicates.equalsIgnoreCase(s8);
        IPredicate isAllLowerCase = StringPredicates.isAllLowerCase();
        IPredicate isAllUpperCase = StringPredicates.isAllUpperCase();
        IPredicate isAlpha = StringPredicates.isAlpha();
        IPredicate isAlphaSpace = StringPredicates.isAlphaSpace();
        IPredicate isAlphaNumeric = StringPredicates.isAlphaNumeric();
        IPredicate isAlphaNumericSpace = StringPredicates.isAlphaNumericSpace();
        IPredicate isAsciiPrintable = StringPredicates.isAsciiPrintable();
        IPredicate isBlank = StringPredicates.isBlank();
        IPredicate isEmpty = StringPredicates.isEmpty();
        IPredicate isNotBlank = StringPredicates.isNotBlank();
        IPredicate isNotEmpty = StringPredicates.isNotEmpty();
        IPredicate isLike = StringPredicates.isLike(s9);
        IPredicate isNumeric = StringPredicates.isNumeric();
        IPredicate isNumericSpace = StringPredicates.isNumericSpace();
        IPredicate isWhitespace = StringPredicates.isWhitespace();
        IPredicate startsWith = StringPredicates.startsWith(s10);
        IPredicate startsWithIgnoreCase = StringPredicates.startsWithIgnoreCase(s11);
        // Then
        for (String s : INPUT) {
            Validate.assertEquals(s.contains(s1), contains.test(s));
            Validate.assertEquals(s.containsAny(s2), containsAny.test(s));
            Validate.assertEquals(s.containsIgnoreCase(s3), containsIgnoreCase.test(s));
            Validate.assertEquals(s.containsNone(s4), containsNone.test(s));
            Validate.assertEquals(s.containsOnly(s5), containsOnly.test(s));
            Validate.assertEquals(s.containsWhitespace(), containsWhitespace.test(s));
            Validate.assertEquals(s.endsWith(s6), endsWith.test(s));
            Validate.assertEquals(s.endsWithIgnoreCase(s7), endsWithIgnoreCase.test(s));
            Validate.assertEquals(s.equalsIgnoreCase(s8), equalsIgnoreCase.test(s));
            Validate.assertEquals(s.isAllLowerCase(), isAllLowerCase.test(s));
            Validate.assertEquals(s.isAllUpperCase(), isAllUpperCase.test(s));
            Validate.assertEquals(s.isAlpha(), isAlpha.test(s));
            Validate.assertEquals(s.isAlphaSpace(), isAlphaSpace.test(s));
            Validate.assertEquals(s.isAlphanumeric(), isAlphaNumeric.test(s));
            Validate.assertEquals(s.isAlphanumericSpace(), isAlphaNumericSpace.test(s));
            Validate.assertEquals(s.isAsciiPrintable(), isAsciiPrintable.test(s));
            Validate.assertEquals(String.isBlank(s), isBlank.test(s));
            Validate.assertEquals(String.isEmpty(s), isEmpty.test(s));
            Validate.assertEquals(String.isNotBlank(s), isNotBlank.test(s));
            Validate.assertEquals(String.isNotEmpty(s), isNotEmpty.test(s));
            Validate.assertEquals(Pattern.matches(
                    '(?i)^' + s9.replaceAll('([^\\w%_ ])', '\\\\$1')
                            .replace('%', '.*?').replace('_', '.{1}?') + '$', s
            ), isLike.test(s));
            Validate.assertEquals(s.isNumeric(), isNumeric.test(s));
            Validate.assertEquals(s.isNumericSpace(), isNumericSpace.test(s));
            Validate.assertEquals(s.isWhitespace(), isWhitespace.test(s));
            Validate.assertEquals(s.startsWith(s10), startsWith.test(s));
            Validate.assertEquals(s.startsWithIgnoreCase(s11), startsWithIgnoreCase.test(s));
        }
    }
    
}
