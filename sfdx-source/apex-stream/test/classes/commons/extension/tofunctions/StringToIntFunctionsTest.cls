/**
 * @see StringToIntFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class StringToIntFunctionsTest {

    private static List<String> strings = IterTestUtils.generateStrings();

    /**
     * @see StringToIntFunctions.charAt
     * @see StringToIntFunctions.codePointAt
     * @see StringToIntFunctions.codePointBefore
     * @see StringToIntFunctions.codePointCount
     * @see StringToIntFunctions.compareTo
     * @see StringToIntFunctions.countMatches
     * @see StringToIntFunctions.getLevenshteinDistance
     * @see StringToIntFunctions.indexOf
     * @see StringToIntFunctions.indexOfAny
     * @see StringToIntFunctions.indexOfAnyBut
     * @see StringToIntFunctions.indexOfChar
     * @see StringToIntFunctions.indexOfDifference
     * @see StringToIntFunctions.indexOfIgnoreCase
     * @see StringToIntFunctions.lastIndexOf
     * @see StringToIntFunctions.lastIndexOfChar
     * @see StringToIntFunctions.lastIndexOfIgnoreCase
     * @see StringToIntFunctions.length
     * @see StringToIntFunctions.offsetByCodePoints
     */
    @IsTest
    static void convert() {
        // Given
        Integer i = 1;
        Integer e = 3;
        String str = 'Hello';
        // When
        new StringToIntFunctions();
        IToIntFunction charAt = StringToIntFunctions.charAt(i);
        IToIntFunction codePointAt = StringToIntFunctions.codePointAt(i);
        IToIntFunction codePointBefore = StringToIntFunctions.codePointBefore(i);
        IToIntFunction codePointCount = StringToIntFunctions.codePointCount(i, e);
        IToIntFunction compareTo = StringToIntFunctions.compareTo(str);
        IToIntFunction countMatches = StringToIntFunctions.countMatches(str);
        IToIntFunction getLevenshteinDistance = StringToIntFunctions.getLevenshteinDistance(str);
        IToIntFunction getLevenshteinDistance1 = StringToIntFunctions.getLevenshteinDistance(str, e);
        IToIntFunction indexOf = StringToIntFunctions.indexOf(str);
        IToIntFunction indexOf1 = StringToIntFunctions.indexOf(str, i);
        IToIntFunction indexOfAny = StringToIntFunctions.indexOfAny(str);
        IToIntFunction indexOfAnyBut = StringToIntFunctions.indexOfAnyBut(str);
        IToIntFunction indexOfChar = StringToIntFunctions.indexOfChar(i);
        IToIntFunction indexOfChar1 = StringToIntFunctions.indexOfChar(i, e);
        IToIntFunction indexOfDifference = StringToIntFunctions.indexOfDifference(str);
        IToIntFunction indexOfIgnoreCase = StringToIntFunctions.indexOfIgnoreCase(str);
        IToIntFunction indexOfIgnoreCase1 = StringToIntFunctions.indexOfIgnoreCase(str, i);
        IToIntFunction lastIndexOf = StringToIntFunctions.lastIndexOf(str);
        IToIntFunction lastIndexOf1 = StringToIntFunctions.lastIndexOf(str, i);
        IToIntFunction lastIndexOfChar = StringToIntFunctions.lastIndexOfChar(i);
        IToIntFunction lastIndexOfChar1 = StringToIntFunctions.lastIndexOfChar(i, e);
        IToIntFunction lastIndexOfIgnoreCase = StringToIntFunctions.lastIndexOfIgnoreCase(str);
        IToIntFunction lastIndexOfIgnoreCase1 = StringToIntFunctions.lastIndexOfIgnoreCase(str, i);
        IToIntFunction length = StringToIntFunctions.length();
        IToIntFunction offsetByCodePoints = StringToIntFunctions.offsetByCodePoints(i, e);
        // Then
        for (String s : strings) {
            if (s.length() > i) {
                Validate.assertEquals(s.charAt(i), charAt.apply(s));
                Validate.assertEquals(s.codePointAt(i), codePointAt.apply(s));
                Validate.assertEquals(s.codePointBefore(i), codePointBefore.apply(s));
                Validate.assertEquals(s.codePointCount(i, e), codePointCount.apply(s));
                Validate.assertEquals(s.compareTo(str), compareTo.apply(s));
                Validate.assertEquals(s.countMatches(str), countMatches.apply(s));
                Validate.assertEquals(s.getLevenshteinDistance(str), getLevenshteinDistance.apply(s));
                Validate.assertEquals(s.getLevenshteinDistance(str, e), getLevenshteinDistance1.apply(s));
                Validate.assertEquals(s.indexOf(str), indexOf.apply(s));
                Validate.assertEquals(s.indexOf(str, i), indexOf1.apply(s));
                Validate.assertEquals(s.indexOfAny(str), indexOfAny.apply(s));
                Validate.assertEquals(s.indexOfAnyBut(str), indexOfAnyBut.apply(s));
                Validate.assertEquals(s.indexOfChar(i), indexOfChar.apply(s));
                Validate.assertEquals(s.indexOfChar(i, e), indexOfChar1.apply(s));
                Validate.assertEquals(s.indexOfDifference(str), indexOfDifference.apply(s));
                Validate.assertEquals(s.indexOfIgnoreCase(str), indexOfIgnoreCase.apply(s));
                Validate.assertEquals(s.indexOfIgnoreCase(str, i), indexOfIgnoreCase1.apply(s));
                Validate.assertEquals(s.lastIndexOf(str), lastIndexOf.apply(s));
                Validate.assertEquals(s.lastIndexOf(str, i), lastIndexOf1.apply(s));
                Validate.assertEquals(s.lastIndexOfChar(i), lastIndexOfChar.apply(s));
                Validate.assertEquals(s.lastIndexOfChar(i, e), lastIndexOfChar1.apply(s));
                Validate.assertEquals(s.lastIndexOfIgnoreCase(str), lastIndexOfIgnoreCase.apply(s));
                Validate.assertEquals(s.lastIndexOfIgnoreCase(str, i), lastIndexOfIgnoreCase1.apply(s));
                if (s.length() > e) {
                    Validate.assertEquals(s.offsetByCodePoints(i, e), offsetByCodePoints.apply(s));
                }
            }
            Validate.assertEquals(s.length(), length.apply(s));
        }
    }

}
