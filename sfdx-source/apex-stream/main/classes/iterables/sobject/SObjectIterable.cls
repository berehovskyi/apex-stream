/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description Provides a skeletal implementation of {@link ISObjectIterable}.
 */
public abstract inherited sharing class SObjectIterable implements ISObjectIterable {

    //<editor-fold desc="Intermediate Operations">
    public abstract ISObjectIterable filter(final ISObjectPredicate predicate);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * that have field's value.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> accountsWithHotRating = accountsIterable
     *     .filter('Rating', 'Hot')
     *     .toList();
     * List<Contact> contactsWithHotRatingAccount = contactsIterable
     *     .filter('Account?.Rating', 'Hot')
     *     .toList();
     * @param fieldName the field
     * @param value the value
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual ISObjectIterable filter(final String fieldName, final Object value) {
        return filter(SObjectPredicate.isEqual(fieldName, value));
    }

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * that have field's value.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> accountsWithHotRating = accountsIterable
     *     .filter(Account.Rating, 'Hot')
     *     .toList();
     * @param field the field
     * @param value the value
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `field` is null
     */
    public virtual ISObjectIterable filter(final SObjectField field, final Object value) {
        return filter(SObjectPredicate.isEqual(field, value));
    }

    public abstract ISObjectIterable take(final ISObjectPredicate predicate);

    /**
     * @description Returns a new `ISObjectIterable` that takes `SObject` elements
     * while `fieldName` equals to `value`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> firstAccountsWithHotRating = accountsIterable
     *     .take('Rating', 'Hot')
     *     .toList();
     * @param fieldName the field
     * @param value the value
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual ISObjectIterable take(final String fieldName, final Object value) {
        return take(SObjectPredicate.isEqual(fieldName, value));
    }

    /**
     * @description Returns a new `ISObjectIterable` that takes `SObject` elements
     * while `field` equals to `value`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> firstAccountsWithHotRating = accountsIterable
     *     .take(Account.Rating, 'Hot')
     *     .toList();
     * @param field the field
     * @param value the value
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `field` is null
     */
    public virtual ISObjectIterable take(final SObjectField field, final Object value) {
        return take(SObjectPredicate.isEqual(field, value));
    }

    public abstract ISObjectIterable drop(final ISObjectPredicate predicate);

    /**
     * @description Returns a new `ISObjectIterable` that drops `SObject` elements
     * while `fieldName` equals to `value`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> restAccounts = accountsIterable
     *     .drop('Rating', 'Hot')
     *     .toList();
     * @param fieldName the field
     * @param value the value
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual ISObjectIterable drop(final String fieldName, final Object value) {
        return drop(SObjectPredicate.isEqual(fieldName, value));
    }

    /**
     * @description Returns a new `ISObjectIterable` that drops `SObject` elements
     * while `field` equals to `value`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> restAccounts = accountsIterable
     *     .drop(Account.Rating, 'Hot')
     *     .toList();
     * @param field the field
     * @param value the value
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `field` is null
     */
    public virtual ISObjectIterable drop(final SObjectField field, final Object value) {
        return drop(SObjectPredicate.isEqual(field, value));
    }

    /**
     * @description Returns a new `ISObjectIterable` without null elements.
     * <p>Intermediate Operation.</p>
     * List<Account> accounts = contactsIterable
     *     .mapTo('Account')
     *     .withoutNulls()
     *     .toList();
     * @return the new `ISObjectIterable`
     */
    public virtual ISObjectIterable withoutNulls() {
        return filter(SObjectPredicate.isNotNull());
    }

    public abstract ISObjectIterable mapTo(final ISObjectUnaryOperator mapper);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> accounts = contactsIterable
     *     .mapTo('Account')
     *     .toList();
     * @param fieldName the field value to be set for new SObject
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual ISObjectIterable mapTo(final String fieldName) {
        return mapTo(SObjectUnaryOperator.getSObject(fieldName));
    }

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> accounts = contactsIterable
     *     .mapTo(Contact.AccountId)
     *     .toList();
     * @param field the field value to be set for new SObject
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `field` is null
     */
    public virtual ISObjectIterable mapTo(final SObjectField field) {
        return mapTo(SObjectUnaryOperator.getSObject(field));
    }

    public abstract IIntIterable mapToInt(final ISObjectToIntFunction mapper);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Integer> numberOfEmployees = accountsIterable
     *     .mapToInt('NumberOfEmployees')
     *     .toList();
     * @param fieldName the field
     * @return the new `IIntIterable`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual IIntIterable mapToInt(final String fieldName) {
        return mapToInt(SObjectToIntFunction.get(fieldName));
    }

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Integer> numberOfEmployees = accountsIterable
     *     .mapToInt(Account.NumberOfEmployees)
     *     .toList();
     * @param field the field
     * @return the new `IIntIterable`
     * @throws NullPointerException if `field` is null
     */
    public virtual IIntIterable mapToInt(final SObjectField field) {
        return mapToInt(SObjectToIntFunction.get(field));
    }

    public abstract ILongIterable mapToLong(final ISObjectToLongFunction mapper);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Long> numberOfEmployees = accountsIterable
     *     .mapToLong('NumberOfEmployees')
     *     .toList();
     * @param fieldName the field
     * @return the new `ILongIterable`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual ILongIterable mapToLong(final String fieldName) {
        return mapToLong(SObjectToLongFunction.get(fieldName));
    }

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Long> numberOfEmployees = accountsIterable
     *     .mapToLong(Account.NumberOfEmployees)
     *     .toList();
     * @param field the field
     * @return the new `ILongIterable`
     * @throws NullPointerException if `field` is null
     */
    public virtual ILongIterable mapToLong(final SObjectField field) {
        return mapToLong(SObjectToLongFunction.get(field));
    }

    public abstract IDoubleIterable mapToDouble(final ISObjectToDoubleFunction mapper);

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Double> annualRevenues = accountsIterable
     *     .mapToDouble('AnnualRevenue')
     *     .toList();
     * @param fieldName the field
     * @return the new `IDoubleIterable`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual IDoubleIterable mapToDouble(final String fieldName) {
        return mapToDouble(SObjectToDoubleFunction.get(fieldName));
    }

    /**
     * @description Returns a new `ILongIterable` with `Double` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Double> annualRevenues = accountsIterable
     *     .mapToDouble(Account.AnnualRevenue)
     *     .toList();
     * @param field the field
     * @return the new `field`
     * @throws NullPointerException if `field` is null
     */
    public virtual IDoubleIterable mapToDouble(final SObjectField field) {
        return mapToDouble(SObjectToDoubleFunction.get(field));
    }

    public abstract IObjectIterable mapToObject(final ISObjectFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Object> birthdates = contactsIterable
     *     .mapToObject('Birthdate')
     *     .toList();
     * @param fieldName the field
     * @return the new `IObjectIterable`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual IObjectIterable mapToObject(final String fieldName) {
        return mapToObject(SObjectFunction.get(fieldName));
    }

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Object> birthdates = contactsIterable
     *     .mapToObject(Contact.Birthdate)
     *     .toList();
     * @param field the field
     * @return the new `IObjectIterable`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual IObjectIterable mapToObject(final SObjectField field) {
        return mapToObject(SObjectFunction.get(field));
    }

    public abstract ISObjectIterable forEach(final ISObjectConsumer consumer);

    /**
     * @description Returns a new `ISObjectIterable` after setting `value` for `fieldName`
     * on each `SObject` element.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> accountsWithResetAnnualRevenue = accountsIterable
     *     .forEach('AnnualRevenue', 0)
     *     .toList();
     * @param fieldName the field
     * @param value the value
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual ISObjectIterable forEach(final String fieldName, final Object value) {
        return forEach(SObjectConsumer.set(fieldName, value));
    }

    /**
     * @description Returns a new `ISObjectIterable` after setting `value` for `field`
     * on each `SObject` element.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> accountsWithResetAnnualRevenue = accountsIterable
     *     .forEach(Account.AnnualRevenue, 0)
     *     .toList();
     * @param field the field
     * @param value the value
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `field` is null
     */
    public virtual ISObjectIterable forEach(final SObjectField field, final Object value) {
        return forEach(SObjectConsumer.set(field, value));
    }

    public abstract ISObjectIterable distinct(final ISObjectFunction classifier);

    /**
     * @description Returns a new `ISObjectIterable` with distinct `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> distinctAccountsByName = accountsIterable
     *     .distinct('Name')
     *     .toList();
     * @param fieldName the field
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual ISObjectIterable distinct(final String fieldName) {
        return distinct(SObjectFunction.get(fieldName));
    }

    /**
     * @description Returns a new `ISObjectIterable` with distinct `SObject` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> distinctAccountsByName = accountsIterable
     *     .distinct(Account.Name)
     *     .toList();
     * @param field the field
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `field` is null
     */
    public virtual ISObjectIterable distinct(final SObjectField field) {
        return distinct(SObjectFunction.get(field));
    }

    public abstract ISObjectIterable sort(final ISObjectComparator comparator);

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * considering `order`.
     * <p>Intermediate Operation.</p>
     * List<Account> sortedAccountsByNameDesc = accountsIterable
     *     .sort(SortOrder.DESCENDING)
     *     .toList();
     * @param order the sort order
     * @return the new `ISObjectIterable`
     */
    public virtual ISObjectIterable sort(final SortOrder order) {
        return sort(SObjectComparator.defaultOrder().order(order));
    }

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> sortedAccountsByName = accountsIterable
     *     .sort('Name')
     *     .toList();
     * @param fieldName the field
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual ISObjectIterable sort(final String fieldName) {
        return sort(SObjectComparator.comparing(fieldName));
    }

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * taken from `fieldName` values considering `order`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> sortedAccountsByNameDesc = accountsIterable
     *     .sort('Name', SortOrder.DESCENDING)
     *     .toList();
     * @param fieldName the field
     * @param order the sort order
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `fieldName` is blank or `order` is null
     */
    public virtual ISObjectIterable sort(final String fieldName, final SortOrder order) {
        return sort(SObjectComparator.comparing(fieldName).order(order));
    }

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * according to `field`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> sortedAccountsByName = accountsIterable
     *     .sort(Account.Name)
     *     .toList();
     * @param field the field
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `field` is null
     */
    public virtual ISObjectIterable sort(final SObjectField field) {
        return sort(SObjectComparator.comparing(field));
    }

    /**
     * @description Returns a new `ISObjectIterable` with sorted `SObject` elements
     * taken from `field` values considering `order`.
     * <p>Intermediate Operation.</p>
     * @example
     * List<Account> sortedAccountsByNameDesc = accountsIterable
     *     .sort(Account.Name, SortOrder.DESCENDING)
     *     .toList();
     * @param field the field
     * @param order the sort order
     * @return the new `ISObjectIterable`
     * @throws NullPointerException if `field` or `order` is null
     */
    public virtual ISObjectIterable sort(final SObjectField field, final SortOrder order) {
        return sort(SObjectComparator.comparing(field).order(order));
    }
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract OptionalSObject reduce(final ISObjectBinaryOperator accumulator);

    public abstract OptionalSObject find(final ISObjectPredicate predicate);

    /**
     * @description Returns an `OptionalSObject` describing the first element
     * which has `value` of `fieldName`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Account firstAccountWithHotRating = accountsIterable
     *     .find('Rating', 'Hot')
     *     .get();
     * @param fieldName the field
     * @param value the field value
     * @return the `OptionalSObject`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual OptionalSObject find(final String fieldName, final Object value) {
        return find(SObjectPredicate.isEqual(fieldName, value));
    }

    /**
     * @description Returns an `OptionalSObject` describing the first element
     * which has `value` of `field`.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Account firstAccountWithHotRating = accountsIterable
     *     .find(Account.Rating, 'Hot')
     *     .get();
     * @param field the field
     * @param value the field value
     * @return the `OptionalSObject`
     * @throws NullPointerException if `field` is null
     */
    public virtual OptionalSObject find(final SObjectField field, final Object value) {
        return find(SObjectPredicate.isEqual(field, value));
    }

    public abstract Boolean every(final ISObjectPredicate predicate);

    /**
     * @description Returns whether all `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isEveryAccountWithHotRating = accountsIterable
     *     .every('Rating', 'Hot');
     * @param fieldName the field
     * @param value the field value
     * @return `true` or `false`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual Boolean every(final String fieldName, final Object value) {
        return every(SObjectPredicate.isEqual(fieldName, value));
    }

    /**
     * @description Returns whether all `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isEveryAccountWithHotRating = accountsIterable
     *     .every(Account.Rating, 'Hot');
     * @param field the field
     * @param value the field value
     * @return `true` or `false`
     * @throws NullPointerException if `field` is null
     */
    public virtual Boolean every(final SObjectField field, final Object value) {
        return every(SObjectPredicate.isEqual(field, value));
    }

    public abstract Boolean some(final ISObjectPredicate predicate);

    /**
     * @description Returns whether some `SObject` element has `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isSomeAccountWithHotRating = accountsIterable
     *     .some('Rating', 'Hot');
     * @param fieldName the field
     * @param value the field value
     * @return `true` or `false`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual Boolean some(final String fieldName, final Object value) {
        return some(SObjectPredicate.isEqual(fieldName, value));
    }

    /**
     * @description Returns whether some `SObject` element has `field` `value`.
     * If `ISObjectIterable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isSomeAccountWithHotRating = accountsIterable
     *     .some(Account.Rating, 'Hot');
     * @param field the field
     * @param value the field value
     * @return `true` or `false`
     * @throws NullPointerException if `field` is null
     */
    public virtual Boolean some(final SObjectField field, final Object value) {
        return some(SObjectPredicate.isEqual(field, value));
    }

    /**
     * @description Returns whether no `SObject` elements match `predicate`.
     * If `ISObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isNoAccountWithHotRating = accountsIterable
     *     .none(SObjectPredicate.isEqual(Account.Rating, 'Hot'));
     * @param predicate the predicate
     * @return `true` or `false`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual Boolean none(final ISObjectPredicate predicate) {
        return !some(predicate);
    }

    /**
     * @description Returns whether no `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isNoAccountWithHotRating = accountsIterable
     *     .none('Rating', 'Hot');
     * @param fieldName the field
     * @param value the field value
     * @return `true` or `false`
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual Boolean none(final String fieldName, final Object value) {
        return none(SObjectPredicate.isEqual(fieldName, value));
    }

    /**
     * @description Returns whether no `SObject` elements have `field` `value`.
     * If `ISObjectIterable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     * @example
     * Boolean isNoAccountWithHotRating = accountsIterable
     *     .none(Account.Rating, 'Hot');
     * @param field the field
     * @param value the field value
     * @return `true` or `false`
     * @throws NullPointerException if `field` is null
     */
    public virtual Boolean none(final SObjectField field, final Object value) {
        return none(SObjectPredicate.isEqual(field, value));
    }

    /**
     * @description Returns an `OptionalSObject` describing the maximum `SObject` element
     * according to `comparator`.
     * <p>Terminal Operation.</p>
     * @example
     * Account accountWithMaxAnnualRevenue = accountsIterable
     *     .max(SObjectComparator.comparing(Account.AnnualRevenue))
     *     .get();
     * @param comparator the comparator
     * @return the `OptionalSObject` describing the result
     * @throws NullPointerException if `comparator` is null
     */
    public virtual OptionalSObject max(final ISObjectComparator comparator) {
        return reduce(SObjectBinaryOperator.maxBy(comparator));
    }

    /**
     * @description Returns an `OptionalSObject` describing the maximum `SObject` element
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     * @example
     * Account accountWithMaxAnnualRevenue = accountsIterable
     *     .max('AnnualRevenue')
     *     .get();
     * @param fieldName the field
     * @return the `OptionalSObject` describing the result
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual OptionalSObject max(final String fieldName) {
        return max(SObjectComparator.comparing(fieldName));
    }

    /**
     * @description Returns an `OptionalSObject` describing the maximum `SObject` element
     * according to `field`.
     * <p>Terminal Operation.</p>
     * @example
     * Account accountWithMaxAnnualRevenue = accountsIterable
     *     .max(Account.AnnualRevenue)
     *     .get();
     * @param field the field
     * @return the `OptionalSObject` describing the result
     * @throws NullPointerException if `field` is null
     */
    public virtual OptionalSObject max(final SObjectField field) {
        return max(SObjectComparator.comparing(field));
    }

    /**
     * @description Returns an `OptionalSObject` describing the minimum `SObject` element
     * according to `comparator`.
     * <p>Terminal Operation.</p>
     * @example
     * Account accountWithMinAnnualRevenue = accountsIterable
     *     .min(SObjectComparator.comparing(Account.AnnualRevenue))
     *     .get();
     * @param comparator the comparator
     * @return the `OptionalSObject` describing the result
     * @throws NullPointerException if `comparator` is null
     */
    public virtual OptionalSObject min(final ISObjectComparator comparator) {
        return reduce(SObjectBinaryOperator.minBy(comparator));
    }

    /**
     * @description Returns an `OptionalSObject` describing the minimum `SObject` element
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     * @example
     * Account accountWithMinAnnualRevenue = accountsIterable
     *     .min('AnnualRevenue')
     *     .get();
     * @param fieldName the field
     * @return the `OptionalSObject` describing the result
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual OptionalSObject min(final String fieldName) {
        return min(SObjectComparator.comparing(fieldName));
    }

    /**
     * @description Returns an `OptionalSObject` describing the minimum `SObject` element
     * according to `field`.
     * <p>Terminal Operation.</p>
     * @example
     * Account accountWithMaxAnnualRevenue = accountsIterable
     *     .min(Account.AnnualRevenue)
     *     .get();
     * @param field the field
     * @return the `OptionalSObject` describing the result
     * @throws NullPointerException if `field` is null
     */
    public virtual OptionalSObject min(final SObjectField field) {
        return min(SObjectComparator.comparing(field));
    }

    /**
     * @description Returns the arithmetic sum of values returned by `classifier` function.
     * <p>Terminal Operation.</p>
     * @example
     * Double sumOfAnnualRevenue = accountsIterable
     *     .sum(SObjectToDoubleFunction.get(Account.AnnualRevenue));
     * @param classifier the classifier function
     * @return the sum of elements returned by function
     * @throws NullPointerException if `classifier` is null
     */
    public virtual Double sum(final ISObjectToDoubleFunction classifier) {
        return mapToDouble(classifier).sum();
    }

    /**
     * @description Returns the arithmetic sum of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     * @example
     * Double sumOfAnnualRevenue = accountsIterable
     *     .sum('AnnualRevenue');
     * @param fieldName the field to sum values
     * @return the sum of field values
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual Double sum(final String fieldName) {
        return sum(SObjectToDoubleFunction.get(fieldName));
    }

    /**
     * @description Returns the arithmetic sum of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     * @example
     * Double sumOfAnnualRevenue = accountsIterable
     *     .sum(Account.AnnualRevenue);
     * @param field the field to sum values
     * @return field sum of field values
     * @throws NullPointerException if `field` is null
     */
    public virtual Double sum(final SObjectField field) {
        return sum(SObjectToDoubleFunction.get(field));
    }

    /**
     * @description Returns the arithmetic mean of values returned by `classifier` function.
     * <p>Terminal Operation.</p>
     * @example
     * Double avgAnnualRevenue = accountsIterable
     *     .avg(SObjectToDoubleFunction.get(Account.AnnualRevenue))
     *     .get();
     * @param classifier the classifier function
     * @return the arithmetic mean of elements returned by function
     * @throws NullPointerException if `classifier` is null
     */
    public virtual OptionalDouble avg(final ISObjectToDoubleFunction classifier) {
        return mapToDouble(classifier).avg();
    }

    /**
     * @description Returns the arithmetic mean of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     * @example
     * Double avgAnnualRevenue = accountsIterable
     *     .avg('AnnualRevenue')
     *     .get();
     * @param fieldName the field to sum values
     * @return the arithmetic mean of field values
     * @throws NullPointerException if `fieldName` is blank
     */
    public virtual OptionalDouble avg(final String fieldName) {
        return avg(SObjectToDoubleFunction.get(fieldName));
    }

    /**
     * @description Returns the arithmetic mean of field values of `SObject` elements.
     * <p>Terminal Operation.</p>
     * @example
     * Double avgAnnualRevenue = accountsIterable
     *     .avg(Account.AnnualRevenue)
     *     .get();
     * @param field the field to sum values
     * @return field arithmetic mean of field values
     * @throws NullPointerException if `field` is null
     */
    public virtual OptionalDouble avg(final SObjectField field) {
        return avg(SObjectToDoubleFunction.get(field));
    }
    //</editor-fold>

}
