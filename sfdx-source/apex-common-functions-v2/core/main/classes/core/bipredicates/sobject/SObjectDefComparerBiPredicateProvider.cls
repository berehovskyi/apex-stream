/**
 * @description Provides a fluent interface for building bi-predicates
 * that uses the default comparer for comparing two SObjects.
 * <p><strong>Note: </strong></p>
 * <p>Bi-predicates built with this builder consider a non-null value as always greater than a null value.</p>
 *
 * @example
 * IBiPredicate isLeftRevenueLtRightBiPredicate = new SObjectDefComparerBiPredicateProvider()
 *     .isL(Account.AnnualRevenue)
 *     .lt()
 *     .rVal(Account.AnnualRevenue);
 * isLeftRevenueLtRightBiPredicate.test(
 *     new Account(AnnualRevenue = 5000),
 *     new Account(AnnualRevenue = 10000)
 * ); // true
 * isLeftRevenueLtRightBiPredicate.test(
 *     new Account(AnnualRevenue = 5000),
 *     new Account(AnnualRevenue = null)
 * ); // true
 */
public virtual inherited sharing class SObjectDefComparerBiPredicateProvider
    extends SObjectComparerBiPredicateProvider {
    /**
     * @description Creates a new instance of `SObjectDefComparerBiPredicateProvider` using
     * the default comparer.
     */
    public SObjectDefComparerBiPredicateProvider() {
        super(Comparer.defaultOrder());
    }
}
