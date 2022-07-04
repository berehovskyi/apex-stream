/**
 * @description Provides a skeletal implementation of {@link ISObjectIterable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Iterables
 */
public abstract inherited sharing class SObjectIterable implements ISObjectIterable {

    //<editor-fold desc="Sources">
    public abstract ISObjectIterable append(final Iterable<SObject> iterable);
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
    public virtual ISObjectIterable union(final Iterable<SObject> iterable) {
        return append(iterable).distinct();
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
    public virtual ISObjectIterable union(final Iterable<SObject> iterable, final ISObjectFunction classifier) {
        return append(iterable).distinct(classifier);
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
    public virtual ISObjectIterable union(final Iterable<SObject> iterable, final String fieldName) {
        return union(iterable, SObjectFunctions.get(fieldName));
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
    public virtual ISObjectIterable union(final Iterable<SObject> iterable, final SObjectField field) {
        return union(iterable, SObjectFunctions.get(field));
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
    public virtual ISObjectIterable intersect(final Iterable<SObject> iterable) {
        return distinct().filter(SObjectPredicates.isIn(iterable));
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
    public virtual ISObjectIterable intersect(final Iterable<SObject> iterable, final ISObjectFunction classifier) {
        return distinct(classifier).filter(SObjectPredicates.isIn(
                classifier, (Iterable<Object>) Iterators.toObjectSet(iterable.iterator(), classifier)
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
    public virtual ISObjectIterable intersect(final Iterable<SObject> iterable, final String fieldName) {
        return intersect(iterable, SObjectFunctions.get(fieldName));
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
    public virtual ISObjectIterable intersect(final Iterable<SObject> iterable, final SObjectField field) {
        return intersect(iterable, SObjectFunctions.get(field));
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
    public virtual ISObjectIterable except(final Iterable<SObject> iterable) {
        return distinct().filter(SObjectPredicates.isIn(iterable).negate());
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
    public virtual ISObjectIterable except(final Iterable<SObject> iterable, final ISObjectFunction classifier) {
        return distinct(classifier).filter(SObjectPredicates.isIn(
                classifier, (Iterable<Object>) Iterators.toObjectSet(iterable.iterator(), classifier)
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
    public virtual ISObjectIterable except(final Iterable<SObject> iterable, final String fieldName) {
        return except(iterable, SObjectFunctions.get(fieldName));
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
    public virtual ISObjectIterable except(final Iterable<SObject> iterable, final SObjectField field) {
        return except(iterable, SObjectFunctions.get(field));
    }

    public abstract ISObjectIterable distinct();

    public abstract ISObjectIterable distinct(final ISObjectFunction classifier);

    /**
     * @description Returns a new `ISObjectIterable` with distinct `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `ISObjectIterable`
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Account> distinctAccountsByName = accountsIterable
     *     .distinct('Name')
     *     .toList();
     */
    public virtual ISObjectIterable distinct(final String fieldName) {
        return distinct(SObjectFunctions.get(fieldName));
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
    public virtual ISObjectIterable distinct(final SObjectField field) {
        return distinct(SObjectFunctions.get(field));
    }

    public abstract ISObjectIterable filter(final ISObjectPredicate predicate);

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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Account> accountsWithHotRating = accountsIterable
     *     .filter('Rating', 'Hot')
     *     .toList();
     * List<Contact> contactsWithHotRatingAccount = contactsIterable
     *     .filter('Account?.Rating', 'Hot')
     *     .toList();
     */
    public virtual ISObjectIterable filter(final String fieldName, final Object value) {
        return filter(SObjectPredicates.isEqual(fieldName, value));
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
    public virtual ISObjectIterable filter(final SObjectField field, final Object value) {
        return filter(SObjectPredicates.isEqual(field, value));
    }

    public abstract ISObjectIterable take(final ISObjectPredicate predicate);

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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Account> firstAccountsWithHotRating = accountsIterable
     *     .take('Rating', 'Hot')
     *     .toList();
     */
    public virtual ISObjectIterable take(final String fieldName, final Object value) {
        return take(SObjectPredicates.isEqual(fieldName, value));
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
    public virtual ISObjectIterable take(final SObjectField field, final Object value) {
        return take(SObjectPredicates.isEqual(field, value));
    }

    public abstract ISObjectIterable drop(final ISObjectPredicate predicate);

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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Account> restAccounts = accountsIterable
     *     .drop('Rating', 'Hot')
     *     .toList();
     */
    public virtual ISObjectIterable drop(final String fieldName, final Object value) {
        return drop(SObjectPredicates.isEqual(fieldName, value));
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
    public virtual ISObjectIterable drop(final SObjectField field, final Object value) {
        return drop(SObjectPredicates.isEqual(field, value));
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
    public virtual ISObjectIterable withoutNulls() {
        return filter(SObjectPredicates.isNull().negate());
    }

    public abstract ISObjectIterable mapTo(final ISObjectUnaryOperator mapper);

    /**
     * @description Returns a new `ISObjectIterable` with `SObject` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the parent reference field
     *
     * @return the new `ISObjectIterable`
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Account> accounts = contactsIterable
     *     .mapTo('Account')
     *     .toList();
     */
    public virtual ISObjectIterable mapTo(final String fieldName) {
        return mapTo(SObjectUnaryOperators.getSObject(fieldName));
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
    public virtual ISObjectIterable mapTo(final SObjectField field) {
        return mapTo(SObjectUnaryOperators.getSObject(field));
    }

    public abstract IIntIterable mapToInt(final ISObjectToIntFunction mapper);

    /**
     * @description Returns a new `IIntIterable` with `Integer` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `IIntIterable`
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Integer> numberOfEmployees = accountsIterable
     *     .mapToInt('NumberOfEmployees')
     *     .toList();
     */
    public virtual IIntIterable mapToInt(final String fieldName) {
        return mapToInt(SObjectToIntFunctions.get(fieldName));
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
    public virtual IIntIterable mapToInt(final SObjectField field) {
        return mapToInt(SObjectToIntFunctions.get(field));
    }

    public abstract ILongIterable mapToLong(final ISObjectToLongFunction mapper);

    /**
     * @description Returns a new `ILongIterable` with `Long` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `ILongIterable`
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Long> numberOfEmployees = accountsIterable
     *     .mapToLong('NumberOfEmployees')
     *     .toList();
     */
    public virtual ILongIterable mapToLong(final String fieldName) {
        return mapToLong(SObjectToLongFunctions.get(fieldName));
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
    public virtual ILongIterable mapToLong(final SObjectField field) {
        return mapToLong(SObjectToLongFunctions.get(field));
    }

    public abstract IDoubleIterable mapToDouble(final ISObjectToDoubleFunction mapper);

    /**
     * @description Returns a new `IDoubleIterable` with `Double` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `IDoubleIterable`
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Double> annualRevenues = accountsIterable
     *     .mapToDouble('AnnualRevenue')
     *     .toList();
     */
    public virtual IDoubleIterable mapToDouble(final String fieldName) {
        return mapToDouble(SObjectToDoubleFunctions.get(fieldName));
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
    public virtual IDoubleIterable mapToDouble(final SObjectField field) {
        return mapToDouble(SObjectToDoubleFunctions.get(field));
    }

    public abstract IObjectIterable mapToObject(final ISObjectFunction mapper);

    /**
     * @description Returns a new `IObjectIterable` with `Object` elements
     * according to `fieldName`.
     * <p>Intermediate Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the new `IObjectIterable`
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Object> birthdates = contactsIterable
     *     .mapToObject('Birthdate')
     *     .toList();
     */
    public virtual IObjectIterable mapToObject(final String fieldName) {
        return mapToObject(SObjectFunctions.get(fieldName));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Object> birthdates = contactsIterable
     *     .mapToObject(Contact.Birthdate)
     *     .toList();
     */
    public virtual IObjectIterable mapToObject(final SObjectField field) {
        return mapToObject(SObjectFunctions.get(field));
    }

    public abstract ISObjectIterable flatMapTo(final ISObjectFunction mapper);

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
    public virtual ISObjectIterable flatMapTo(final String fieldName) {
        return flatMapTo(SObjectFunctions.getSObjects(fieldName));
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
    public virtual ISObjectIterable flatMapTo(final SObjectField field) {
        return flatMapTo(SObjectFunctions.getSObjects(field));
    }

    public abstract ISObjectIterable forEach(final ISObjectConsumer consumer);

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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Account> accountsWithResetAnnualRevenue = accountsIterable
     *     .forEach('AnnualRevenue', 0)
     *     .toList();
     */
    public virtual ISObjectIterable forEach(final String fieldName, final Object value) {
        return forEach(SObjectConsumers.set(fieldName, value));
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
    public virtual ISObjectIterable forEach(final SObjectField field, final Object value) {
        return forEach(SObjectConsumers.set(field, value));
    }

    public abstract ISObjectIterable sort(final ISObjectComparator comparator);

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
    public virtual ISObjectIterable sort(final SortOrder order) {
        return sort(SObjectComparator.defaultOrder().order(order));
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * List<Account> sortedAccountsByName = accountsIterable
     *     .sort('Name')
     *     .toList();
     */
    public virtual ISObjectIterable sort(final String fieldName) {
        return sort(SObjectComparator.comparing(fieldName));
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
     * @throws NullPointerException if `fieldName` is blank or `order` is null
     *
     * @example
     * List<Account> sortedAccountsByNameDesc = accountsIterable
     *     .sort('Name', SortOrder.DESCENDING)
     *     .toList();
     */
    public virtual ISObjectIterable sort(final String fieldName, final SortOrder order) {
        return sort(SObjectComparator.comparing(fieldName).order(order));
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
    public virtual ISObjectIterable sort(final SObjectField field) {
        return sort(SObjectComparator.comparing(field));
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
     *
     * @param fieldName the field
     * @param value the field value
     *
     * @return the `OptionalSObject`
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Account firstAccountWithHotRating = accountsIterable
     *     .find('Rating', 'Hot')
     *     .get();
     */
    public virtual OptionalSObject find(final String fieldName, final Object value) {
        return find(SObjectPredicates.isEqual(fieldName, value));
    }

    /**
     * @description Returns an `OptionalSObject` describing the first element
     * which has `value` of `field`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param field the field
     * @param value the field value
     *
     * @return the `OptionalSObject`
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Account firstAccountWithHotRating = accountsIterable
     *     .find(Account.Rating, 'Hot')
     *     .get();
     */
    public virtual OptionalSObject find(final SObjectField field, final Object value) {
        return find(SObjectPredicates.isEqual(field, value));
    }

    public abstract Boolean every(final ISObjectPredicate predicate);

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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Boolean isEveryAccountWithHotRating = accountsIterable
     *     .every('Rating', 'Hot');
     */
    public virtual Boolean every(final String fieldName, final Object value) {
        return every(SObjectPredicates.isEqual(fieldName, value));
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
        return every(SObjectPredicates.isEqual(field, value));
    }

    public abstract Boolean some(final ISObjectPredicate predicate);

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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Boolean isSomeAccountWithHotRating = accountsIterable
     *     .some('Rating', 'Hot');
     */
    public virtual Boolean some(final String fieldName, final Object value) {
        return some(SObjectPredicates.isEqual(fieldName, value));
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
        return some(SObjectPredicates.isEqual(field, value));
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
     *     .none(SObjectPredicates.isEqual(Account.Rating, 'Hot'));
     */
    public virtual Boolean none(final ISObjectPredicate predicate) {
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Boolean isNoAccountWithHotRating = accountsIterable
     *     .none('Rating', 'Hot');
     */
    public virtual Boolean none(final String fieldName, final Object value) {
        return none(SObjectPredicates.isEqual(fieldName, value));
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
        return none(SObjectPredicates.isEqual(field, value));
    }

    /**
     * @description Returns an `OptionalSObject` describing the maximum `SObject` element
     * according to `comparator`.
     * <p>Terminal Operation.</p>
     *
     * @param comparator the comparator
     *
     * @return the `OptionalSObject` describing the result
     *
     * @throws NullPointerException if `comparator` is null
     *
     * @example
     * Account accountWithMaxAnnualRevenue = accountsIterable
     *     .max(SObjectComparator.comparing(Account.AnnualRevenue))
     *     .get();
     */
    public virtual OptionalSObject max(final ISObjectComparator comparator) {
        return reduce(SObjectBinaryOperator.maxBy(comparator));
    }

    /**
     * @description Returns an `OptionalSObject` describing the maximum `SObject` element
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `OptionalSObject` describing the result
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Account accountWithMaxAnnualRevenue = accountsIterable
     *     .max('AnnualRevenue')
     *     .get();
     */
    public virtual OptionalSObject max(final String fieldName) {
        return max(SObjectComparator.comparing(fieldName));
    }

    /**
     * @description Returns an `OptionalSObject` describing the maximum `SObject` element
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `OptionalSObject` describing the result
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Account accountWithMaxAnnualRevenue = accountsIterable
     *     .max(Account.AnnualRevenue)
     *     .get();
     */
    public virtual OptionalSObject max(final SObjectField field) {
        return max(SObjectComparator.comparing(field));
    }

    /**
     * @description Returns an `OptionalSObject` describing the minimum `SObject` element
     * according to `comparator`.
     * <p>Terminal Operation.</p>
     *
     * @param comparator the comparator
     *
     * @return the `OptionalSObject` describing the result
     *
     * @throws NullPointerException if `comparator` is null
     *
     * @example
     * Account accountWithMinAnnualRevenue = accountsIterable
     *     .min(SObjectComparator.comparing(Account.AnnualRevenue))
     *     .get();
     */
    public virtual OptionalSObject min(final ISObjectComparator comparator) {
        return reduce(SObjectBinaryOperator.minBy(comparator));
    }

    /**
     * @description Returns an `OptionalSObject` describing the minimum `SObject` element
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `OptionalSObject` describing the result
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Account accountWithMinAnnualRevenue = accountsIterable
     *     .min('AnnualRevenue')
     *     .get();
     */
    public virtual OptionalSObject min(final String fieldName) {
        return min(SObjectComparator.comparing(fieldName));
    }

    /**
     * @description Returns an `OptionalSObject` describing the minimum `SObject` element
     * according to `field`.
     * <p>Terminal Operation.</p>
     *
     * @param field the field
     *
     * @return the `OptionalSObject` describing the result
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Account accountWithMaxAnnualRevenue = accountsIterable
     *     .min(Account.AnnualRevenue)
     *     .get();
     */
    public virtual OptionalSObject min(final SObjectField field) {
        return min(SObjectComparator.comparing(field));
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
    public virtual Double sum(final ISObjectToDoubleFunction classifier) {
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Double sumOfAnnualRevenue = accountsIterable
     *     .sum('AnnualRevenue');
     */
    public virtual Double sum(final String fieldName) {
        return sum(SObjectToDoubleFunctions.get(fieldName));
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
        return sum(SObjectToDoubleFunctions.get(field));
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
    public virtual OptionalDouble avg(final ISObjectToDoubleFunction classifier) {
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
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Double avgAnnualRevenue = accountsIterable
     *     .avg('AnnualRevenue')
     *     .get();
     */
    public virtual OptionalDouble avg(final String fieldName) {
        return avg(SObjectToDoubleFunctions.get(fieldName));
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
    public virtual OptionalDouble avg(final SObjectField field) {
        return avg(SObjectToDoubleFunctions.get(field));
    }

    /**
     * @description Accumulates elements returned by `mapper` into a `List<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `List<Object>` containing the collected elements
     *
     * @example
     * List<Object> accountNames = accountsIterable.toList(SObjectFunctions.get('Name'));
     */
    public virtual List<Object> toList(final ISObjectFunction mapper) {
        return toList(mapper, List<Object>.class);
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
        return toList(fieldName, List<Object>.class);
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
        return toList(field, List<Object>.class);
    }

    public abstract List<Object> toList(final ISObjectFunction mapper, final Type listType);

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
     * @throws NullPointerException if `fieldName` is blank or `listType` is null
     *
     * @example
     * List<String> accountNames = (List<String>) accountsIterable
     *     .toList('Name', List<String>.class);
     */
    public virtual List<Object> toList(final String fieldName, final Type listType) {
        return toList(SObjectFunctions.get(fieldName), listType);
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
        return toList(SObjectFunctions.get(field), listType);
    }

    public abstract Set<Object> toSet(final ISObjectFunction mapper);

    /**
     * @description Accumulates `Object` elements into a `Set<Object>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Set<Object>` containing the collected elements field values
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Set<Object> createdDates = contactsIterable.toSet('CreatedDate');
     */
    public virtual Set<Object> toSet(final String fieldName) {
        return toSet(SObjectFunctions.get(fieldName));
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
        return toSet(SObjectFunctions.get(field));
    }

    public abstract Set<Id> toIdSet(final ISObjectFunction mapper);

    /**
     * @description Accumulates `Id` elements into a `Set<Id>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Set<Id>` containing the collected elements field values
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Set<Id> accountIds = contactsIterable.toIdSet('AccountId');
     */
    public virtual Set<Id> toIdSet(final String fieldName) {
        return toIdSet(SObjectFunctions.get(fieldName));
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
        return toIdSet(SObjectFunctions.get(field));
    }

    public abstract Set<String> toStringSet(final ISObjectFunction mapper);

    /**
     * @description Accumulates `String` elements into a `Set<String>`
     * according to `fieldName`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Set<String>` containing the collected elements field values
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Set<String> accountNames = accountsIterable.toStringSet('Name');
     */
    public virtual Set<String> toStringSet(final String fieldName) {
        return toStringSet(SObjectFunctions.get(fieldName));
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
        return toStringSet(SObjectFunctions.get(field));
    }

    public abstract Map<Id, SObject> toByIdMap(final ISObjectFunction keyMapper, final Type mapType);

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
     * @throws NullPointerException if `fieldName` is blank or `mapType` is null
     *
     * @example
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) contactsIterable
     *     .toByIdMap('AccountId', Map<Id, Contact>.class);
     */
    public virtual Map<Id, SObject> toByIdMap(final String fieldName, final Type mapType) {
        return toByIdMap(SObjectFunctions.get(fieldName), mapType);
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
     * @throws NullPointerException if `fieldName` is blank or `mapType` is null
     *
     * @example
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) contactsIterable
     *     .toByIdMap(Contact.AccountId, Map<Id, Contact>.class);
     */
    public virtual Map<Id, SObject> toByIdMap(final SObjectField field, final Type mapType) {
        return toByIdMap(SObjectFunctions.get(field), mapType);
    }

    public abstract Map<String, SObject> toByStringMap(final ISObjectFunction keyMapper, final Type mapType);

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
     * @throws NullPointerException if `fieldName` is blank or `mapType` is null
     *
     * @example
     * Map<String, Account> accountByName = (Map<String, Account>) accountsIterable
     *     .toByStringMap('Name', Map<String, Account>.class);
     */
    public virtual Map<String, SObject> toByStringMap(final String fieldName, final Type mapType) {
        return toByStringMap(SObjectFunctions.get(fieldName), mapType);
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
        return toByStringMap(SObjectFunctions.get(field), mapType);
    }

    public abstract Map<Id, List<SObject>> groupById(final ISObjectFunction keyMapper);

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Map<Id, List<SObject>>` containing the iterable elements
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = contactsIterable.groupById('AccountId');
     */
    public virtual Map<Id, List<SObject>> groupById(final String fieldName) {
        return groupById(SObjectFunctions.get(fieldName));
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
        return groupById(SObjectFunctions.get(field));
    }

    public abstract Map<String, List<SObject>> groupByString(final ISObjectFunction keyMapper);

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are `fieldName` values and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     *
     * @return the `Map<String, List<SObject>>` containing the iterable elements
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Map<String, List<Account>> accountsByRating = accountsIterable.groupByString('Rating');
     */
    public virtual Map<String, List<SObject>> groupByString(final String fieldName) {
        return groupByString(SObjectFunctions.get(fieldName));
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
        return groupByString(SObjectFunctions.get(field));
    }

    public abstract Map<Boolean, List<SObject>> partition(final ISObjectPredicate predicate);

    /**
     * @description Partition `SObject` elements by `fieldName` having `value`.
     * <p>Terminal Operation.</p>
     *
     * @param fieldName the field
     * @param value the satisfying value
     *
     * @return the `Map<Boolean, List<SObject>>` containing the iterable elements
     *
     * @throws NullPointerException if `fieldName` is blank
     *
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = accountsIterable.partition('Rating', 'Hot');
     */
    public virtual Map<Boolean, List<SObject>> partition(final String fieldName, final Object value) {
        return partition(SObjectPredicates.isEqual(fieldName, value));
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
        return partition(SObjectPredicates.isEqual(field, value));
    }
    //</editor-fold>

}
