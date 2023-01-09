/**
 * @description Provides common implementations of `String` {@link ToIntFunction}
 * and related utilities.
 * 
 * @see ToIntFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class StringToIntFunctions {

    @TestVisible
    private StringToIntFunctions() {}

    //<editor-fold desc="String To Int Functions">
    // @start-group String To Int Functions
    /**
     * @description Returns a `ToIntFunction` that returns the value of
     * the character at the specified `index`.
     *
     * @param index the index
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `index` is null
     *
     * @see String.charAt
     */
    public static ToIntFunction charAt(final Integer index) {
        Validate.notNull(index);
        return new CharAt(index);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the Unicode code point value
     * at the specified `index`.
     *
     * @param index the index
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `index` is null
     *
     * @see String.codePointAt
     */
    public static ToIntFunction codePointAt(final Integer index) {
        Validate.notNull(index);
        return new CodePointAt(index);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the Unicode code point value
     * that occurs before the specified `index`.
     *
     * @param index the index
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `index` is null
     *
     * @see String.codePointBefore
     */
    public static ToIntFunction codePointBefore(final Integer index) {
        Validate.notNull(index);
        return new CodePointBefore(index);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the number of Unicode code points
     * within the specified text range.
     *
     * @param beginIndex the starting index
     * @param endIndex the ending index
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `beginIndex` or `endIndex` is null
     *
     * @see String.codePointCount
     */
    public static ToIntFunction codePointCount(final Integer beginIndex, final Integer endIndex) {
        Validate.notNull(beginIndex);
        Validate.notNull(endIndex);
        return new CodePointCount(beginIndex, endIndex);
    }

    /**
     * @description Returns a `ToIntFunction` that compares two strings lexicographically,
     * based on the Unicode value of each character in the Strings.
     *
     * @param str the String to compare
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `str` is null
     *
     * @see String.compareTo
     */
    public static ToIntFunction compareTo(final String str) {
        Validate.notNull(str);
        return new CompareTo(str);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the number of times
     * the specified substring occurs in the String input argument.
     *
     * @param searchStr the String to compare
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `searchStr` is null
     *
     * @see String.countMatches
     */
    public static ToIntFunction countMatches(final String searchStr) {
        Validate.notNull(searchStr);
        return new CountMatches(searchStr);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the Levenshtein distance
     * between the String input argument and the specified `other` String.
     *
     * @param other the String to compare
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `other` is null
     *
     * @see String.getLevenshteinDistance
     */
    public static ToIntFunction getLevenshteinDistance(final String other) {
        Validate.notNull(other);
        return new GetLevenshteinDistance(other);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the Levenshtein distance
     * between the String input argument and the specified `other` String if it is less
     * than or equal than the given threshold; otherwise, returns -1.
     *
     * @param other the String to compare
     * @param threshold the threshold
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `other` or `threshold` is null
     *
     * @see String.getLevenshteinDistance
     */
    public static ToIntFunction getLevenshteinDistance(final String other, final Integer threshold) {
        Validate.notNull(other);
        Validate.notNull(threshold);
        return new GetLevenshteinDistanceThreshold(other, threshold);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the index of the first occurrence
     * of the specified `substring`.
     * If the `substring` does not occur, this method returns -1.
     *
     * @param substring the String
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.indexOf
     */
    public static ToIntFunction indexOf(final String substring) {
        Validate.notNull(substring);
        return new IndexOf(substring);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the index of the first occurrence
     * of the specified `substring` from the point of the given `index`.
     * If the `substring` does not occur, this method returns -1.
     *
     * @param substring the String
     * @param index the starting position
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `substring` or `index` is null
     *
     * @see String.indexOf
     */
    public static ToIntFunction indexOf(final String substring, final Integer index) {
        Validate.notNull(substring);
        Validate.notNull(index);
        return new IndexOfStartPos(substring, index);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the zero-based index of the first occurrence
     * of any character specified in the `substring`.
     * If the `substring` does not occur, this method returns -1.
     *
     * @param substring the String
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.indexOfAny
     */
    public static ToIntFunction indexOfAny(final String substring) {
        Validate.notNull(substring);
        return new IndexOfAny(substring);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the zero-based index of the first occurrence
     * of a character that is not in the specified `substring`. Otherwise, returns -1.
     *
     * @param substring the String
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.indexOfAnyBut
     */
    public static ToIntFunction indexOfAnyBut(final String substring) {
        Validate.notNull(substring);
        return new IndexOfAnyBut(substring);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the index of the first occurrence
     * of the character that corresponds to the specified character value.
     * If the `substring` does not occur, this method returns -1.
     *
     * @param ch the character
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `ch` is null
     *
     * @see String.indexOfChar
     */
    public static ToIntFunction indexOfChar(final Integer ch) {
        Validate.notNull(ch);
        return new IndexOfChar(ch);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the index of the first occurrence
     * of the character that corresponds to the specified character value, starting from the specified index.
     *
     * @param ch the character
     * @param fromIndex the starting index
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `ch` or `fromIndex` is null
     *
     * @see String.indexOfChar
     */
    public static ToIntFunction indexOfChar(final Integer ch, final Integer fromIndex) {
        Validate.notNull(ch);
        Validate.notNull(fromIndex);
        return new IndexOfCharFromIndex(ch, fromIndex);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the zero-based index of the character
     * where the String input argument begins to differ from the specified `other` String.
     *
     * @param other the String
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `other` is null
     *
     * @see String.indexOfDifference
     */
    public static ToIntFunction indexOfDifference(final String other) {
        Validate.notNull(other);
        return new IndexOfDifference(other);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the zero-based index of the first occurrence
     * of the specified substring without regard to case.
     * If the substring does not occur, this method returns -1.
     *
     * @param searchStr the String
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `searchStr` is null
     *
     * @see String.indexOfIgnoreCase
     */
    public static ToIntFunction indexOfIgnoreCase(final String searchStr) {
        Validate.notNull(searchStr);
        return new IndexOfIgnoreCase(searchStr);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the zero-based index of the first occurrence
     * of the specified substring without regard to case, starting from the specified index.
     * If the substring does not occur, this method returns -1.
     *
     * @param searchStr the String
     * @param startPos the starting index
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `searchStr` or `startPos` is null
     *
     * @see String.indexOfIgnoreCase
     */
    public static ToIntFunction indexOfIgnoreCase(final String searchStr, final Integer startPos) {
        Validate.notNull(searchStr);
        Validate.notNull(startPos);
        return new IndexOfIgnoreCaseStartPos(searchStr, startPos);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the index of the last occurrence
     * of the specified `substring`.
     * If the `substring` does not occur, this method returns -1.
     *
     * @param substring the String
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.lastIndexOf
     */
    public static ToIntFunction lastIndexOf(final String substring) {
        Validate.notNull(substring);
        return new LastIndexOf(substring);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the index of the last occurrence
     * of the specified `substring` from the point of the given `index`.
     * If the `substring` does not occur, this method returns -1.
     *
     * @param substring the String
     * @param startPos the starting index
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `substring` or `index` is null
     *
     * @see String.lastIndexOf
     */
    public static ToIntFunction lastIndexOf(final String substring, final Integer startPos) {
        Validate.notNull(substring);
        Validate.notNull(startPos);
        return new LastIndexOfStartPos(substring, startPos);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the index of the last occurrence
     * of the character that corresponds to the specified character value.
     * If the `substring` does not occur, this method returns -1.
     *
     * @param ch the character
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `ch` is null
     *
     * @see String.lastIndexOfChar
     */
    public static ToIntFunction lastIndexOfChar(final Integer ch) {
        Validate.notNull(ch);
        return new LastIndexOfChar(ch);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the index of the last occurrence
     * of the character that corresponds to the specified character value, starting from the specified index.
     *
     * @param ch the character
     * @param fromIndex the starting index
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `ch` or `fromIndex` is null
     *
     * @see String.lastIndexOfChar
     */
    public static ToIntFunction lastIndexOfChar(final Integer ch, final Integer fromIndex) {
        Validate.notNull(ch);
        Validate.notNull(fromIndex);
        return new LastIndexOfCharFromIndex(ch, fromIndex);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the zero-based index of the last occurrence
     * of the specified substring without regard to case.
     * If the substring does not occur, this method returns -1.
     *
     * @param searchStr the String
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `searchStr` is null
     *
     * @see String.lastIndexOfIgnoreCase
     */
    public static ToIntFunction lastIndexOfIgnoreCase(final String searchStr) {
        Validate.notNull(searchStr);
        return new LastIndexOfIgnoreCase(searchStr);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the zero-based index of the last occurrence
     * of the specified substring without regard to case, starting from the specified index.
     * If the substring does not occur, this method returns -1.
     *
     * @param searchStr the String
     * @param startPos the starting index
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `searchStr` or `startPos` is null
     *
     * @see String.lastIndexOfIgnoreCase
     */
    public static ToIntFunction lastIndexOfIgnoreCase(final String searchStr, final Integer startPos) {
        Validate.notNull(searchStr);
        Validate.notNull(startPos);
        return new LastIndexOfIgnoreCaseStartPos(searchStr, startPos);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the number of 16-bit Unicode
     * characters contained in the String inout argument.
     *
     * @return the `ToIntFunction`
     *
     * @see String.length
     */
    public static ToIntFunction length() {
        return new Length();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the index of the Unicode code point
     * that is offset by the specified number of code points, starting from the given `index`.
     *
     * @param index the String
     * @param codePointOffset the number of code points
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `index` or `codePointOffset` is null
     *
     * @see String.offsetByCodePoints
     */
    public static ToIntFunction offsetByCodePoints(final Integer index, final Integer codePointOffset) {
        Validate.notNull(index);
        Validate.notNull(codePointOffset);
        return new OffsetByCodePoints(index, codePointOffset);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class CharAt extends ToIntFunction {
        private final Integer index;
        private CharAt(Integer index) { this.index = index; }
        public override Integer apply(Object o) { return ((String) o).charAt(index); }
    }

    private class CodePointAt extends ToIntFunction {
        private final Integer index;
        private CodePointAt(Integer index) { this.index = index; }
        public override Integer apply(Object o) { return ((String) o).codePointAt(index); }
    }

    private class CodePointBefore extends ToIntFunction {
        private final Integer index;
        private CodePointBefore(Integer index) { this.index = index; }
        public override Integer apply(Object o) { return ((String) o).codePointBefore(index); }
    }

    private class CodePointCount extends ToIntFunction {
        private final Integer beginIndex;
        private final Integer endIndex;
        private CodePointCount(Integer beginIndex, Integer endIndex) {
            this.beginIndex = beginIndex;
            this.endIndex = endIndex;
        }
        public override Integer apply(Object o) { return ((String) o).codePointCount(beginIndex, endIndex); }
    }

    private class CompareTo extends ToIntFunction {
        private final String str;
        private CompareTo(String str) { this.str = str; }
        public override Integer apply(Object o) { return ((String) o).compareTo(str); }
    }

    private class CountMatches extends ToIntFunction {
        private final String searchStr;
        private CountMatches(String searchStr) { this.searchStr = searchStr; }
        public override Integer apply(Object o) { return ((String) o).countMatches(searchStr); }
    }

    private class GetLevenshteinDistance extends ToIntFunction {
        private final String other;
        private GetLevenshteinDistance(String other) { this.other = other; }
        public override Integer apply(Object o) { return ((String) o).getLevenshteinDistance(other); }
    }

    private class GetLevenshteinDistanceThreshold extends ToIntFunction {
        private final String other;
        private final Integer threshold;
        private GetLevenshteinDistanceThreshold(String other, Integer threshold) {
            this.other = other;
            this.threshold = threshold;
        }
        public override Integer apply(Object o) { return ((String) o).getLevenshteinDistance(other, threshold); }
    }

    private class IndexOf extends ToIntFunction {
        private final String str;
        private IndexOf(String str) { this.str = str; }
        public override Integer apply(Object o) { return ((String) o).indexOf(str); }
    }

    private class IndexOfStartPos extends ToIntFunction {
        private final String str;
        private final Integer startPos;
        private IndexOfStartPos(String str, Integer startPos) {
            this.str = str;
            this.startPos = startPos;
        }
        public override Integer apply(Object o) { return ((String) o).indexOf(str, startPos); }
    }

    private class IndexOfAny extends ToIntFunction {
        private final String searchChars;
        private IndexOfAny(String searchChars) { this.searchChars = searchChars; }
        public override Integer apply(Object o) { return ((String) o).indexOfAny(searchChars); }
    }

    private class IndexOfAnyBut extends ToIntFunction {
        private final String searchChars;
        private IndexOfAnyBut(String searchChars) { this.searchChars = searchChars; }
        public override Integer apply(Object o) { return ((String) o).indexOfAnyBut(searchChars); }
    }

    private class IndexOfChar extends ToIntFunction {
        private final Integer ch;
        private IndexOfChar(Integer ch) { this.ch = ch; }
        public override Integer apply(Object o) { return ((String) o).indexOfChar(ch); }
    }

    private class IndexOfCharFromIndex extends ToIntFunction {
        private final Integer ch;
        private final Integer fromIndex;
        private IndexOfCharFromIndex(Integer ch, Integer fromIndex) {
            this.ch = ch;
            this.fromIndex = fromIndex;
        }
        public override Integer apply(Object o) { return ((String) o).indexOfChar(ch, fromIndex); }
    }

    private class IndexOfDifference extends ToIntFunction {
        private final String other;
        private IndexOfDifference(String other) { this.other = other; }
        public override Integer apply(Object o) { return ((String) o).indexOfDifference(other); }
    }

    private class IndexOfIgnoreCase extends ToIntFunction {
        private final String searchStr;
        private IndexOfIgnoreCase(String searchStr) { this.searchStr = searchStr; }
        public override Integer apply(Object o) { return ((String) o).indexOfIgnoreCase(searchStr); }
    }

    private class IndexOfIgnoreCaseStartPos extends ToIntFunction {
        private final String searchStr;
        private final Integer startPos;
        private IndexOfIgnoreCaseStartPos(String searchStr, Integer startPos) {
            this.searchStr = searchStr;
            this.startPos = startPos;
        }
        public override Integer apply(Object o) { return ((String) o).indexOfIgnoreCase(searchStr, startPos); }
    }

    private class LastIndexOf extends ToIntFunction {
        private final String str;
        private final Integer startPos;
        private LastIndexOf(String str) { this.str = str; }
        public override Integer apply(Object o) { return ((String) o).indexOf(str); }
    }

    private class LastIndexOfStartPos extends ToIntFunction {
        private final String str;
        private final Integer startPos;
        private LastIndexOfStartPos(String str, Integer startPos) {
            this.str = str;
            this.startPos = startPos;
        }
        public override Integer apply(Object o) { return ((String) o).lastIndexOf(str, startPos); }
    }

    private class LastIndexOfChar extends ToIntFunction {
        private final Integer ch;
        private final Integer fromIndex;
        private LastIndexOfChar(Integer ch) { this.ch = ch; }
        public override Integer apply(Object o) { return ((String) o).lastIndexOfChar(ch); }
    }

    private class LastIndexOfCharFromIndex extends ToIntFunction {
        private final Integer ch;
        private final Integer fromIndex;
        private LastIndexOfCharFromIndex(Integer ch, Integer fromIndex) {
            this.ch = ch;
            this.fromIndex = fromIndex;
        }
        public override Integer apply(Object o) { return ((String) o).lastIndexOfChar(ch, fromIndex); }
    }

    private class LastIndexOfIgnoreCase extends ToIntFunction {
        private final String searchStr;
        private final Integer startPos;
        private LastIndexOfIgnoreCase(String searchStr) { this.searchStr = searchStr; }
        public override Integer apply(Object o) { return ((String) o).lastIndexOfIgnoreCase(searchStr); }
    }

    private class LastIndexOfIgnoreCaseStartPos extends ToIntFunction {
        private final String searchStr;
        private final Integer startPos;
        private LastIndexOfIgnoreCaseStartPos(String searchStr, Integer startPos) {
            this.searchStr = searchStr;
            this.startPos = startPos;
        }
        public override Integer apply(Object o) { return ((String) o).lastIndexOfIgnoreCase(searchStr, startPos); }
    }

    private class Length extends ToIntFunction {
        public override Integer apply(Object o) { return ((String) o).length(); }
    }

    private class OffsetByCodePoints extends ToIntFunction {
        private final Integer index;
        private final Integer codePointOffset;
        private OffsetByCodePoints(Integer index, Integer codePointOffset) {
            this.index = index;
            this.codePointOffset = codePointOffset;
        }
        public override Integer apply(Object o) { return ((String) o).offsetByCodePoints(index, codePointOffset); }
    }
    // @end-group
    //</editor-fold>

}
