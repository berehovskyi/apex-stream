/**
 * @description `CollectorProvider` for `SObject` instances.
 *
 * @see CollectorProvider
 *
 * @group Functional Built-In Classes V2
 *
 * @example
 * List<Account> accounts = new List<Account>{
 *     new Account(Name = 'John Doe', AnnualRevenue = 1000000, Industry = 'Technology', BillingCity = 'Los Angeles'),
 *     new Account(Name = 'Jane Smith', AnnualRevenue = 2000000, Industry = 'Finance', BillingCity = 'New York'),
 *     new Account(Name = 'Judy Roe', AnnualRevenue = 3000000, Industry = 'Healthcare', BillingCity = 'Los Angeles'),
 *     new Account(Name = 'Jack Amber', AnnualRevenue = 4000000, Industry = 'Healthcare', BillingCity = 'New York'),
 *     new Account(Name = 'Jill Black', AnnualRevenue = 5000000, Industry = 'Technology', BillingCity = 'Los Angeles')
 * };
 * CollectorProvider builder = new SObjectCollectorProvider();
 * // Accumulate names into a List
 * ICollector nameToListCollector = builder
 *     .toList()
 *     .of(String.class)
 *     .val(Account.Name);
 * List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
 *     .collect(nameToListCollector); // ['John Doe', 'Jane Smith', 'Judy Roe', 'Jack Amber', 'Jill Black']
 * // Concatenate names into a String, separated by commas
 * ICollector concatNamesCollector = builder
 *     .joining()
 *     .del(', ')
 *     .val(Account.Name);
 * String joinedNames = (String) [SObjectEnumerable].of(accounts)
 *     .collect(concatNamesCollector); // 'John Doe, Jane Smith, Judy Roe, Jack Amber, Jill Black'
 * // Compute sum of annual revenue
 * ICollector revenueSumCollector = builder
 *     .summingDouble()
 *     .val(Account.AnnualRevenue);
 * Double revenueSum = (Double) [SObjectEnumerable].of(accounts)
 *     .collect(revenueSumCollector); // 15000000.0
 * // Group accounts by industry
 * ICollector groupByIndustryCollector = builder
 *     .groupingByString()
 *     .key(Account.Industry);
 * Map<String, List<Account>> accountsByIndustry = (Map<String, List<Account>>) [SObjectEnumerable].of(accounts)
 *     .collect(groupByIndustryCollector);
 * // {
 * //    'Technology': [
 * //        { Name: 'John Doe', AnnualRevenue: 1000000, Industry: 'Technology', BillingCity: 'Los Angeles' },
 * //        { Name: 'Jill Black', AnnualRevenue: 5000000, Industry: 'Technology', BillingCity: 'Los Angeles' }
 * //    ],
 * //    'Finance': [
 * //        { Name: 'Jane Smith', AnnualRevenue: 2000000, Industry: 'Finance', BillingCity: 'New York' }
 * //    ],
 * //    'Healthcare': [
 * //        { Name: 'Judy Roe', AnnualRevenue: 3000000, Industry: 'Healthcare', BillingCity: 'Los Angeles' },
 * //        { Name: 'Jack Amber', AnnualRevenue: 4000000, Industry: 'Healthcare', BillingCity: 'New York' }
 * //    ]
 * // }
 * // Map sum of annual revenue by city
 * ICollector revenueByCityCollector = builder
 *     .groupingByString()
 *     .key(Account.BillingCity)
 *     .val(builder.summingDouble().val(Account.AnnualRevenue));
 * Map<String, Object> revenueByCity = (Map<String, Object>) [SObjectEnumerable].of(accounts)
 *     .collect(revenueByCityCollector);
 * // {
 * //    'Los Angeles': 9000000.0,
 * //    'New York': 6000000.0
 * // }
 * // Map names by industry and by city
 * ICollector namesByIndustryAndCityCollector = builder
 *     .groupingByString()
 *     .key(Account.Industry)
 *     .val(builder
 *         .groupingByString()
 *         .key(Account.BillingCity)
 *         .val(builder
 *             .toStringSet()
 *             .val(Account.Name)
 *         )
 *     ).cast(Map<String, Map<String, Set<String>>>.class);
 * Map<String, Map<String, Set<String>>> namesByIndustryAndCity = (Map<String, Map<String, Set<String>>>)
 *     [SObjectEnumerable].of(accounts).collect(namesByIndustryAndCityCollector);
 * // {
 * //    'Technology': {
 * //        'Los Angeles': { 'John Doe', 'Jill Black' }
 * //    },
 * //    'Finance': {
 * //        'New York': { 'Jane Smith' }
 * //    },
 * //    'Healthcare': {
 * //        'Los Angeles': { 'Judy Roe' },
 * //        'New York': { 'Jack Amber' }
 * //    }
 * // }
 */
public virtual inherited sharing class SObjectCollectorProvider extends CollectorProvider {
    public SObjectCollectorProvider() {
        super(SObject.class);
    }
}
