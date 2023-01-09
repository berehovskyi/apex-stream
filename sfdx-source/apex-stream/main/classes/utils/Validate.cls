/**
 * @description Contains static utility arguments validation methods.
 * <ul>
 *   <li>An invalid `null` argument causes a {@link NullPointerException}.</li>
 *   <li>A non-`null` argument causes an {@link IllegalArgumentException}.</li>
 *   <li>Assertion failure causes a fatal error that causes code execution to halt.</li>
 * </ul>
 *
 * @author Oleh Berehovskyi
 *
 * @group Utils
 */
public inherited sharing class Validate {

    @TestVisible
    private Validate() {}

    /**
     * @description Checks whether the specified Object reference is not null.
     *
     * @param o the validated object reference
     *
     * @throws NullPointerException if `o` is null
     */
    public static void notNull(final Object o) {
        if (o == null) { throw new NullPointerException(); }
    }

    /**
     * @description Checks whether the specified String reference is not whitespace nor empty (''), nor null.
     *
     * @param s the validated string
     *
     * @throws IllegalArgumentException if `s` is whitespace or empty ('')
     * @throws NullPointerException if `s` is null
     */
    public static void notBlank(final String s) {
        notNull(s);
        isTrue(String.isNotBlank(s));
    }

    /**
     * @description Checks whether the specified String reference is not empty ('') nor null.
     *
     * @param s the validated string
     *
     * @throws IllegalArgumentException if `s` is empty ('')
     * @throws NullPointerException if `s` is null
     */
    public static void notEmpty(final String s) {
        notNull(s);
        isTrue(String.isNotEmpty(s));
    }

    /**
     * @description Checks whether the specified `objs` reference is not null nor empty.
     *
     * @param objs the validated list
     *
     * @throws IllegalArgumentException if `objs` is empty
     * @throws NullPointerException if `objs` is null
     */
    public static void notEmpty(final List<Object> objs) {
        notNull(objs);
        isTrue(!objs.isEmpty());
    }

    /**
     * @description Checks whether the specified `objs` reference is not null
     * nor contains any null elements.
     *
     * @param objs the validated list
     *
     * @throws NullPointerException if `objs` or any element is null
     */
    public static void noNullElements(final List<Object> objs) {
        notNull(objs);
        for (Integer i = 0, size = objs.size(); i < size; i++) {
            isTrue(objs[i] != null);
        }
    }

    /**
     * @description Checks whether the specified `condition` is true.
     *
     * @param condition the boolean expression to check
     *
     * @throws IllegalArgumentException if `condition` evaluates to false
     */
    public static void isTrue(final Boolean condition) {
        if (!condition) { throw new IllegalArgumentException(); }
    }

    /**
     * @description Checks whether the specified `condition` is true.
     *
     * @param condition the boolean expression to check
     * @param message the exception message
     *
     * @throws IllegalArgumentException if `condition` evaluates to false
     */
    public static void isTrue(final Boolean condition, final String message) {
        isTrue(condition, new IllegalArgumentException(message));
    }

    /**
     * @description Checks whether the specified `condition` is true.
     *
     * @param condition the boolean expression to check
     * @param exc the exception to throw
     *
     * @throws Exception if `condition` evaluates to false
     */
    public static void isTrue(final Boolean condition, final Exception exc) {
        if (!condition) { throw exc; }
    }

    /**
     * @description Checks whether the specified `condition` is true.
     *
     * @param condition the boolean expression to check
     * @param message the formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `condition` evaluates to false
     *
     * @example
     * Validate.isTrue(n >= 0, 'The argument should be positive, actual: {0}.', new List<Object>{ n });
     */
    public static void isTrue(final Boolean condition, final String message, final List<Object> arguments) {
        if (!condition) { throw new IllegalArgumentException(String.format(message, arguments)); }
    }

    /**
     * @description Checks whether the specified `input` matches the specified `pattern`.
     *
     * @param input the string to validate
     * @param regex the regular expression pattern
     * @param message the formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `input` does not match `pattern`
     *
     * @example 
     * Validate.matches(
     *     'A-{00000}',
     *     '\\S*\\{\\d+\\}',
     *     'The string {0} does not match the pattern {1}.', 
     *     new List<Object>{ 'A-{00000}', '\\S*\\{\\d+\\}' }
     * );
     */
    public static void matches(
            final String input,
            final String regex,
            final String message,
            final List<Object> arguments
    ) {
        isTrue(Pattern.matches(regex, input), message, arguments);
    }

    /**
     * @description Checks whether the specified `condition` is true.
     *
     * @param condition the boolean expression to check
     * @param message the formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalStateException if `condition` evaluates to false
     *
     * @example
     * Validate.validState(
     *     !map.containsKey(key),
     *     'Duplicate key {0} (attempted merging values {1} and {2}).',
     *     new List<Object>{ key, oldValue, newValue }
     * );
     */
    public static void validState(final Boolean condition, String message, final List<Object> arguments) {
        isTrue(condition, new IllegalStateException(String.format(message, arguments)));
    }

}
