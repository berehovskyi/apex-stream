/**
 * @description A lightweight, stateless utility class that manages validating arguments.
 * Provides an easy way to follow a fail-fast principle and a design-by-contract programming approach.
 *
 * @author Oleh Berehovskyi
 *
 * @group Utils
 */
@SuppressWarnings(
    'PMD.CognitiveComplexity, PMD.CyclomaticComplexity, PMD.ExcessivePublicCount, PMD.ExcessiveClassLength'
)
public inherited sharing class Validate {

    @TestVisible
    private Validate() {}

    //<editor-fold desc="Nullability">
    // @start-group Nullability
    /**
     * @description Checks that the argument reference `obj` is not null.
     *
     * @param obj the object to check for nullity
     *
     * @throws NullPointerException if `obj` is null with the default exception message 'Argument object is null'
     *
     * @see Validate.isNotNull
     *
     * @example
     * Validate.notNull('foo'); // valid
     * Object obj;
     * Validate.notNull(obj); // throws a NullPointerException
     */
    public static void notNull(final Object obj) {
        notNull(obj, Label.AV_ErrorMessage_Null);
    }

    /**
     * @description Checks that the argument reference `obj` is not null.
     *
     * @param obj the object to check for nullity
     * @param message the required custom exception message
     *
     * @throws NullPointerException if `obj` is null with the custom exception `message`
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isNotNull
     *
     * @example
     * Validate.notNull('foo', 'The argument cannot be null'); // valid
     * Object obj;
     * Validate.notNull(obj, 'The argument cannot be null'); // throws a NullPointerException
     */
    public static void notNull(final Object obj, final String message) {
        notNull(obj, message, null);
    }

    /**
     * @description Checks that the argument reference `obj` is not null.
     *
     * @param obj the object to check for nullity
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws NullPointerException if `obj` is null with the custom exception `message`
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isNotNull
     * 
     * @example
     * Validate.notNull(
     *     obj,
     *     'The argument {0} cannot be null',
     *     new List<String>{ 'obj' }
     * ); // throws a NullPointerException
     */
    public static void notNull(final Object obj, final String message, final List<Object> arguments) {
        if (message == null) {
            throw newNullPointerException(Label.AV_ErrorMessage_NullMessage);
        }
        if (obj == null) {
            throw newNullPointerException(format(message, arguments));
        }
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Conditions">
    // @start-group Conditions
    /**
     * @description Checks that the argument `condition` is true.
     *
     * @param condition the boolean expression to check
     *
     * @throws IllegalArgumentException if `condition` evaluates to false
     * with the default exception message 'Argument condition is false'
     * @throws NullPointerException if `condition` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.isFalse
     * @see Assert.isTrue
     * 
     * @example
     * Validate.isTrue(i > 0);
     * Validate.isTrue(response.getStatusCode() == 200);
     */
    public static void isTrue(final Boolean condition) {
        isTrue(condition, Label.AV_ErrorMessage_FalseCondition);
    }

    /**
     * @description Checks that the argument `condition` is true.
     *
     * @param condition the boolean expression to check
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if `condition` evaluates to false with the custom exception `message`
     * @throws NullPointerException if `condition` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isFalse
     * @see Assert.isTrue
     * 
     * @example
     * Validate.isTrue(i > 0, 'The argument value must be positive');
     * Validate.isTrue(response.getStatusCode() == 200, 'The status code must be 200');
     */
    public static void isTrue(final Boolean condition, final String message) {
        isTrue(condition, message, null);
    }

    /**
     * @description Checks that the argument `condition` is true.
     *
     * @param condition the boolean expression to check
     * @param exc the exception to throw
     *
     * @throws Exception if `condition` evaluates to false
     * @throws NullPointerException if `condition` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `exc` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.isFalse
     * @see Assert.isTrue
     * 
     * @example
     * Validate.isTrue(i > 0, new CustomException());
     * Validate.isTrue(response.getStatusCode() == 200, new CalloutException());
     */
    public static void isTrue(final Boolean condition, final Exception exc) {
        notNull(condition);
        notNull(exc);
        if (!condition) {
            throw exc;
        }
    }

    /**
     * @description Checks that the argument `condition` is true.
     *
     * @param condition the boolean expression to check
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `condition` evaluates to false with the custom exception `message`
     * @throws NullPointerException if `condition` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isFalse
     * @see Assert.isTrue
     *
     * @example
     * Validate.isTrue(
     *     n >= 0,
     *     'The argument should be positive, actual: {0}.',
     *     new List<Object>{ n }
     * );
     */
    public static void isTrue(final Boolean condition, final String message, final List<Object> arguments) {
        notNull(condition);
        notNull(message, Label.AV_ErrorMessage_NullMessage);
        if (!condition) {
            throw newIllegalArgumentException(format(message, arguments));
        }
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Iterables">
    // @start-group Iterables
    /**
     * @description Checks that the argument list `objs` is not empty.
     *
     * @param objs the list to check for emptiness
     *
     * @throws IllegalArgumentException if `objs` is empty with the default exception message 'Argument list is empty'
     * @throws NullPointerException if `objs` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.noNullElements
     * 
     * @example
     * Validate.notEmpty(someList);
     */
    public static void notEmpty(final List<Object> objs) {
        notEmpty(objs, Label.AV_ErrorMessage_EmptyList);
    }

    /**
     * @description Checks that the argument list `objs` is not empty.
     *
     * @param objs the list to check for emptiness
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if `objs` is empty with the custom exception `message`
     * @throws NullPointerException if `objs` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Validate.noNullElements
     *
     * @example
     * Validate.notEmpty(someList, 'The list cannot be empty');
     */
    public static void notEmpty(final List<Object> objs, final String message) {
        notEmpty(objs, message, null);
    }

    /**
     * @description Checks that the argument list `objs` is not empty.
     *
     * @param objs the list to check for emptiness
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `objs` is empty with the custom exception `message`
     * @throws NullPointerException if `objs` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Validate.noNullElements
     *
     * @example
     * Validate.notEmpty(
     *     someList,
     *     'The list {0} cannot be empty',
     *     new List<String>{ 'someList' }
     * );
     */
    public static void notEmpty(final List<Object> objs, final String message, final List<Object> arguments) {
        notNull(objs);
        isTrue(!objs.isEmpty(), message, arguments);
    }

    /**
     * @description Checks that the argument `iterable` is not empty.
     *
     * @param iterable the iterable to check for emptiness
     *
     * @throws IllegalArgumentException if `iterable` is empty with the default exception message
     * 'Argument iterable is empty'
     * @throws NullPointerException if `iterable` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.noNullElements
     * 
     * @example
     * Validate.notEmpty(someIterable);
     * Validate.notEmpty((Iterable<String>) someStringSet);
     */
    public static void notEmpty(final Iterable<Object> iterable) {
        notEmpty(iterable, Label.AV_ErrorMessage_EmptyIterable);
    }

    /**
     * @description Checks that the argument `iterable` is not empty.
     *
     * @param iterable the iterable to check for emptiness
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if `iterable` is empty with the custom exception `message`
     * @throws NullPointerException if `iterable` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Validate.noNullElements
     *
     * @example
     * Validate.notEmpty(someIterable, 'The iterable cannot be empty');
     * Validate.notEmpty((Iterable<String>) someStringSet, 'The set cannot be empty');
     */
    public static void notEmpty(final Iterable<Object> iterable, final String message) {
        notEmpty(iterable, message, null);
    }

    /**
     * @description Checks that the argument `iterable` is not empty.
     *
     * @param iterable the iterable to check for emptiness
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `iterable` is empty with the custom exception `message`
     * @throws NullPointerException if `iterable` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Validate.noNullElements
     *
     * @example
     * Validate.notEmpty(
     *     someIterable,
     *     'The iterable {0} cannot be empty',
     *     new List<String>{ 'someIterable' }
     * );
     */
    public static void notEmpty(final Iterable<Object> iterable, final String message, final List<Object> arguments) {
        notNull(iterable);
        isTrue(iterable.iterator().hasNext(), message, arguments);
    }

    /**
     * @description Checks that the argument list `objs` contains no null elements.
     *
     * @param objs the list to check for null elements
     *
     * @throws IllegalArgumentException if `objs` contains a null element with the default exception message
     * 'Argument list contains null element'
     * @throws NullPointerException if `objs` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.notEmpty
     * 
     * @example
     * Validate.noNullElements(someList);
     */
    public static void noNullElements(final List<Object> objs) {
        noNullElements(objs, Label.AV_ErrorMessage_NullElementList);
    }

    /**
     * @description Checks that the argument list `objs` contains no null elements.
     *
     * @param objs the list to check for null elements
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if `objs` contains a null element with the custom exception `message`
     * @throws NullPointerException if `objs` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Validate.notEmpty
     *
     * @example
     * Validate.noNullElements(someList, 'The list cannot contain null elements');
     */
    public static void noNullElements(final List<Object> objs, final String message) {
        noNullElements(objs, message, null);
    }

    /**
     * @description Checks that the argument list `objs` contains no null elements.
     *
     * @param objs the list to check for null elements
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `objs` contains a null element with the custom exception `message`
     * @throws NullPointerException if `objs` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Validate.notEmpty
     *
     * @example
     * Validate.noNullElements(
     *     someList,
     *     'The list {0} cannot contain null elements',
     *     new List<String>{ 'someList' }
     * );
     */
    public static void noNullElements(final List<Object> objs, final String message, final List<Object> arguments) {
        notNull(objs);
        for (Integer i = 0, size = objs.size(); i < size; i++) {
            isTrue(objs[i] != null, message, arguments);
        }
    }

    /**
     * @description Checks that the argument `iterable` contains no null elements.
     *
     * @param iterable the iterable to check for null elements
     *
     * @throws IllegalArgumentException if `iterable` contains a null element with the default exception message
     * 'Argument iterable contains null element'
     * @throws NullPointerException if `iterable` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.notEmpty
     * 
     * @example
     * Validate.noNullElements(someIterable);
     * Validate.noNullElements((Iterable<String>) someStringSet);
     */
    public static void noNullElements(final Iterable<Object> iterable) {
        noNullElements(iterable, Label.AV_ErrorMessage_NullElementIterable);
    }

    /**
     * @description Checks that the argument `iterable` contains no null elements.
     *
     * @param iterable the iterable to check for null elements
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if `iterable` contains a null element with the custom exception `message`
     * @throws NullPointerException if `iterable` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Validate.notEmpty
     *
     * @example
     * Validate.noNullElements(someIterable, 'The iterable cannot contain null elements');
     * Validate.noNullElements(
     *     (Iterable<String>) someStringSet,
     *     'The set cannot contain null elements'
     * );
     */
    public static void noNullElements(final Iterable<Object> iterable, final String message) {
        noNullElements(iterable, message, null);
    }

    /**
     * @description Checks that the argument `iterable` contains no null elements.
     *
     * @param iterable the iterable to check for null elements
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `iterable` contains a null element with the custom exception `message`
     * @throws NullPointerException if `iterable` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Validate.notEmpty
     *
     * @example
     * Validate.noNullElements(
     *     someIterable,
     *     'The iterable {0} cannot contain null elements',
     *     new List<String>{ 'someIterable' }
     * );
     */
    public static void noNullElements(
        final Iterable<Object> iterable,
        final String message,
        final List<Object> arguments
    ) {
        notNull(iterable);
        final Iterator<Object> iterator = iterable.iterator();
        while (iterator.hasNext()) {
            isTrue(iterator.next() != null, message, arguments);
        }
    }

    /**
     * @description Checks that the `index` is within the bounds of the argument list `objs`.
     *
     * @param objs the list to check
     * @param index the index to check
     *
     * @throws IndexOutOfBoundsException if `index` is invalid with the default formatted exception message
     * 'List index out of bounds: {0}'
     * @throws NullPointerException if `objs` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `index` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.index(
     *     new List<String>{ 'foo', 'bar' }, 
     *     3
     * ); // throws an IndexOutOfBoundsException
     */
    public static void index(final List<Object> objs, final Integer index) {
        index(objs, index, format(Label.AV_ErrorMessage_InvalidIndexList, index));
    }

    /**
     * @description Checks that the `index` is within the bounds of the argument list `objs`.
     *
     * @param objs the list to check
     * @param index the index to check
     * @param message the required custom exception message
     *
     * @throws IndexOutOfBoundsException if `index` is invalid with the custom exception `message`
     * @throws NullPointerException if `objs` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `index` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.index(
     *     new List<String>{ 'foo', 'bar' }, 
     *     3,
     *     'Invalid index'
     * ); // throws an IndexOutOfBoundsException
     */
    public static void index(final List<Object> objs, final Integer index, final String message) {
        index(objs, index, message, null);
    }

    /**
     * @description Checks that the `index` is within the bounds of the argument list `objs`.
     *
     * @param objs the list to check
     * @param index the index to check
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IndexOutOfBoundsException if `index` is invalid with the custom exception `message`
     * @throws NullPointerException if `objs` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `index` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.index(
     *     new List<String>{ 'foo', 'bar' }, 
     *     3,
     *     'Invalid index: {0}',
     *     new List<Integer>{ 3 }
     * ); // throws an IndexOutOfBoundsException
     */
    public static void index(
        final List<Object> objs,
        final Integer index,
        final String message,
        final List<Object> arguments
    ) {
        notNull(objs);
        notNull(index);
        isTrue(index >= 0 && index < objs.size(), newIndexOutOfBoundsException(format(message, arguments)));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Strings">
    // @start-group Strings
    /**
     * @description Checks that the argument string `str` is not whitespace nor empty (''), nor null.
     *
     * @param str the string to check for not being blank
     *
     * @throws IllegalArgumentException if `str` is whitespace or empty ('') with the default exception message
     * 'Argument string is blank'
     * @throws NullPointerException if `str` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.notEmpty
     * 
     * @example
     * Validate.notBlank(' '); // throws an IllegalArgumentException
     */
    public static void notBlank(final String str) {
        notBlank(str, Label.AV_ErrorMessage_BlankString);
    }

    /**
     * @description Checks that the argument string `str` is not whitespace nor empty (''), nor null.
     *
     * @param str the string to check for not being blank
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if `str` is whitespace or empty ('') with the custom exception `message`
     * @throws NullPointerException if `str` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.notEmpty
     * 
     * @example
     * Validate.notBlank(
     *     ' ', 
     *     'The string cannot be blank'
     * ); // throws an IllegalArgumentException
     */
    public static void notBlank(final String str, final String message) {
        notBlank(str, message, null);
    }

    /**
     * @description Checks that the argument string `str` is not whitespace nor empty (''), nor null.
     *
     * @param str the string to check for not being blank
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `str` is whitespace or empty ('') with the custom exception `message`
     * @throws NullPointerException if `str` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.notEmpty
     * 
     * @example
     * Validate.notBlank(
     *     ' ', 
     *     'The string cannot be blank. {0}',
     *     new List<String>{ 'Status code: 400' }
     * ); // throws an IllegalArgumentException
     */
    public static void notBlank(final String str, final String message, final List<Object> arguments) {
        notNull(str);
        isTrue(String.isNotBlank(str), message, arguments);
    }

    /**
     * @description Checks that the argument string `str` is not empty (''), nor null.
     *
     * @param str the string to check for not being empty
     *
     * @throws IllegalArgumentException if `str` is empty ('') with the default exception message
     * 'Argument string is empty'
     * @throws NullPointerException if `str` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.notBlank
     * 
     * @example
     * Validate.notEmpty(''); // throws an IllegalArgumentException
     */
    public static void notEmpty(final String str) {
        notEmpty(str, Label.AV_ErrorMessage_EmptyString);
    }

    /**
     * @description Checks that the argument string `str` is not empty (''), nor null.
     *
     * @param str the string to check for not being empty
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if `str` is empty ('') with the custom exception `message`
     * @throws NullPointerException if `str` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.notBlank
     * 
     * @example
     * Validate.notEmpty(
     *     '', 
     *     'The string cannot be empty'
     * ); // throws an IllegalArgumentException
     */
    public static void notEmpty(final String str, final String message) {
        notEmpty(str, message, null);
    }

    /**
     * @description Checks that the argument string `str` is not empty (''), nor null.
     *
     * @param str the string to check for not being empty
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `str` is empty ('') with the custom exception `message`
     * @throws NullPointerException if `str` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.notBlank
     * 
     * @example
     * Validate.notEmpty(
     *     '', 
     *     'The string cannot be empty. {0}',
     *     new List<String>{ 'Status code: 400' }
     * ); // throws an IllegalArgumentException
     */
    public static void notEmpty(final String str, final String message, final List<Object> arguments) {
        notNull(str);
        isTrue(String.isNotEmpty(str), message, arguments);
    }

    /**
     * @description Checks that the `index` is within the bounds of the argument string `str`.
     *
     * @param str the string to check
     * @param index the index to check
     *
     * @throws IndexOutOfBoundsException if `index` is invalid with the default formatted exception message
     * 'String index out of bounds: {0}'
     * @throws NullPointerException if `str` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `index` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.index('foo', 3); // throws an IndexOutOfBoundsException
     */
    public static void index(final String str, final Integer index) {
        index(str, index, format(Label.AV_ErrorMessage_InvalidIndexString, index));
    }

    /**
     * @description Checks that the `index` is within the bounds of the argument string `str`.
     *
     * @param str the string to check
     * @param index the index to check
     * @param message the required custom exception message
     *
     * @throws IndexOutOfBoundsException if `index` is invalid with the custom exception `message`
     * @throws NullPointerException if `str` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `index` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.index(
     *     'foo',
     *     3,
     *     'Invalid index'
     * ); // throws an IndexOutOfBoundsException
     */
    public static void index(final String str, final Integer index, final String message) {
        index(str, index, message, null);
    }

    /**
     * @description Checks that the `index` is within the bounds of the argument string `str`.
     *
     * @param str the string to check
     * @param index the index to check
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IndexOutOfBoundsException if `index` is invalid with the custom exception `message`
     * @throws NullPointerException if `str` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `index` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.index(
     *    'foo', 
     *     3,
     *     'Invalid index: {0}',
     *     new List<Integer>{ 3 }
     * ); // throws an IndexOutOfBoundsException
     */
    public static void index(
        final String str,
        final Integer index,
        final String message,
        final List<Object> arguments
    ) {
        notNull(str);
        notNull(index);
        isTrue(
            index >= 0 && index < str.getChars().size(),
            newIndexOutOfBoundsException(String.format(message, arguments))
        );
    }

    /**
     * @description Checks that the argument string `str` matches the `regex`.
     *
     * @param str the string to check for matching
     * @param regex the regular expression to match against
     *
     * @throws IllegalArgumentException if `str` does not match the `regex` with the default formatted
     * exception message 'Argument string {0} does not match the pattern {1}'
     * @throws NullPointerException if `str` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `regex` is null with the default exception message 'Argument object is null'
     *
     * @see Validate.isTrue
     *
     * @example
     * Validate.matches('foo', '\\d+'); // throws an IllegalArgumentException
     */
    public static void matches(final String str, final String regex) {
        matches(str, regex, format(Label.AV_ErrorMessage_PatternMismatch, str, regex));
    }

    /**
     * @description Checks that the argument string `str` matches the `regex`.
     *
     * @param str the string to check for matching
     * @param regex the regular expression to match against
     * @param message the required custom exception message
     * 
     * @throws IllegalArgumentException if `str` does not match the `regex` with the custom exception `message`
     * @throws NullPointerException if `str` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `regex` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.matches(
     *     'foo',
     *     '\\d+',
     *     'Custom message'
     * ); // throws an IllegalArgumentException
     */
    public static void matches(final String str, final String regex, final String message) {
        matches(str, regex, message, null);
    }

    /**
     * @description Checks that the argument string `str` matches the `regex`.
     *
     * @param str the string to check for matching
     * @param regex the regular expression to match against
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `str` does not match the `regex` with the custom exception `message`
     * @throws NullPointerException if `str` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `regex` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @example
     * Validate.matches(
     *     'foo',
     *     '\\d+',
     *     'The string {0} does not match the pattern {1}.', 
     *     new List<String>{ 'foo', '\\d+' }
     * ); // throws an IllegalArgumentException
     */
    public static void matches(
        final String str,
        final String regex,
        final String message,
        final List<Object> arguments
    ) {
        notNull(str);
        notNull(regex);
        isTrue(Pattern.matches(regex, str), message, arguments);
    }

    /**
     * @description Checks that the argument `email` is valid.
     * Please note that this validation method isn't fully RFC 5322 and RFC 6531 compliant
     * e.g. does not support non-ASCII characters.
     *
     * @param email the email to validate
     *
     * @throws IllegalArgumentException if `email` is invalid with the default formatted exception message
     * 'Argument email {0} is invalid'
     * @throws NullPointerException if `email` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.matches
     * 
     * @example
     * Validate.email('john.doe＠example.com'); // valid
     * Validate.email('john.doe.example.com'); // throws an IllegalArgumentException
     * Validate.email('＠example.com'); // throws an IllegalArgumentException
     */
    public static void email(final String email) {
        email(email, format(Label.AV_ErrorMessage_InvalidEmail, email));
    }

    /**
     * @description Checks that the argument `email` is valid.
     * Please note that this validation method isn't fully RFC 5322 and RFC 6531 compliant
     * e.g. does not support non-ASCII characters.
     *
     * @param email the email to validate
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if `email` is invalid with the custom exception `message`
     * @throws NullPointerException if `email` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.matches
     * 
     * @example
     * Validate.email(
     *     'john.doe.example.com',
     *     'Invalid email address'
     * ); // throws an IllegalArgumentException
     */
    public static void email(final String email, final String message) {
        email(email, message, null);
    }

    /**
     * @description Checks that the argument `email` is valid.
     * Please note that this validation method isn't fully RFC 5322 and RFC 6531 compliant
     * e.g. does not support non-ASCII characters.
     *
     * @param email the email to validate
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `email` is invalid with the custom exception `message`
     * @throws NullPointerException if `email` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.matches
     * 
     * @example
     * Validate.email(
     *     'john.doe.example.com',
     *     'The email address {0} is not valid',
     *     new List<String>{ 'john.doe.example.com' }
     * ); // throws an IllegalArgumentException
     */
    public static void email(final String email, final String message, final List<Object> arguments) {
        matches(email, Label.AV_Regex_ValidEmail.unescapeHtml4(), message, arguments);
    }

    /**
     * @description Checks that the argument `card` is valid 
     * using <a href="https://en.wikipedia.org/wiki/Luhn_algorithm">Luhn algorithm</a>.
     *
     * @param card the credit card to validate
     *
     * @throws IllegalArgumentException if `card` is invalid with the default formatted exception message
     * 'Argument credit card {0} is invalid'
     * @throws NullPointerException if `card` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.matches
     * 
     * @example
     * Validate.creditCard('1234-5678-9012-3452'); // valid
     * Validate.creditCard('4417123456789113'); // valid
     * Validate.creditCard('0000000000000001'); // throws an IllegalArgumentException
     */
    public static void creditCard(final String card) {
        creditCard(card, format(Label.AV_ErrorMessage_InvalidCreditCard, card));
    }

    /**
     * @description Checks that the argument `card` is valid 
     * using <a href="https://en.wikipedia.org/wiki/Luhn_algorithm">Luhn algorithm</a>.
     *
     * @param card the credit card to validate
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if `card` is invalid with the custom exception `message`
     * @throws NullPointerException if `card` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.matches
     * 
     * @example
     * Validate.creditCard(
     *     '0000000000000001',
     *     'Invalid credit card number'
     * ); // throws an IllegalArgumentException
     */
    public static void creditCard(final String card, final String message) {
        creditCard(card, message, null);
    }

    /**
     * @description Checks that the argument `card` is valid 
     * using <a href="https://en.wikipedia.org/wiki/Luhn_algorithm">Luhn algorithm</a>.
     *
     * @param card the credit card to validate
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `card` is invalid with the custom exception `message`
     * @throws NullPointerException if `card` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.matches
     * 
     * @example
     * Validate.creditCard(
     *     '0000000000000001',
     *     'Invalid credit card number {0}',
     *     new List<String>{ '0000000000000001' }
     * ); // throws an IllegalArgumentException
     */
    public static void creditCard(final String card, final String message, final List<Object> arguments) {
        notBlank(card);
        isTrue(isCreditCardValid(card), message, arguments);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="State">
    // @start-group State
    /**
     * @description Checks that the stateful argument `condition` is true.
     * 
     * @param condition the boolean expression to check
     *
     * @throws IllegalStateException if `condition` evaluates to false
     * with the default exception message 'Argument state is invalid'
     * @throws NullPointerException if `condition` is null with the default exception message 'Argument object is null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.state(response.getStatusCode() == 200);
     */
    public static void state(final Boolean condition) {
        state(condition, Label.AV_ErrorMessage_InvalidState);
    }

    /**
     * @description Checks that the stateful argument `condition` is true.
     * 
     * @param condition the boolean expression to check
     * @param message the required custom exception message
     *
     * @throws IllegalStateException if `condition` evaluates to false
     * with custom exception `message`
     * @throws NullPointerException if `condition` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.state(response.getStatusCode() == 200, 'Custom message');
     */
    public static void state(final Boolean condition, final String message) {
        state(condition, message, null);
    }

    /**
     * @description Checks that the stateful argument `condition` is true.
     *
     * @param condition the boolean expression to check
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalStateException if `condition` evaluates to false
     * with the custom exception `message`
     * @throws NullPointerException if `condition` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @example
     * Validate.state(
     *     !map.containsKey(key),
     *     'Duplicate key {0} (attempted merging values {1} and {2}).',
     *     new List<Object>{ key, oldValue, newValue }
     * ); // throws an IllegalStateException
     */
    public static void state(final Boolean condition, final String message, final List<Object> arguments) {
        notNull(condition);
        isTrue(condition, newIllegalStateException(format(message, arguments)));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Numbers">
    // @start-group Numbers
    /**
     * @description Checks that the argument long `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range with the default formatted
     * exception message 'Argument {0} is not between inclusive range from {1} to {2}'
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(1L, 10L, 5L); // valid
     */
    public static void between(final Long startInclusive, final Long endInclusive, final Long value) {
        between(
            startInclusive,
            endInclusive,
            value,
            format(Label.AV_ErrorMessage_NotBetween, value, startInclusive, endInclusive)
        );
    }

    /**
     * @description Checks that the argument long `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * @param message the required custom exception message
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range
     * with the custom exception `message`
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *     1L,
     *     10L,
     *     11L,
     *     'The value is out of range'
     * ); //throws an IllegalArgumentException
     */
    public static void between(
        final Long startInclusive,
        final Long endInclusive,
        final Long value,
        final String message
    ) {
        between(startInclusive, endInclusive, value, message, null);
    }

    /**
     * @description Checks that the argument long `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range
     * with the custom exception `message`
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *     1L,
     *     10L,
     *     11L,
     *     'The value {0} is out of range {1} - {2}',
     *     new List<Long>{ 11L, 1L, 10L }
     * ); // throws an IllegalArgumentException
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public static void between(
        final Long startInclusive,
        final Long endInclusive,
        final Long value,
        final String message,
        final List<Object> arguments
    ) {
        notNull(startInclusive);
        notNull(endInclusive);
        notNull(value);
        isTrue(
            value >= startInclusive && value <= endInclusive,
            newIllegalArgumentException(format(message, arguments))
        );
    }

    /**
     * @description Checks that the argument int `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range with the default formatted
     * exception message 'Argument {0} is not between inclusive range from {1} to {2}'
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(1, 10, 5); // valid
     */
    public static void between(final Integer startInclusive, final Integer endInclusive, final Integer value) {
        between(
            startInclusive,
            endInclusive,
            value,
            format(Label.AV_ErrorMessage_NotBetween, value, startInclusive, endInclusive)
        );
    }

    /**
     * @description Checks that the argument int `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * @param message the required custom exception message
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range
     * with the custom exception `message`
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *     1,
     *     10,
     *     11,
     *     'The value is out of range'
     * ); //throws an IllegalArgumentException
     */
    public static void between(
        final Integer startInclusive,
        final Integer endInclusive,
        final Integer value,
        final String message
    ) {
        between(startInclusive, endInclusive, value, message, null);
    }

    /**
     * @description Checks that the argument int `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     * 
     * @throws IllegalStateException if the `value` is not within the specified range
     * with the custom exception `message`
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *     1,
     *     10,
     *     11,
     *     'The value {0} is out of range {1} - {2}',
     *     new List<Integer>{ 11, 1, 10 }
     * ); // throws an IllegalArgumentException
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public static void between(
        final Integer startInclusive,
        final Integer endInclusive,
        final Integer value,
        final String message,
        final List<Object> arguments
    ) {
        notNull(startInclusive);
        notNull(endInclusive);
        notNull(value);
        isTrue(
            value >= startInclusive && value <= endInclusive,
            newIllegalArgumentException(format(message, arguments))
        );
    }

    /**
     * @description Checks that the argument double `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range with the default formatted
     * exception message 'Argument {0} is not between inclusive range from {1} to {2}'
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between((Double) 1.1, (Double) 10.2, (Double) 5.2); // valid
     */
    public static void between(final Double startInclusive, final Double endInclusive, final Double value) {
        between(
            startInclusive,
            endInclusive,
            value,
            format(Label.AV_ErrorMessage_NotBetween, value, startInclusive, endInclusive)
        );
    }

    /**
     * @description Checks that the argument double `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * @param message the required custom exception message
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range
     * with the custom exception `message`
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *     (Double) 1.1,
     *     (Double) 10.2,
     *     (Double) 11.2,
     *     'The value is out of range'
     * ); //throws an IllegalArgumentException
     */
    public static void between(
        final Double startInclusive,
        final Double endInclusive,
        final Double value,
        final String message
    ) {
        between(startInclusive, endInclusive, value, message, null);
    }

    /**
     * @description Checks that the argument double `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range
     * with the custom exception `message`
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *     (Double) 1.1,
     *     (Double) 10.2,
     *     (Double) 11.2,
     *     'The value {0} is out of range {1} - {2}',
     *     new List<Double>{ 11.2, 1.1, 10.2 }
     * ); // throws an IllegalArgumentException
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public static void between(
        final Double startInclusive,
        final Double endInclusive,
        final Double value,
        final String message,
        final List<Object> arguments
    ) {
        notNull(startInclusive);
        notNull(endInclusive);
        notNull(value);
        isTrue(
            value >= startInclusive && value <= endInclusive,
            newIllegalArgumentException(format(message, arguments))
        );
    }

    /**
     * @description Checks that the argument date `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range with the default formatted
     * exception message 'Argument {0} is not between inclusive range from {1} to {2}'
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *    Date.today(),
     *    Date.today().addDays(2),
     *    Date.today().addDays(1)
     * ); // valid
     */
    public static void between(final Date startInclusive, final Date endInclusive, final Date value) {
        between(
            startInclusive,
            endInclusive,
            value,
            format(Label.AV_ErrorMessage_NotBetween, value, startInclusive, endInclusive)
        );
    }

    /**
     * @description Checks that the argument date `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * @param message the required custom exception message
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range
     * with the custom exception `message`
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *     Date.today(),
     *     Date.today().addDays(2),
     *     Date.today().addDays(3),
     *     'The value is out of range'
     * ); //throws an IllegalArgumentException
     */
    public static void between(
        final Date startInclusive,
        final Date endInclusive,
        final Date value,
        final String message
    ) {
        between(startInclusive, endInclusive, value, message, null);
    }

    /**
     * @description Checks that the argument date `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range
     * with the custom exception `message`
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *     Date.today(),
     *     Date.today().addDays(2),
     *     Date.today().addDays(3),
     *     'The value {0} is out of range {1} - {2}',
     *     new List<Date>{
     *         Date.today(),
     *         Date.today().addDays(2),
     *         Date.today().addDays(3)
     *     }
     * ); // throws an IllegalArgumentException
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public static void between(
        final Date startInclusive,
        final Date endInclusive,
        final Date value,
        final String message,
        final List<Object> arguments
    ) {
        notNull(startInclusive);
        notNull(endInclusive);
        notNull(value);
        isTrue(
            value >= startInclusive && value <= endInclusive,
            newIllegalArgumentException(format(message, arguments))
        );
    }

    /**
     * @description Checks that the argument datetime `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range with the default formatted
     * exception message 'Argument {0} is not between inclusive range from {1} to {2}'
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *    Datetime.now(),
     *    Datetime.now().addDays(2),
     *    Datetime.now().addDays(1)
     * ); // valid
     */
    public static void between(final Datetime startInclusive, final Datetime endInclusive, final Datetime value) {
        between(
            startInclusive,
            endInclusive,
            value,
            format(Label.AV_ErrorMessage_NotBetween, value, startInclusive, endInclusive)
        );
    }

    /**
     * @description Checks that the argument datetime `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * @param message the required custom exception message
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range
     * with the custom exception `message`
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *     Datetime.now(),
     *     Datetime.now().addDays(2),
     *     Datetime.now().addDays(3),
     *     'The value is out of range'
     * ); //throws an IllegalArgumentException
     */
    public static void between(
        final Datetime startInclusive,
        final Datetime endInclusive,
        final Datetime value,
        final String message
    ) {
        between(startInclusive, endInclusive, value, message, null);
    }

    /**
     * @description Checks that the argument datetime `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range
     * with the custom exception `message`
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *     Datetime.now(),
     *     Datetime.now().addDays(2),
     *     Datetime.now().addDays(3),
     *     'The value {0} is out of range {1} - {2}',
     *     new List<Datetime>{
     *         Datetime.now(),
     *         Datetime.now().addDays(2),
     *         Datetime.now().addDays(3)
     *     }
     * ); // throws an IllegalArgumentException
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public static void between(
        final Datetime startInclusive,
        final Datetime endInclusive,
        final Datetime value,
        final String message,
        final List<Object> arguments
    ) {
        notNull(startInclusive);
        notNull(endInclusive);
        notNull(value);
        isTrue(
            value >= startInclusive && value <= endInclusive,
            newIllegalArgumentException(format(message, arguments))
        );
    }

    /**
     * @description Checks that the argument time `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range with the default formatted
     * exception message 'Argument {0} is not between inclusive range from {1} to {2}'
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *    Time.newInstance(0, 0, 0, 0),
     *    Time.newInstance(0, 0, 0, 0).addHours(2),
     *    Time.newInstance(0, 0, 0, 0).addHours(1)
     * ); // valid
     */
    public static void between(final Time startInclusive, final Time endInclusive, final Time value) {
        between(
            startInclusive,
            endInclusive,
            value,
            format(Label.AV_ErrorMessage_NotBetween, value, startInclusive, endInclusive)
        );
    }

    /**
     * @description Checks that the argument time `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * @param message the required custom exception message
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range
     * with the custom exception `message`
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *     Time.newInstance(0, 0, 0, 0),
     *     Time.newInstance(0, 0, 0, 0).addHours(2),
     *     Time.newInstance(0, 0, 0, 0).addHours(3),
     *     'The value is out of range'
     * ); //throws an IllegalArgumentException
     */
    public static void between(
        final Time startInclusive,
        final Time endInclusive,
        final Time value,
        final String message
    ) {
        between(startInclusive, endInclusive, value, message, null);
    }

    /**
     * @description Checks that the argument time `value` is between the two inclusive values.
     * 
     * @param startInclusive the inclusive start value
     * @param endInclusive the inclusive end value
     * @param value tha value to validate
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     * 
     * @throws IllegalArgumentException if the `value` is not within the specified range
     * with the custom exception `message`
     * @throws NullPointerException if `startInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `endInclusive` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `value` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Validate.isTrue
     * 
     * @example
     * Validate.between(
     *     Time.newInstance(0, 0, 0, 0),
     *     Time.newInstance(0, 0, 0, 0).addHours(2),
     *     Time.newInstance(0, 0, 0, 0).addHours(3),
     *     'The value {0} is out of range {1} - {2}',
     *     new List<Datetime>{
     *         Time.newInstance(0, 0, 0, 0),
     *         Time.newInstance(0, 0, 0, 0).addHours(2),
     *         Time.newInstance(0, 0, 0, 0).addHours(3)
     *     }
     * ); // throws an IllegalArgumentException
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public static void between(
        final Time startInclusive,
        final Time endInclusive,
        final Time value,
        final String message,
        final List<Object> arguments
    ) {
        notNull(startInclusive);
        notNull(endInclusive);
        notNull(value);
        isTrue(
            value >= startInclusive && value <= endInclusive,
            newIllegalArgumentException(format(message, arguments))
        );
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Methods consistent with System.Assert class">
    // @start-group Methods consistent with System.Assert class
    /**
     * @description Checks that the arguments `obj1` and `obj2` are equal.
     *
     * @param obj1 the first object to compare
     * @param obj2 the second object to compare
     *
     * @throws IllegalArgumentException if the `obj1` and `obj2` are not equal with the default formatted
     * exception message 'Arguments {0} and {1} are not equal'
     *
     * @see Assert.areEqual
     * 
     * @example
     * Validate.areEqual('foo', 'foo'); // valid
     * Validate.areEqual('foo', 'bar'); // throws an IllegalArgumentException 
     */
    public static void areEqual(final Object obj1, final Object obj2) {
        areEqual(obj1, obj2, format(Label.AV_ErrorMessage_NotEqual, obj1, obj2));
    }

    /**
     * @description Checks that the arguments `obj1` and `obj2` are equal.
     *
     * @param obj1 the first object to compare
     * @param obj2 the second object to compare
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if the `obj1` and `obj2` are not equal with the custom `message`
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Assert.areEqual
     * 
     * @example
     * Validate.areEqual(
     *    'foo',
     *    'bar',
     *    'Arguments are not equal'
     * ); // throws an IllegalArgumentException 
     */
    public static void areEqual(final Object obj1, final Object obj2, final String message) {
        areEqual(obj1, obj2, message, null);
    }

    /**
     * @description Checks that the arguments `obj1` and `obj2` are equal.
     *
     * @param obj1 the first object to compare
     * @param obj2 the second object to compare
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if the `obj1` and `obj2` are not equal with the custom `message`
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Assert.areEqual
     * 
     * @example
     * Validate.areEqual(
     *    'foo',
     *    'bar',
     *    'Arguments {0} and {1} are not equal',
     *    new List<String>{ 'foo', 'bar' }
     * ); // throws an IllegalArgumentException 
     */
    public static void areEqual(
        final Object obj1,
        final Object obj2,
        final String message,
        final List<Object> arguments
    ) {
        isTrue(obj1 == obj2, message, arguments);
    }

    /**
     * @description Checks that the arguments `obj1` and `obj2` are not equal.
     *
     * @param obj1 the first object to compare
     * @param obj2 the second object to compare
     *
     * @throws IllegalArgumentException if the `obj1` and `obj2` are equal with the default formatted
     * exception message 'Arguments {0} and {1} are equal'
     *
     * @see Assert.areNotEqual
     * 
     * @example
     * Validate.areNotEqual('foo', 'bar'); // valid
     * Validate.areNotEqual('foo', 'foo'); // throws an IllegalArgumentException 
     */
    public static void areNotEqual(final Object obj1, final Object obj2) {
        areNotEqual(obj1, obj2, format(Label.AV_ErrorMessage_Equal, obj1, obj2));
    }

    /**
     * @description Checks that the arguments `obj1` and `obj2` are not equal.
     *
     * @param obj1 the first object to compare
     * @param obj2 the second object to compare
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if the `obj1` and `obj2` are equal with the custom `message`
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Assert.areNotEqual
     * 
     * @example
     * Validate.areNotEqual(
     *    'foo',
     *    'foo',
     *    'Arguments are equal'
     * ); // throws an IllegalArgumentException 
     */
    public static void areNotEqual(final Object obj1, final Object obj2, final String message) {
        areNotEqual(obj1, obj2, message, null);
    }

    /**
     * @description Checks that the arguments `obj1` and `obj2` are not equal.
     *
     * @param obj1 the first object to compare
     * @param obj2 the second object to compare
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if the `obj1` and `obj2` are equal with the custom `message`
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Assert.areNotEqual
     * 
     * @example
     * Validate.areNotEqual(
     *    'foo',
     *    'foo',
     *    'Arguments {0} and {1} are equal',
     *    new List<String>{ 'foo', 'bar' }
     * ); // throws an IllegalArgumentException
     */
    public static void areNotEqual(
        final Object obj1,
        final Object obj2,
        final String message,
        final List<Object> arguments) {
        isTrue(obj1 != obj2, message, arguments);
    }

    /**
     * @description Checks that the argument `condition` is false.
     *
     * @param condition the boolean expression to check
     *
     * @throws IllegalArgumentException if `condition` evaluates to true
     * with the default exception message 'Argument condition is true'
     * @throws NullPointerException if `condition` is null with the default exception message 'Argument object is null'
     * 
     * @see Assert.isFalse
     * @see Validate.isTrue
     * 
     * @example
     * Validate.isFalse(i > 0);
     * Validate.isFalse(response.getStatusCode() != 200);
     */
    public static void isFalse(final Boolean condition) {
        isFalse(condition, Label.AV_ErrorMessage_TrueCondition);
    }

    /**
     * @description Checks that the argument `condition` is false.
     *
     * @param condition the boolean expression to check
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if `condition` evaluates to true with the custom exception `message`
     * @throws NullPointerException if `condition` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Assert.isFalse
     * @see Validate.isTrue
     * 
     * @example
     * Validate.isFalse(
     *     i < 0,
     *     'The argument value must be positive'
     * );
     * Validate.isFalse(
     *     response.getStatusCode() == 400,
     *     'The status code must not be 400'
     * );
     */
    public static void isFalse(final Boolean condition, final String message) {
        isFalse(condition, message, null);
    }

    /**
     * @description Checks that the argument `condition` is false.
     *
     * @param condition the boolean expression to check
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `condition` evaluates to true with the custom exception `message`
     * @throws NullPointerException if `condition` is null with the default exception message 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     * 
     * @see Assert.isFalse
     * @see Validate.isTrue
     * 
     * @example
     * Validate.isFalse(
     *     response.getStatusCode() == 400,
     *     'The status code must not be {0}',
     *     new List<Integer>{ 400 }
     * );
     */
    public static void isFalse(final Boolean condition, final String message, final List<Object> arguments) {
        notNull(condition);
        notNull(message, Label.AV_ErrorMessage_NullMessage);
        if (condition) {
            throw newIllegalArgumentException(format(message, arguments));
        }
    }

    /**
     * @description Checks that the argument `obj` is the instance of type.
     *
     * @param obj the object to validate
     * @param expectedType the expected type for the object
     *
     * @throws IllegalArgumentException if the `obj` is not an instance of `expectedType` with the default formatted
     * exception message 'Argument object is not an instance of {0}. Actual type: {1}'
     * @throws NullPointerException if `expectedType` is null with the default exception message
     * 'Argument object is null'
     *
     * @see Assert.isInstanceOfType
     *
     * @example
     * Validate.isInstanceOfType('hello', String.class); // valid
     * Validate.isInstanceOfType('hello', Integer.class); // throws an IllegalArgumentException
     */
    public static void isInstanceOfType(final Object obj, final Type expectedType) {
        isInstanceOfType(obj, expectedType, format(Label.AV_ErrorMessage_NotInstanceOf, expectedType, getType(obj)));
    }

    /**
     * @description Checks that the argument `obj` is the instance of type.
     *
     * @param obj the object to validate
     * @param expectedType the expected type for the object
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if the `obj` is not an instance of `expectedType` with
     * the custom exception `message`
     * @throws NullPointerException if `expectedType` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Assert.isInstanceOfType
     *
     * @example
     * Validate.isInstanceOfType(
     *     'hello',
     *     Integer.class,
     *     'Invalid type'
     * ); // throws an IllegalArgumentException
     */
    public static void isInstanceOfType(final Object obj, final Type expectedType, final String message) {
        isInstanceOfType(obj, expectedType, message, null);
    }

    /**
     * @description Checks that the argument `obj` is the instance of type.
     *
     * @param obj the object to validate
     * @param expectedType the expected type for the object
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if the `obj` is not an instance of `expectedType` with
     * the custom exception `message`
     * @throws NullPointerException if `expectedType` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Assert.isInstanceOfType
     *
     * @example
     * Validate.isInstanceOfType(
     *     'hello',
     *     Integer.class,
     *     'Expected Type: {0}',
     *     new List<String>{ 'Integer' }
     * ); // throws an IllegalArgumentException
     */
    public static void isInstanceOfType(
        final Object obj,
        final Type expectedType,
        final String message,
        final List<Object> arguments
    ) {
        notNull(expectedType);
        isTrue(obj == null || expectedType.isAssignableFrom(getType(obj)), message, arguments);
    }

    /**
     * @description Checks that the argument `obj` is not the instance of type.
     *
     * @param obj the object to validate
     * @param notExpectedType the not expected type for the object
     *
     * @throws IllegalArgumentException if the `obj` is an instance of `notExpectedType` with the default formatted
     * exception message 'Argument object is an instance of {0}'
     * @throws NullPointerException if `notExpectedType` is null with the default exception message
     * 'Argument object is null'
     *
     * @see Assert.isNotInstanceOfType
     *
     * @example
     * Validate.isNotInstanceOfType('hello', Integer.class); // valid
     * Validate.isNotInstanceOfType('hello', String.class); // throws an IllegalArgumentException
     */
    public static void isNotInstanceOfType(final Object obj, final Type notExpectedType) {
        isNotInstanceOfType(
            obj,
            notExpectedType,
            format(Label.AV_ErrorMessage_InstanceOf, notExpectedType)
        );
    }

    /**
     * @description Checks that the argument `obj` is not the instance of type.
     *
     * @param obj the object to validate
     * @param notExpectedType the not expected type for the object
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if the `obj` is an instance of `notExpectedType` with
     * the custom exception `message`
     * @throws NullPointerException if `notExpectedType` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Assert.isNotInstanceOfType
     *
     * @example
     * Validate.isNotInstanceOfType(
     *     'hello',
     *     String.class,
     *     'Invalid type'
     * ); // throws an IllegalArgumentException
     */
    public static void isNotInstanceOfType(final Object obj, final Type notExpectedType, final String message) {
        isNotInstanceOfType(obj, notExpectedType, message, null);
    }

    /**
     * @description Checks that the argument `obj` is not the instance of type.
     *
     * @param obj the object to validate
     * @param notExpectedType the expected type for the object
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if the `obj` is not an instance of `notExpectedType` with
     * the custom exception `message`
     * @throws NullPointerException if `notExpectedType` is null with the default exception message
     * 'Argument object is null'
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Assert.isNotInstanceOfType
     *
     * @example
     * Validate.isNotInstanceOfType(
     *     'hello',
     *     String.class,
     *     'Unexpected Type: {0}',
     *     new List<String>{ 'String' }
     * ); // throws an IllegalArgumentException
     */
    public static void isNotInstanceOfType(
        final Object obj,
        final Type notExpectedType,
        final String message,
        final List<Object> arguments
    ) {
        notNull(notExpectedType);
        isTrue(obj != null && !notExpectedType.isAssignableFrom(getType(obj)), message, arguments);
    }

    /**
     * @description Checks that the argument reference `obj` is not null.
     * Unlike {@link Validate.notNull} throws `IllegalArgumentException` when the `obj` is null.
     *
     * @param obj the object to check for nullity
     *
     * @throws IllegalArgumentException if `obj` is null with the default exception message 'Argument object is null'
     *
     * @see Assert.isNotNull
     * @see Validate.notNull
     * @see Validate.isTrue
     *
     * @example
     * Validate.isNotNull('foo'); // valid
     * Object obj;
     * Validate.isNotNull(obj); // throws an IllegalArgumentException
     */
    public static void isNotNull(final Object obj) {
        isNotNull(obj, Label.AV_ErrorMessage_Null);
    }

    /**
     * @description Checks that the argument reference `obj` is not null.
     * Unlike {@link Validate.notNull} throws `IllegalArgumentException` when the `obj` is null.
     *
     * @param obj the object to check for nullity
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if `obj` is null with the custom exception `message`
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Assert.isNotNull
     * @see Validate.notNull
     * @see Validate.isTrue
     *
     * @example
     * Object obj;
     * Validate.isNotNull(
     *     obj,
     *     'The object cannot be null'
     * ); // throws an IllegalArgumentException
     */
    public static void isNotNull(final Object obj, final String message) {
        isNotNull(obj, message, null);
    }

    /**
     * @description Checks that the argument reference `obj` is not null.
     * Unlike {@link Validate.notNull} throws `IllegalArgumentException` when the `obj` is null.
     *
     * @param obj the object to check for nullity
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `obj` is null with the custom exception `message`
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Assert.isNotNull
     * @see Validate.notNull
     * @see Validate.isTrue
     *
     * @example
     * Object obj;
     * Validate.isNotNull(
     *     obj,
     *     'Custom exception {0}',
     *     new List<String>{ 'argument' }
     * ); // throws an IllegalArgumentException
     */
    public static void isNotNull(final Object obj, final String message, final List<Object> arguments) {
        isTrue(obj != null, message, arguments);
    }

    /**
     * @description Checks that the argument reference `obj` is null.
     *
     * @param obj the object to check for nullity
     *
     * @throws IllegalArgumentException if `obj` is not null with the default formatted exception message 
     * 'Argument object is not null. Actual value: {0}'
     *
     * @see Assert.isNull
     * @see Validate.isTrue
     *
     * @example
     * Object obj;
     * Validate.isNull(obj); // valid
     * Validate.isNull('foo'); // throws an IllegalArgumentException
     */
    public static void isNull(final Object obj) {
        isNull(obj, format(Label.AV_ErrorMessage_NotNull, obj));
    }

    /**
     * @description Checks that the argument reference `obj` is null.
     *
     * @param obj the object to check for nullity
     * @param message the required custom exception message
     *
     * @throws IllegalArgumentException if `obj` is not null with the custom exception `message`
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Assert.isNull
     * @see Validate.isTrue
     *
     * @example
     * Validate.isNull('foo', 'Custom message'); // throws an IllegalArgumentException
     */
    public static void isNull(final Object obj, final String message) {
        isNull(obj, message, null);
    }

    /**
     * @description Checks that the argument reference `obj` is null.
     *
     * @param obj the object to check for nullity
     * @param message the required formatted exception message
     * @param arguments the optional values for the formatted exception message
     *
     * @throws IllegalArgumentException if `obj` is not null with the custom exception `message`
     * @throws NullPointerException if `message` is null with the default exception message
     * 'Exception message cannot be null'
     *
     * @see Assert.isNull
     * @see Validate.isTrue
     *
     * @example
     * Validate.isNull(
     *     'foo',
     *     'Argument is not null. Actual value: {0}',
     *     new List<String>{ 'foo' }
     * ); // throws an IllegalArgumentException
     */
    public static void isNull(final Object obj, final String message, final List<Object> arguments) {
        isTrue(obj == null, message, arguments);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Private Methods">
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

    private static Exception newIndexOutOfBoundsException(final String message) {
        final IndexOutOfBoundsException exc = new IndexOutOfBoundsException(message);
        exc.setMessage(message);
        return exc;
    }

    private static Exception newIllegalStateException(final String message) {
        final IllegalStateException exc = new IllegalStateException(message);
        exc.setMessage(message);
        return exc;
    }

    private static Type getType(final Object o) {
        return Type.forName(getTypeName(o));
    }

    private static String getTypeName(final Object o) {
        Object result;
        try {
            result = (System.JSON) o;
            return 'System.JSON';
        } catch (TypeException exc) {
            return exc.getMessage().substringBetween('Invalid conversion from runtime type ', ' to System.JSON');
        }
    }

    // https://en.wikipedia.org/wiki/Luhn_algorithm
    private static Boolean isCreditCardValid(final String str) {
        final List<Integer> chars = str.replace('-', '').deleteWhitespace().getChars();
        if (chars.size() < 13 || chars.size() > 19) {
            return false;
        }
        Integer checksum = 0;
        Boolean evenDigit = false;
        for (Integer i = chars.size() - 1; i >= 0; i--) {
            final Integer ch = chars[i];
            // numeric check
            if (!(ch >= 48 && ch <= 57)) {
                return false;
            }
            Integer digitValue = (ch - 48) * (evenDigit ? 2 : 1);
            evenDigit = !evenDigit;
            while (digitValue > 0) {
                checksum += Math.mod(digitValue, 10);
                digitValue /= 10;
            }
        }
        return Math.mod(checksum, 10) == 0;
    }

    @TestVisible
    private static String format(String str, Object arg1) {
        return String.format(escapeBraces(str), new List<Object>{ arg1 });
    }

    @TestVisible
    private static String format(String str, Object arg1, Object arg2) {
        return String.format(escapeBraces(str), new List<Object>{ arg1, arg2 });
    }

    @TestVisible
    private static String format(String str, Object arg1, Object arg2, Object arg3) {
        return String.format(escapeBraces(str), new List<Object>{ arg1, arg2, arg3 });
    }

    @TestVisible
    private static String format(String str, List<Object> args) {
        return String.format(escapeBraces(str), args);
    }

    @TestVisible
    private static String escapeBraces(String str) {
        return str.replaceAll('\\{(?![0-9])', '(').replaceAll('(?<!\\d)\\}', ')');
    }
    //</editor-fold>
    
}
