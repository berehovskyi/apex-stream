/**
 * @description Provides a skeletal implementation of {@link ISObjectEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 */
public abstract inherited sharing class SObjectEnumerable implements ISObjectEnumerable {

    //<editor-fold desc="Iterator">
    public abstract Iterator<SObject> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    public abstract SObjectEnumerable append(final Iterable<SObject> iterable);

    public abstract SObjectEnumerable prepend(final Iterable<SObject> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `ISObjectIterable` as a set union
     * of the current and another iterables.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ISObjectIterable`
     *
     * @example
     * List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
     * List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
     * List<Account> union = accountsIterable1.union(accounts2).toList();
     * // [acc5, acc3, acc9, acc7, acc8, acc6, acc4, acc1, acc0]
     */
    public virtual SObjectEnumerable union(final Iterable<SObject> iterable) {
        return (SObjectEnumerable) append(iterable).distinct();
    }

    /**
     * @description Returns a new `ISObjectIterable` as a set union
     * of the current and another iterables according to `classifier` function.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `ISObjectIterable`
     *
     * @example
     * List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
     * List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
     * List<Account> unionByClassifier = accountsIterable1.union(accounts2, classifier);
     */
    public virtual SObjectEnumerable union(final Iterable<SObject> iterable, final IFunction classifier) {
        return (SObjectEnumerable) append(iterable).distinct(classifier);
    }

    /**
     * @description Returns a new `ISObjectIterable` as a set union
     * of the current and another iterables according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param fieldName the field
     *
     * @return the new `ISObjectIterable`
     * 
     * @example
     * List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
     * List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
     * List<Account> unionByName = accountsIterable1.union(accounts2, 'Name');
     */
    public virtual SObjectEnumerable union(final Iterable<SObject> iterable, final String fieldName) {
        return union(iterable, BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a new `ISObjectIterable` as a set union
     * of the current and another iterables according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param field the field
     *
     * @return the new `ISObjectIterable`
     * 
     * @example
     * List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
     * List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
     * List<Account> unionByName = accountsIterable1.union(accounts2, Account.Name);
     */
    public virtual SObjectEnumerable union(final Iterable<SObject> iterable, final SObjectField field) {
        return union(iterable, BaseSObjectFunctions.get(field));
    }

    /**
     * @description Returns a new `ISObjectIterable` as a set intersection
     * of the current and another iterables.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ISObjectIterable`
     * 
     * @example
     * List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
     * List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
     * List<Account> intersection = accountsIterable1.intersect(accounts2).toList(); // [acc3, acc9]
     */
    public virtual SObjectEnumerable intersect(final Iterable<SObject> iterable) {
        return (SObjectEnumerable) distinct().filter(BasePredicates.isIn(iterable));
    }

    /**
     * @description Returns a new `ISObjectIterable` as a set intersection
     * of the current and another iterables according to `classifier` function.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `ISObjectIterable`
     * 
     * @example
     * List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
     * List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
     * List<Account> intersectionByClassifier = accountsIterable1.intersect(accounts2, classifier);
     */
    public virtual SObjectEnumerable intersect(final Iterable<SObject> iterable, final IFunction classifier) {
        return (SObjectEnumerable) distinct(classifier).filter(BasePredicates.isIn(
                classifier, EnumerablePipeline.toObjectSet(iterable, classifier)
        ));
    }

    /**
     * @description Returns a new `ISObjectIterable` as a set intersection
     * of the current and another iterables according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param fieldName the field
     *
     * @return the new `ISObjectIterable`
     * 
     * @example
     * List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
     * List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
     * List<Account> intersectionByName = accountsIterable1.intersect(accounts2, 'Name');
     */
    public virtual SObjectEnumerable intersect(final Iterable<SObject> iterable, final String fieldName) {
        return intersect(iterable, BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a new `ISObjectIterable` as a set intersection
     * of the current and another iterables according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param field the field
     *
     * @return the new `ISObjectIterable`
     * 
     * @example
     * List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
     * List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
     * List<Account> intersectionByName = accountsIterable1.intersect(accounts2, Account.Name);
     */
    public virtual SObjectEnumerable intersect(final Iterable<SObject> iterable, final SObjectField field) {
        return intersect(iterable, BaseSObjectFunctions.get(field));
    }

    /**
     * @description Returns a new `ISObjectIterable` as a set difference
     * of the current and another iterables.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ISObjectIterable`
     * 
     * @example
     * List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
     * List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
     * List<Account> diff = accountsIterable1.except(accounts2).toList(); // [acc5, acc7]
     */
    public virtual SObjectEnumerable except(final Iterable<SObject> iterable) {
        return (SObjectEnumerable) distinct().filter(BasePredicates.isIn(iterable).negate());
    }

    /**
     * @description Returns a new `ISObjectIterable` as a set difference
     * of the current and another iterables according to `classifier` function.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `ISObjectIterable`
     * 
     * @example
     * List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
     * List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
     * List<Account> diffByClassifier = accountsIterable1.except(accounts2, classifier);
     */
    public virtual SObjectEnumerable except(final Iterable<SObject> iterable, final IFunction classifier) {
        return (SObjectEnumerable) distinct(classifier).filter(BasePredicates.isIn(
                classifier, EnumerablePipeline.toObjectSet(iterable, classifier)
        ).negate());
    }

    /**
     * @description Returns a new `ISObjectIterable` as a set difference
     * of the current and another iterables according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param fieldName the field
     *
     * @return the new `ISObjectIterable`
     *
     * @example
     * List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
     * List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
     * List<Account> diffByName = accountsIterable1.except(accounts2, 'Name');
     */
    public virtual SObjectEnumerable except(final Iterable<SObject> iterable, final String fieldName) {
        return except(iterable, BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a new `ISObjectIterable` as a set difference
     * of the current and another iterables according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     * @param field the field
     *
     * @return the new `ISObjectIterable`
     *
     * @example
     * List<Account> accounts1 = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
     * List<Account> accounts2 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc0 };
     * List<Account> diffByName = accountsIterable1.except(accounts2, Account.Name);
     */
    public virtual SObjectEnumerable except(final Iterable<SObject> iterable, final SObjectField field) {
        return except(iterable, BaseSObjectFunctions.get(field));
    }

    public abstract SObjectEnumerable distinct();

    public abstract SObjectEnumerable distinct(final IFunction classifier);

    /**
     * @description Returns a new `ISObjectIterable` with distinct `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `ISObjectIterable`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Account> distinctAccountsByName = accountsIterable
     *     .distinct('Name')
     *     .toList();
     */
    public virtual SObjectEnumerable distinct(final String fieldName) {
        return distinct(BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a new `ISObjectIterable` with distinct `SObject` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `ISObjectIterable`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Account> distinctAccountsByName = accountsIterable
     *     .distinct(Account.Name)
     *     .toList();
     */
    public virtual SObjectEnumerable distinct(final SObjectField field) {
        return distinct(BaseSObjectFunctions.get(field));
    }

    public abstract SObjectEnumerable filter(final IPredicate predicate);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * that have field's value.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Account> accountsWithHotRating = accountsIterable
     *     .filter('Rating', 'Hot')
     *     .toList();
     * List<Contact> contactsWithHotRatingAccount = contactsIterable
     *     .filter('Account?.Rating', 'Hot')
     *     .toList();
     */
    public virtual SObjectEnumerable filter(final String fieldName, final Object value) {
        return filter(BaseSObjectPredicates.isEqual(fieldName, value));
    }

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * that have field's value.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Account> accountsWithHotRating = accountsIterable
     *     .filter(Account.Rating, 'Hot')
     *     .toList();
     */
    public virtual SObjectEnumerable filter(final SObjectField field, final Object value) {
        return filter(BaseSObjectPredicates.isEqual(field, value));
    }

    public abstract SObjectEnumerable take(final IPredicate predicate);

    /**
     * @description Returns a new `ISObjectIterable` that takes `SObject` elements
     * while `fieldName` equals to `value`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Account> firstAccountsWithHotRating = accountsIterable
     *     .take('Rating', 'Hot')
     *     .toList();
     */
    public virtual SObjectEnumerable take(final String fieldName, final Object value) {
        return take(BaseSObjectPredicates.isEqual(fieldName, value));
    }

    /**
     * @description Returns a new `ISObjectIterable` that takes `SObject` elements
     * while `field` equals to `value`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Account> firstAccountsWithHotRating = accountsIterable
     *     .take(Account.Rating, 'Hot')
     *     .toList();
     */
    public virtual SObjectEnumerable take(final SObjectField field, final Object value) {
        return take(BaseSObjectPredicates.isEqual(field, value));
    }

    public abstract SObjectEnumerable drop(final IPredicate predicate);

    /**
     * @description Returns a new `ISObjectIterable` that drops `SObject` elements
     * while `fieldName` equals to `value`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Account> restAccounts = accountsIterable
     *     .drop('Rating', 'Hot')
     *     .toList();
     */
    public virtual SObjectEnumerable drop(final String fieldName, final Object value) {
        return drop(BaseSObjectPredicates.isEqual(fieldName, value));
    }

    /**
     * @description Returns a new `ISObjectIterable` that drops `SObject` elements
     * while `field` equals to `value`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Account> restAccounts = accountsIterable
     *     .drop(Account.Rating, 'Hot')
     *     .toList();
     */
    public virtual SObjectEnumerable drop(final SObjectField field, final Object value) {
        return drop(BaseSObjectPredicates.isEqual(field, value));
    }

    /**
     * @description Returns a new `ISObjectIterable` without null elements.
     * <p>Intermediate Operation.</p>
     * List<Account> accounts = contactsIterable
     *     .mapTo('Account')
     *     .withoutNulls()
     *     .toList();
     *
     * @return the new `ISObjectIterable`
     */
    public virtual SObjectEnumerable withoutNulls() {
        return filter(BasePredicates.isNotNull());
    }

    public abstract SObjectEnumerable mapTo(final IOperator mapper);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the parent reference field
     *
     * @return the new `ISObjectIterable`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Account> accounts = contactsIterable
     *     .mapTo('Account')
     *     .toList();
     */
    public virtual SObjectEnumerable mapTo(final String fieldName) {
        return mapTo(BaseSObjectOperators.getSObject(fieldName));
    }

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the parent reference field
     *
     * @return the new `ISObjectIterable`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Account> accounts = contactsIterable
     *     .mapTo(Contact.AccountId)
     *     .toList();
     */
    public virtual SObjectEnumerable mapTo(final SObjectField field) {
        return mapTo(BaseSObjectOperators.getSObject(field));
    }

    public abstract IntEnumerable mapToInt(final IFunction mapper);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `IIntIterable`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Integer> numberOfEmployees = accountsIterable
     *     .mapToInt('NumberOfEmployees')
     *     .toList();
     */
    public virtual IntEnumerable mapToInt(final String fieldName) {
        return mapToInt(BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `IIntIterable`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Integer> numberOfEmployees = accountsIterable
     *     .mapToInt(Account.NumberOfEmployees)
     *     .toList();
     */
    public virtual IntEnumerable mapToInt(final SObjectField field) {
        return mapToInt(BaseSObjectFunctions.get(field));
    }

    public abstract LongEnumerable mapToLong(final IFunction mapper);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `ILongIterable`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Long> numberOfEmployees = accountsIterable
     *     .mapToLong('NumberOfEmployees')
     *     .toList();
     */
    public virtual LongEnumerable mapToLong(final String fieldName) {
        return mapToLong(BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `ILongIterable`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Long> numberOfEmployees = accountsIterable
     *     .mapToLong(Account.NumberOfEmployees)
     *     .toList();
     */
    public virtual LongEnumerable mapToLong(final SObjectField field) {
        return mapToLong(BaseSObjectFunctions.get(field));
    }

    public abstract DoubleEnumerable mapToDouble(final IFunction mapper);

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `IDoubleIterable`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Double> annualRevenues = accountsIterable
     *     .mapToDouble('AnnualRevenue')
     *     .toList();
     */
    public virtual DoubleEnumerable mapToDouble(final String fieldName) {
        return mapToDouble(BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a new `ILongIterable` with `Double` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `field`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Double> annualRevenues = accountsIterable
     *     .mapToDouble(Account.AnnualRevenue)
     *     .toList();
     */
    public virtual DoubleEnumerable mapToDouble(final SObjectField field) {
        return mapToDouble(BaseSObjectFunctions.get(field));
    }

    public abstract ObjectEnumerable mapToObject(final IFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `IObjectIterable`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Object> birthdates = contactsIterable
     *     .mapToObject('Birthdate')
     *     .toList();
     */
    public virtual ObjectEnumerable mapToObject(final String fieldName) {
        return mapToObject(BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `IObjectIterable`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Object> birthdates = contactsIterable
     *     .mapToObject(Contact.Birthdate)
     *     .toList();
     */
    public virtual ObjectEnumerable mapToObject(final SObjectField field) {
        return mapToObject(BaseSObjectFunctions.get(field));
    }

    public abstract SObjectEnumerable flatMapTo(final IFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `SObject` elements as a result of
     * replacing each element with the contents of a mapped iterable
     * according to child relationship `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the child relationship field
     *
     * @return the new `ISObjectIterable`
     *
     * @example
     * List<Contact> contacts = accountsIterable
     *     .flatMapTo('Contacts')
     *     .toList();
     */
    public virtual SObjectEnumerable flatMapTo(final String fieldName) {
        return flatMapTo(BaseSObjectFunctions.getSObjects(fieldName));
    }

    /**
     * @description Returns a new `IObjectIterable` with `SObject` elements as a result of
     * replacing each element with the contents of a mapped iterable
     * according to child relationship `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the child relationship field
     *
     * @return the new `ISObjectIterable`
     *
     * @example
     * List<Contact> contacts = accountsIterable
     *     .flatMapTo(Contact.AccountId)
     *     .toList();
     */
    public virtual SObjectEnumerable flatMapTo(final SObjectField field) {
        return flatMapTo(BaseSObjectFunctions.getSObjects(field));
    }

    public abstract IntEnumerable flatMapToInt(final IFunction mapper);

    public abstract LongEnumerable flatMapToLong(final IFunction mapper);

    public abstract DoubleEnumerable flatMapToDouble(final IFunction mapper);

    public abstract ObjectEnumerable flatMapToObject(final IFunction mapper);

    public abstract SObjectEnumerable forEach(final IConsumer consumer);

    /**
     * @description Returns a new `ISObjectIterable` after setting `value` for `fieldName`
     * on each `SObject` element.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Account> accountsWithResetAnnualRevenue = accountsIterable
     *     .forEach('AnnualRevenue', 0)
     *     .toList();
     */
    public virtual SObjectEnumerable forEach(final String fieldName, final Object value) {
        return forEach(BaseSObjectConsumers.set(fieldName, value));
    }

    /**
     * @description Returns a new `ISObjectIterable` after setting `value` for `field`
     * on each `SObject` element.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param value the value
     *
     * @return the new `ISObjectIterable`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Account> accountsWithResetAnnualRevenue = accountsIterable
     *     .forEach(Account.AnnualRevenue, 0)
     *     .toList();
     */
    public virtual SObjectEnumerable forEach(final SObjectField field, final Object value) {
        return forEach(BaseSObjectConsumers.set(field, value));
    }

    public abstract SObjectEnumerable sort();

    public abstract SObjectEnumerable sort(final IComparer comparer);

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * considering `order`.
     * <p>Intermediate Operation.</p>
     * List<Account> sortedAccountsByNameDesc = accountsIterable
     *     .sort(SortOrder.DESCENDING)
     *     .toList();
     *
     * @param order the sort order
     *
     * @return the new `ISObjectIterable`
     */
    public virtual SObjectEnumerable sort(final SortOrder order) {
        return sort(Comparer.defaultOrder().order(order));
    }

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `ISObjectIterable`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * List<Account> sortedAccountsByName = accountsIterable
     *     .sort('Name')
     *     .toList();
     */
    public virtual SObjectEnumerable sort(final String fieldName) {
        return sort(Comparer.comparing(BaseSObjectFunctions.get(fieldName)));
    }

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * taken from `fieldName` values considering `order`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     * @param order the sort order
     *
     * @return the new `ISObjectIterable`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `order` is null
     *
     * @example
     * List<Account> sortedAccountsByNameDesc = accountsIterable
     *     .sort('Name', SortOrder.DESCENDING)
     *     .toList();
     */
    public virtual SObjectEnumerable sort(final String fieldName, final SortOrder order) {
        return sort(Comparer.comparing(BaseSObjectFunctions.get(fieldName)).order(order));
    }

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     *
     * @return the new `ISObjectIterable`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * List<Account> sortedAccountsByName = accountsIterable
     *     .sort(Account.Name)
     *     .toList();
     */
    public virtual SObjectEnumerable sort(final SObjectField field) {
        return sort(Comparer.comparing(BaseSObjectFunctions.get(field)));
    }

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * taken from `field` values considering `order`.
     * <p>Intermediate Operation.</p>
     *
     * @param field the field
     * @param order the sort order
     *
     * @return the new `ISObjectIterable`
     *
     * @throws NullPointerException if `field` or `order` is null
     *
     * @example
     * List<Account> sortedAccountsByNameDesc = accountsIterable
     *     .sort(Account.Name, SortOrder.DESCENDING)
     *     .toList();
     */
    public virtual SObjectEnumerable sort(final SObjectField field, final SortOrder order) {
        return sort(Comparer.comparing(BaseSObjectFunctions.get(field)).order(order));
    }

    public abstract SObjectEnumerable lim(final Integer lim);
    
    public abstract SObjectEnumerable skip(final Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract SObject reduce(final SObject identity, final IBiOperator accumulator);
    
    public abstract Optional reduce(final IBiOperator accumulator);

//    public abstract Object collect(final ISupplier supplier, final IBiConsumer accumulator);

    public abstract Object collect(final ICollector collector);

    public abstract Optional find(final IPredicate predicate);

    /**
     * @description Returns an `Optional` describing the first element
     * which has `value` of `fieldName`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param value the field value
     *
     * @return the `Optional`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Account firstAccountWithHotRating = accountsIterable
     *     .find('Rating', 'Hot')
     *     .get();
     */
    public virtual Optional find(final String fieldName, final Object value) {
        return find(BaseSObjectPredicates.isEqual(fieldName, value));
    }

    /**
     * @description Returns an `Optional` describing the first element
     * which has `value` of `field`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the field value
     *
     * @return the `Optional`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Account firstAccountWithHotRating = accountsIterable
     *     .find(Account.Rating, 'Hot')
     *     .get();
     */
    public virtual Optional find(final SObjectField field, final Object value) {
        return find(BaseSObjectPredicates.isEqual(field, value));
    }

    public abstract Boolean every(final IPredicate predicate);

    /**
     * @description Returns whether all `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param value the field value
     *
     * @return `true` or `false`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Boolean isEveryAccountWithHotRating = accountsIterable
     *     .every('Rating', 'Hot');
     */
    public virtual Boolean every(final String fieldName, final Object value) {
        return every(BaseSObjectPredicates.isEqual(fieldName, value));
    }

    /**
     * @description Returns whether all `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the field value
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Boolean isEveryAccountWithHotRating = accountsIterable
     *     .every(Account.Rating, 'Hot');
     */
    public virtual Boolean every(final SObjectField field, final Object value) {
        return every(BaseSObjectPredicates.isEqual(field, value));
    }

    public abstract Boolean some(final IPredicate predicate);

    /**
     * @description Returns whether some `SObject` element has `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param value the field value
     *
     * @return `true` or `false`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Boolean isSomeAccountWithHotRating = accountsIterable
     *     .some('Rating', 'Hot');
     */
    public virtual Boolean some(final String fieldName, final Object value) {
        return some(BaseSObjectPredicates.isEqual(fieldName, value));
    }

    /**
     * @description Returns whether some `SObject` element has `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the field value
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Boolean isSomeAccountWithHotRating = accountsIterable
     *     .some(Account.Rating, 'Hot');
     */
    public virtual Boolean some(final SObjectField field, final Object value) {
        return some(BaseSObjectPredicates.isEqual(field, value));
    }

    /**
     * @description Returns whether no `SObject` elements match `predicate`.
     * If `ISObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Boolean isNoAccountWithHotRating = accountsIterable
     *     .none(Predicates.isEqual(Account.Rating, 'Hot'));
     */
    public virtual Boolean none(final IPredicate predicate) {
        return !some(predicate);
    }

    /**
     * @description Returns whether no `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param value the field value
     *
     * @return `true` or `false`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Boolean isNoAccountWithHotRating = accountsIterable
     *     .none('Rating', 'Hot');
     */
    public virtual Boolean none(final String fieldName, final Object value) {
        return none(BaseSObjectPredicates.isEqual(fieldName, value));
    }

    /**
     * @description Returns whether no `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the field value
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Boolean isNoAccountWithHotRating = accountsIterable
     *     .none(Account.Rating, 'Hot');
     */
    public virtual Boolean none(final SObjectField field, final Object value) {
        return none(BaseSObjectPredicates.isEqual(field, value));
    }

    /**
     * @description Returns an `Optional` describing the maximum `SObject` element
     * according to `comparer`.
     * <p>Terminal Operation.</p>
     *
     * @param comparer the comparer
     *
     * @return the `Optional` describing the result
     *
     * @throws NullPointerException if `comparer` is null
     *
     * @example
     * Account accountWithMaxAnnualRevenue = accountsIterable
     *     .max(SObjectComparer.comparing(Account.AnnualRevenue))
     *     .get();
     */
    public virtual Optional max(final IComparer comparer) {
        return reduce(BiOperator.maxBy(comparer));
    }

    /**
     * @description Returns an `Optional` describing the maximum `SObject` element
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Optional` describing the result
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Account accountWithMaxAnnualRevenue = accountsIterable
     *     .max('AnnualRevenue')
     *     .get();
     */
    public virtual Optional max(final String fieldName) {
        return max(Comparer.comparing(BaseSObjectFunctions.get(fieldName)));
    }

    /**
     * @description Returns an `Optional` describing the maximum `SObject` element
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Optional` describing the result
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Account accountWithMaxAnnualRevenue = accountsIterable
     *     .max(Account.AnnualRevenue)
     *     .get();
     */
    public virtual Optional max(final SObjectField field) {
        return max(Comparer.comparing(BaseSObjectFunctions.get(field)));
    }

    /**
     * @description Returns an `Optional` describing the minimum `SObject` element
     * according to `comparer`.
     * <p>Terminal Operation.</p>
     *
     * @param comparer the comparer
     *
     * @return the `Optional` describing the result
     *
     * @throws NullPointerException if `comparer` is null
     *
     * @example
     * Account accountWithMinAnnualRevenue = accountsIterable
     *     .min(SObjectComparer.comparing(Account.AnnualRevenue))
     *     .get();
     */
    public virtual Optional min(final IComparer comparer) {
        return reduce(BiOperator.minBy(comparer));
    }

    /**
     * @description Returns an `Optional` describing the minimum `SObject` element
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Optional` describing the result
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Account accountWithMinAnnualRevenue = accountsIterable
     *     .min('AnnualRevenue')
     *     .get();
     */
    public virtual Optional min(final String fieldName) {
        return min(Comparer.comparing(BaseSObjectFunctions.get(fieldName)));
    }

    /**
     * @description Returns an `Optional` describing the minimum `SObject` element
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Optional` describing the result
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Account accountWithMaxAnnualRevenue = accountsIterable
     *     .min(Account.AnnualRevenue)
     *     .get();
     */
    public virtual Optional min(final SObjectField field) {
        return min(Comparer.comparing(BaseSObjectFunctions.get(field)));
    }

    /**
     * @description Returns the arithmetic sum of values returned by `classifier` function.
     * <p>Terminal Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the sum of elements returned by function
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * Double sumOfAnnualRevenue = accountsIterable
     *     .sum(SObjectToDoubleFunctions.get(Account.AnnualRevenue));
     */
    public virtual Double sum(final IFunction classifier) {
        return mapToDouble(classifier).sum();
    }

    /**
     * @description Returns the arithmetic sum of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field to sum values
     *
     * @return the sum of field values
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Double sumOfAnnualRevenue = accountsIterable
     *     .sum('AnnualRevenue');
     */
    public virtual Double sum(final String fieldName) {
        return sum(BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns the arithmetic sum of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field to sum values
     *
     * @return field sum of field values
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Double sumOfAnnualRevenue = accountsIterable
     *     .sum(Account.AnnualRevenue);
     */
    public virtual Double sum(final SObjectField field) {
        return sum(BaseSObjectFunctions.get(field));
    }

    /**
     * @description Returns the arithmetic mean of values returned by `classifier` function.
     * <p>Terminal Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the arithmetic mean of elements returned by function
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * Double avgAnnualRevenue = accountsIterable
     *     .avg(SObjectToDoubleFunctions.get(Account.AnnualRevenue))
     *     .get();
     */
    public virtual Optional avg(final IFunction classifier) {
        return mapToDouble(classifier).avg();
    }

    /**
     * @description Returns the arithmetic mean of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field to sum values
     *
     * @return the arithmetic mean of field values
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Double avgAnnualRevenue = accountsIterable
     *     .avg('AnnualRevenue')
     *     .get();
     */
    public virtual Optional avg(final String fieldName) {
        return avg(BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Returns the arithmetic mean of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field to sum values
     *
     * @return field arithmetic mean of field values
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Double avgAnnualRevenue = accountsIterable
     *     .avg(Account.AnnualRevenue)
     *     .get();
     */
    public virtual Optional avg(final SObjectField field) {
        return avg(BaseSObjectFunctions.get(field));
    }

    public abstract Integer count();

    public abstract Boolean isEmpty();

    public abstract List<SObject> toList();

    /**
     * @description Accumulates elements returned by `mapper` into a `List<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `List<Object>` containing the collected elements
     *
     * @example
     * List<Object> accountNames = accountsIterable.toList(Functions.get('Name'));
     */
    public virtual List<Object> toList(final IFunction mapper) {
        return toList(mapper, Object.class);
    }

    /**
     * @description Accumulates `Object` elements into a `List<Object>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `List<Object>` containing the collected elements
     *
     * @example
     * List<Object> accountNames = accountsIterable.toList('Name');
     */
    public virtual List<Object> toList(final String fieldName) {
        return toList(fieldName, Object.class);
    }

    /**
     * @description Accumulates `Object` elements into a `List<Object>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `List<Object>` containing the collected elements
     *
     * @example
     * List<Object> accountNames = accountsIterable.toList(Account.Name);
     */
    public virtual List<Object> toList(final SObjectField field) {
        return toList(field, Object.class);
    }

    public abstract List<Object> toList(final IFunction mapper, final Type elementType);

    /**
     * @description Accumulates `Object` elements into a `List<Object>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param listType result type
     *
     * @return the `List<Object>` containing the collected elements, which can be cast to `listType`
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null or `listType` is null
     *
     * @example
     * List<String> accountNames = (List<String>) accountsIterable
     *     .toList('Name', List<String>.class);
     */
    public virtual List<Object> toList(final String fieldName, final Type listType) {
        return toList(BaseSObjectFunctions.get(fieldName), listType);
    }

    /**
     * @description Accumulates `Object` elements into a `List<Object>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param listType result type
     *
     * @return the `List<Object>` containing the collected elements, which can be cast to `listType`
     *
     * @throws NullPointerException if `field` or `listType` is null
     *
     * @example
     * List<String> accountNames = (List<String>) accountsIterable
     *     .toList(Account.Name, List<String>.class);
     */
    public virtual List<Object> toList(final SObjectField field, final Type listType) {
        return toList(BaseSObjectFunctions.get(field), listType);
    }

    public abstract Set<SObject> toSet();
    
    public abstract Set<Object> toSet(final IFunction mapper);

    /**
     * @description Accumulates `Object` elements into a `Set<Object>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Set<Object>` containing the collected elements field values
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Set<Object> createdDates = contactsIterable.toSet('CreatedDate');
     */
    public virtual Set<Object> toSet(final String fieldName) {
        return toSet(BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Accumulates `Object` elements into a `Set<Object>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Set<Object>` containing the collected elements field values
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Set<Object> createdDates = contactsIterable.toSet(Contact.CreatedDate);
     */
    public virtual Set<Object> toSet(final SObjectField field) {
        return toSet(BaseSObjectFunctions.get(field));
    }

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Id>` containing the sequence element field values
     *
     * @example
     * Set<Id> accountIds = accountsIterable.toIdSet();
     */
    public virtual Set<Id> toIdSet() {
        return toIdSet('Id');
    }

    public abstract Set<Id> toIdSet(final IFunction mapper);

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Set<Id>` containing the collected elements field values
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Set<Id> accountIds = contactsIterable.toIdSet('AccountId');
     */
    public virtual Set<Id> toIdSet(final String fieldName) {
        return toIdSet(BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Set<Id>` containing the collected elements field values
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Set<Id> accountIds = contactsIterable.toIdSet(Contact.AccountId);
     */
    public virtual Set<Id> toIdSet(final SObjectField field) {
        return toIdSet(BaseSObjectFunctions.get(field));
    }

    public abstract Set<String> toStringSet(final IFunction mapper);

    /**
     * @description Accumulates `String` elements into a `Set<String>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Set<String>` containing the collected elements field values
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Set<String> accountNames = accountsIterable.toStringSet('Name');
     */
    public virtual Set<String> toStringSet(final String fieldName) {
        return toStringSet(BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Accumulates `String` elements into a `Set<String>`
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Set<String>`containing the collected elements field values
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Set<String> accountNames = accountsIterable.toStringSet(Account.Name);
     */
    public virtual Set<String> toStringSet(final SObjectField field) {
        return toStringSet(BaseSObjectFunctions.get(field));
    }

    public abstract Map<Id, SObject> toMap();

    public abstract Map<Id, SObject> toByIdMap(final IFunction keyMapper, final Type mapType);

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, SObject>`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param mapType result type
     *
     * @return the `Map<Id, SObject>` containing the collected elements, which can be cast to `mapType`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `mapType` is null
     *
     * @example
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) contactsIterable
     *     .toByIdMap('AccountId', Map<Id, Contact>.class);
     */
    public virtual Map<Id, SObject> toByIdMap(final String fieldName, final Type mapType) {
        return toByIdMap(BaseSObjectFunctions.get(fieldName), mapType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, SObject>`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param mapType result type
     *
     * @return the `Map<Id, SObject>` containing the collected elements, which can be cast to `mapType`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `field` is null or `mapType` is null
     *
     * @example
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) contactsIterable
     *     .toByIdMap(Contact.AccountId, Map<Id, Contact>.class);
     */
    public virtual Map<Id, SObject> toByIdMap(final SObjectField field, final Type mapType) {
        return toByIdMap(BaseSObjectFunctions.get(field), mapType);
    }

    public abstract Map<String, SObject> toByStringMap(final IFunction keyMapper, final Type mapType);

    /**
     * @description Accumulates `SObject` elements into a `Map<String, SObject>`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param mapType result type
     *
     * @return the `Map<String, SObject>` containing the collected elements, which can be cast to `mapType`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     * @throws NullPointerException if `mapType` is null
     *
     * @example
     * Map<String, Account> accountByName = (Map<String, Account>) accountsIterable
     *     .toByStringMap('Name', Map<String, Account>.class);
     */
    public virtual Map<String, SObject> toByStringMap(final String fieldName, final Type mapType) {
        return toByStringMap(BaseSObjectFunctions.get(fieldName), mapType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<String, SObject>`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param mapType result type
     *
     * @return the `Map<String, SObject>` containing the collected elements, which can be cast to `mapType`
     *
     * @throws IllegalStateException if mapped keys contain duplicates
     * @throws NullPointerException if `field` or `mapType` is null
     *
     * @example
     * Map<String, Account> accountByName = (Map<String, Account>) accountsIterable
     *     .toByStringMap(Account.Name, Map<String, Account>.class);
     */
    public virtual Map<String, SObject> toByStringMap(final SObjectField field, final Type mapType) {
        return toByStringMap(BaseSObjectFunctions.get(field), mapType);
    }

    public abstract Map<Id, List<SObject>> groupById(final IFunction keyMapper);

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Map<Id, List<SObject>>` containing the iterable elements
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = contactsIterable.groupById('AccountId');
     */
    public virtual Map<Id, List<SObject>> groupById(final String fieldName) {
        return groupById(BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Map<Id, List<SObject>>` containing the iterable elements
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = contactsIterable.groupById(Contact.AccountId);
     */
    public virtual Map<Id, List<SObject>> groupById(final SObjectField field) {
        return groupById(BaseSObjectFunctions.get(field));
    }

    public abstract Map<String, List<SObject>> groupByString(final IFunction keyMapper);

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Map<String, List<SObject>>` containing the iterable elements
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Map<String, List<Account>> accountsByRating = accountsIterable.groupByString('Rating');
     */
    public virtual Map<String, List<SObject>> groupByString(final String fieldName) {
        return groupByString(BaseSObjectFunctions.get(fieldName));
    }

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are `field` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `Map<String, List<SObject>>` containing the iterable elements
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Map<String, List<Account>> accountsByRating = accountsIterable.groupByString(Account.Rating);
     */
    public virtual Map<String, List<SObject>> groupByString(final SObjectField field) {
        return groupByString(BaseSObjectFunctions.get(field));
    }

    public abstract Map<Boolean, List<SObject>> partition(final IPredicate predicate);

    /**
     * @description Partition `SObject` elements by `fieldName` having `value`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param value the satisfying value
     *
     * @return the `Map<Boolean, List<SObject>>` containing the iterable elements
     *
     * @throws IllegalArgumentException if `fieldName` is blank
     * @throws NullPointerException if `fieldName` is null
     *
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = accountsIterable.partition('Rating', 'Hot');
     */
    public virtual Map<Boolean, List<SObject>> partition(final String fieldName, final Object value) {
        return partition(BaseSObjectPredicates.isEqual(fieldName, value));
    }

    /**
     * @description Partition `SObject` elements by `field` having `value`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     * @param value the satisfying value
     *
     * @return the `Map<Boolean, List<SObject>>` containing the iterable elements
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = accountsIterable.partition(Account.Rating, 'Hot');
     */
    public virtual Map<Boolean, List<SObject>> partition(final SObjectField field, final Object value) {
        return partition(BaseSObjectPredicates.isEqual(field, value));
    }
    //</editor-fold>

}
