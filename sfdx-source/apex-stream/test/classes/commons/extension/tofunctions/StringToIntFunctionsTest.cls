/**
 * @see StringToIntFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class StringToIntFunctionsTest {

    private static final List<String> INPUT = IterTestUtils.generateStrings();

    static {
        new StringToIntFunctions();
    }

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
        for (String s : INPUT) {
            if (s.length() > i) {
                Assert.areEqual(s.charAt(i), charAt.apply(s));
                Assert.areEqual(s.codePointAt(i), codePointAt.apply(s));
                Assert.areEqual(s.codePointBefore(i), codePointBefore.apply(s));
                Assert.areEqual(s.codePointCount(i, e), codePointCount.apply(s));
                Assert.areEqual(s.compareTo(str), compareTo.apply(s));
                Assert.areEqual(s.countMatches(str), countMatches.apply(s));
                Assert.areEqual(s.getLevenshteinDistance(str), getLevenshteinDistance.apply(s));
                Assert.areEqual(s.getLevenshteinDistance(str, e), getLevenshteinDistance1.apply(s));
                Assert.areEqual(s.indexOf(str), indexOf.apply(s));
                Assert.areEqual(s.indexOf(str, i), indexOf1.apply(s));
                Assert.areEqual(s.indexOfAny(str), indexOfAny.apply(s));
                Assert.areEqual(s.indexOfAnyBut(str), indexOfAnyBut.apply(s));
                Assert.areEqual(s.indexOfChar(i), indexOfChar.apply(s));
                Assert.areEqual(s.indexOfChar(i, e), indexOfChar1.apply(s));
                Assert.areEqual(s.indexOfDifference(str), indexOfDifference.apply(s));
                Assert.areEqual(s.indexOfIgnoreCase(str), indexOfIgnoreCase.apply(s));
                Assert.areEqual(s.indexOfIgnoreCase(str, i), indexOfIgnoreCase1.apply(s));
                Assert.areEqual(s.lastIndexOf(str), lastIndexOf.apply(s));
                Assert.areEqual(s.lastIndexOf(str, i), lastIndexOf1.apply(s));
                Assert.areEqual(s.lastIndexOfChar(i), lastIndexOfChar.apply(s));
                Assert.areEqual(s.lastIndexOfChar(i, e), lastIndexOfChar1.apply(s));
                Assert.areEqual(s.lastIndexOfIgnoreCase(str), lastIndexOfIgnoreCase.apply(s));
                Assert.areEqual(s.lastIndexOfIgnoreCase(str, i), lastIndexOfIgnoreCase1.apply(s));
                if (s.length() > e) {
                    Assert.areEqual(s.offsetByCodePoints(i, e), offsetByCodePoints.apply(s));
                }
            }
            Assert.areEqual(s.length(), length.apply(s));
        }
    }

}
