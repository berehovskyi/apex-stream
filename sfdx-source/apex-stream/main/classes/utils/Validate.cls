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
    private Validate(){}

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
     * @description Checks whether the specified String reference is not blank.
     *
     * @param o the validated String
     *
     * @throws NullPointerException if `o` is blank
     */
    public static void notBlank(final String o) {
        if (String.isBlank(o)) { throw new NullPointerException(); }
    }

    /**
     * @description Checks whether the specified `List<Object>` reference is not null
     * nor contains any null elements.
     *
     * @param objs the validated list
     *
     * @throws NullPointerException if `objs` or any element is null
     */
    public static void noNullElements(final List<Object> objs) {
        if (objs == null && !objs.isEmpty()) { throw new NullPointerException(); }
        for (Object o : objs) {
            notNull(o);
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
        if (!condition) { throw new IllegalArgumentException(message); }
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
     * @example Validate.isTrue(n >= 0, 'The argument should be positive, actual: {0}.', new List<Object>{ n });
     */
    public static void isTrue(final Boolean condition, final String message, final List<Object> arguments) {
        if (!condition) { throw new IllegalArgumentException(String.format(message, arguments)); }
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

    /**
     * @description Asserts whether the specified `condition` is true.
     * If it is not, a fatal error is returned that causes code execution to halt.
     * @param condition the boolean expression to check
     */
    public static void assert(final Boolean condition) {
        System.assert(condition);
    }

    /**
     * @description Asserts whether the specified `condition` is true.
     * If it is not, a fatal error is returned that causes code execution to halt.
     *
     * @param condition the boolean expression to check
     * @param message the optional message returned as part of the error message
     */
    public static void assert(final Boolean condition, final String message) {
        System.assert(condition, message);
    }

    /**
     * @description Asserts that the first two arguments are the same.
     * If it is not, a fatal error is returned that causes code execution to halt.
     *
     * @param expected the expected value
     * @param actual the actual value
     */
    public static void assertEquals(final Object expected, final Object actual) {
        System.assertEquals(expected, actual);
    }

    /**
     * @description Asserts that the first two arguments are the same.
     * If it is not, a fatal error is returned that causes code execution to halt.
     *
     * @param expected the expected value
     * @param actual the actual value
     * @param message the optional message returned as part of the error message
     */
    public static void assertEquals(final Object expected, final Object actual, final String message) {
        System.assertEquals(expected, actual, message);
    }

    /**
     * @description Asserts that the first two arguments are not the same.
     * If it is, a fatal error is returned that causes code execution to halt.
     *
     * @param expected the expected value
     * @param actual the actual value
     */
    public static void assertNotEquals(final Object expected, final Object actual) {
        System.assertNotEquals(expected, actual);
    }

    /**
     * @description Asserts that the first two arguments are not the same.
     * If it is, a fatal error is returned that causes code execution to halt.
     *
     * @param expected the expected value
     * @param actual the actual value
     * @param message the optional message returned as part of the error message
     */
    public static void assertNotEquals(final Object expected, final Object actual, final String message) {
        System.assertNotEquals(expected, actual, message);
    }

}
