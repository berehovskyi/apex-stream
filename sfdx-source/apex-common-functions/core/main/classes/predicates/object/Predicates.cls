/**
 * @description Provides common implementations of {@link Predicate}
 * and related utilities.
 *
 * @see Predicate
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class Predicates {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected Predicates() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins

    //<editor-fold desc="?">
    /**
     * @description Returns a `Predicate` that tests if the result of comparing
     * the values returned by the applied `left` and `right` functions
     * by the `comparer` is equal to the expected `result`.
     *
     * @param left the function applied to the input argument the result of which is passed to
     * the `comparer` as the first argument
     * @param right the function applied to the input argument the result of which is passed to
     * the `comparer` as the second argument
     * @param comparer the function that compares two arguments
     * @param result the expected result of comparison (1, -1, or 0)
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or  `right`,
     * or `comparer`, or `result` is null
     *
     * @example
     * Predicates.isCompared(
     *     func1,
     *     func2,
     *     Comparer.defaultOrder(),
     *     1
     * );
     */
    @SuppressWarnings('PMD.ExcessiveParameterList')
    public static Predicate isCompared(
        final IFunction left,
        final IFunction right,
        final IComparer comparer,
        final Integer result
    ) {
        return new ComparerPredicate(left, right, comparer, result);
    }
    //</editor-fold>

    //<editor-fold desc="==">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is equal to the result returned by the `right`
     * function, comparing object value equality not reference equality.
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * Predicates.isEqual(func1, func2);
     * Predicates.isEqual(func1, Function.constant(100));
     */
    public static Predicate isEqual(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparer.defaultOrder(), 0);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is equal to
     * the `value`, comparing object value equality not reference equality.
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * Predicates.isEqual(100).test(100); // true
     * Predicates.isEqual(100).test(50); // false
     */
    public static Predicate isEqual(final Object value) {
        return isEqual(Function.identity(), Function.constant(value));
    }
    //</editor-fold>

    //<editor-fold desc=">">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is greater than the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * Predicates.isGreater(func1, func2);
     * Predicates.isGreater(func1, Function.constant(100));
     */
    public static Predicate isGreater(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparer.defaultOrder(), 1);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is greater than
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>` "greater than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @example
     * Predicates.isGreater(100);
     */
    public static Predicate isGreater(final Object value) {
        return isGreater(Function.identity(), Function.constant(value));
    }
    //</editor-fold>

    //<editor-fold desc=">=">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is greater than or equal to the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to " operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * Predicates.isGreaterOrEqual(func1, func2);
     * Predicates.isGreaterOrEqual(func1, Function.constant(100));
     */
    public static Predicate isGreaterOrEqual(final IFunction left, final IFunction right) {
        return isGreater(left, right).orElse(isEqual(left, right));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is greater than or equal to
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `>=` "greater than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @example
     * Predicates.isGreaterOrEqual(100);
     */
    public static Predicate isGreaterOrEqual(final Object value) {
        return isGreater(value).orElse(isEqual(value));
    }
    //</editor-fold>

    //<editor-fold desc="<">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is less than the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * Predicates.isLess(func1, func2);
     * Predicates.isLess(func1, Function.constant(100));
     */
    public static Predicate isLess(final IFunction left, final IFunction right) {
        return isCompared(left, right, Comparer.defaultOrder(), -1);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is less than
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<` "less than" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @example
     * Predicates.isLess(100);
     */
    public static Predicate isLess(final Object value) {
        return isLess(Function.identity(), Function.constant(value));
    }
    //</editor-fold>

    //<editor-fold desc="<=">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is less than or equal to the result returned by the `right`
     * function.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * Predicates.isLessOrEqual(func1, func2);
     * Predicates.isLessOrEqual(func1, Function.constant(100));
     */
    public static Predicate isLessOrEqual(final IFunction left, final IFunction right) {
        return isLess(left, right).orElse(isEqual(left, right));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is less than or equal to
     * the `value`.
     * <p><strong>Note: </strong></p>
     * <p>Unlike the standard `<=` "less than or equal to" operator, the predicate function supports
     * comparison of all primitive types and considers a non-null value as always greater than
     * a null value. User-defined types must implement the `Comparable` interface.</p>
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @example
     * Predicates.isLess(100);
     */
    public static Predicate isLessOrEqual(final Object value) {
        return isLess(value).orElse(isEqual(value));
    }
    //</editor-fold>

    //<editor-fold desc="!=">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `left` function is not equal to the result returned by the `right`
     * function, comparing object value equality not reference equality.
     *
     * @param left the function whose application result is considered as the left argument of comparison
     * @param right the function whose application result is considered as the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * Predicates.isNotEqual(func1, func2);
     * Predicates.isNotEqual(func1, Function.constant(100));
     */
    public static Predicate isNotEqual(final IFunction left, final IFunction right) {
        return isEqual(left, right).negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is not equal to
     * the `value`, comparing object value equality not reference equality.
     *
     * @param value the right argument of comparison
     *
     * @return the `Predicate`
     *
     * @example
     * Predicates.isEqual(100);
     */
    public static Predicate isNotEqual(final Object value) {
        return isEqual(value).negate();
    }
    //</editor-fold>

    //<editor-fold desc="NULL">
    /**
     * @description Returns a `Predicate` that tests the result returned by
     * the `function` if it is null.
     *
     * @param left the function whose application result is tested
     *
     * @return the `Predicate`
     *
     * @example
     * Predicates.isNull(func1);
     */
    public static Predicate isNull(final IFunction left) {
        return isEqual(left, Function.constant(null));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is null.
     *
     * @return the `Predicate`
     *
     * @example
     * Predicates.isNull().test(null); // true;
     * Predicates.isNull().test(1); // false;
     */
    public static Predicate isNull() {
        return isNull(Function.identity());
    }
    //</editor-fold>

    //<editor-fold desc="NOT NULL">
    /**
     * @description Returns a `Predicate` that tests the result returned by
     * the `function` if it is not null.
     *
     * @param left the function whose application result is tested
     *
     * @return the `Predicate`
     *
     * @example
     * Predicates.isNull().test(null); // true;
     * Predicates.isNull().test(1); // false;
     */
    public static Predicate isNotNull(final IFunction left) {
        return isNotEqual(left, Function.constant(null));
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is not null.
     *
     * @return the `Predicate`
     *
     * @example
     * Predicates.isNotNull().test(null); // false
     * Predicates.isNotNull().test(1); // true
     */
    public static Predicate isNotNull() {
        return isNull().negate();
    }
    //</editor-fold>

    //<editor-fold desc="LIKE">
    /**
     * @description Returns a `Predicate` that tests the input object if the string returned by
     * the `function` matches the `likeString` pattern. Supports the `%` and
     * the `_` wildcards and is case-insensitive.
     *
     * @param function the function whose application result string is tested
     * @param likeString the pattern that is tested to match the string returned by the `function`
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `function` or `likeString` is null
     *
     * @see Comparer.defaultOrder
     *
     * @example
     * Predicates.isLike(Functions.get('Name'), '%a_e');
     * Predicates.isLike(Functions.get(Account.Name), '%a_e');
     */
    public static Predicate isLike(final IFunction function, final String likeString) {
        return new LikePredicate(function, likeString);
    }
    //</editor-fold>

    //<editor-fold desc="IN">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `function` is contained in the `container`.
     *
     * @param function the function whose application result is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `function` or `container` is null
     *
     * @see List.contains
     *
     * @example
     * Predicates.isIn(getNameFunc, new List<Object>{ 'John', 'Jim' });
     * Predicates.isIn(getNameFunc, new Set<String>{ 'John', 'Jim' });
     * Predicates.isIn(getNameFunc, nameEnumerable);
     */
    public static Predicate isIn(final IFunction function, final Iterable<Object> container) {
        return new ContainsPredicate(function, container);
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is contained in
     * the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `container` is null
     *
     * @see List.contains
     *
     * @example
     * Predicates.isIn(new List<Object>{ 'John', 'Jim' });
     * Predicates.isIn(new Set<String>{ 'John', 'Jim' });
     * Predicates.isIn(nameEnumerable);
     */
    public static Predicate isIn(final Iterable<Object> container) {
        return isIn(Function.identity(), container);
    }
    //</editor-fold>

    //<editor-fold desc="NOT IN">
    /**
     * @description Returns a `Predicate` that tests the input object if the result returned by
     * the `function` is not contained in the `container`.
     *
     * @param function the function whose application result is tested
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `function` or `container` is null
     *
     * @see List.contains
     *
     * @example
     * Predicates.isNotIn(getNameFunc, new List<Object>{ 'John', 'Jim' });
     * Predicates.isNotIn(getNameFunc, new Set<String>{ 'John', 'Jim' });
     * Predicates.isNotIn(getNameFunc, nameStream);
     */
    public static Predicate isNotIn(final IFunction function, final Iterable<Object> container) {
        return isIn(function, container).negate();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is not contained in
     * the `container`.
     *
     * @param container the iterable that checks for the presence of an element
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `container` is null
     *
     * @see List.contains
     *
     * @example
     * Predicates.isNotIn(new List<Object>{ 'John', 'Jim' });
     * Predicates.isNotIn(new Set<String>{ 'John', 'Jim' });
     * Predicates.isNotIn(nameStream);
     */
    public static Predicate isNotIn(final Iterable<Object> container) {
        return isIn(container).negate();
    }
    //</editor-fold>

    //<editor-fold desc="INCLUDES">
    /**
     * @description Returns a `Predicate` that tests the input object if the string returned by
     * the `function` fully matches any element of the `container`.
     * Each element of the `container` should be represented as a subset and the subset elements
     * should be separated by `;`.
     *
     * @param function the function whose application result is tested
     * @param container the iterable against which the string is tested
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `function`, `container` is null, or `container` contains null element
     *
     * @see Set.containsAll
     *
     * @example
     * Person person = new Person(Name = 'AAA;BBB');
     * Predicates.includes(getNameFunc, new List<String>{ 'AAA' }).test(person); // false
     * Predicates.includes(getNameFunc, new Set<String>{ 'AAA;BBB' }).test(person); // true
     * Predicates.includes(getNameFunc, new Set<String>{ 'BBB;CCC' }).test(person); // false
     * Predicates.includes(getNameFunc, new Set<String>{ 'AAA;CCC', 'BBB' }).test(person); // true
     * Predicates.includes(getNameFunc, new List<String>{ 'AAA;BBB;CCC' }).test(person); // false
     */
    public static Predicate includes(final IFunction function, final Iterable<String> container) {
        return new IncludesPredicate(function, container);
    }
    //</editor-fold>

    //<editor-fold desc="EXCLUDES">
    /**
     * @description Returns a `Predicate` that tests the input object if the string returned by
     * the `function` does not match every element of the `container`.
     * Each element of the `container` should be represented as a subset and the subset elements
     * should be separated by `;`.
     *
     * @param function the function whose application result is tested
     * @param container the iterable against which the string is tested
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `function`, `container` is null, or `container` contains null element
     *
     * @see Set.containsAll
     *
     * @example
     * Person person = new Person(Name = 'AAA;BBB');
     * Predicates.excludes(getNameFunc, new List<String>{ 'AAA' }).test(person); // true
     * Predicates.excludes(getNameFunc, new Set<String>{ 'AAA;BBB' }).test(person); // false
     * Predicates.excludes(getNameFunc, new Set<String>{ 'BBB;CCC' }).test(person); // true
     * Predicates.excludes(getNameFunc, new Set<String>{ 'AAA;CCC', 'BBB' }).test(person); // false
     * Predicates.excludes(getNameFunc, new List<String>{ 'AAA;BBB;CCC' }).test(person); // true
     */
    public static Predicate excludes(final IFunction function, final Iterable<String> container) {
        return includes(function, container).negate();
    }
    //</editor-fold>

    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ComparerPredicate extends Predicate {
        private final IFunction left;
        private final IFunction right;
        private final IComparer comparer;
        private final Integer comparisonResult;
        @SuppressWarnings('PMD.ExcessiveParameterList')
        private ComparerPredicate(
            IFunction left,
            IFunction right,
            IComparer comparer,
            Integer comparisonResult
        ) {
            Validate.notNull(left);
            Validate.notNull(right);
            Validate.notNull(comparer);
            Validate.notNull(comparisonResult);
            this.left = left;
            this.right = right;
            this.comparer = comparer;
            this.comparisonResult = comparisonResult;
        }
        public override Boolean test(Object obj) {
            return comparer.compare(this.left.apply(obj), right.apply(obj)) == comparisonResult;
        }
    }

    private class LikePredicate extends Predicate {
        private final IFunction function;
        private final String regex;
        private LikePredicate(IFunction function, String likeString) {
            Validate.notNull(function);
            Validate.notNull(likeString);
            this.function = function;
            regex = '(?i)^' + likeString.replaceAll('([^\\w%_ ])', '\\\\$1')
                .replace('%', '.*?')
                .replace('_', '.{1}?') + '$';
        }
        public override Boolean test(Object obj) {
            return Pattern.matches(regex, (String) function.apply(obj));
        }
    }

    private class ContainsPredicate extends Predicate {
        private final IFunction function;
        private final Set<Object> container;
        private ContainsPredicate(IFunction function, Iterable<Object> container) {
            Validate.notNull(function);
            Validate.notNull(container);
            this.function = function;
            this.container = toSet(container);
        }
        public override Boolean test(Object o) { return container.contains(function.apply(o)); }
        private Set<Object> toSet(Iterable<Object> src) {
            final Set<Object> dest = new Set<Object>();
            for (Object o : src) {
                dest.add(o);
            }
            return dest;
        }
    }

    private class IncludesPredicate extends Predicate {
        private final IFunction function;
        private final Set<String> container;
        private IncludesPredicate(IFunction function, Iterable<String> container) {
            Validate.notNull(function);
            Validate.notNull(container);
            this.function = function;
            this.container = toStringSet(container);
        }
        public override Boolean test(Object o) {
            String value = (String) function.apply(o);
            if (value == null) { return false; }
            Set<String> values = split(value.trim());
            for (String element : container) {
                if (values.containsAll(split(element))) { return true; }
            }
            return false;
        }
        private Set<String> toStringSet(Iterable<String> src) {
            final Set<String> dest = new Set<String>();
            for (String str : src) {
                Validate.notNull(str);
                dest.add(str);
            }
            return dest;
        }
        private Set<String> split(String value) { return new Set<String>(value.split(';')); }
    }
    // @end-group
    //</editor-fold>

}
