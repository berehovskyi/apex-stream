/**
 * @description Provides a fluent interface for building bi-predicates that compare two SObjects
 * using a comparer and currying. This builder allows you to create bi-predicates for equality,
 * inequality, and relational comparisons between two SObjects with the ability to use fields, constants,
 * or functions as comparands.
 *
 * @example
 * IBiPredicate areNamesEqBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
 *     .isL(Account.Name)
 *     .eq()
 *     .rVal('Name');
 * areNamesEqBiPredicate.test(new Account(Name = 'John'), new Account(Name = 'John')); // true
 */
public virtual inherited sharing class SObjectComparerBiPredicateProvider {
    protected final IComparer com;
    protected final ComparisonInterpreter interp;

    /**
     * @description Constructs an instance of `SObjectComparerBiPredicateProvider` with the provided comparer.
     *
     * @param comparer the comparer to be used for comparing SObject fields
     *
     * @throws NullPointerException if `comparer` is null
     *
     * @example
     * SObjectComparerBiPredicateProvider provider = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder());
     */
    public SObjectComparerBiPredicateProvider(final IComparer comparer) {
        this(comparer, new ComparisonInterpreter());
    }

    /**
     * @description Constructs an instance of `SObjectComparerBiPredicateProvider` with the provided comparer
     * and interpreter.
     *
     * @param comparer the comparer to be used for comparing SObjects
     * @param interpreter the interpreter that defines the comparison operations
     *
     * @throws NullPointerException if `comparer` or `interpreter` is null
     */
    protected SObjectComparerBiPredicateProvider(final IComparer comparer, final ComparisonInterpreter interpreter) {
        Validate.notNull(comparer);
        Validate.notNull(interpreter);
        com = comparer;
        interp = interpreter;
    }

    /**
     * @description Creates a `ComparisonOperator` for comparing the left value of two SObjects using
     * the provided function, with support for currying to build complex comparisons.
     *
     * @param left the function used to map the left SObject to a comparable value
     *
     * @return a `ComparisonOperator` for further specification of the comparison operation
     *
     * @throws NullPointerException if `left` is null
     *
     * @example
     * IBiPredicate areRevenuesEqBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
     *     .isL(new SObjectFunctionProvider().get(Account.AnnualRevenue))
     *     .eq()
     *     .rVal(new SObjectFunctionProvider().get(Account.AnnualRevenue));
     * areRevenuesEqBiPredicate.test(
     *     new Account(AnnualRevenue = 1000000),
     *     new Account(AnnualRevenue = 1000000)
     * ); // true
     */
    public virtual ComparisonOperator isL(final IFunction left) {
        return new ComparisonOperator(left, com, interp);
    }

    /**
     * @description Creates a `ComparisonOperator` using the identity function as the default mapper
     * for the left SObject, with support for currying to build complex comparisons.
     *
     * @return a `ComparisonOperator` for further specification of the comparison operation
     *
     * @example
     * IBiPredicate areEqAccountsBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
     *     .isL()
     *     .eq()
     *     .rVal();
     * areEqAccountsBiPredicate.test(
     *     new Account(Id = '001000000000000AAA'),
     *     new Account(Id = '001000000000000AAA')
     * ); // true
     */
    public virtual ComparisonOperator isL() {
        return isL(Function.identity());
    }

    /**
    * @description Creates a `ComparisonOperator` for comparing the left value of two SObjects using a constant value,
    * with support for currying to build complex comparisons.
    *
    * @param left the constant value to be used for comparison
    *
    * @return a `ComparisonOperator` for further specification of the comparison operation
    *
    * @example
    * IBiPredicate isRightRevenueLt1MBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
    *     .isLVar(1000000)
    *     .gt()
    *     .rVal('AnnualRevenue');
    * isRightRevenueLt1MBiPredicate.test(
    *     new Account(),
    *     new Account(AnnualRevenue = 500000)
    * ); // true
    */
    public virtual ComparisonOperator isLVar(final Object left) {
        return isL(Function.constant(left));
    }

    /**
     * @description Creates a `ComparisonOperator` for comparing the left value of two SObjects
     * using the provided field name, with support for currying to build complex comparisons.
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
     * IBiPredicate areNamesEqBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
     *     .isL('Name')
     *     .eq()
     *     .rVal('Name');
     * areNamesEqBiPredicate.test(new Account(Name = 'John'), new Account(Name = 'John')); // true
     * // safe navigation
     * new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
     *     .isL('Parent?.Name')
     *     .eq()
     *     .rVal('Parent?.Name');
     */
    public virtual ComparisonOperator isL(final String left) {
        return isL(new SObjectFunctionProvider().get(left));
    }

    /**
     * @description Creates a `ComparisonOperator` for comparing the left value of two SObjects
     * using the provided SObjectField, with support for currying to build complex comparisons.
     *
     * @param left the SObjectField to be used for mapping
     *
     * @return a `ComparisonOperator` for further specification of the comparison operation
     *
     * @throws NullPointerException if `left` is null
     *
     * @example
     * IBiPredicate areNamesEqPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
     *     .isL(Account.Name)
     *     .eq()
     *     .rVal(Account.Name);
     * areNamesEqPredicate.test(new Account(Name = 'John'), new Account(Name = 'John')); // true
     */
    public virtual ComparisonOperator isL(final SObjectField left) {
        return isL(new SObjectFunctionProvider().get(left));
    }

    /**
     * @description Creates a `BiPredicate` that checks if the left and right SObject values are equal.
     *
     * @return a `BiPredicate` that returns true if the left and right values are equal
     *
     * @example
     * IBiPredicate areEqAccountsBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
     *     .areEq();
     * areEqAccountsBiPredicate.test(
     *     new Account(Name = 'John'),
     *     new Account(Name = 'John')
     * ); // true
     */
    public virtual BiPredicate areEq() {
        return isL().eq().rVal();
    }

    /**
     * @description Creates a `BiPredicate` that checks if the left and right SObject values are not equal.
     *
     * @return a `BiPredicate` that returns true if the left and right values are not equal
     *
     * @example
     * IBiPredicate areNeAccountsBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
     *     .areNe();
     * areNeAccountsBiPredicate.test(
     *     new Account(Name = 'John'),
     *     new Account(Name = 'Jane')
     * ); // true
     */
    public virtual BiPredicate areNe() {
        return isL().ne().rVal();
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
         * IBiPredicate areNamesEqBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
         *     .isL(Account.Name)
         *     .eq()
         *     .rVal(Account.Name);
         * areNamesEqBiPredicate.test(new Account(Name = 'John'), new Account(Name = 'John')); // true
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
         * IBiPredicate areNamesNeBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
         *     .isL(Account.Name)
         *     .ne()
         *     .rVal(Account.Name);
         * areNamesNeBiPredicate.test(new Account(Name = 'John'), new Account(Name = 'Jane')); // true
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
         * IBiPredicate isLeftRevenueGtRightBiPredicate
         *     = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
         *         .isL(Account.AnnualRevenue)
         *         .gt()
         *         .rVal(Account.AnnualRevenue);
         * isLeftRevenueGtRightBiPredicate.test(
         *     new Account(AnnualRevenue = 2000000),
         *     new Account(AnnualRevenue = 1000000)
         * ); // true
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
         * IBiPredicate isLeftRevenueGteRightBiPred = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
         *     .isL(Account.AnnualRevenue)
         *     .ge()
         *     .rVal(Account.AnnualRevenue);
         * isLeftRevenueGteRightBiPred.test(
         *     new Account(AnnualRevenue = 1000000),
         *     new Account(AnnualRevenue = 1000000)
         * ); // true
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
         * IBiPredicate isLeftRevenueLtRightBiPredicate
         *     = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
         *         .isL(Account.AnnualRevenue)
         *         .lt()
         *         .rVal(Account.AnnualRevenue);
         * isLeftRevenueLtRightBiPredicate.test(
         *     new Account(AnnualRevenue = 500000),
         *     new Account(AnnualRevenue = 1000000)
         * ); // true
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
         * IBiPredicate isLeftRevenueLteRightBiPred = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
         *     .isL(Account.AnnualRevenue)
         *     .le()
         *     .rVal(Account.AnnualRevenue);
         * isLeftRevenueLteRightBiPred.test(
         *     new Account(AnnualRevenue = 1000000),
         *     new Account(AnnualRevenue = 1000000)
         * ); // true
         */
        public virtual RightComparand le() {
            return new RightComparand(left, comparer, interpreter.le());
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
         * @description Specifies a function to compare the left value against, creating a `BiPredicate`
         * that evaluates the comparison between two SObjects.
         *
         * @param right the function that maps the right SObject to a comparable value
         *
         * @return a `BiPredicate` that returns true if the comparison holds for the specified function
         *
         * @throws NullPointerException if `right` is null
         *
         * @example
         * IBiPredicate areRevenuesEqBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
         *     .isL(Account.AnnualRevenue)
         *     .eq()
         *     .rVal(new SObjectFunctionProvider().get(Account.AnnualRevenue));
         * areRevenuesEqBiPredicate.test(
         *     new Account(AnnualRevenue = 1000000),
         *     new Account(AnnualRevenue = 1000000)
         * ); // true
         */
        public virtual BiPredicate rVal(final IFunction right) {
            return new ComparerBiPredicate(left, right, comparer, results);
        }

        /**
         * @description Specifies that the left value should be compared against itself,
         * creating a `BiPredicate` that evaluates this comparison.
         *
         * @return a `BiPredicate` that returns true if the comparison holds for the left value
         *
         * @example
         * IBiPredicate areAccountsEqBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
         *     .isL()
         *     .eq()
         *     .rVal();
         * areAccountsEqBiPredicate.test(
         *     new Account(Id = '001000000000000AAA'),
         *     new Account(Id = '001000000000000AAA')
         * ); // true
         */
        public virtual BiPredicate rVal() {
            return rVal(Function.identity());
        }

        /**
         * @description Specifies a constant value to compare the left value against, creating a `BiPredicate`
         * that evaluates the comparison.
         *
         * @param right the constant value to compare against
         *
         * @return a `BiPredicate` that returns true if the comparison holds for the specified constant
         *
         * @throws NullPointerException if `right` is null
         *
         * @example
         * IBiPredicate isLeftRevenueGt1MBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
         *     .isL('AnnualRevenue')
         *     .gt()
         *     .rVar(1000000);
         * isLeftRevenueGt1MBiPredicate.test(
         *     new Account(AnnualRevenue = 1500000),
         *     new Account()
         * ); // true
         */
        public virtual BiPredicate rVar(final Object right) {
            return rVal(Function.constant(right));
        }

        /**
         * @description Specifies a field name to compare the left value against, creating a `BiPredicate`
         * that evaluates the comparison.
         *
         * @param right the field name to compare against
         *
         * @return a `BiPredicate` that returns true if the comparison holds for the specified field name
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         * @throws NullPointerException if `NullPointerException` occurs during unsafe cross-reference navigation
         * @throws SObjectException if provided invalid `fieldName`
         *
         * @example
         * IBiPredicate isRevenueGtCfBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
         *     .isL(Account.AnnualRevenue)
         *     .gt()
         *     .rVal('CustomField__c');
         * isRevenueGtCfBiPredicate.test(
         *     new Account(AnnualRevenue = 1000000),
         *     new Account(CustomField__c = 500000)
         * ); // true
         * // safe navigation
         * IBiPredicate isRevenueGtParentRevenueBiPred = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
         *     .isL(Account.AnnualRevenue)
         *     .gt()
         *     .rVal('Parent?.AnnualRevenue');
         * isRevenueGtParentRevenueBiPred.test(
         *     new Account(AnnualRevenue = 1000000),
         *     new Account(Parent = new Account(AnnualRevenue = 500000))
         * ); // true
         */
        public virtual BiPredicate rVal(final String right) {
            return rVal(new SObjectFunctionProvider().get(right));
        }

        /**
         * @description Specifies an SObjectField to compare the left value against, creating a `BiPredicate`
         * that evaluates the comparison.
         *
         * @param right the SObjectField to compare against
         *
         * @return a `BiPredicate` that returns true if the comparison holds for the specified SObjectField
         *
         * @throws NullPointerException if `right` is null
         *
         * @example
         * IBiPredicate isRevenueGtCfBiPredicate = new SObjectComparerBiPredicateProvider(Comparer.defaultOrder())
         *     .isL(Account.AnnualRevenue)
         *     .gt()
         *     .rVal(Account.CustomField__c);
         * isRevenueGtCfBiPredicate.test(
         *     new Account(AnnualRevenue = 1000000),
         *     new Account(CustomField__c = 500000)
         * ); // true
         */
        public virtual BiPredicate rVal(final SObjectField right) {
            return rVal(new SObjectFunctionProvider().get(right));
        }
    }

    private class ComparerBiPredicate extends BiPredicate {
        private final IFunction left;
        private final IFunction right;
        private final IComparer comparer;
        private final Set<Integer> results;
        @SuppressWarnings('PMD.ExcessiveParameterList')
        private ComparerBiPredicate(IFunction left, IFunction right, IComparer comparer, Set<Integer> results) {
            Validate.notNull(left);
            Validate.notNull(right);
            Validate.notNull(comparer);
            Validate.notNull(results);
            this.left = left;
            this.right = right;
            this.comparer = comparer;
            this.results = results;
        }
        public override Boolean test(Object o1, Object o2) {
            return results.contains(comparer.compare(left.apply(o1), right.apply(o2)));
        }
    }
}
