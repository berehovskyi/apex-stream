/**
 * @description Provides a fluent interface for building predicates that compare SObjects
 * using a comparer and currying. This builder allows you to create predicates for equality,
 * inequality, and relational comparisons with the ability to use fields, constants, or functions as comparands.
 *
 * @group Functional Built-In Classes V2
 *
 * @example
 * IPredicate isNameJohnPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
 *     .is(Account.Name)
 *     .eq()
 *     .val('John');
 * isNameJohnPredicate.test(new Account(Name = 'John')); // true
 */
public virtual inherited sharing class SObjectComparerPredicateProvider {
    protected final IComparer com;
    protected final ComparisonInterpreter interp;

    /**
     * @description Constructs an instance of `SObjectComparerPredicateProvider` with the provided comparer.
     *
     * @param comparer the comparer to be used for comparing SObject fields
     *
     * @throws NullPointerException if `comparer` is null
     *
     * @example
     * SObjectComparerPredicateProvider provider = new SObjectComparerPredicateProvider(Comparer.defaultOrder());
     */
    public SObjectComparerPredicateProvider(final IComparer comparer) {
        this(comparer, new ComparisonInterpreter());
    }

    /**
     * @description Constructs an instance of `SObjectComparerPredicateProvider` with the provided comparer
     * and interpreter.
     *
     * @param comparer the comparer to be used for comparing SObjects
     * @param interpreter the interpreter that defines the comparison operations
     *
     * @throws NullPointerException if `comparer` or `interpreter` is null
     */
    protected SObjectComparerPredicateProvider(final IComparer comparer, final ComparisonInterpreter interpreter) {
        Validate.notNull(comparer);
        Validate.notNull(interpreter);
        com = comparer;
        interp = interpreter;
    }

    /**
     * @description Creates a `ComparisonOperator` for comparing SObjects using the provided function,
     * with support for currying to build complex comparisons.
     *
     * @param left the function used to map an SObject to a comparable value
     *
     * @return a `ComparisonOperator` for further specification of the comparison operation
     *
     * @throws NullPointerException if `left` is null
     *
     * @example
     * IPredicate isRevenueGt1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
     *     .is(new SObjectFunctionProvider().get(Account.AnnualRevenue))
     *     .gt()
     *     .var(1000000);
     */
    public virtual ComparisonOperator is(final IFunction left) {
        return new ComparisonOperator(left, com, interp);
    }

    /**
     * @description Creates a `ComparisonOperator` using the identity function as the default mapper,
     * with support for currying to build complex comparisons.
     *
     * @return a `ComparisonOperator` for further specification of the comparison operation
     *
     * @example
     * IPredicate isEqJohnPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
     *     .is()
     *     .eq()
     *     .var(new Account(Name = 'John'));
     * isEqJohnPredicate.test(new Account(Name = 'John')); // true
     */
    public virtual ComparisonOperator is() {
        return is(Function.identity());
    }

    /**
     * @description Creates a `ComparisonOperator` for comparing SObjects using a constant value,
     * with support for currying to build complex comparisons.
     *
     * @param left the constant value to be used for comparison
     *
     * @return a `ComparisonOperator` for further specification of the comparison operation
     *
     * @example
     * IPredicate isRevenueLt1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
     *     .isVar(1000000)
     *     .gt()
     *     .val(Account.AnnualRevenue);
     * isRevenueLt1MPredicate.test(new Account(AnnualRevenue = 500000)); // true
     */
    public virtual ComparisonOperator isVar(final Object left) {
        return is(Function.constant(left));
    }

    /**
     * @description Creates a `ComparisonOperator` for comparing SObjects using the provided field name,
     * with support for currying to build complex comparisons.
     *
     * @param left the field name of the SObject to be used for mapping
     *
     * @return a `ComparisonOperator` for further specification of the comparison operation
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-reference navigation
     * @throws SObjectException if provided invalid `fieldName`
     *
     * @example
     * SObjectComparerPredicateProvider builder = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
     *
     * IPredicate isNameJohnPredicate = builder.is('Name').eq().var('John');
     * isNameJohnPredicate.test(new Account(Name = 'John')); // true
     *
     * IPredicate isRevenueGt1MPredicate = builder.is('AnnualRevenue').gt().var(1000000);
     * isRevenueGt1MPredicate.test(new Account(AnnualRevenue = 2000000)); // true
     * // safe navigation
     * builder.is('Parent?.Name').eq().var('John');
     */
    public virtual ComparisonOperator is(final String left) {
        return is(new SObjectFunctionProvider().get(left));
    }

    /**
     * @description Creates a `ComparisonOperator` for comparing SObjects using the provided SObjectField,
     * with support for currying to build complex comparisons.
     *
     * @param left the SObjectField to be used for mapping
     *
     * @return a `ComparisonOperator` for further specification of the comparison operation
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * IPredicate isRevenueGt1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
     *     .is(Account.AnnualRevenue)
     *     .gt()
     *     .var(1000000);
     * isRevenueGt1MPredicate.test(new Account(AnnualRevenue = 2000000)); // true
     */
    public virtual ComparisonOperator is(final SObjectField left) {
        return is(new SObjectFunctionProvider().get(left));
    }

    /**
     * @description Represents the operations available for comparing an SObjects with another value or field,
     * utilizing currying to support flexible and reusable comparisons.
     */
    public virtual class ComparisonOperator {
        protected final IFunction left;
        protected final IComparer comparer;
        protected final ComparisonInterpreter interpreter;
        protected ComparisonOperator(IFunction left, IComparer comparer, ComparisonInterpreter interpreter) {
            Validate.notNull(left);
            this.left = left;
            this.comparer = comparer;
            this.interpreter = interpreter;
        }

        /**
         * @description Specifies that the comparison should check for equality (`==`).
         *
         * @return a `RightComparand` for specifying the right-hand side of the comparison
         *
         * @example
         * IPredicate isNameJohnPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.Name)
         *     .eq()
         *     .var('John');
         * isNameJohnPredicate.test(new Account(Name = 'John')); // true
         */
        public virtual RightComparand eq() {
            return new RightComparand(left, comparer, interpreter.eq());
        }

        /**
         * @description Specifies that the comparison should check for inequality (`!=`).
         *
         * @return a `RightComparand` for specifying the right-hand side of the comparison
         *
         * @example
         * IPredicate isNameNotJohnPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.Name)
         *     .ne()
         *     .var('John');
         * isNameNotJohnPredicate.test(new Account(Name = 'Sam')); // true
         */
        public virtual RightComparand ne() {
            return new RightComparand(left, comparer, interpreter.ne());
        }

        /**
         * @description Specifies that the comparison should check if the left value is greater than (`>`)
         * the right value.
         *
         * @return a `RightComparand` for specifying the right-hand side of the comparison
         *
         * @example
         * IPredicate isRevenueGt1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.AnnualRevenue)
         *     .gt()
         *     .var(1000000);
         * isRevenueGt1MPredicate.test(new Account(AnnualRevenue = 2000000)); // true
         */
        public virtual RightComparand gt() {
            return new RightComparand(left, comparer, interpreter.gt());
        }

        /**
         * @description Specifies that the comparison should check if the left value is greater than or equal to (`>=`)
         * the right value.
         *
         * @return a `RightComparand` for specifying the right-hand side of the comparison
         *
         * @example
         * IPredicate isRevenueGte1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.AnnualRevenue)
         *     .ge()
         *     .var(1000000);
         * isRevenueGte1MPredicate.test(new Account(AnnualRevenue = 2000000)); // true
         * isRevenueGte1MPredicate.test(new Account(AnnualRevenue = 1000000)); // true
         * isRevenueGte1MPredicate.test(new Account(AnnualRevenue = 500000)); // false
         */
        public virtual RightComparand ge() {
            return new RightComparand(left, comparer, interpreter.ge());
        }

        /**
         * @description Specifies that the comparison should check if the left value is less than (`<`)
         * the right value.
         *
         * @return a `RightComparand` for specifying the right-hand side of the comparison
         *
         * @example
         * IPredicate isRevenueLt1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.AnnualRevenue)
         *     .lt()
         *     .var(1000000);
         * isRevenueLt1MPredicate.test(new Account(AnnualRevenue = 500000)); // true
         */
        public virtual RightComparand lt() {
            return new RightComparand(left, comparer, interpreter.lt());
        }

        /**
         * @description Specifies that the comparison should check if the left value is less than or equal to (`<=`)
         * the right value.
         *
         * @return a `RightComparand` for specifying the right-hand side of the comparison
         *
         * @example
         * IPredicate isRevenueLte1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.AnnualRevenue)
         *     .le()
         *     .var(1000000);
         * isRevenueLte1MPredicate.test(new Account(AnnualRevenue = 2000000)); // false
         * isRevenueLte1MPredicate.test(new Account(AnnualRevenue = 1000000)); // true
         * isRevenueLte1MPredicate.test(new Account(AnnualRevenue = 500000)); // true
         */
        public virtual RightComparand le() {
            return new RightComparand(left, comparer, interpreter.le());
        }

        /**
         * @description Creates a predicate that checks if the left value is equal to `null`.
         *
         * @return a predicate that returns true if the left value is `null`
         *
         * @example
         * IPredicate isNameNullPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.Name)
         *     .eqNull();
         * isNameNullPredicate.test(new Account()); // true
         * isNameNullPredicate.test(new Account(Name = 'Sam')); // false
         * IPredicate isNullPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is()
         *     .eqNull();
         * isNullPredicate.test(null); // true
         */
        public virtual Predicate eqNull() {
            return new ComparerPredicate(left, Function.constant(null), comparer, interpreter.eq());
        }

        /**
         * @description Creates a predicate that checks if the left value is not equal to `null`.
         *
         * @return a predicate that returns true if the left value is not `null`
         *
         * @example
         * IPredicate isNameNotNullPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.Name)
         *     .neNull();
         * isNameNotNullPredicate.test(new Account()); // false
         * isNameNotNullPredicate.test(new Account(Name = 'Sam')); // true
         * IPredicate isNotNullPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is()
         *     .neNull();
         * isNotNullPredicate.test(null); // false
         */
        public virtual Predicate neNull() {
            return new ComparerPredicate(left, Function.constant(null), comparer, interpreter.ne());
        }
    }

    /**
     * @description Represents the right-hand side of a comparison, allowing specification of the value
     * or field to compare against.
     */
    public virtual class RightComparand {
        protected final IFunction left;
        protected final IComparer comparer;
        protected final Set<Integer> results;
        protected RightComparand(IFunction left, IComparer comparer, Set<Integer> results) {
            Validate.notNull(results);
            this.left = left;
            this.comparer = comparer;
            this.results = results;
        }

        /**
         * @description Specifies a function to compare the left value against, creating a predicate
         * that evaluates the comparison.
         *
         * @param right the function that maps an SObject to a comparable value
         *
         * @return a predicate that returns true if the comparison holds for the specified function
         *
         * @throws NullPointerException if `right` is null
         *
         * @example
         * IPredicate isRevenueGtCfPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.AnnualRevenue)
         *     .gt()
         *     .val(new SObjectFunctionProvider().get('CustomField__c'));
         * isRevenueGtCfPredicate.test(new Account(AnnualRevenue = 1000000, CustomField__c = 500000)); // true
         */
        public virtual Predicate val(final IFunction right) {
            return new ComparerPredicate(left, right, comparer, results);
        }

        /**
         * @description Specifies that the left value should be compared against itself,
         * creating a predicate that evaluates this comparison.
         *
         * @return a predicate that returns true if the comparison holds for the left value
         *
         * @example
         * IPredicate isEqPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(new Account(AnnualRevenue = 1000000))
         *     .eq()
         *     .val();
         * isEqPredicate.test(new Account(AnnualRevenue = 1000000)); // true
         */
        public virtual Predicate val() {
            return val(Function.identity());
        }

        /**
         * @description Specifies a constant value to compare the left value against, creating a predicate
         * that evaluates the comparison.
         *
         * @param right the constant value to compare against
         *
         * @return a predicate that returns true if the comparison holds for the specified constant
         *
         * @throws NullPointerException if `right` is null
         *
         * @example
         * IPredicate isRevenueGt1MPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.AnnualRevenue)
         *     .gt()
         *     .var(1000000);
         * isRevenueGt1MPredicate.test(new Account(AnnualRevenue = 2000000)); // true
         */
        public virtual Predicate var(final Object right) {
            return val(Function.constant(right));
        }

        /**
         * @description Specifies a field name to compare the left value against, creating a predicate
         * that evaluates the comparison.
         *
         * @param right the field name to compare against
         *
         * @return a predicate that returns true if the comparison holds for the specified field name
         *
         * @throws IllegalArgumentException if `right` is blank
         * @throws NullPointerException if `right` is null
         * @throws SObjectException if provided invalid `right`
         *
         * @example
         * IPredicate isRevenueGtCfPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.AnnualRevenue)
         *     .gt()
         *     .val('CustomField__c');
         * isRevenueGtCfPredicate.test(new Account(AnnualRevenue = 1000000, CustomField__c = 500000)); // true
         * // safe navigation
         * IPredicate isRevenueGtParentRevenuePredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.AnnualRevenue)
         *     .gt()
         *     .val('Parent?.AnnualRevenue');
         * isRevenueGtParentRevenuePredicate.test(
         *     new Account(AnnualRevenue = 1000000, Parent = new Account(AnnualRevenue = 500000))
         * ); // true
         */
        public virtual Predicate val(final String right) {
            return val(new SObjectFunctionProvider().get(right));
        }

        /**
         * @description Specifies an SObjectField to compare the left value against, creating a predicate
         * that evaluates the comparison.
         *
         * @param right the SObjectField to compare against
         *
         * @return a predicate that returns true if the comparison holds for the specified SObjectField
         *
         * @throws NullPointerException if `right` is null
         *
         * @example
         * IPredicate isRevenueGtCfPredicate = new SObjectComparerPredicateProvider(Comparer.defaultOrder())
         *     .is(Account.AnnualRevenue)
         *     .gt()
         *     .val(Account.CustomField__c);
         * isRevenueGtCfPredicate.test(new Account(AnnualRevenue = 1000000, CustomField__c = 500000)); // true
         */
        public virtual Predicate val(final SObjectField right) {
            return val(new SObjectFunctionProvider().get(right));
        }
    }

    private class ComparerPredicate extends Predicate {
        private final IFunction left;
        private final IFunction right;
        private final IComparer comparer;
        private final Set<Integer> results;
        @SuppressWarnings('PMD.ExcessiveParameterList')
        private ComparerPredicate(IFunction left, IFunction right, IComparer comparer, Set<Integer> results) {
            Validate.notNull(right);
            this.left = left;
            this.right = right;
            this.comparer = comparer;
            this.results = results;
        }
        public override Boolean test(Object o) {
            return results.contains(comparer.compare(left.apply(o), right.apply(o)));
        }
    }
}
