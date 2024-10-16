/**
 * @description Provides a fluent interface for building predicates
 * that uses the default comparer for SObject comparisons.
 * <p><strong>Note: </strong></p>
 * <p>Predicates built with this builder consider a non-null value as always greater than a null value.</p>
 *
 * @see SObjectComparerPredicateProvider
 * @see Comparer
 *
 * @group Functional Built-In Classes V2
 *
 * @example
 * IPredicate isRevenueLt10KPredicate = new SObjectDefaultComparerPredicateProvider()
 *     .is(Account.AnnualRevenue)
 *     .lt()
 *     .var(10000);
 * isRevenueLt10KPredicate.test(new Account(AnnualRevenue = 5000)); // true
 * isRevenueLt10KPredicate.test(new Account(AnnualRevenue = null)); // true
 */
public virtual inherited sharing class SObjectDefaultComparerPredicateProvider
    extends SObjectComparerPredicateProvider {
    /**
     * @description Creates a new instance of `SObjectDefaultComparerPredicateProvider` using
     * the default comparer.
     */
    public SObjectDefaultComparerPredicateProvider() {
        super(Comparer.defaultOrder());
    }
}
