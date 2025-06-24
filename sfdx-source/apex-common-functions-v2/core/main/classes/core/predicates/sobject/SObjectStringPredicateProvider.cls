/**
 * @description Provides a fluent interface for building string-related predicates
 * that operate on SObject fields using currying. This builder allows you to create predicates
 * for checking various string conditions such as whether a string is blank, contains a value, starts with a value, etc.
 *
 * @group Functional Built-In Classes V2
 *
 * @example
 * IPredicate isNameBlank = new SObjectStringPredicateProvider()
 *     .is(Account.Name)
 *     .blank();
 * isNameBlank.test(new Account(Name = '')); // true
 */
public virtual inherited sharing class SObjectStringPredicateProvider {
    /**
     * @description Creates an instance of `StringOperator` using the provided mapping function.
     *
     * @param mapper the function used to map an SObject to a string value
     *
     * @return the `StringOperator`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * IPredicate isNameContainingJohn = new SObjectStringPredicateProvider()
     *     .is(new SObjectFunctionProvider().get(Account.Name))
     *     .containing('John');
     * isNameContainingJohn.test(new Account(Name = 'John Doe')); // true
     */
    public virtual StringOperator is(final IFunction mapper) {
        return new StringOperator(mapper, false);
    }

    /**
     * @description Creates an instance of `StringOperator` using the provided field name.
     *
     * @param fieldName the field name of the SObject to be used for mapping
     *
     * @return the `StringOperator`
     *
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * IPredicate isNameContainingJohn = new SObjectStringPredicateProvider()
     *     .is('Name')
     *     .containing('John');
     * isNameContainingJohn.test(new Account(Name = 'John Doe')); // true
     * // safe navigation
     * IPredicate isParentNameContainingJohn = new SObjectStringPredicateProvider()
     *     .is('Parent?.Name')
     *     .containing('John');
     */
    public virtual StringOperator is(final String fieldName) {
        return is(new SObjectFunctionProvider().get(fieldName));
    }

    /**
     * @description Creates an instance of `StringOperator` using the provided SObjectField.
     *
     * @param field the SObjectField to be used for mapping
     *
     * @return the `StringOperator`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * IPredicate isNameContainingJohn = new SObjectStringPredicateProvider()
     *     .is(Account.Name)
     *     .containing('John');
     * isNameContainingJohn.test(new Account(Name = 'John Doe')); // true
     */
    public virtual StringOperator is(final SObjectField field) {
        return is(new SObjectFunctionProvider().get(field));
    }

    /**
     * @description Represents a builder for string-related predicates that operate on SObject fields,
     * supporting operations like checking if a string is blank, contains a value, or starts/ends with a value.
     */
    public virtual class StringOperator {
        protected final IFunction mapper;
        protected final Boolean negate;
        protected StringOperator(IFunction mapper, Boolean negate) {
            Validate.notNull(mapper);
            this.mapper = mapper;
            this.negate = negate;
        }

        /**
         * @description Toggles the negation flag, allowing predicates to check for the opposite condition.
         *
         * @return a new instance of `StringOperator` with the negation flag toggled
         *
         * @example
         * IPredicate isNameNotContainingJohn = new SObjectStringPredicateProvider()
         *     .is(Account.Name)
         *     .notx()
         *     .containing('John');
         * isNameNotContainingJohn.test(new Account(Name = 'Jane Doe')); // true
         */
        public virtual StringOperator notx() {
            return new StringOperator(mapper, !negate);
        }

        /**
         * @description Creates a predicate that checks if the mapped string value is blank.
         *
         * @return a predicate that returns true if the mapped string value is blank
         *
         * @example
         * IPredicate isNameBlank = new SObjectStringPredicateProvider()
         *     .is(Account.Name)
         *     .blank();
         * isNameBlank.test(new Account(Name = ' ')); // true
         */
        public virtual Predicate blank() {
            return negate ? new BlankPredicate(mapper).negate() : new BlankPredicate(mapper);
        }

        /**
         * @description Creates a predicate that checks if the mapped string value is empty.
         *
         * @return a predicate that returns true if the mapped string value is empty
         *
         * @example
         * IPredicate isNameEmpty = new SObjectStringPredicateProvider()
         *     .is(Account.Name)
         *     .empty();
         * isNameEmpty.test(new Account(Name = '')); // true
         */
        public virtual Predicate empty() {
            return negate ? new EmptyPredicate(mapper).negate() : new EmptyPredicate(mapper);
        }

        /**
         * @description Creates a predicate that checks if the mapped string value contains the specified value,
         * respecting case.
         *
         * @param value the string value to check for
         *
         * @return a predicate that returns true if the mapped string value contains the specified value
         *
         * @throws NullPointerException if `value` is null
         *
         * @example
         * IPredicate isNameContainingJohn = new SObjectStringPredicateProvider()
         *     .is(Account.Name)
         *     .containing('John');
         * isNameContainingJohn.test(new Account(Name = 'John Doe')); // true
         */
        public virtual Predicate containing(final String value) {
            return negate ? new ContainsPredicate(mapper, value).negate() : new ContainsPredicate(mapper, value);
        }

        /**
         * @description Creates a predicate that checks if the mapped string value contains the specified value,
         * ignoring case.
         *
         * @param value the string value to check for, ignoring case
         *
         * @return a predicate that returns true if the mapped string value contains the specified value, ignoring case
         *
         * @throws NullPointerException if `value` is null
         *
         * @example
         * IPredicate isNameContainingJohnIgnoreCase = new SObjectStringPredicateProvider()
         *     .is(Account.Name)
         *     .iContaining('john');
         * isNameContainingJohnIgnoreCase.test(new Account(Name = 'JOHN DOE')); // true
         */
        public virtual Predicate iContaining(final String value) {
            return negate ? new IContainsPredicate(mapper, value).negate() : new IContainsPredicate(mapper, value);
        }

        /**
         * @description Creates a predicate that checks if the mapped string value starts with the specified value,
         * respecting case.
         *
         * @param value the string value to check for at the start
         *
         * @return a predicate that returns true if the mapped string value starts with the specified value
         *
         * @throws NullPointerException if `value` is null
         *
         * @example
         * IPredicate isNameStartingWithJohn = new SObjectStringPredicateProvider()
         *     .is(Account.Name)
         *     .startingWith('John');
         * isNameStartingWithJohn.test(new Account(Name = 'John Doe')); // true
         */
        public virtual Predicate startingWith(final String value) {
            return negate ? new StartsWithPredicate(mapper, value).negate() : new StartsWithPredicate(mapper, value);
        }

        /**
         * @description Creates a predicate that checks if the mapped string value starts with the specified value,
         * ignoring case.
         *
         * @param value the string value to check for at the start, ignoring case
         *
         * @return a predicate that returns true if the mapped string value starts with the specified value,
         * ignoring case
         *
         * @throws NullPointerException if `value` is null
         *
         * @example
         * IPredicate isNameStartingWithJohnIgnoreCase = new SObjectStringPredicateProvider()
         *     .is(Account.Name)
         *     .iStartingWith('john');
         * isNameStartingWithJohnIgnoreCase.test(new Account(Name = 'JOHN DOE')); // true
         */
        public virtual Predicate iStartingWith(final String value) {
            return negate ? new IStartsPredicate(mapper, value).negate() : new IStartsPredicate(mapper, value);
        }

        /**
         * @description Creates a predicate that checks if the mapped string value ends with the specified value,
         * respecting case.
         *
         * @param value the string value to check for at the end
         *
         * @return a predicate that returns true if the mapped string value ends with the specified value
         *
         * @throws NullPointerException if `value` is null
         *
         * @example
         * IPredicate isNameEndingWithDoe = new SObjectStringPredicateProvider()
         *     .is(Account.Name)
         *     .endingWith('Doe');
         * isNameEndingWithDoe.test(new Account(Name = 'John Doe')); // true
         */
        public virtual Predicate endingWith(final String value) {
            return negate ? new EndsWithPredicate(mapper, value).negate() : new EndsWithPredicate(mapper, value);
        }

        /**
         * @description Creates a predicate that checks if the mapped string value ends with the specified value,
         * ignoring case.
         *
         * @param value the string value to check for at the end, ignoring case
         *
         * @return a predicate that returns true if the mapped string value ends with the specified value,
         * ignoring case
         *
         * @throws NullPointerException if `value` is null
         *
         * @example
         * IPredicate isNameEndingWithDoeIgnoreCase = new SObjectStringPredicateProvider()
         *     .is(Account.Name)
         *     .iEndingWith('doe');
         * isNameEndingWithDoeIgnoreCase.test(new Account(Name = 'JOHN DOE')); // true
         */
        public virtual Predicate iEndingWith(final String value) {
            return negate ? new IEndsWithPredicate(mapper, value).negate() : new IEndsWithPredicate(mapper, value);
        }

        /**
         * @description Creates a predicate that checks if the mapped string value matches a given pattern (`LIKE`),
         * respecting case.
         *
         * @param pattern the pattern to match against
         *
         * @return a predicate that returns true if the mapped string value matches the pattern
         *
         * @throws NullPointerException if `pattern` is null
         *
         * @example
         * IPredicate isNameLikePattern = new SObjectStringPredicateProvider()
         *     .is(Account.Name)
         *     .likex('%Doe');
         * isNameLikePattern.test(new Account(Name = 'John Doe')); // true
         */
        public virtual Predicate likex(final String pattern) {
            return negate ? new LikePredicate(mapper, pattern, false).negate() : new LikePredicate(mapper, pattern, false);
        }

        /**
         * @description Creates a predicate that checks if the mapped string value matches a given pattern (`LIKE`),
         * ignoring case.
         *
         * @param pattern the pattern to match against
         *
         * @return a predicate that returns true if the mapped string value matches the pattern
         *
         * @throws NullPointerException if `pattern` is null
         *
         * @example
         * IPredicate isNameLikePattern = new SObjectStringPredicateProvider()
         *     .is(Account.Name)
         *     .iLike('%doe');
         * isNameLikePattern.test(new Account(Name = 'John Doe')); // true
         */
        public virtual Predicate iLike(final String pattern) {
            return negate ? new LikePredicate(mapper, pattern, true).negate() : new LikePredicate(mapper, pattern, true);
        }
    }

    private abstract class StringPredicate extends Predicate {
        protected final IFunction mapper;
        protected final String value;
        protected StringPredicate(IFunction mapper, String value) {
            Validate.notNull(value);
            this.mapper = mapper;
            this.value = value;
        }
    }

    private class BlankPredicate extends StringPredicate {
        private BlankPredicate(IFunction mapper) { super(mapper, ''); }
        public override Boolean test(Object o) { return String.isBlank((String) mapper.apply(o)); }
    }

    private class EmptyPredicate extends StringPredicate {
        private EmptyPredicate(IFunction mapper) { super(mapper, ''); }
        public override Boolean test(Object o) { return String.isEmpty((String) mapper.apply(o)); }
    }

    private class ContainsPredicate extends StringPredicate {
        private ContainsPredicate(IFunction mapper, String value) { super(mapper, value); }
        public override Boolean test(Object o) { return ((String) mapper.apply(o)).contains(value); }
    }

    private class IContainsPredicate extends StringPredicate {
        private IContainsPredicate(IFunction mapper, String value) { super(mapper, value); }
        public override Boolean test(Object o) { return ((String) mapper.apply(o)).containsIgnoreCase(value); }
    }

    private class StartsWithPredicate extends StringPredicate {
        private StartsWithPredicate(IFunction mapper, String value) { super(mapper, value); }
        public override Boolean test(Object o) { return ((String) mapper.apply(o)).startsWith(value); }
    }

    private class IStartsPredicate extends StringPredicate {
        private IStartsPredicate(IFunction mapper, String value) { super(mapper, value); }
        public override Boolean test(Object o) { return ((String) mapper.apply(o)).startsWithIgnoreCase(value); }
    }

    private class EndsWithPredicate extends StringPredicate {
        private EndsWithPredicate(IFunction mapper, String value) { super(mapper, value); }
        public override Boolean test(Object o) { return ((String) mapper.apply(o)).endsWith(value); }
    }

    private class IEndsWithPredicate extends StringPredicate {
        private IEndsWithPredicate(IFunction mapper, String value) { super(mapper, value); }
        public override Boolean test(Object o) { return ((String) mapper.apply(o)).endsWithIgnoreCase(value); }
    }

    private virtual class LikePredicate extends StringPredicate {
        protected LikePredicate(IFunction function, String likeString, Boolean ignoreCase) {
            super(
                function,
                (ignoreCase ? '(?i)' : '')
                + '^' + likeString.replaceAll('([^\\w%_ ])', '\\\\$1').replace('%', '.*?').replace('_', '.{1}?') + '$'
            );
        }
        public override Boolean test(Object o) { return Pattern.matches(value, (String) mapper.apply(o)); }
    }
}
