/**
 * @description A sequence of `SObject` elements supporting aggregate operations.
 * Stream operations are composed of stream chain. A stream chain consists of:
 * <ul>
 *     <li>A Source (which might be an iterable (such as list or set), an iterator, a generator function, etc).</li>
 *     <li>Zero or more Intermediate Operations (which transform a stream into another stream,
 *     such as {@link SObjectStream.filter(IPredicate))}.</li>
 *     <li>A Terminal Operation (which produces a result such as
 *     {@link SObjectStream.count()} or {@link SObjectStream.collect(ICollector)}).</li>
 * </ul>
 * <p>Streams are <strong>lazy</strong>:</p>
 * <ul>
 *     <li>Intermediate operations describe how a stream is processed without performing any action.</li>
 *     <li>Computation is only performed when the terminal operation is initiated,
 * and source elements are consumed only as needed.</li>
 * </ul>
 * <p>A stream may not consume all elements. It may be infinite and complete in finite time.</p>
 * <p>A stream should be operated on (invoking an intermediate or terminal stream operation)
 * only <strong>once</strong>.
 * A stream throws {@link IllegalStateException} if it detects that the stream is being reused.</p>
 * <p>Contract:</p>
 * <ul>
 *     <li>Must be non-interfering (do not modify the stream source but may mutate its elements).</li>
 *     <li>Should be stateless in most cases.</li>
 * </ul>
 * <p>Unlike in Java, an Apex Streams may execute only <strong>sequentially</strong>,
 * i.e. do not support `spliterator()`.</p>
 * <p>There are primitive specializations for {@link IntStream}, {@link LongStream},
 * and {@link DoubleStream} and {@link ObjectStream} for Object references.</p>
 * <p>Sequences and streams equally ensure the fulfillment of the set goals,
 * but are implemented in different ways.</p>
 *
 * @see ObjectStream
 * @see IntStream
 * @see LongStream
 * @see DoubleStream
 *
 * @author Oleh Berehovskyi
 *
 * @group Enumerables
 *
 * @example
 * Double annualRevenueSumOfUniqueHotRankedAccounts
 *     = SObjectStream.of(accounts)
 *         .filter(Account.Rating, 'Hot')
 *         .distinct()
 *         .mapToDouble(Account.AnnualRevenue)
 *         .sum();
 */
@SuppressWarnings(
    'PMD.CognitiveComplexity, PMD.CyclomaticComplexity, PMD.ExcessiveClassLength, PMD.ExcessivePublicCount'
)
public virtual inherited sharing class SObjectStream extends SObjectEnumerable {

    private final transient Iterator<SObject> iterator;

    /**
     * @description A flag defining whether this stream has been linked or consumed.
     */
    public Boolean isOperated { get { return isOperated; } protected set; } {
        isOperated = false;
    }

    protected SObjectStream() {
        this(new List<SObject>().iterator());
    }

    protected SObjectStream(final Iterator<SObject> iterator) {
        this.iterator = iterator;
    }

    //<editor-fold desc="Iterator">
    // @start-group Iterator
    /**
     * @description Returns an internal iterator for the elements of this stream.
     * <p>Terminal Operation.</p>
     *
     * @return the internal `Iterator<SObject>`
     *
     * @throws IllegalArgumentException if this stream has been operated (linked or consumed)
     */
    public override Iterator<SObject> iterator() {
        Validate.isTrue(!isOperated, Label.AS_ErrorMessage_StreamOperated);
        try {
            return iterator;
        } finally {
            isOperated = true;
        }
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Sources">
    // @start-group Sources
    /**
     * @description Returns a `SObjectEnumerable` created from `iterator`.
     *
     * @param iterator the iterator
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `iterator` is null
     *
     * @example
     * SObjectEnumerable accStream = SObjectStream.of(new List<Account>(accounts).iterator());
     * SObjectEnumerable accStream = SObjectStream.of(new Set<Account>(accounts).iterator());
     * SObjectEnumerable accStream = SObjectStream.of(
     *     (Iterator<Account>) Database.getQueryLocator('SELECT Id FROM Account').iterator()
     * );
     * SObjectEnumerable accStream = SObjectStream.of(otherStream.iterator());
     */
    public static SObjectEnumerable of(final Iterator<SObject> iterator) {
        Validate.notNull(iterator);
        return new SObjectStream(iterator);
    }

    /**
     * @description Returns a `SObjectEnumerable` created from `iterable`.
     *
     * @param iterable the iterable
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * SObjectEnumerable accStream = SObjectStream.of(new List<Account>(accounts));
     * SObjectEnumerable accStream = SObjectStream.of((Iterable<Account>) new Set<Account>(accounts));
     * SObjectEnumerable accStream = SObjectStream.of(stream1);
     */
    public static SObjectEnumerable of(final Iterable<SObject> iterable) {
        Validate.notNull(iterable);
        return new SObjectStream(iterable.iterator());
    }

    /**
     * @description Returns a `SObjectEnumerable` created from `iterable` if non-null,
     * otherwise returns an empty `SObjectEnumerable`.
     *
     * @param iterable the iterable
     *
     * @return the new `SObjectEnumerable` if `iterable` is non-null,
     * otherwise an empty `SObjectEnumerable`
     *
     * @example
     * SObjectEnumerable accStream = SObjectStream.ofNullable(new List<Account>(accounts));
     * SObjectEnumerable accStream = SObjectStream.ofNullable((Iterable<Account>) new Set<Account>(accounts));
     * SObjectEnumerable accStream = SObjectStream.ofNullable(stream1);
     */
    public static SObjectEnumerable ofNullable(final Iterable<SObject> iterable) {
        if (iterable == null) { return empty(); }
        return new SObjectStream(iterable.iterator());
    }

    /**
     * @description Returns an empty `SObjectEnumerable`.
     *
     * @return the empty `SObjectEnumerable`
     */
    public static SObjectEnumerable empty() {
        return new SObjectStream();
    }

    /**
     * @description Returns an infinite `SObjectEnumerable` where each element is
     * generated by `supplier`.
     *
     * @param supplier the supplier of generated elements
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `supplier` is null
     *
     * @example
     * SObjectEnumerable accStream = SObjectStream.generate(Supplier.of(Account.class));
     */
    public static SObjectEnumerable generate(final ISupplier supplier) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.generate(supplier));
    }

    /**
     * @description Returns an infinite `SObjectEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * producing a `SObjectEnumerable` consisting of `seed`, `operator(seed)`,
     * `operator(operator(seed))`, etc.
     *
     * @param seed the initial element
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `supplier` is null
     */
    public static SObjectEnumerable iterate(final SObject seed, final IOperator operator) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.iterate(seed, operator));
    }

    /**
     * @description Returns an infinite `SObjectEnumerable` produced by iterative
     * application of `operator` to an initial element `seed`,
     * conditioned on satisfying `predicate`.
     *
     * @param seed the initial element
     * @param predicate the predicate to determine when the stream must be terminated
     * @param operator the operator to be applied to the previous element to produce a new element
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `supplier` or `supplier` is null
     */
    public static SObjectEnumerable iterate(final SObject seed, final IPredicate predicate, final IOperator operator) {
        return iterate(seed, operator).take(predicate);
    }

    /**
     * @description Returns lazily concatenated `SObjectEnumerable` whose elements are all the
     * elements of the first `Iterable<SObject>` followed by all the elements of the
     * second `Iterable<SObject>`.
     *
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `iterable1` or `iterable2` is null
     *
     * @example
     * List<Account> accounts1 = new List<Account>{
     *     new Account(Name = 'foo'),
     *     new Account(Name = 'bar'),
     *     new Account(Name = 'baz')
     * };
     * List<Account> accounts2 = new List<Account>{
     *     new Account(Name = 'qux'),
     *     new Account(Name = 'fred'),
     *     new Account(Name = 'foo')
     * };
     * List<Account> concat = SObjectSequence.concat(accounts1, accounts2)
     *     .toList(); //
     * [
     *   { Name: 'foo' },
     *   { Name: 'bar' },
     *   { Name: 'baz' },
     *   { Name: 'qux' },
     *   { Name: 'fred' },
     *   { Name: 'foo' }
     * ]
     */
    public static SObjectEnumerable concat(final Iterable<SObject> iterable1, final Iterable<SObject> iterable2) {
        return concat(new List<Iterable<SObject>>{ iterable1, iterable2 });
    }

    /**
     * @description Returns lazily concatenated `List<Iterable<SObject>>`.
     *
     * @param iterables the list of `Iterable<SObject>`
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `iterables` or some element in a list is null
     *
     * @example
     * List<Account> accounts1 = new List<Account>{
     *     new Account(Name = 'foo'),
     *     new Account(Name = 'bar'),
     *     new Account(Name = 'baz')
     * };
     * List<Account> accounts2 = new List<Account>{
     *     new Account(Name = 'qux'),
     *     new Account(Name = 'fred'),
     *     new Account(Name = 'foo')
     * };
     * List<Account> concat = SObjectSequence.concat(final List<Iterable<SObject>>{ accounts1, accounts2 })
     *     .toList(); //
     * [
     *   { Name: 'foo' },
     *   { Name: 'bar' },
     *   { Name: 'baz' },
     *   { Name: 'qux' },
     *   { Name: 'fred' },
     *   { Name: 'foo' }
     * ]
     */
    public static SObjectEnumerable concat(final List<Iterable<SObject>> iterables) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.concat(iterables, SObject.class));
    }

    /**
     * @description Returns a combined `SObjectEnumerable` by applying `combiner` function
     * to each element at the same position.
     *
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `iterable1`, `iterable2` or `combiner` is null
     *
     * @example
     * List<Account> triggerOld = new List<Account>{
     *     new Account(Name = 'foo', NumberOfEmployees = 100),
     *     new Account(Name = 'bar', NumberOfEmployees = 200),
     *     new Account(Name = 'baz', NumberOfEmployees = 300)
     * };
     * List<Account> triggerNew = new List<Account>{
     *     new Account(Name = 'foo', NumberOfEmployees = 400),
     *     new Account(Name = 'bar', NumberOfEmployees = 100),
     *     new Account(Name = 'baz', NumberOfEmployees = 600)
     * };
     * SObjectSequence.zip(
     *     triggerOld,
     *     triggerNew,
     *     BiOperator.minBy(Comparator.comparing(BaseSObjectFunctions.get(Account.AnnualRevenue)))
     * ).toList(); //
     * [
     *   { Name: 'foo', NumberOfEmployees: 100 },
     *   { Name: 'bar', NumberOfEmployees: 100 },
     *   { Name: 'baz', NumberOfEmployees: 300 }
     * ]
     */
    public static SObjectEnumerable zip(
        final Iterable<SObject> iterable1,
        final Iterable<SObject> iterable2,
        final IBiOperator combiner
    ) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.zip(iterable1, iterable2, combiner));
    }

    /**
     * @description Returns a combined `SObjectEnumerable` by applying `combiner` function
     * to each element at the same position, conditioned on satisfying `predicate`.
     *
     * @param iterable1 the first `Iterable<SObject>`
     * @param iterable2 the second `Iterable<SObject>`
     * @param predicate the binary predicate
     * @param combiner the binary operator to be applied to each element at the same position
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `iterable1`, `iterable2`,
     * `predicate` or `combiner` is null
     *
     * @example
     * public class ContainsAnyBiPredicate extends BiPredicate {
     *     private final String fieldName;
     *     private final String s;
     *     public ContainsPredicate(String fieldName, String s) { 
     *         this.fieldName = fieldName; 
     *         this.s = s; 
     *     }
     *     public override Boolean test(Object o1, Object o2) {
     *         String value1 = (String) ((Account) o1).get(fieldName);
     *         String value2 = (String) ((Account) o2).get(fieldName);
     *         return value1.contains(s) || value2.contains(s);
     *     }
     * }
     * List<Account> triggerOld = new List<Account>{
     *     new Account(Name = 'foo', NumberOfEmployees = 100),
     *     new Account(Name = 'bar', NumberOfEmployees = 200),
     *     new Account(Name = 'baz', NumberOfEmployees = 300)
     * };
     * List<Account> triggerNew = new List<Account>{
     *     new Account(Name = 'foo', NumberOfEmployees = 400),
     *     new Account(Name = 'bar', NumberOfEmployees = 100),
     *     new Account(Name = 'baz', NumberOfEmployees = 600)
     * };
     * SObjectSequence.zip(
     *     triggerOld,
     *     triggerNew,
     *     new ContainsAnyBiPredicate('Name', 'a'),
     *     BiOperator.minBy(BaseSObjectFunctions.get(Account.AnnualRevenue))
     * ).toList(); //
     * [
     *   { Name: 'bar', NumberOfEmployees: 100 },
     *   { Name: 'baz', NumberOfEmployees: 300 }
     * ]
     */
    public static SObjectEnumerable zip(
        final Iterable<SObject> iterable1,
        final Iterable<SObject> iterable2,
        final IBiPredicate predicate,
        final IBiOperator combiner
    ) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.zip(iterable1, iterable2, predicate, combiner));
    }

    /**
     * @description Returns new `SObjectEnumerable` by appending `iterable`
     * to the current stream.
     *
     * @param iterable the `Iterable<SObject>` to append to the current stream
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Account> accounts1 = new List<Account>{
     *     new Account(Name = 'foo'),
     *     new Account(Name = 'bar'),
     *     new Account(Name = 'baz')
     * };
     * List<Account> accounts2 = new List<Account>{
     *     new Account(Name = 'qux'),
     *     new Account(Name = 'fred'),
     *     new Account(Name = 'foo')
     * };
     * List<Account> append = SObjectSequence.of(accounts1)
     *     .append(accounts2)
     *     .toList(); //
     * [
     *   { Name: 'foo' },
     *   { Name: 'bar' },
     *   { Name: 'baz' },
     *   { Name: 'qux' },
     *   { Name: 'fred' },
     *   { Name: 'foo' }
     * ]
     */
    public virtual override SObjectEnumerable append(final Iterable<SObject> iterable) {
        return concat(this, iterable);
    }

    /**
     * @description Returns new `SObjectEnumerable` by prepending `iterable`
     * to the current stream.
     *
     * @param iterable the `Iterable<SObject>` to prepend to the current stream
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `iterable` is null
     *
     * @example
     * List<Account> accounts1 = new List<Account>{
     *     new Account(Name = 'foo'),
     *     new Account(Name = 'bar'),
     *     new Account(Name = 'baz')
     * };
     * List<Account> accounts2 = new List<Account>{
     *     new Account(Name = 'qux'),
     *     new Account(Name = 'fred'),
     *     new Account(Name = 'foo')
     * };
     * List<Account> prepend = SObjectSequence.of(accounts1)
     *     .prepend(accounts2)
     *     .toList(); //
     * [
     *   { Name: 'foo' },
     *   { Name: 'bar' },
     *   { Name: 'baz' },
     *   { Name: 'qux' },
     *   { Name: 'fred' },
     *   { Name: 'foo' }
     * ]
     */
    public virtual override SObjectEnumerable prepend(final Iterable<SObject> iterable) {
        return concat(iterable, this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    // @start-group Intermediate Operations
    /**
     * @description Returns a `SObjectEnumerable` with elements that match `predicate`.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `SObjectEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String fieldName;
     *     private final String s;
     *     public ContainsPredicate(String fieldName, String s) {
     *         this.fieldName = fieldName; 
     *         this.s = s;
     *     }
     *     public override Boolean test(Object o) {
     *         return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
     *     }
     * }
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'foo', NumberOfEmployees = 100),
     *     new Account(Name = 'bar', NumberOfEmployees = 200),
     *     new Account(Name = 'baz', NumberOfEmployees = 300)
     * };
     * List<Account> filtered = SObjectSequence.of(accounts)
     *     .filter(new ContainsPredicate('Name', 'a'))
     *     .toList(); //
     * [
     *   { Name: 'bar', NumberOfEmployees: 200 },
     *   { Name: 'baz', NumberOfEmployees: 300 }
     * ]
     */
    public virtual override SObjectEnumerable filter(final IPredicate predicate) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.filter(iterator(), predicate));
    }

    /**
     * @description Returns a `SObjectEnumerable` which takes elements while elements match `predicate`.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `SObjectEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String fieldName;
     *     private final String s;
     *     public ContainsPredicate(String fieldName, String s) {
     *         this.fieldName = fieldName; 
     *         this.s = s;
     *     }
     *     public override Boolean test(Object o) {
     *         return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
     *     }
     * }
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'bar', NumberOfEmployees = 200),
     *     new Account(Name = 'baz', NumberOfEmployees = 300),
     *     new Account(Name = 'foo', NumberOfEmployees = 100)
     * };
     * List<Account> firstMatched = SObjectSequence.of(accounts)
     *     .take(new ContainsPredicate('Name', 'a'))
     *     .toList(); //
     * [
     *   { Name: 'bar', NumberOfEmployees: 200 },
     *   { Name: 'baz', NumberOfEmployees: 300 }
     * ]
     */
    public virtual override SObjectEnumerable take(final IPredicate predicate) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.take(iterator(), predicate));
    }

    /**
     * @description Returns a `SObjectEnumerable` which drops elements while elements match `predicate`,
     * then takes the rest.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param predicate the non-interfering, stateless predicate
     *
     * @return the `SObjectEnumerable`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String fieldName;
     *     private final String s;
     *     public ContainsPredicate(String fieldName, String s) {
     *         this.fieldName = fieldName; 
     *         this.s = s;
     *     }
     *     public override Boolean test(Object o) {
     *         return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
     *     }
     * }
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'bar', NumberOfEmployees = 200),
     *     new Account(Name = 'baz', NumberOfEmployees = 300),
     *     new Account(Name = 'foo', NumberOfEmployees = 100)
     * };
     * List<Account> rest = SObjectSequence.of(accounts)
     *     .drop(new ContainsPredicate('Name', 'a'))
     *     .toList(); //
     * [
     *   { Name: 'foo', NumberOfEmployees: 100 }
     * ]
     */
    public virtual override SObjectEnumerable drop(final IPredicate predicate) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.drop(iterator(), predicate));
    }

    /**
     * @description Returns a `SObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `SObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MapToContactOperator extends Operator {
     *     public override Object apply(Object o) {
     *         Account acc = (Account) o;
     *         return new Contact(
     *             LastName = acc.Name,
     *             AccountId = acc.Id
     *         );
     *     }
     * }
     * Account acc1 = new Account(Id = '001000000000001AAA', Name = 'foo');
     * Account acc2 = new Account(Id = '001000000000002AAA', Name = 'bar');
     * Account acc3 = new Account(Id = '001000000000003AAA', Name = 'baz');
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
     * List<Contact> contacts = SObjectSequence.of(accounts)
     *     .mapTo(new MapToContactOperator())
     *     .toList(); //
     * [
     *   { LastName: 'foo', AccountId: '001000000000001AAA' },
     *   { LastName: 'bar', AccountId: '001000000000002AAA' },
     *   { LastName: 'baz', AccountId: '001000000000003AAA' }
     * ]
     */
    public virtual override SObjectEnumerable mapTo(final IOperator mapper) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.mapTo(iterator(), (IFunction) mapper));
    }

    /**
     * @description Returns a `IntEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `IntEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class TotalPriceFunction extends Function {
     *     public override Object apply(Object o) {
     *         OpportunityLineItem item = (OpportunityLineItem) o;
     *         return (Integer) (item.Quantity * item.UnitPrice);
     *     }
     * }
     * List<OpportunityLineItem> items = new List<OpportunityLineItem>{
     *     new OpportunityLineItem(Quantity = 100, UnitPrice = 100),
     *     new OpportunityLineItem(Quantity = 20, UnitPrice = 2000),
     *     new OpportunityLineItem(Quantity = 50, UnitPrice = 1000)
     * };
     * List<Integer> totalPrices = SObjectSequence.of(items)
     *     .mapToInt(new TotalPriceFunction())
     *     .toList(); // [10000, 40000, 5000]
     */
    public virtual override IntEnumerable mapToInt(final IFunction mapper) {
        return IntStream.of((Iterator<Integer>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `LongEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `LongEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class TotalPriceFunction extends Function {
     *     public override Object apply(Object o) {
     *         OpportunityLineItem item = (OpportunityLineItem) o;
     *         return (Long) (item.Quantity * item.UnitPrice);
     *     }
     * }
     * List<OpportunityLineItem> items = new List<OpportunityLineItem>{
     *     new OpportunityLineItem(Quantity = 10000, UnitPrice = 10000),
     *     new OpportunityLineItem(Quantity = 2000, UnitPrice = 200000),
     *     new OpportunityLineItem(Quantity = 5000, UnitPrice = 100000)
     * };
     * List<Long> totalPrices = SObjectSequence.of(items)
     *     .mapToLong(new TotalPriceFunction())
     *     .toList(); // [100000000, 400000000, 500000000]
     */
    public virtual override LongEnumerable mapToLong(final IFunction mapper) {
        return LongStream.of((Iterator<Long>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `DoubleEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `DoubleEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class HaversineDistanceFunction extends Function {
     *       private final Double RADIUS_OF_EARTH = 6371.0; // Earth's radius in kilometers
     *       private final Double srcLat;
     *       private final Double srcLon;
     *       public HaversineDistanceFunction(Double srcLat, Double srcLon) {
     *           this.srcLat = srcLat;
     *           this.srcLon = srcLon;
     *       }
     *       public override Object apply (Object o) {
     *           Account acc = (Account) o;
     *           Double lat = acc.BillingLatitude;
     *           Double lon = acc.BillingLongitude;
     *           Double latDistance = toRadians(lat - this.srcLat);
     *           Double lonDistance = toRadians(lon - this.srcLon);
     *           Double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
     *               + Math.cos(toRadians(this.srcLat)) * Math.cos(toRadians(lat))
     *               * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
     *           Double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
     *           return RADIUS_OF_EARTH * c;
     *       }
     *       private Double toRadians(Double degrees) {
     *           return degrees * (Math.PI / 180);
     *       }
     *   }
     *   Account acc1 = new Account(Name = 'foo', BillingLatitude = 37.7749, BillingLongitude = -122.4194); // SF, CA
     *   Account acc2 = new Account(Name = 'bar', BillingLatitude = 51.5074, BillingLongitude = -0.1278); // London
     *   Account acc3 = new Account(Name = 'baz', BillingLatitude = 48.8566, BillingLongitude = 2.3522); // Paris
     *   Double newYorkLat = 40.7128;
     *   Double newYorkLon = -74.0060;
     *   List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
     *   List<Double> haversineDistancesFromNyInKms = SObjectSequence.of(accounts)
     *       .mapToDouble(new HaversineDistanceFunction(newYorkLat, newYorkLon))
     *       .toList(); // [4129.0861, 5570.2221, 5837.2409]
     */
    public virtual override DoubleEnumerable mapToDouble(final IFunction mapper) {
        return DoubleStream.of((Iterator<Double>) StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `ObjectEnumerable` with elements returned by `mapper` function,
     * applied to the elements of this stream.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the non-interfering, stateless operator
     *
     * @return the `ObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class GetFieldValueToLowerCaseFunction extends Function {
     *     private final String fieldName;
     *     public GetFieldValueToLowerCaseFunction(String fieldName) { this.fieldName = fieldName; }
     *     public override Object apply(Object o) {
     *         return ((String) ((SObject) o).get(fieldName))?.toLowerCase();
     *     }
     * }
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'foo'),
     *     new Account(Name = 'Bar'),
     *     new Account(Name = 'baz'),
     *     new Account(Name = 'Foo'),
     *     new Account(Name = 'bar')
     * };
     * List<String> normalizedNames = (List<String>) SObjectSequence.of(accounts)
     *     .mapToObject(new GetFieldValueToLowerCaseFunction('Name'))
     *     .toList(String.class); // ['foo', 'bar', 'baz', 'foo', 'bar']
     */
    public virtual override ObjectEnumerable mapToObject(final IFunction mapper) {
        return ObjectStream.of(StreamPipeline.mapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `SObjectEnumerable` with `SObject` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<SObject>`
     *
     * @return the new `SObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MapPayloadToContacts extends Function {
     *     public override Object apply(Object o) {
     *         Account acc = ((Account) o);
     *         String payload = acc?.Payload__c;
     *         if (String.isBlank(payload)) { return null; }
     *         return SObjectSequence.of((List<Contact>) JSON.deserialize(payload, List<Contact>.class))
     *             .forEach(Contact.AccountId, acc.Id);
     *     }
     * }
     * Account acc1 = new Account(
     *     Id = '001000000000001AAA',
     *     Name = 'foo',
     *     Payload__c = '[{ "LastName": "qux" }, { "LastName": "fred" }]'
     * );
     * Account acc2 = new Account(
     *     Id = '001000000000002AAA',
     *     Name = 'bar',
     *     Payload__c = '[{ "LastName": "thud" }]'
     * );
     * Account acc3 = new Account(
     *     Id = '001000000000003AAA',
     *     Name = 'baz'
     * );
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
     * List<Contact> contacts = SObjectSequence.of(accounts)
     *     .flatMapTo(new MapPayloadToContacts())
     *     .toList(); //
     * [
     *   { LastName: 'qux', AccountId: '001000000000001AAA' },
     *   { LastName: 'fred', AccountId: '001000000000001AAA' },
     *   { LastName: 'thud', AccountId: '001000000000002AAA' }
     * ]
     */
    public virtual override SObjectEnumerable flatMapTo(final IFunction mapper) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `IntEnumerable` with `Integer` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Integer>`
     *
     * @return the new `IntEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MapToNumberOfEmployees extends Function {
     *     public override Object apply(Object o) {
     *         Account acc = ((Account) o);
     *         List<Account> childAccounts = acc?.ChildAccounts;
     *         if (childAccounts?.isEmpty() != false) { return null; }
     *         return SObjectSequence.of(childAccounts).mapToInt(Account.NumberOfEmployees);
     *     }
     * }
     * Account acc1 = new Account(NumberOfEmployees = 100);
     * Account acc2 = new Account(NumberOfEmployees = 200);
     * Account acc3 = new Account(NumberOfEmployees = 500);
     * Account parentAcc1 = new Account(
     *     Name = 'foo',
     *     ChildAccounts = new List<Account>{ acc1, acc2 } // pseudo assignment
     * );
     * Account parentAcc2 = new Account(
     *     Name = 'bar',
     *     ChildAccounts = new List<Account>{ acc3 }
     * );
     * Account parentAcc3 = new Account(Name = 'baz');
     * List<Account> parentAccounts = new List<Account>{ parentAcc1, parentAcc2, parentAcc3 };
     * List<Integer> numberOfEmployees = SObjectSequence.of(parentAccounts)
     *     .flatMapToInt(new MapToNumberOfEmployees())
     *     .toList(); // [100, 200, 500]
     */
    public virtual override IntEnumerable flatMapToInt(final IFunction mapper) {
        return IntStream.of((Iterator<Integer>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `LongEnumerable` with `Long` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Long>`
     *
     * @return the new `LongEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MapToNumberOfEmployees extends Function {
     *     public override Object apply(Object o) {
     *         Account acc = ((Account) o);
     *         List<Account> childAccounts = acc?.ChildAccounts;
     *         if (childAccounts?.isEmpty() != false) { return null; }
     *         return SObjectSequence.of(childAccounts).mapToLong(Account.NumberOfEmployees);
     *     }
     * }
     * Account acc1 = new Account(NumberOfEmployees = 100);
     * Account acc2 = new Account(NumberOfEmployees = 200);
     * Account acc3 = new Account(NumberOfEmployees = 500);
     * Account parentAcc1 = new Account(
     *     Name = 'foo',
     *     ChildAccounts = new List<Account>{ acc1, acc2 } // pseudo assignment
     * );
     * Account parentAcc2 = new Account(
     *     Name = 'bar',
     *     ChildAccounts = new List<Account>{ acc3 }
     * );
     * Account parentAcc3 = new Account(Name = 'baz');
     * List<Account> parentAccounts = new List<Account>{ parentAcc1, parentAcc2, parentAcc3 };
     * List<Long> numberOfEmployees = SObjectSequence.of(parentAccounts)
     *     .flatMapToLong(new MapToNumberOfEmployees())
     *     .toList(); // [100, 200, 500]
     */
    public virtual override LongEnumerable flatMapToLong(final IFunction mapper) {
        return LongStream.of((Iterator<Long>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `DoubleEnumerable` with `Double` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Double>`
     *
     * @return the new `DoubleEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     * 
     * @example
     * public class MapToAnnualRevenue extends Function {
     *     public override Object apply(Object o) {
     *         Account acc = ((Account) o);
     *         List<Account> childAccounts = acc?.ChildAccounts;
     *         if (childAccounts?.isEmpty() != false) { return null; }
     *         return SObjectSequence.of(childAccounts).mapToDouble(Account.AnnualRevenue);
     *     }
     * }
     * Account acc1 = new Account(AnnualRevenue = 10.8);
     * Account acc2 = new Account(AnnualRevenue = 5.5);
     * Account acc3 = new Account(AnnualRevenue = 6.0);
     * Account parentAcc1 = new Account(
     *     Name = 'foo',
     *     ChildAccounts = new List<Account>{ acc1, acc2 } // pseudo assignment
     * );
     * Account parentAcc2 = new Account(
     *     Name = 'bar',
     *     ChildAccounts = new List<Account>{ acc3 }
     * );
     * Account parentAcc3 = new Account(Name = 'baz');
     * List<Account> parentAccounts = new List<Account>{ parentAcc1, parentAcc2, parentAcc3 };
     * List<Double> annualRevenues = SObjectSequence.of(parentAccounts)
     *     .flatMapToDouble(new MapToAnnualRevenue())
     *     .toList(); // [10.8, 5.5, 6.0]
     */
    public virtual override DoubleEnumerable flatMapToDouble(final IFunction mapper) {
        return DoubleStream.of((Iterator<Double>) StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a new `ObjectEnumerable` with `Object` elements as a result of
     * replacing each element of this stream with the contents of a mapped iterable created by applying
     * the specified `mapper` function to each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param mapper the mapping function which must produce `Iterable<Object>`
     *
     * @return the new `ObjectEnumerable`
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * public class MapToName extends Function {
     *     public override Object apply(Object o) {
     *         Account acc = ((Account) o);
     *         List<Account> childAccounts = acc?.ChildAccounts;
     *         if (childAccounts?.isEmpty() != false) { return null; }
     *         return SObjectSequence.of(childAccounts).mapToObject(Account.Name);
     *     }
     * }
     * Account acc1 = new Account(Name = 'qux');
     * Account acc2 = new Account(Name = 'fred');
     * Account acc3 = new Account(Name = 'thud');
     * Account parentAcc1 = new Account(
     *     Name = 'foo',
     *     ChildAccounts = new List<Account>{ acc1, acc2 } // pseudo assignment
     * );
     * Account parentAcc2 = new Account(
     *     Name = 'bar',
     *     ChildAccounts = new List<Account>{ acc3 }
     * );
     * Account parentAcc3 = new Account(Name = 'baz');
     * List<Account> parentAccounts = new List<Account>{ parentAcc1, parentAcc2, parentAcc3 };
     * List<String> names = (List<String>) SObjectSequence.of(parentAccounts)
     *     .flatMapToObject(new MapToName())
     *     .toList(String.class); // ['qux', fred', 'thud']
     */
    public virtual override ObjectEnumerable flatMapToObject(final IFunction mapper) {
        return ObjectStream.of(StreamPipeline.flatMapTo(iterator(), mapper));
    }

    /**
     * @description Returns a `SObjectEnumerable` after performing `consumer` action on each element.
     * <p>Stateless Intermediate Operation.</p>
     *
     * @param consumer the non-interfering, stateless action to be performed on each element.
     * Expected to operate via side effects.
     *
     * @return the `SObjectEnumerable`
     *
     * @throws NullPointerException if `consumer` is null
     *
     * @example
     * public class SetRatingConsumer extends Consumer {
     *     public override void accept(Object o) {
     *         Account acc = (Account) o;
     *         Integer annualRevenue = (Integer) acc?.AnnualRevenue;
     *         if (annualRevenue == null || annualRevenue <= 100) {
     *             acc.Rating = 'Cold';
     *             return;
     *         }
     *         if (annualRevenue <= 200) {
     *             acc.Rating = 'Warm';
     *             return;
     *         }
     *         acc.Rating = 'Hot';
     *     }
     * }
     * Account acc1 = new Account(AnnualRevenue = 100);
     * Account acc2 = new Account(AnnualRevenue = 200);
     * Account acc3 = new Account(AnnualRevenue = 500);
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
     * List<Account> processedAccounts = SObjectSequence.of(accounts)
     *     .forEach(new SetRatingConsumer())
     *     .toList(); //
     * [
     *   { AnnualRevenue: 100, Rating: 'Cold' },
     *   { AnnualRevenue: 200, Rating: 'Warm' },
     *   { AnnualRevenue: 500, Rating: 'Hot' }
     * ]
     */
    public virtual override SObjectEnumerable forEach(final IConsumer consumer) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.forEach(iterator(), consumer));
    }

    /**
     * @description Returns a `SObjectEnumerable` with distinct elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `SObjectEnumerable`
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'foo'),
     *     new Account(Name = 'bar'),
     *     new Account(Name = 'baz'),
     *     new Account(Name = 'foo'),
     *     new Account(Name = 'bar')
     * };
     * List<Account> distinct = SObjectSequence.of(accounts)
     *     .distinct()
     *     .toList(); //
     * [
     *   { Name: 'foo' },
     *   { Name: 'bar' },
     *   { Name: 'baz' }
     * ]
     */
    public virtual override SObjectEnumerable distinct() {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.distinct(iterator()));
    }

    /**
     * @description Returns a `SObjectEnumerable` with distinct elements
     * according to `classifier` function.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param classifier the classifier function
     *
     * @return the `SObjectEnumerable`
     *
     * @throws NullPointerException if `classifier` is null
     *
     * @example
     * public class GetFieldValueToLowerCaseFunction extends Function {
     *     private final String fieldName;
     *     public GetFieldValueToLowerCaseFunction(String fieldName) { this.fieldName = fieldName; }
     *     public override Object apply(Object o) { return ((String) ((SObject) o).get(fieldName))?.toLowerCase(); }
     * }
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'foo'),
     *     new Account(Name = 'Bar'),
     *     new Account(Name = 'baz'),
     *     new Account(Name = 'Foo'),
     *     new Account(Name = 'bar')
     * };
     * List<Account> distinct = SObjectSequence.of(accounts)
     *     .distinct(new GetFieldValueToLowerCaseFunction('Name'))
     *     .toList(); //
     * [
     *   { Name: 'foo' },
     *   { Name: 'Bar' },
     *   { Name: 'baz' }
     * ]
     */
    public virtual override SObjectEnumerable distinct(final IFunction classifier) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.distinct(iterator(), classifier));
    }

    /**
     * @description Returns a `SObjectEnumerable` with sorted elements in ascending order.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @return the `SObjectEnumerable`
     *
     * @example
     * Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
     * Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
     * Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
     * List<Account> sortedAccounts = SObjectSequence.of(accounts)
     *     .sort()
     *     .toList(); //
     * [
     *   { Name: 'bar', AnnualRevenue: 200 },
     *   { Name: 'baz', AnnualRevenue: 500 },
     *   { Name: 'foo', AnnualRevenue: 100 }
     * ]
     */
    public virtual override SObjectEnumerable sort() {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.sort(iterator()));
    }

    /**
     * @description Returns a `SObjectEnumerable` with sorted elements according to `comparer`.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param comparer the non-interfering, stateless comparer to compare stream elements
     *
     * @return the `SObjectEnumerable`
     *
     * @throws NullPointerException if `comparer` is null
     *
     * @example
     * public class NameAndThenAnnualRevenueComparer extends Comparer {
     *     public override Integer compare(Object o1, Object o2) {
     *         Account acc1 = (Account) o1;
     *         Account acc2 = (Account) o2;
     *         Integer nameComparison = acc1.Name.compareTo(acc2.Name);
     *         return nameComparison != 0 
     *             ? nameComparison
     *             : acc1.AnnualRevenue > acc2.AnnualRevenue 
     *                 ? 1
     *                 : acc1.AnnualRevenue == acc2.AnnualRevenue
     *                     ? 0
     *                     : -1;
     *     }
     * }
     * Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
     * Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
     * Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
     * Account acc4 = new Account(Name = 'foo', AnnualRevenue = 600);
     * Account acc5 = new Account(Name = 'bar', AnnualRevenue = 800);
     * Account acc6 = new Account(Name = 'baz', AnnualRevenue = 100);
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6 };
     * List<Account> sortedAccounts = SObjectSequence.of(accounts)
     *     .sort(new NameAndThenAnnualRevenueComparer())
     *     .toList(); //
     * [
     *   { Name: 'bar', AnnualRevenue: 200 },
     *   { Name: 'bar', AnnualRevenue: 800 },
     *   { Name: 'baz', AnnualRevenue: 100 },
     *   { Name: 'baz', AnnualRevenue: 500 },
     *   { Name: 'foo', AnnualRevenue: 100 },
     *   { Name: 'foo', AnnualRevenue: 600 }
     * ]
     */
    public virtual override SObjectEnumerable sort(final IComparer comparer) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.sort(iterator(), comparer));
    }

    /**
     * @description Returns a `SObjectEnumerable` with first `lim` elements.
     * <p>Short-circuiting Stateful Intermediate Operation.</p>
     *
     * @param lim the number of elements to limit
     *
     * @return the `SObjectEnumerable`
     *
     * @throws IllegalStateException if `lim` is less than 0
     * @throws NullPointerException if `lim` is null
     *
     * @example
     * Account acc1 = new Account(Name = 'foo');
     * Account acc2 = new Account(Name = 'bar');
     * Account acc3 = new Account(Name = 'baz');
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
     * List<Account> first2 = SObjectSequence.of(accounts)
     *     .lim(2)
     *     .toList(); //
     * [
     *   { Name: 'foo' },
     *   { Name: 'bar' }
     * ]
     */
    public virtual override SObjectEnumerable lim(final Integer lim) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.lim(iterator(), lim));
    }

    /**
     * @description Returns a new `SObjectEnumerable` that skips first `n` elements
     * and returns remaining elements.
     * <p>Stateful Intermediate Operation.</p>
     *
     * @param n the number of elements to skip
     *
     * @return the `SObjectEnumerable`
     *
     * @throws IllegalStateException if `n` is less than 0
     * @throws NullPointerException if `n` is null
     *
     * @example
     * Account acc1 = new Account(Name = 'foo');
     * Account acc2 = new Account(Name = 'bar');
     * Account acc3 = new Account(Name = 'baz');
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
     * List<Account> rest = SObjectSequence.of(accounts)
     *     .skip(1)
     *     .toList(); //
     * [
     *   { Name: 'bar' },
     *   { Name: 'baz' }
     * ]
     */
    public virtual override SObjectEnumerable skip(final Integer n) {
        return new SObjectStream((Iterator<SObject>) StreamPipeline.skip(iterator(), n));
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    // @start-group Terminal Operations
    /**
     * @description Performs a reduction on `SObject` elements,
     * using `identity` value and an associative `accumulator` function, and returns the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param identity the identity value for `accumulator`
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `SObject` result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class AnnualRevenueAccumulator extends BiOperator {
     *     public override Object apply (Object o1, Object o2) {
     *         Account result = ((Account) o1);
     *         Account acc = ((Account) o2);
     *         result.AnnualRevenue += acc.AnnualRevenue;
     *         return result;
     *     }
     * }
     * Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
     * Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
     * Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
     * Account identity = new Account(Name = 'total', AnnualRevenue = 0);
     * Account total = (Account) SObjectSequence.of(accounts)
     *     .reduce(identity, new AnnualRevenueAccumulator()); // { Name: 'total', AnnualRevenue: 800 }
     */
    public virtual override SObject reduce(final SObject identity, final IBiOperator accumulator) {
        return (SObject) StreamPipeline.reduce(iterator(), (Object) identity, accumulator);
    }

    /**
     * @description Performs a reduction on `SObject` elements,
     * using `identity` value and associative `accumulator` function, and returns
     * an `Optional` SObject describing the reduced value.
     * <p>Terminal Operation.</p>
     *
     * @param accumulator the associative, non-interfering, stateless accumulation function
     *
     * @return the `Optional` SObject result of the reduction
     *
     * @throws NullPointerException if `accumulator` is null
     *
     * @example
     * public class AccountAccumulator extends BiOperator {
     *     public override Object apply (Object o1, Object o2) {
     *         Account result = ((Account) o1);
     *         Account acc = ((Account) o2);
     *         result.Name += ';' + acc.Name;
     *         result.AnnualRevenue += acc.AnnualRevenue;
     *         return result;
     *     }
     * }
     * Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
     * Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
     * Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
     * Account total = (Account) SObjectSequence.of(accounts)
     *     .reduce(new AccountAccumulator())
     *     .get(); // { Name: 'foo;bar;baz', AnnualRevenue: 800 }
     */
    public virtual override Optional reduce(final IBiOperator accumulator) {
        return Optional.ofNullable((SObject) StreamPipeline.reduce(iterator(), accumulator));
    }

    /**
     * @description Performs a mutable reduction operation on elements, collecting elements
     * to a container using `collector`.
     * <p>Terminal Operation.</p>
     *
     * @param collector the collector
     *
     * @return the `Object` result of the collection
     *
     * @throws NullPointerException if `collector` is null
     *
     * @example
     * // Simple collecting
     * public class AddToStringSetBiConsumer extends BiConsumer {
     *     private final String fieldName;
     *     public AddToStringSetBiConsumer(String fieldName) { this.fieldName = fieldName; }
     *     public override void accept(Object container, Object o) {
     *         String value = (String) ((SObject) o).get(fieldName);
     *         ((Set<String>) container).add(value);
     *     }
     * }
     * Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
     * Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 400);
     * Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
     * Account acc4 = new Account(Name = 'qux', NumberOfEmployees = 100);
     * Account acc5 = new Account(Name = 'bar', NumberOfEmployees = 300);
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5 };
     * Set<String> names = (Set<String>) SObjectSequence.of(accounts)
     *     .collect(Collector.of(Supplier.of(Set<String>.class), new AddToStringSetBiConsumer('Name')));
     * // ['foo', 'bar', 'baz', 'qux']
     * // Cascaded operation
     * public class GetIntFieldFunction extends Function {
     *     private final String fieldName;
     *     public GetIntFieldFunction(String fieldName) { this.fieldName = fieldName; }
     *     public override Object apply(Object o) {
     *         return (Integer) ((SObject) o).get(fieldName);
     *     }
     * }
     * public class AddToListBiConsumer extends BiConsumer {
     *     private final String fieldName;
     *     public AddToListBiConsumer(String fieldName) { this.fieldName = fieldName; }
     *     public override void accept(Object container, Object o) {
     *         ((List<Object>) container).add(((SObject) o).get(fieldName));
     *     }
     * }
     * public class PutToObjectsByIntMap extends BiConsumer {
     *     private final IFunction classifier;
     *     public PutToObjectsByIntMap(ICollector downstream, IFunction classifier) {
     *         this.downstream = downstream;
     *         this.classifier = classifier;
     *     }
     *     public override void accept(Object container, Object o) {
     *         final Map<Integer, List<Object>> m = (Map<Integer, List<Object>>) container;
     *         final Integer key = (Integer) classifier.apply(o);
     *         if (!m.containsKey(key)) { m.put(key, (List<Object>) downstream.supplier().get()); }
     *         downstream.accumulator().accept(m.get(key), o);
     *     }
     * }
     * // the classifier function mapping input elements to keys.
     * IFunction classificationFunction = new GetIntFieldFunction('NumberOfEmployees');
     * // the supplier providing a new empty Map into which the results will be inserted.
     * ISupplier mapSupplier = Supplier.of(Map<Integer, List<String>>.class);
     * // the Collector implementing the downstream reduction.
     * ICollector downstreamCollector = Collector.of(
     *     Supplier.of(List<String>.class),
     *     new AddToListBiConsumer('Name')
     * );
     * // the function that folds an element into a result container.
     * IBiConsumer accumulator = new PutToObjectsByIntMap(downstreamCollector, classificationFunction);
     * // the Collector implementing the cascaded group-by operation.
     * ICollector groupByNumberOfEmployeesCollector = Collector.of(mapSupplier, accumulator);
     * Map<Integer, List<String>> namesByNumberOfEmployees = (Map<Integer, List<String>>)
     *     SObjectSequence.of(accounts)
     *     .collect(groupByNumberOfEmployeesCollector); //
     * {
     *   100: ['foo', 'qux'],
     *   300: ['baz', 'bar'],
     *   400: ['bar']
     * }
     * // The same result can be obtained by using built-in Collectors
     * Map<Integer, List<String>> namesByNumberOfEmployees1 = (Map<Integer, List<String>>)
     *     SObjectSequence.of(accounts)
     *     .collect(
     *         SObjectCollectors.groupingByInt('NumberOfEmployees', 'Name')
     *             .cast(Map<Integer, List<String>>.class)
     *     );
     */
    public virtual override Object collect(final ICollector collector) {
        return StreamPipeline.collect(iterator(), collector);
    }

    /**
     * @description Returns an `Optional` SObject describing the first element
     * that matches `predicate`.
     * <p>Short-circuiting Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Optional` SObject
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * public class ContainsPredicate extends Predicate {
     *     private final String fieldName;
     *     private final String s;
     *     public ContainsPredicate(String fieldName, String s) {
     *         this.fieldName = fieldName; 
     *         this.s = s;
     *     }
     *     public override Boolean test(Object o) {
     *         return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
     *     }
     * }
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'foo', NumberOfEmployees = 100),
     *     new Account(Name = 'bar', NumberOfEmployees = 200),
     *     new Account(Name = 'baz', NumberOfEmployees = 300)
     * };
     * Account firstFound = (Account) SObjectSequence.of(accounts)
     *     .find(new ContainsPredicate('Name', 'a'))
     *     .get(); // { Name: 'bar', NumberOfEmployees: 200 }
     */
    public virtual override Optional find(final IPredicate predicate) {
        return Optional.ofNullable((SObject) StreamPipeline.find(iterator(), predicate));
    }

    /**
     * @description Returns whether all elements match `predicate`.
     * If `SObjectEnumerable` is empty then `false` is returned.
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
     *     private final String fieldName;
     *     private final String s;
     *     public ContainsPredicate(String fieldName, String s) {
     *         this.fieldName = fieldName; 
     *         this.s = s;
     *     }
     *     public override Boolean test(Object o) {
     *         return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
     *     }
     * }
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'foo', NumberOfEmployees = 100),
     *     new Account(Name = 'bar', NumberOfEmployees = 200),
     *     new Account(Name = 'baz', NumberOfEmployees = 300)
     * };
     * Boolean doesEveryAccountNameContainA = SObjectSequence.of(accounts)
     *     .every(new ContainsPredicate('Name', 'a')); // false
     */
    public virtual override Boolean every(final IPredicate predicate) {
        return StreamPipeline.match(iterator(), predicate, 1);
    }

    /**
     * @description Returns whether some element matches `predicate`.
     * If `SObjectEnumerable` is empty then `false` is returned.
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
     *     private final String fieldName;
     *     private final String s;
     *     public ContainsPredicate(String fieldName, String s) {
     *         this.fieldName = fieldName; 
     *         this.s = s;
     *     }
     *     public override Boolean test(Object o) {
     *         return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
     *     }
     * }
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'foo', NumberOfEmployees = 100),
     *     new Account(Name = 'bar', NumberOfEmployees = 200),
     *     new Account(Name = 'baz', NumberOfEmployees = 300)
     * };
     * Boolean doesSomeAccountNameContainA = SObjectSequence.of(accounts)
     *     .some(new ContainsPredicate('Name', 'a')); // true
     */
    public virtual override Boolean some(final IPredicate predicate) {
        return StreamPipeline.match(iterator(), predicate, 0);
    }

    /**
     * @description Returns the count of elements.
     * <p>Terminal Operation.</p>
     *
     * @return the count of elements
     *
     * @example
     * Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
     * Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
     * Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
     * Integer count = SObjectSequence.of(accounts)
     *     .count(); // 3
     */
    public virtual override Integer count() {
        return StreamPipeline.count(iterator());
    }

    /**
     * @description Returns whether the count of elements is 0.
     * <p>Terminal Operation.</p>
     *
     * @return `true` or `false`
     *
     * @example
     * Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
     * Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
     * Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
     * SObjectSequence.of(accounts)
     *     .isEmpty(); // false
     * SObjectSequence.of(new List<Account>()))
     *     .isEmpty(); // true
     */
    public virtual override Boolean isEmpty() {
        return StreamPipeline.isEmpty(iterator());
    }

    /**
     * @description Accumulates elements into a `List<SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `List<SObject>` containing the stream elements
     *
     * @example
     * Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
     * Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
     * Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
     * List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
     * List<Account> accounts1 = SObjectSequence.of(accounts)
     *     .skip(1)
     *     .toList(); //
     * [
     *   { Name: 'bar', NumberOfEmployees: 200 },
     *   { Name: 'baz', NumberOfEmployees: 200 }
     * ]
     */
    public virtual override List<SObject> toList() {
        return (List<SObject>) StreamPipeline.toList(iterator(), SObject.class);
    }

    /**
     * @description Accumulates elements returned by `mapper` into a `List<?>` of specific `listType`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     * @param elementType the element type
     *
     * @return the `List<Object>` containing the stream elements
     *
     * @throws NullPointerException if `field` or `listType` is null
     *
     * @example
     * List<String> accountNames = (List<String>) SObjectStream.of(accounts)
     *     .toList(SObjectFunctions.get('Name'), String.class);
     */
    public virtual override List<Object> toList(final IFunction mapper, final Type elementType) {
        return StreamPipeline.toList(iterator(), mapper, elementType);
    }

    /**
     * @description Accumulates elements into a `Set<SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Set<SObject>` containing the stream elements
     *
     * @example
     * Set<SObject> accountsWithHotRating = SObjectStream.of(accounts)
     *     .filter(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toSet();
     */
    public virtual override Set<SObject> toSet() {
        return StreamPipeline.toSObjectSet(iterator());
    }

    /**
     * @description Accumulates `Object` elements returned by `mapper` into a `Set<Object>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<Object>`containing the stream elements field values
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Set<Object> createdDates = SObjectStream.of(accounts).toSet(SObjectFunctions.get('CreatedDate'));
     */
    public virtual override Set<Object> toSet(final IFunction mapper) {
        return StreamPipeline.toObjectSet(iterator(), mapper);
    }

//    /**
//     * @description Accumulates `Id` elements into a `Set<Id>`.
//     * <p>Terminal Operation.</p>
//     *
//     * @return the `Set<Id>` containing the stream elements field values
//     *
//     * @example
//     * Set<Id> accountIds = SObjectStream.of(accounts).toIdSet();
//     */
//    public virtual override Set<Id> toIdSet() {
//        return toIdSet('Id');
//    }

    /**
     * @description Accumulates `Id` elements returned by `mapper` into a `Set<Id>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<Id>` containing the stream elements field values
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Set<Id> accountIds = SObjectStream.of(contacts).toIdSet(SObjectFunctions.get('AccountId'));
     */
    public virtual override Set<Id> toIdSet(final IFunction mapper) {
        return StreamPipeline.toIdSet(iterator(), mapper);
    }

    /**
     * @description Accumulates `String` elements returned by `mapper` into a `Set<String>`.
     * <p>Terminal Operation.</p>
     *
     * @param mapper the mapping function
     *
     * @return the `Set<String>`containing the stream elements field values
     *
     * @throws NullPointerException if `mapper` is null
     *
     * @example
     * Set<String> accountNames = SObjectStream.of(accounts).toStringSet(SObjectFunctions.get('Name'));
     */
    public virtual override Set<String> toStringSet(final IFunction mapper) {
        return StreamPipeline.toStringSet(iterator(), mapper);
    }

    /**
     * @description Accumulates elements into a `Map<Id, SObject>`.
     * <p>Terminal Operation.</p>
     *
     * @return the `Map<Id, SObject>` containing the stream elements
     *
     * @example
     * Map<Id, SObject> accountsWithHotRating = SObjectStream.of(accounts)
     *     .filter(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
     *     .toMap();
     */
    public virtual override Map<Id, SObject> toMap() {
        return new Map<Id, SObject>((List<SObject>) StreamPipeline.toList(iterator(), SObject.class));
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     * @param valueType the type of the value
     *
     * @return the `Map<Id, SObject>` containing the stream elements
     *
     * @throws IllegalStateException if mapped keys contain duplicates, which can be cast to `mapType`
     * @throws NullPointerException if `keyMapper` or `mapType` is null
     *
     * @example
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) SObjectStream.of(contacts)
     *     .toByIdMap(SObjectFunctions.get('AccountId'), Map<Id, Contact>.class);
     */
    public virtual override Map<Id, SObject> toByIdMap(final IFunction keyMapper, final Type valueType) {
        return (Map<Id, SObject>) StreamPipeline.toByIdMap(iterator(), keyMapper, valueType);
    }

    /**
     * @description Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType`
     * whose keys are produced by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     * @param valueType the type of the value
     *
     * @return the `Map<String, SObject>` containing the stream elements
     *
     * @throws IllegalStateException if mapped keys contain duplicates, which can be cast to `mapType`
     * @throws NullPointerException if `keyMapper` or `mapType` is null
     *
     * @example
     * Map<String, Account> accountByName = (Map<String, Account>) SObjectStream.of(accounts)
     *     .toByStringMap(SObjectFunctions.get('Name'), Map<String, Account>.class);
     */
    public virtual override Map<String, SObject> toByStringMap(final IFunction keyMapper, final Type valueType) {
        return (Map<String, SObject>) StreamPipeline.toByStringMap(iterator(), keyMapper, valueType);
    }

    /**
     * @description Groups `SObject` elements into a `Map<Id, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     *
     * @return the `Map<Id, List<SObject>>` containing the stream elements
     *
     * @throws NullPointerException if `field` is null
     *
     * @example
     * Map<Id, List<Contact>> contactsByAccountId = SObjectStream.of(contacts)
     *     .groupById(SObjectFunctions.get('AccountId'));
     */
    public virtual override Map<Id, List<SObject>> groupById(final IFunction keyMapper) {
        return (Map<Id, List<SObject>>) StreamPipeline.groupById(iterator(), keyMapper, SObject.class);
    }

    /**
     * @description Groups `SObject` elements into a `Map<String, List<SObject>>`
     * whose keys are values returned by `keyMapper` and values are `SObject` elements.
     * <p>Terminal Operation.</p>
     *
     * @param keyMapper the mapping function producing keys
     *
     * @return the `Map<String, List<SObject>>` containing the stream elements
     *
     * @throws NullPointerException if `keyMapper` is null
     *
     * @example
     * Map<String, List<Account>> accountsByRating = SObjectStream.of(accounts)
     *     .groupByString(SObjectFunctions.get('Rating'));
     */
    public virtual override Map<String, List<SObject>> groupByString(final IFunction keyMapper) {
        return (Map<String, List<SObject>>) StreamPipeline.groupByString(iterator(), keyMapper, SObject.class);
    }

    /**
     * @description Partition `SObject` elements by `predicate`.
     * <p>Terminal Operation.</p>
     *
     * @param predicate the predicate
     *
     * @return the `Map<Boolean, List<SObject>>` containing the stream elements
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
     *     = SObjectStream.of(accounts).partition(SObjectPredicates.isEqual(Account.Rating, 'Hot'));
     */
    public virtual override Map<Boolean, List<SObject>> partition(final IPredicate predicate) {
        return (Map<Boolean, List<SObject>>) StreamPipeline.partition(iterator(), predicate, SObject.class);
    }
    // @end-group
    //</editor-fold>

}
