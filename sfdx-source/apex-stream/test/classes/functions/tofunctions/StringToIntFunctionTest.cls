/**
 * @author Oleh Berehovskyi
 * @see StringToIntFunction
 */
@IsTest(IsParallel = true)
private class StringToIntFunctionTest {

    private static List<String> strings = IterTestUtils.generateStrings();

    /**
     * @see StringToIntFunction.charAt
     * @see StringToIntFunction.codePointAt
     * @see StringToIntFunction.codePointBefore
     * @see StringToIntFunction.codePointCount
     * @see StringToIntFunction.compareTo
     * @see StringToIntFunction.countMatches
     * @see StringToIntFunction.getLevenshteinDistance
     * @see StringToIntFunction.indexOf
     * @see StringToIntFunction.indexOfAny
     * @see StringToIntFunction.indexOfAnyBut
     * @see StringToIntFunction.indexOfChar
     * @see StringToIntFunction.indexOfDifference
     * @see StringToIntFunction.indexOfIgnoreCase
     * @see StringToIntFunction.lastIndexOf
     * @see StringToIntFunction.lastIndexOfChar
     * @see StringToIntFunction.lastIndexOfIgnoreCase
     * @see StringToIntFunction.length
     * @see StringToIntFunction.offsetByCodePoints
     */
    @IsTest
    static void default() {
        // Given
        Integer i = 1;
        Integer e = 3;
        String str = 'Hello';
        // When
        IToIntFunction charAt = StringToIntFunction.charAt(i);
        IToIntFunction codePointAt = StringToIntFunction.codePointAt(i);
        IToIntFunction codePointBefore = StringToIntFunction.codePointBefore(i);
        IToIntFunction codePointCount = StringToIntFunction.codePointCount(i, e);
        IToIntFunction compareTo = StringToIntFunction.compareTo(str);
        IToIntFunction countMatches = StringToIntFunction.countMatches(str);
        IToIntFunction getLevenshteinDistance = StringToIntFunction.getLevenshteinDistance(str);
        IToIntFunction getLevenshteinDistance1 = StringToIntFunction.getLevenshteinDistance(str, e);
        IToIntFunction indexOf = StringToIntFunction.indexOf(str);
        IToIntFunction indexOf1 = StringToIntFunction.indexOf(str, i);
        IToIntFunction indexOfAny = StringToIntFunction.indexOfAny(str);
        IToIntFunction indexOfAnyBut = StringToIntFunction.indexOfAnyBut(str);
        IToIntFunction indexOfChar = StringToIntFunction.indexOfChar(i);
        IToIntFunction indexOfChar1 = StringToIntFunction.indexOfChar(i, e);
        IToIntFunction indexOfDifference = StringToIntFunction.indexOfDifference(str);
        IToIntFunction indexOfIgnoreCase = StringToIntFunction.indexOfIgnoreCase(str);
        IToIntFunction indexOfIgnoreCase1 = StringToIntFunction.indexOfIgnoreCase(str, i);
        IToIntFunction lastIndexOf = StringToIntFunction.lastIndexOf(str);
        IToIntFunction lastIndexOf1 = StringToIntFunction.lastIndexOf(str, i);
        IToIntFunction lastIndexOfChar = StringToIntFunction.lastIndexOfChar(i);
        IToIntFunction lastIndexOfChar1 = StringToIntFunction.lastIndexOfChar(i, e);
        IToIntFunction lastIndexOfIgnoreCase = StringToIntFunction.lastIndexOfIgnoreCase(str);
        IToIntFunction lastIndexOfIgnoreCase1 = StringToIntFunction.lastIndexOfIgnoreCase(str, i);
        IToIntFunction length = StringToIntFunction.length();
        IToIntFunction offsetByCodePoints = StringToIntFunction.offsetByCodePoints(i, e);
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
