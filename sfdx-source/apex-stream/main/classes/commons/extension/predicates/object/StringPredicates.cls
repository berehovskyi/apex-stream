/**
 * @description Provides common implementations of `String` {@link Predicate}
 * and related utilities.
 *
 * @see Predicate
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class StringPredicates {

    @TestVisible
    private StringPredicates() {}

    //<editor-fold desc="String Predicates">
    // @start-group String Predicates
    /**
     * @description Returns a `Predicate` that tests the input string if it contains
     * the `substring`.
     *
     * @param substring string
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.contains
     */
    public static Predicate contains(final String substring) {
        Validate.notNull(substring);
        return new Contains(substring);
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it contains any
     * `substring`.
     *
     * @param substring string
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.containsAny
     */
    public static Predicate containsAny(final String substring) {
        Validate.notNull(substring);
        return new ContainsAny(substring);
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it contains
     * the `substring` ignoring case.
     *
     * @param substring string
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.containsIgnoreCase
     */
    public static Predicate containsIgnoreCase(final String substring) {
        Validate.notNull(substring);
        return new ContainsIgnoreCase(substring);
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it does not
     * contain any of the characters in the `substring`.
     *
     * @param substring string
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.containsNone
     */
    public static Predicate containsNone(final String substring) {
        Validate.notNull(substring);
        return new ContainsNone(substring);
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it contains
     * characters only from the `substring`.
     *
     * @param substring string
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `substring` is null
     *
     * @see String.containsOnly
     */
    public static Predicate containsOnly(final String substring) {
        Validate.notNull(substring);
        return new ContainsOnly(substring);
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it contains
     * any white space.
     *
     * @return the `Predicate`
     *
     * @see String.containsWhitespace
     */
    public static Predicate containsWhitespace() {
        return new ContainsWhitespace();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it ends with the
     * `suffix`.
     *
     * @param suffix string
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `suffix` is null
     *
     * @see String.endsWith
     */
    public static Predicate endsWith(final String suffix) {
        Validate.notNull(suffix);
        return new EndsWith(suffix);
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it ends with the
     * `suffix` ignoring case.
     *
     * @param suffix string
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `suffix` is null
     *
     * @see String.endsWithIgnoreCase
     */
    public static Predicate endsWithIgnoreCase(final String suffix) {
        Validate.notNull(suffix);
        return new EndsWithIgnoreCase(suffix);
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it equals to the
     * `that` ignoring case.
     *
     * @param that string
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `that` is null
     *
     * @see String.equalsIgnoreCase
     */
    public static Predicate equalsIgnoreCase(final String that) {
        Validate.notNull(that);
        return new EqualsIgnoreCase(that);
    }

    /**
     * @description Returns a `Predicate` that tests the input string if all characters
     * are lowercase.
     *
     * @return the `Predicate`
     *
     * @see String.isAllLowerCase
     */
    public static Predicate isAllLowerCase() {
        return new IsAllLowerCase();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if all characters
     * are uppercase.
     *
     * @return the `Predicate`
     *
     * @see String.IsAllUpperCase
     */
    public static Predicate isAllUpperCase() {
        return new IsAllUpperCase();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if all characters
     * are Unicode letters only.
     *
     * @return the `Predicate`
     *
     * @see String.isAlpha
     */
    public static Predicate isAlpha() {
        return new IsAlpha();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if all characters
     * are Unicode letters or spaces only.
     *
     * @return the `Predicate`
     *
     * @see String.isAlphaSpace
     */
    public static Predicate isAlphaSpace() {
        return new IsAlphaSpace();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if all characters
     * are Unicode letters or numbers only.
     *
     * @return the `Predicate`
     *
     * @see String.isAlphaNumeric
     */
    public static Predicate isAlphaNumeric() {
        return new IsAlphaNumeric();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if all characters
     * are Unicode letters, spaces or numbers only.
     *
     * @return the `Predicate`
     *
     * @see String.isAlphaNumericSpace
     */
    public static Predicate isAlphaNumericSpace() {
        return new IsAlphaNumericSpace();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if all characters
     * are ASCII printable only.
     *
     * @return the `Predicate`
     *
     * @see String.isAsciiPrintable
     */
    public static Predicate isAsciiPrintable() {
        return new IsAsciiPrintable();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it is
     * white space, empty (''), or null.
     *
     * @return the `Predicate`
     *
     * @see String.isBlank
     */
    public static Predicate isBlank() {
        return new IsBlank();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it is
     * empty (''), or null.
     *
     * @return the `Predicate`
     *
     * @see String.isEmpty
     */
    public static Predicate isEmpty() {
        return new IsEmpty();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it is
     * like the `likeString`. Supports `%` and
     * `_` wildcards and is case-insensitive.
     *
     * @param likeString string
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `likeString` is null
     */
    public static Predicate isLike(final String likeString) {
        Validate.notNull(likeString);
        return new IsLike(likeString);
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it is not
     * white space, empty (''), or null.
     *
     * @return the `Predicate`
     *
     * @see String.isNotBlank
     */
    public static Predicate isNotBlank() {
        return isBlank().negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it is not
     * empty (''), or null.
     *
     * @return the `Predicate`
     *
     * @see String.isNotEmpty
     */
    public static Predicate isNotEmpty() {
        return isEmpty().negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if all characters
     * are numbers only.
     *
     * @return the `Predicate`
     *
     * @see String.isNumeric
     */
    public static Predicate isNumeric() {
        return new IsNumeric();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if all characters
     * are spaces or numbers only.
     *
     * @return the `Predicate`
     *
     * @see String.isNumericSpace
     */
    public static Predicate isNumericSpace() {
        return new IsNumericSpace();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if all characters
     * are spaces only.
     *
     * @return the `Predicate`
     *
     * @see String.isWhitespace
     */
    public static Predicate isWhitespace() {
        return new IsWhitespace();
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it starts with the
     * `prefix`.
     *
     * @param prefix string
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `prefix` is null
     *
     * @see String.startsWith
     */
    public static Predicate startsWith(final String prefix) {
        Validate.notNull(prefix);
        return new StartsWith(prefix);
    }

    /**
     * @description Returns a `Predicate` that tests the input string if it starts with the
     * `prefix` ignoring case.
     *
     * @param prefix string
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `prefix` is null
     *
     * @see String.startsWithIgnoreCase
     */
    public static Predicate startsWithIgnoreCase(final String prefix) {
        Validate.notNull(prefix);
        return new StartsWithIgnoreCase(prefix);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Contains extends Predicate {
        private final String subString;
        public Contains(String subString) { this.subString = subString; }
        public override Boolean test(Object str) { return ((String) str).contains(subString); }
    }

    private class ContainsAny extends Predicate {
        private final String subString;
        public ContainsAny(String subString) { this.subString = subString; }
        public override Boolean test(Object str) { return ((String) str).containsAny(subString); }
    }

    private class ContainsIgnoreCase extends Predicate {
        private final String subString;
        public ContainsIgnoreCase(String subString) { this.subString = subString; }
        public override Boolean test(Object str) { return ((String) str).containsIgnoreCase(subString); }
    }

    private class ContainsNone extends Predicate {
        private final String subString;
        public ContainsNone(String subString) { this.subString = subString; }
        public override Boolean test(Object str) { return ((String) str).containsNone(subString); }
    }

    private class ContainsOnly extends Predicate {
        private final String subString;
        public ContainsOnly(String subString) { this.subString = subString; }
        public override Boolean test(Object str) { return ((String) str).containsOnly(subString); }
    }

    private class ContainsWhitespace extends Predicate {
        public override Boolean test(Object str) { return ((String) str).containsWhitespace(); }
    }

    private class EndsWith extends Predicate {
        private final String subString;
        public EndsWith(String suffix) { this.subString = suffix; }
        public override Boolean test(Object str) { return ((String) str).endsWith(subString); }
    }

    private class EndsWithIgnoreCase extends Predicate {
        private final String subString;
        public EndsWithIgnoreCase(String suffix) { this.subString = suffix; }
        public override Boolean test(Object str) { return ((String) str).endsWithIgnoreCase(subString); }
    }

    private class EqualsIgnoreCase extends Predicate {
        private final String subString;
        public EqualsIgnoreCase(String secondString) { this.subString = secondString; }
        public override Boolean test(Object str) { return ((String) str).equalsIgnoreCase(subString); }
    }

    private class IsAllLowerCase extends Predicate {
        public override Boolean test(Object str) { return ((String) str).isAllLowerCase(); }
    }

    private class IsAllUpperCase extends Predicate {
        public override Boolean test(Object str) { return ((String) str).isAllUpperCase(); }
    }

    private class IsAlpha extends Predicate {
        public override Boolean test(Object str) { return ((String) str).isAlpha(); }
    }

    private class IsAlphaSpace extends Predicate {
        public override Boolean test(Object str) { return ((String) str).isAlphaSpace(); }
    }

    private class IsAlphaNumeric extends Predicate {
        public override Boolean test(Object str) { return ((String) str).isAlphanumeric(); }
    }

    private class IsAlphaNumericSpace extends Predicate {
        public override Boolean test(Object str) { return ((String) str).isAlphanumericSpace(); }
    }

    private class IsAsciiPrintable extends Predicate {
        public override Boolean test(Object str) { return ((String) str).isAsciiPrintable(); }
    }

    private class IsBlank extends Predicate {
        public override Boolean test(Object str) { return String.isBlank((String) str); }
    }

    private class IsEmpty extends Predicate {
        public override Boolean test(Object str) { return String.isEmpty((String) str); }
    }

    private class IsLike extends Predicate {
        private final String likeString;
        private IsLike(String likeString) { this.likeString = likeString; }
        public override Boolean test(Object str) {
            return Pattern.matches(
                    '(?i)^' + likeString.replaceAll('([^\\w%_ ])', '\\\\$1')
                            .replace('%', '.*?').replace('_', '.{1}?') + '$', (String) str
            );
        }
    }

    private class IsNumeric extends Predicate {
        public override Boolean test(Object str) { return ((String) str).isNumeric(); }
    }

    private class IsNumericSpace extends Predicate {
        public override Boolean test(Object str) { return ((String) str).isNumericSpace(); }
    }

    private class IsWhitespace extends Predicate {
        public override Boolean test(Object str) { return ((String) str).isWhitespace(); }
    }

    private class StartsWith extends Predicate {
        private final String subString;
        public StartsWith(Object prefix) { this.subString = (String) prefix; }
        public override Boolean test(Object str) { return ((String) str).startsWith(subString); }
    }

    private class StartsWithIgnoreCase extends Predicate {
        private final String subString;
        public StartsWithIgnoreCase(Object prefix) { this.subString = (String) prefix; }
        public override Boolean test(Object str) { return ((String) str).startsWithIgnoreCase(subString); }
    }
    // @end-group
    //</editor-fold>

}
