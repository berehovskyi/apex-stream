/**
 * @description Provides a fluent interface for building predicates
 * that uses a non-antisymmetric comparer for SObject comparisons.
 * <p><strong>Note: </strong></p>
 * <p>Predicates built with this builder may return `false` when comparing a non-null value with a null value,
 * aligning with Apex's native behavior for certain comparison operations.</p>
 * <p>If compared values are strings or ids, a non-null value is always greater than a null value.</p>
 *
 * @see Comparer
 * @see SObjectComparerPredicateProvider
 *
 * @group Functional Built-In Classes V2
 *
 * @example
 * IPredicate isRevenueLt10KPredicate = new SObjectApexComparerPredicateProvider()
 *     .is(Account.AnnualRevenue)
 *     .lt()
 *     .var(10000);
 * isRevenueLt10KPredicate.test(new Account(AnnualRevenue = 5000)); // true
 * isRevenueLt10KPredicate.test(new Account(AnnualRevenue = null)); // false
 */
public virtual inherited sharing class SObjectApexComparerPredicateProvider
    extends SObjectComparerPredicateProvider {
    /**
     * @description Creates a new instance of `SObjectApexComparerPredicateProvider` using
     * the non-antisymmetric comparer.
     */
    public SObjectApexComparerPredicateProvider() {
        super(Comparer.nonAntisymmetricOrder(), new ComparisonInterpreter.NonAntisymmetric());
    }
}
