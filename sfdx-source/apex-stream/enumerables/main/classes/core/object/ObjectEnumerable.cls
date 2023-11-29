/**
 * @description Provides a skeletal implementation of {@link IObjectEnumerable}.
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 */
@SuppressWarnings('PMD.ExcessivePublicCount, PMD.ExcessiveClassLength')
public abstract inherited sharing class ObjectEnumerable implements IObjectEnumerable {

    //<editor-fold desc="Iterator">
    /**
     * @description Returns an instance of an iterator for this enumerable.
     * <p>Terminal Operation.</p>
     *
     * @return the iterator
     */
    public abstract Iterator<Object> iterator();
    //</editor-fold>

    //<editor-fold desc="Sources">
    /**
     * @description Returns a new `ObjectEnumerable` from the current
     * to which another `iterable` is appended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
     * List<String> append = (List<String>) [ObjectEnumerable].of(strs1)
     *     .append(strs2)
     *     .toList(String.class);
     * // ['foo', 'bar', 'baz', 'qux', 'fred', 'foo']
     */
    public abstract ObjectEnumerable append(final Iterable<Object> iterable);

    /**
     * @description Returns a new `ObjectEnumerable` from the current
     * to which another `iterable` is prepended.
     * <p>Intermediate Operation.</p>
     *
     * @param iterable the other iterable
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
     * List<String> prepend = (List<String>) [ObjectEnumerable].of(strs1)
     *     .prepend(strs2)
     *     .toList(String.class);
     * // ['qux', 'fred', 'foo', 'foo', 'bar', 'baz']
     */
    public abstract ObjectEnumerable prepend(final Iterable<Object> iterable);
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    /**
     * @description Returns a new `ObjectEnumerable` as a set union
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
     * List<String> union = (List<String>) [ObjectEnumerable].of(strs1)
     *     .union(strs2)
     *     .toList(String.class);
     * // ['foo', 'bar', 'baz', 'qux', 'fred']
     */
    public virtual ObjectEnumerable union(final Iterable<Object> iterable) {
        return (ObjectEnumerable) append(iterable).distinct();
    }

    /**
     * @description Returns a new `ObjectEnumerable` as a set union
     * of the current and another iterables according to `classifier`.
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `iterable` or `classifier` is null
     *
     * @example
     * public class ToLowerCaseOperator extends Operator {
     *     public override Object apply(Object o) { return ((String) o).toLowerCase(); }
     * }
     * List<Object> strs1 = new List<String>{ 'foo', 'Bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'Foo' };
     * List<String> union = (List<String>) [ObjectEnumerable].of(strs1)
     *     .union(strs2, new ToLowerCaseOperator())
     *     .toList(String.class);
     * // ['foo', 'Bar', 'baz', 'qux', 'fred']
     */
    public virtual ObjectEnumerable union(final Iterable<Object> iterable, final IFunction classifier) {
        return (ObjectEnumerable) append(iterable).distinct(classifier);
    }

    /**
     * @description Returns a new `ObjectEnumerable` as a set intersection
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
     * List<String> intersect = (List<String>) [ObjectEnumerable].of(strs1)
     *     .intersect(strs2)
     *     .toList(String.class);
     * // ['foo']
     */
    public virtual ObjectEnumerable intersect(final Iterable<Object> iterable) {
        return (ObjectEnumerable) distinct().filter(BasePredicates.isIn(iterable));
    }

    /**
     * @description Returns a new `ObjectEnumerable` as a set intersection
     * of the current and another iterables according to `classifier`.
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `iterable` or `classifier` is null
     *
     * @example
     * public class ToLowerCaseOperator extends Operator {
     *     public override Object apply(Object o) { return ((String) o).toLowerCase(); }
     * }
     * List<Object> strs1 = new List<String>{ 'foo', 'Bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'Foo' };
     * List<String> intersect = (List<String>) [ObjectEnumerable].of(strs1)
     *     .intersect(strs2, new ToLowerCaseOperator())
     *     .toList(String.class);
     * // ['foo']
     */
    public virtual ObjectEnumerable intersect(final Iterable<Object> iterable, final IFunction classifier) {
        return (ObjectEnumerable) distinct(classifier).filter(BasePredicates.isIn(
            classifier, (Iterable<Object>) EnumerablePipeline.toObjectSet(iterable, classifier)
        ));
    }

    /**
     * @description Returns a new `ObjectEnumerable` as a set difference
     * of the current and another iterables.
     *
     * @param iterable the other iterable
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
     * List<String> except = (List<String>) [ObjectEnumerable].of(strs1)
     *     .except(strs2)
     *     .toList(String.class);
     * // ['bar', 'baz']
     * List<String> except1 = (List<String>) [ObjectEnumerable].of(strs2)
     *     .except(strs1)
     *     .toList(String.class);
     * // ['qux', 'fred']
     */
    public virtual ObjectEnumerable except(final Iterable<Object> iterable) {
        return (ObjectEnumerable) distinct().filter(BasePredicates.isIn(iterable).negate());
    }

    /**
     * @description Returns a new `ObjectEnumerable` as a set difference
     * of the current and another iterables according to `classifier`.
     *
     * @param iterable the other iterable
     * @param classifier the classifier function
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `iterable` or `classifier` is null
     *
     * @example
     * public class ToLowerCaseOperator extends Operator {
     *     public override Object apply(Object o) { return ((String) o).toLowerCase(); }
     * }
     * List<Object> strs1 = new List<String>{ 'foo', 'Bar', 'baz' };
     * List<Object> strs2 = new List<String>{ 'qux', 'fred', 'Foo' };
     * List<String> except = (List<String>) [ObjectEnumerable].of(strs1)
     *     .except(strs2, new ToLowerCaseOperator())
     *     .toList(String.class);
     * // ['Bar', 'baz']
     * List<String> except1 = (List<String>) [ObjectEnumerable].of(strs2)
     *     .except(strs1, new ToLowerCaseOperator())
     *     .toList(String.class);
     * // ['qux', 'fred']
     */
    public virtual ObjectEnumerable except(final Iterable<Object> iterable, final IFunction classifier) {
        return (ObjectEnumerable) distinct(classifier).filter(BasePredicates.isIn(
            classifier, (Iterable<Object>) EnumerablePipeline.toObjectSet(iterable, classifier)
        ).negate());
    }

    /**
     * @description Returns a `ObjectEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `ObjectEnumerable`
     *
     * @example
     * List<String> distinct = (List<String>)
     *     [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'foo', 'bar' })
     *     .distinct()
     *     .toList(String.class); // ['foo', 'bar', 'baz']
     */
    public abstract ObjectEnumerable distinct();

    /**
     * @description Returns a new `ObjectEnumerable` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `classifier` is null
     * 
     * @example
     * public class ToLowerCaseOperator extends Operator {
     *     public override Object apply(Object o) { return ((String) o).toLowerCase(); }
     * }
     * List<String> distinct = (List<String>)
     *     [ObjectEnumerable].of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
     *     .distinct(new ToLowerCaseOperator())
     *     .toList(String.class); // ['foo', 'Bar', 'baz']
     */
    public abstract ObjectEnumerable distinct(final IFunction classifier);

    /**
     * @description Returns a new `ObjectEnumerable` with elements
     * that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `predicate` is null
     * 
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * List<String> filtered = (List<String>)
     *     [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .filter(new ContainsPredicate('a'))
     *     .toList(String.class); // ['bar', 'baz']
     */
    public abstract ObjectEnumerable filter(final IPredicate predicate);

    /**
     * @description Returns a new `ObjectEnumerable` that takes elements
     * while `predicate` returns `true`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `predicate` is null
     * 
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * List<String> firstMatched = (List<String>)
     *     [ObjectEnumerable].of(new List<String>{ 'bar', 'baz', 'foo' })
     *     .take(new ContainsPredicate('a'))
     *     .toList(String.class); // ['bar', 'baz']
     */
    public abstract ObjectEnumerable take(final IPredicate predicate);

    /**
     * @description Returns a new `ObjectEnumerable` that drops elements
     * while `predicate` returns `true`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * List<String> rest = (List<String>)
     *     [ObjectEnumerable].of(new List<String>{ 'bar', 'baz', 'foo' })
     *     .take(new ContainsPredicate('a'))
     *     .toList(String.class); // ['foo']
     */
    public abstract ObjectEnumerable drop(final IPredicate predicate);

    /**
     * @description Returns a new `ObjectEnumerable` without null elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `ObjectEnumerable`
     *
     * @example
     * List<String> withoutNulls = (List<String>)
     *     [ObjectEnumerable].of(new List<String>{ 'foo', null, 'bar', 'baz', null })
     *     .withoutNulls()
     *     .toList(String.class); // ['foo', 'bar', 'baz']
     */
    public virtual ObjectEnumerable withoutNulls() {
        return filter(BasePredicates.isNotNull());
    }

    /**
     * @description Returns a `ObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this enumerable.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class ToLowerCaseOperator extends Operator {
     *     public override Object apply(Object o) { return ((String) o).toLowerCase(); }
     * }
     * List<String> normalizedStrings = (List<String>)
     *     [ObjectEnumerable].of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
     *     .mapTo(new ToLowerCaseOperator())
     *     .toList(String.class); // ['foo', 'bar', 'baz', 'foo', 'bar']
     */
    public abstract ObjectEnumerable mapTo(final IOperator mapper);

    /**
     * @description Returns a `ObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this enumerable.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return ((String) o).length(); }
     * }
     * List<Integer> ints = [ObjectEnumerable].of(new List<String>{ 'f', 'ba', 'baz' })
     *     .mapToInt(new LengthFunction())
     *     .toList(); // [1, 2, 3]
     */
    public abstract IntEnumerable mapToInt(final IFunction mapper);

    /**
     * @description Returns a `ObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this enumerable.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return (Long) ((String) o).length(); }
     * }
     * List<Long> longs = [ObjectEnumerable].of(new List<String>{ 'f', 'ba', 'baz' })
     *     .mapToLong(new LengthFunction())
     *     .toList(); // [1L, 2L, 3L]
     */
    public abstract LongEnumerable mapToLong(final IFunction mapper);

    /**
     * @description Returns a `ObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this enumerable.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return (Double) ((String) o).length(); }
     * }
     * List<Double> doubles = [ObjectEnumerable].of(new List<String>{ 'f', 'ba', 'baz' })
     *     .mapToDouble(new LengthFunction())
     *     .toList(); // [1.0, 2.0, 3.0]
     */
    public abstract DoubleEnumerable mapToDouble(final IFunction mapper);

    /**
     * @description Returns a `SObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this enumerable.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `SObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class CreateAccountFunction extends Function {
     *     public override Object apply(Object o) { return new Account(Name = (String) o); }
     * }
     * List<Account> accounts = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .mapToSObject(new CreateAccountFunction())
     *     .toList(); //
     * [
     *   { Name: 'foo' },
     *   { Name: 'bar' },
     *   { Name: 'baz' }
     * ]
     */
    public abstract SObjectEnumerable mapToSObject(final IFunction mapper);

    /**
     * @description Returns a new `ObjectEnumerable` with `Object` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Object>`
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class ToLowerCaseFunction extends Function {
     *     public override Object apply(Object o) { return new List<String>{ ((String) o).toLowerCase() }; }
     * }
     * List<String> normalizedStrings = (List<String>)
     *     [ObjectEnumerable].of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
     *     .flatMapTo(new ToLowerCaseFunction())
     *     .toList(String.class); // ['foo', 'bar', 'baz', 'foo', 'bar']
     */
    public abstract ObjectEnumerable flatMapTo(final IFunction mapper);

    /**
     * @description Returns a new `IntEnumerable` with `Integer` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     *
     * @return the new `IntEnumerable`
     * 
     * @throws NullPointerException if `mapper` is null
     * 
     * @example
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return new List<Integer>{ ((String) o).length() }; }
     * }
     * List<Integer> ints = [ObjectEnumerable].of(new List<String>{ 'f', 'ba', 'baz' })
     *     .flatMapToInt(new LengthFunction())
     *     .toList(); // [1, 2, 3]
     */
    public abstract IntEnumerable flatMapToInt(final IFunction mapper);

    /**
     * @description Returns a new `LongEnumerable` with `Long` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Long>`
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return new List<Long>{ ((String) o).length() }; }
     * }
     * List<Long> longs = [ObjectEnumerable].of(new List<String>{ 'f', 'ba', 'baz' })
     *     .flatMapToLong(new LengthFunction())
     *     .toList(); // [1L, 2L, 3L]
     */
    public abstract LongEnumerable flatMapToLong(final IFunction mapper);

    /**
     * @description Returns a new `DoubleEnumerable` with `Double` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Double>`
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return new List<Double>{ ((String) o).length() }; }
     * }
     * List<Double> doubles = [ObjectEnumerable].of(new List<String>{ 'f', 'ba', 'baz' })
     *     .flatMapToDouble(new LengthFunction())
     *     .toList(); // [1.0, 2.0, 3.0]
     */
    public abstract DoubleEnumerable flatMapToDouble(final IFunction mapper);

    /**
     * @description Returns a new `SObjectEnumerable` with `SObject` elements as a result of
     * replacing each element with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<SObject>`
     *
     * @return the new `SObjectEnumerable`
     * 
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class CreateAccountFunction extends Function {
     *     public override Object apply(Object o) { return new List<Account>{ new Account(Name = (String) o) }; }
     * }
     * List<Account> accounts = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .flatMapToSObject(new CreateAccountFunction())
     *     .toList(); //
     * [
     *   { Name: 'foo' },
     *   { Name: 'bar' },
     *   { Name: 'baz' }
     * ]
     */
    public abstract SObjectEnumerable flatMapToSObject(final IFunction mapper);

    /**
     * @description Returns a `ObjectEnumerable` after performing `consumer` action on each element.
     * <p>Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return this `ObjectEnumerable`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * public class DebugConsumer extends Consumer {
     *     public override void accept(Object o) { System.debug(o); }
     * }
     * List<String> strings = (List<String>) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .forEach(new DebugConsumer()) // prints 'foo', 'bar', 'baz'
     *     .toList(String.class); // ['foo', 'bar', 'baz']
     */
    public abstract ObjectEnumerable forEach(final IConsumer consumer);

    /**
     * @description Returns a `ObjectEnumerable` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `ObjectEnumerable`
     *
     * @example
     * List<String> sorted = (List<String>) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', null })
     *     .sort()
     *     .toList(String.class); // [null, 'bar', 'baz', 'foo']
     */
    public abstract ObjectEnumerable sort();

    /**
     * @description Returns a new `ObjectEnumerable` with sorted elements considering `order`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param order the sort order
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `order` is null
     *
     * @example
     * List<String> sorted = (List<String>) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', null })
     *     .sort(SortOrder.DESCENDING)
     *     .toList(String.class); // ['foo', 'baz', 'bar', null]
     */
    public virtual ObjectEnumerable sort(final SortOrder order) {
        return sort(Comparer.defaultOrder().order(order));
    }

    /**
     * @description Returns a new `ObjectEnumerable` with sorted elements
     * according to `comparer`.
     * <p>Intermediate Operation.</p>
     *
     * @param comparer the comparer
     *
     * @return the new `ObjectEnumerable`
     * 
     * @throws NullPointerException if `comparer` is null
     * 
     * @example
     * public class SecondLetterComparer extends Comparer {
     *     public override Integer compare(Object o1, Object o2) {
     *         String s1 = (String) o1;
     *         String s2 = (String) o2;
     *         if (s1.length() > 1 && s2.length() > 1) {
     *             return s1.split('')[1].compareTo(s2.split('')[1]);
     *         }
     *         return s1.length() <= 1 ? -1 : 1;
     *     }
     * }
     * List<String> sorted = (List<String>)
     *     [ObjectEnumerable].of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
     *     .sort(new SecondCharComparer())
     *     .toList(String.class); // ['Bar', 'baz', 'bar', 'foo', 'Foo']
     */
    public abstract ObjectEnumerable sort(final IComparer comparer);

    /**
     * @description Returns a `ObjectEnumerable` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `ObjectEnumerable`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * List<String> first2 = (List<String>) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .lim(2)
     *     .toList(String.class); // ['foo', 'baz']
     */
    public abstract ObjectEnumerable lim(final Integer lim);

    /**
     * @description Returns a new `ObjectEnumerable` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `ObjectEnumerable`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * List<String> rest = (List<String>) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .skip(1)
     *     .toList(String.class); // ['bar', 'baz']
     */
    public abstract ObjectEnumerable skip(final Integer n);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    /**
     * @description Performs a reduction on `Object` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Object` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class ConcatenateBiOperator extends BiOperator {
     *     private final String separator;
     *     public ConcatenateBiOperator(String separator) { this.separator = separator; }
     *     public override Object apply(Object o1, Object o2) {
     *         return String.isEmpty((String) o1) ? (String) o2 : o1 + separator + o2;
     *     }
     * }
     * String concatenated = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .reduce('', new ConcatenateBiOperator('-')); // 'foo-bar-baz'
     * String concatenated1 = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .reduce('seed', new ConcatenateBiOperator(';')); // 'seed;foo;bar;baz'
     */
    public abstract Object reduce(final Object identity, final IBiOperator accumulator);

    /**
     * @description Performs a reduction on `Object` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` Object describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Optional` Object result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class ConcatenateBiOperator extends BiOperator {
     *     private final String separator;
     *     public ConcatenateBiOperator(String separator) { this.separator = separator; }
     *     public override Object apply(Object o1, Object o2) {
     *         return String.isEmpty((String) o1) ? (String) o2 : o1 + separator + o2;
     *     }
     * }
     * String concatenated = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .reduce(new ConcatenateBiOperator('-'))
     *     .get(); // 'foo-bar-baz'
     * String concatenated1 = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .reduce(new ConcatenateBiOperator(';'))
     *     .get(); // 'seed;foo;bar;baz'
     */
    public abstract Optional reduce(final IBiOperator accumulator);

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container using `collector`.
     * <p>Terminal Operation.</p>
     *
     * @param collector the function that returns a mutable result container
     *
     * @return the `Object` result of the collection
     *
     * @throws NullPointerException if `collector` is null
     *
     * @example
     * // Simple collecting
     * public class AddToStringSetBiConsumer extends BiConsumer {
     *     public override void accept(Object container, Object o) { ((Set<String>) container).add((String) o); }
     * }
     * Set<String> strings = (Set<String>)
     *     [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', 'foo', 'bar' })
     *     .collect(Collector.of(Supplier.of(Set<String>.class), new AddToStringSetBiConsumer()));
     * // ['foo', 'bar', 'baz', 'quux', 'a']
     * // Cascaded operation
     * public class LengthFunction extends Function {
     *     public override Object apply(Object o) { return ((String) o).length(); }
     * }
     * public class PutToObjectsByIntMap extends BiConsumer {
     *     private final IFunction classifier;
     *     public PutToObjectsByIntMap(ICollector downstream, IFunction classifier) {
     *         this.downstream = downstream;
     *         this.classifier = classifier;
     *     }
     *     public override void accept(Object container, Object o) {
     *         final Map<Integer, Set<String>> m = (Map<Integer, Set<String>>) container;
     *         final Integer key = (Integer) classifier.apply(o);
     *         if (!m.containsKey(key)) { m.put(key, (Set<String>) downstream.supplier().get()); }
     *         downstream.accumulator().accept(m.get(key), o);
     *     }
     * }
     * // the classifier function mapping input elements to keys.
     * IFunction classificationFunction = new LengthFunction();
     * // the supplier providing a new empty Map into which the results will be inserted.
     * ISupplier mapSupplier = Supplier.of(Map<Integer, Set<String>>.class);
     * // the Collector implementing the downstream reduction.
     * ICollector downstreamCollector = Collector.of(Supplier.of(Set<String>.class), new AddToStringSetBiConsumer());
     * // the function that folds an element into a result container.
     * IBiConsumer accumulator = new PutToObjectsByIntMap(downstreamCollector, new LengthFunction());
     * // the Collector implementing the cascaded group-by operation.
     * ICollector groupByLengthCollector = Collector.of(mapSupplier, accumulator);
     * Map<Integer, Set<String>> stringsByLength = (Map<Integer, Set<String>>)
     *     [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', 'foo', 'bar' })
     *     .collect(groupByLengthCollector); //
     * {
     *   1: ['a'],
     *   3: ['foo', 'bar', 'baz'],
     *   4: ['quux']
     * }
     * // The same result can be obtained by using built-in Collectors
     * Map<Integer, Set<String>> stringsByLength1 = (Map<Integer, Set<String>>)
     *     [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', 'foo', 'bar' })
     *     .collect(
     *         Collectors.groupingByInt(new LengthFunction(), Collectors.toStringSet())
     *             .cast(Map<Integer, Set<String>>.class)
     *     );
     */
    public abstract Object collect(final ICollector collector);

    /**
     * @description Returns an `Optional` Object describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Optional` Object
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * String firstFound = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .find(new ContainsPredicate('a'))
     *     .get(); // 'bar'
     */
    public abstract Optional find(final IPredicate predicate);

    /**
     * @description Returns whether all elements match `predicate`.
     * If `ObjectEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * Boolean doesEveryStringContainA = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .every(new ContainsPredicate('a')); // false
     */
    public abstract Boolean every(final IPredicate predicate);

    /**
     * @description Returns whether some element matches `predicate`.
     * If `ObjectEnumerable` is empty then `false` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * Boolean doesSomeStringContainA = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .some(new ContainsPredicate('a')); // true
     */
    public abstract Boolean some(final IPredicate predicate);

    /**
     * @description Returns whether no elements match `predicate`.
     * If `ObjectEnumerable` is empty then `true` is returned.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return `true` or `false`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String s;
     *     public ContainsPredicate(String s) { this.s = s; }
     *     public override Boolean test(Object o) { return ((String) o).contains(s); }
     * }
     * Boolean doesNoneStringContainA = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .none(new ContainsPredicate('a')); // false
     */
    public virtual Boolean none(final IPredicate predicate) {
        return !some(predicate);
    }

    /**
     * @description Returns an `Optional` Object describing the maximum element according to `comparer`.
     * <p>Terminal Operation.</p>
     *
     * @param comparer the comparer
     *
     * @return the `Optional` Object
     * 
     * @throws NullPointerException if `comparer` is null
     *
     * @example
     * public class LengthComparer extends Comparer {
     *    public override Integer compare(Object o1, Object o2) {
     *        Integer len1 = o1 == null ? -1 : ((String) o1).length();
     *        Integer len2 = o2 == null ? -1 : ((String) o2).length();
     *        return len1 > len2 ? 1 : len1 == len2 ? 0 : -1; 
     *    }
     * }
     * String maxLen = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', null })
     *     .max()
     *     .get(); // 'quux'
     */
    public virtual Optional max(final IComparer comparer) {
        return reduce(BiOperator.maxBy(comparer));
    }

    /**
     * @description Returns an `Optional` Object describing the minimum element according to `comparer`.
     * <p>Terminal Operation.</p>
     *
     * @param comparer comparer the comparer
     *
     * @return the `Optional` Object
     * 
     * @throws NullPointerException if `comparer` is null
     *
     * @example
     * public class LengthComparer extends Comparer {
     *    public override Integer compare(Object o1, Object o2) {
     *        Integer len1 = o1 == null ? -1 : ((String) o1).length();
     *        Integer len2 = o2 == null ? -1 : ((String) o2).length();
     *        return len1 > len2 ? 1 : len1 == len2 ? 0 : -1; 
     *    }
     * }
     * String minLen = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', null })
     *     .min()
     *     .get(); // null
     * String minLen1 = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a' })
     *     .min()
     *     .get(); // 'a'
     */
    public virtual Optional min(final IComparer comparer) {
        return reduce(BiOperator.minBy(comparer));
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     *
     * @example
     * Integer count = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .count(); // 3
     */
    public abstract Integer count();

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     *
     * @example
     * [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
     *     .isEmpty(); // false
     * [ObjectEnumerable].of(new List<String>())
     *     .isEmpty(); // true
     */
    public abstract Boolean isEmpty();

    /**
     * @description Accumulates elements into a `List<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<Object>` containing the enumerable elements
     *
     * @example
     * List<Object> strings = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'qux' })
     *     .skip(1)
     *     .toList(); // ['bar', 'baz', 'qux']
     */
    public abstract List<Object> toList();

    /**
     * @description Accumulates `Object` elements into a `List<T>` so it can be cast.
     * <p>Terminal Operation.</p>
     *
     * @param elementType the element type argument of List
     *
     * @return the `List<Object>` containing the iterable elements that can be cast to `List<T>`
     * 
     * @throws NullPointerException if `elementType` is null
     * 
     * @example
     * List<String> strings = (List<String>.class)
     *     [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'qux' })
     *     .skip(1)
     *     .toList(String.class); // ['bar', 'baz', 'qux']
     */
    public virtual List<Object> toList(final Type elementType) {
        return (List<Object>) collect(BaseCollectors.toList(elementType));
    }

    /**
     * @description Accumulates elements into a `Set<Object>` cannot be cast.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<Object>` containing the enumerable elements
     *
     * @example
     * Set<Object> strings = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'qux', 'foo', 'bar' })
     *     .skip(1)
     *     .toSet(); // ['bar', 'baz', 'qux']
     */
    public abstract Set<Object> toSet();
    //</editor-fold>

}
