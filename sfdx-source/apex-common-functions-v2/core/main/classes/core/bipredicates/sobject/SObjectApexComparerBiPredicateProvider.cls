/**
 * @description Provides a fluent interface for building bi-predicates
 * that uses a non-antisymmetric comparer for comparing two SObjects.
 * <p><strong>Note: </strong></p>
 * <p>Bi-predicates built with this builder may return `false` when comparing a non-null value with a null value,
 * aligning with Apex's native behavior for certain comparison operations.</p>
 * <p>If compared values are strings or ids, a non-null value is always greater than a null value.</p>
 *
 * @example
 * IBiPredicate areRevenuesLtBiPredicate = new SObjectApexComparerBiPredicateProvider()
 *     .isL(Account.AnnualRevenue)
 *     .lt()
 *     .rVal(Account.AnnualRevenue);
 * areRevenuesLtBiPredicate.test(
 *     new Account(AnnualRevenue = 5000),
 *     new Account(AnnualRevenue = 10000)
 * ); // true
 * areRevenuesLtBiPredicate.test(
 *     new Account(AnnualRevenue = 5000),
 *     new Account(AnnualRevenue = null)
 * ); // false
 */
public virtual inherited sharing class SObjectApexComparerBiPredicateProvider
    extends SObjectComparerBiPredicateProvider {
    /**
     * @description Creates a new instance of `SObjectApexComparerBiPredicateProvider` using
     * the non-antisymmetric comparer.
     */
    public SObjectApexComparerBiPredicateProvider() {
        super(Comparer.nonAntisymmetricOrder(), new ComparisonInterpreter.NonAntisymmetric());
    }
}
