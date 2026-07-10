/**
 * @description Internal argument and state validation shared by Apex Functions dependents.
 *
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public inherited sharing class AfSupport {
    private static final String NULL_ARGUMENT = 'Argument object is null';
    private static final String NULL_MESSAGE = 'Exception message cannot be null';
    private static final String FALSE_CONDITION = 'Argument condition is false';
    private static final String NULL_ELEMENT = 'Argument iterable contains null element';
    private static final String BLANK_STRING = 'Argument string is blank';

    @TestVisible
    private AfSupport() {
    }

    public static void notNull(final Object value) {
        // prettier-ignore
        if (value == null) { throw newNullPointerException(NULL_ARGUMENT); }
    }

    public static void isNotNull(final Object value) {
        isTrue(value != null, NULL_ARGUMENT);
    }

    public static void isTrue(final Boolean condition) {
        isTrue(condition, FALSE_CONDITION);
    }

    public static void isTrue(final Boolean condition, final String message) {
        isTrue(condition, message, null);
    }

    public static void isTrue(final Boolean condition, final String message, final List<Object> arguments) {
        notNull(condition);
        requireMessage(message);
        // prettier-ignore
        if (!condition) { throw newIllegalArgumentException(format(message, arguments)); }
    }

    public static void noNullElements(final Iterable<Object> iterable) {
        notNull(iterable);
        final Iterator<Object> iterator = iterable.iterator();
        while (iterator.hasNext()) {
            isTrue(iterator.next() != null, NULL_ELEMENT);
        }
    }

    public static void notBlank(final String value) {
        notNull(value);
        isTrue(String.isNotBlank(value), BLANK_STRING);
    }

    public static void matches(
        final String value,
        final String regex,
        final String message,
        final List<Object> arguments
    ) {
        notNull(value);
        notNull(regex);
        isTrue(Pattern.matches(regex, value), message, arguments);
    }

    public static void positive(final Decimal value, final String message, final List<Object> arguments) {
        notNull(value);
        isTrue(value > 0, message, arguments);
    }

    public static void state(final Boolean condition, final String message, final List<Object> arguments) {
        notNull(condition);
        requireMessage(message);
        // prettier-ignore
        if (!condition) { throw newInvalidStateException(format(message, arguments)); }
    }

    private static void requireMessage(final String message) {
        // prettier-ignore
        if (message == null) { throw newNullPointerException(NULL_MESSAGE); }
    }

    private static Exception newNullPointerException(final String message) {
        final NullPointerException exc = new NullPointerException();
        exc.setMessage(message);
        return exc;
    }

    private static Exception newIllegalArgumentException(final String message) {
        final IllegalArgumentException exc = new IllegalArgumentException(message);
        exc.setMessage(message);
        return exc;
    }

    private static Exception newInvalidStateException(final String message) {
        final InvalidStateException exc = new InvalidStateException(message);
        exc.setMessage(message);
        return exc;
    }

    private static String format(final String message, final List<Object> arguments) {
        return String.format(message.replaceAll('\\{(?![0-9])', '(').replaceAll('(?<!\\d)\\}', ')'), arguments);
    }
}
