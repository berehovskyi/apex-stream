/**
 * @description Provides a fluent interface for building predicates
 * that operate on iterable collections using currying.
 * This builder allows you to create predicates for checking if an object is in or not in a given collection,
 * as well as if a string is included in or excluded from a iterable of strings.
 *
 * @example
 * IPredicate isNameInPredicate = new SObjectIterablePredicateProvider()
 *     .is(Account.Name)
 *     .inx(new List<String>{ 'John', 'Jane' });
 * isNameInPredicate.test(new Account(Name = 'John')); // true
 */
public virtual inherited sharing class SObjectIterablePredicateProvider {
    /**
     * @description Creates an instance of `SObjectIterablePredicate` using the provided mapping function.
     *
     * @param mapper the function used to map an SObject to a comparable value
     *
     * @return the `SObjectIterablePredicate`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * IPredicate isNameInPredicate = new SObjectIterablePredicateProvider()
     *     .is(new SObjectFunctionProvider().get(Account.Name))
     *     .inx(new List<String>{ 'John', 'Jane' });
     * isNameInPredicate.test(new Account(Name = 'John')); // true
     */
    public virtual SObjectIterableOperator is(final IFunction mapper) {
        return new SObjectIterableOperator(mapper);
    }

    /**
     * @description Creates an instance of `SObjectIterablePredicate` using the identity function
     * as the default mapper.
     *
     * @return the `SObjectIterablePredicate`
     *
     * @example
     * IPredicate isAccountInPredicate = new SObjectIterablePredicateProvider()
     *     .is()
     *     .inx(new List<Account>{ new Account(Name = 'John'), new Account(Name = 'Jane') });
     * isAccountInPredicate.test(new Account(Name = 'John')); // true
     */
    public virtual SObjectIterableOperator is() {
        return is(Function.identity());
    }

    /**
     * @description Creates an instance of `SObjectIterableOperator` using the provided field name.
     *
     * @param fieldName the field name of the SObject to be used for mapping
     *
     * @return the `SObjectIterableOperator`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-
     * reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * IPredicate isNameInPredicate = new SObjectIterablePredicateProvider()
     *     .is('Name')
     *     .inx(new List<String>{ 'John', 'Jane' });
     * isNameInPredicate.test(new Account(Name = 'John')); // true
     * // safe navigation
     * new SObjectIterablePredicateProvider().is('Parent?.Name').inx(new List<String>{ 'Sam', 'Frank' });
     */
    public virtual SObjectIterableOperator is(final String fieldName) {
        return is(new SObjectFunctionProvider().get(fieldName));
    }

    /**
     * @description Creates an instance of `SObjectIterableOperator` using the provided SObjectField.
     *
     * @param field the SObjectField to be used for mapping
     *
     * @return the `SObjectIterableOperator`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * IPredicate isNameInPredicate = new SObjectIterablePredicateProvider()
     *     .is(Account.Name)
     *     .inx(new List<String>{ 'John', 'Jane' });
     * isNameInPredicate.test(new Account(Name = 'John')); // true
     */
    public virtual SObjectIterableOperator is(final SObjectField field) {
        return is(new SObjectFunctionProvider().get(field));
    }

    /**
     * @description Represents predicate operations on iterables, utilizing currying to build complex conditions.
     */
    public virtual class SObjectIterableOperator {
        protected final IFunction mapper;
        protected SObjectIterableOperator(final IFunction mapper) {
            Validate.notNull(mapper);
            this.mapper = mapper;
        }

        /**
         * @description Creates a predicate that checks if the mapped value is `IN` the provided container.
         *
         * @param container an iterable of objects to check against
         *
         * @return a predicate that returns true if the mapped value is in the container
         *
         * @throws NullPointerException if `container` is null
         *
         * @example
         * IPredicate inPredicate = new SObjectIterablePredicateProvider()
         *     .is(Account.Name)
         *     .inx(new List<String>{ 'John', 'Jane' });
         * inPredicate.test(new Account(Name = 'John')); // true
         */
        public virtual Predicate inx(final Iterable<Object> container) {
            return new ContainsPredicate(mapper, container);
        }

        /**
         * @description Creates a predicate that checks if the mapped value is `NOT IN` the provided container.
         *
         * @param container an iterable of objects to check against
         *
         * @return a predicate that returns true if the mapped value is not in the container
         *
         * @throws NullPointerException if `container` is null
         *
         * @example
         * IPredicate notInPredicate = new SObjectIterablePredicateProvider()
         *     .is(Account.Name)
         *     .nin(new List<String>{ 'John', 'Jane' });
         * notInPredicate.test(new Account(Name = 'Doe')); // true
         */
        public virtual Predicate nin(final Iterable<Object> container) {
            return inx(container).negate();
        }

        /**
         * @description Creates a predicate that checks if the mapped string value `INCLUDES` any
         * of the strings in the provided container.
         *
         * @param container an iterable of strings to check against
         *
         * @return a predicate that returns true if the mapped string value includes any of the strings in the container
         *
         * @throws NullPointerException if `container` is null or `container` contains null element
         *
         * @example
         * SObjectIterablePredicateProvider builder = new SObjectIterablePredicateProvider();
         *
         * Account acc = new Account(Name = 'AAA;BBB');
         * builder.is(Account.Name).inc(new List<String>{ 'AAA' }).test(acc); // true
         * builder.is(Account.Name).inc(new Set<String>{ 'AAA;BBB' }).test(acc); // true
         * builder.is(Account.Name).inc(new Set<String>{ 'BBB;CCC' }).test(acc); // false
         * builder.is('Name').inc(new Set<String>{ 'AAA;CCC', 'BBB' }).test(acc); // true
         * builder.is('Name').inc(new List<String>{ 'AAA;BBB;CCC' }).test(acc); // false
         * // safe navigation
         * builder.is('Parent?.Name').inc(new List<String>{ 'AAA' });
         */
        public virtual Predicate inc(final Iterable<String> container) {
            return new IncludesPredicate(mapper, container);
        }

        /**
         * @description Creates a predicate that checks if the mapped string value does not include (`EXCLUDES`) any
         * of the strings in the provided container.
         *
         * @param container an iterable collection of strings to check against
         *
         * @return a predicate that returns true if the mapped string value does not include any
         * of the strings in the container
         *
         * @throws NullPointerException if `container` is null or `container` contains null element
         *
         * @example
         * SObjectIterablePredicateProvider builder = new SObjectIterablePredicateProvider();
         *
         * Account acc = new Account(Name = 'AAA;BBB');
         * builder.is(Account.Name).exc(new List<String>{ 'AAA' }).test(acc); // false
         * builder.is(Account.Name).exc(new Set<String>{ 'AAA;BBB' }).test(acc); // false
         * builder.is(Account.Name).exc(new Set<String>{ 'BBB;CCC' }).test(acc); // true
         * builder.is('Name').exc(new Set<String>{ 'AAA;CCC', 'BBB' }).test(acc); // false
         * builder.is('Name').exc(new List<String>{ 'AAA;BBB;CCC' }).test(acc); // true
         * // safe navigation
         * builder.is('Parent?.Name').exc(new List<String>{ 'AAA' });
         */
        public virtual Predicate exc(final Iterable<String> container) {
            return inc(container).negate();
        }
    }

    private abstract class IterablePredicate extends Predicate {
        protected final IFunction mapper;
        protected final Iterable<Object> container;
        protected Set<Object> elements;
        protected IterablePredicate(IFunction mapper, Iterable<Object> container) {
            Validate.notNull(container);
            this.mapper = mapper;
            this.container = container;
        }
        protected Set<Object> toSet(Iterable<Object> source) {
            final Set<Object> dest = new Set<Object>();
            for (Object o : source) {
                dest.add(o);
            }
            return dest;
        }
    }

    private class ContainsPredicate extends IterablePredicate {
        private ContainsPredicate(IFunction mapper, Iterable<Object> container) { super(mapper, container); }
        public override Boolean test(Object o) {
            if (elements == null) { elements = toSet(container); }
            return elements.contains(mapper.apply(o));
        }
    }

    private class IncludesPredicate extends IterablePredicate {
        private IncludesPredicate(IFunction mapper, Iterable<String> container) { super(mapper, container); }
        public override Boolean test(Object o) {
            final String value = (String) mapper.apply(o);
            if (value == null) { return false; }
            final Set<String> values = split(value.trim());
            if (elements == null) { elements = toSet(container); }
            for (Object element : elements) {
                Validate.notNull(element);
                if (values.containsAll(split((String) element))) { return true; }
            }
            return false;
        }
        private Set<String> split(String value) { return new Set<String>(value.split(';')); }
    }
}
