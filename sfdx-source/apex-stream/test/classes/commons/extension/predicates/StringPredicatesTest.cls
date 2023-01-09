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
            Assert.areEqual(s.contains(s1), contains.test(s));
            Assert.areEqual(s.containsAny(s2), containsAny.test(s));
            Assert.areEqual(s.containsIgnoreCase(s3), containsIgnoreCase.test(s));
            Assert.areEqual(s.containsNone(s4), containsNone.test(s));
            Assert.areEqual(s.containsOnly(s5), containsOnly.test(s));
            Assert.areEqual(s.containsWhitespace(), containsWhitespace.test(s));
            Assert.areEqual(s.endsWith(s6), endsWith.test(s));
            Assert.areEqual(s.endsWithIgnoreCase(s7), endsWithIgnoreCase.test(s));
            Assert.areEqual(s.equalsIgnoreCase(s8), equalsIgnoreCase.test(s));
            Assert.areEqual(s.isAllLowerCase(), isAllLowerCase.test(s));
            Assert.areEqual(s.isAllUpperCase(), isAllUpperCase.test(s));
            Assert.areEqual(s.isAlpha(), isAlpha.test(s));
            Assert.areEqual(s.isAlphaSpace(), isAlphaSpace.test(s));
            Assert.areEqual(s.isAlphanumeric(), isAlphaNumeric.test(s));
            Assert.areEqual(s.isAlphanumericSpace(), isAlphaNumericSpace.test(s));
            Assert.areEqual(s.isAsciiPrintable(), isAsciiPrintable.test(s));
            Assert.areEqual(String.isBlank(s), isBlank.test(s));
            Assert.areEqual(String.isEmpty(s), isEmpty.test(s));
            Assert.areEqual(String.isNotBlank(s), isNotBlank.test(s));
            Assert.areEqual(String.isNotEmpty(s), isNotEmpty.test(s));
            Assert.areEqual(Pattern.matches(
                    '(?i)^' + s9.replaceAll('([^\\w%_ ])', '\\\\$1')
                            .replace('%', '.*?').replace('_', '.{1}?') + '$', s
            ), isLike.test(s));
            Assert.areEqual(s.isNumeric(), isNumeric.test(s));
            Assert.areEqual(s.isNumericSpace(), isNumericSpace.test(s));
            Assert.areEqual(s.isWhitespace(), isWhitespace.test(s));
            Assert.areEqual(s.startsWith(s10), startsWith.test(s));
            Assert.areEqual(s.startsWithIgnoreCase(s11), startsWithIgnoreCase.test(s));
        }
    }
    
}
