# virtual LongSequence

`SUPPRESSWARNINGS`

`APIVERSION: 61`

`STATUS: ACTIVE`

A sequence of `Long` elements supporting aggregate operations,
a primitive specialization of [ObjectSequence](/docs/Enumerables/ObjectSequence.md).


**Inheritance**

[LongEnumerable](/docs/Enumerables/LongEnumerable.md)
 > 
LongSequence


**See** [SObjectSequence](/docs/Enumerables/SObjectSequence.md)


**See** [ObjectSequence](/docs/Enumerables/ObjectSequence.md)


**See** [DoubleSequence](/docs/Enumerables/DoubleSequence.md)


**See** [IntSequence](/docs/Enumerables/IntSequence.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### Iterator
##### `public override Iterator<Long> iterator()`

Returns an internal iterator for the elements of this sequence. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Iterator<Long>`|the internal `Iterator<Long>`|

---
### Sources
##### `public static LongEnumerable of(List<Long> longs)`

Returns a `LongEnumerable` created from `longs` list.

###### Parameters

|Param|Description|
|---|---|
|`longs`|the list of Longs|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `longs` is null|

###### Example
```apex
LongEnumerable longSeq = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 });
```


##### `public static LongEnumerable of(Set<Long> longs)`

Returns a `LongEnumerable` created from `longs` set.

###### Parameters

|Param|Description|
|---|---|
|`longs`|the set of Longs|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `longs` is null|

###### Example
```apex
LongEnumerable longSeq = LongSequence.of(new Set<Long>{ 0, 5L, 1L, -10 });
```


##### `public static LongEnumerable ofNullable(List<Long> longs)`

Returns a `LongEnumerable` created from `longs` list if non-null, otherwise returns an empty `LongEnumerable`.

###### Parameters

|Param|Description|
|---|---|
|`longs`|the list of Longs|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable` if `longs` is non-null, otherwise an empty `LongEnumerable`|

###### Example
```apex
LongEnumerable longSeq = LongSequence.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
```


##### `public static LongEnumerable ofNullable(Set<Long> longs)`

Returns a `LongEnumerable` created from `longs` set if non-null, otherwise returns an empty `LongEnumerable`.

###### Parameters

|Param|Description|
|---|---|
|`longs`|the set of Longs|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable` if `longs` is non-null, otherwise an empty `LongEnumerable`|

###### Example
```apex
LongEnumerable longSeq = LongSequence.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
```


##### `public static LongEnumerable empty()`

Returns an empty `LongEnumerable`.

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the empty `LongEnumerable`|

##### `public static LongEnumerable range(Long fromLong, Long toLong)`

Returns an ordered `LongEnumerable` from `fromLong` (inclusive) to `toLong` (inclusive) by an incremental step of 1.

###### Parameters

|Param|Description|
|---|---|
|`fromLong`|the inclusive initial value|
|`toLong`|the inclusive upper bound|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `fromLong` or `toLong` is null|

###### Example
```apex
LongEnumerable longSeqFrom0To100 = LongSequence.range(0, 100);
```


##### `public static LongEnumerable concat(Iterable<Long> iterable1, Iterable<Long> iterable2)`

Returns eagerly concatenated `LongEnumerable` whose elements are all the elements of the first `Iterable<Long>` followed by all the elements of the second `Iterable<Long>`.

###### Parameters

|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Long>`|
|`iterable2`|the second `Iterable<Long>`|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

###### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> concat = LongSequence.concat(longs1, longs2)
    .toList();
// [5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L, 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L]
```


##### `public static LongEnumerable concat(List<Iterable<Long>> iterables)`

Returns eagerly concatenates `List<Iterable<Long>>`.

###### Parameters

|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<Long>`|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

###### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> concat = LongSequence.concat(new List<Iterable<Long>>{ longs1, longs2 })
    .toList();
// [5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L, 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L]
```


##### `public static LongEnumerable zip(Iterable<Long> iterable1, Iterable<Long> iterable2, IBiOperator combiner)`

Returns a combined `LongEnumerable` by applying `combiner` function to each element at the same position.

###### Parameters

|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Long>`|
|`iterable2`|the second `Iterable<Long>`|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

###### Example
```apex
public class SumBiOperator extends BiOperator {
    public override Object apply(Object o1, Object o2) { return (Long) o1 + (Long) o2; }
}
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> zip = LongSequence.zip(longs1, longs2, new SumBiOperator())
    .toList();
// [13L, 6L, 15L, 11L, 9L, 18L, 4L, 7L]
```


##### `public virtual override LongEnumerable append(Iterable<Long> iterable)`

Returns new `LongEnumerable` by appending `iterable` to the current sequence.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the `Iterable<Long>` to append to the current sequence|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> append = LongSequence.of(longs1)
    .append(longs2)
    .toList();
// [5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L, 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L]
```


##### `public virtual override LongEnumerable prepend(Iterable<Long> iterable)`

Returns new `LongEnumerable` by prepending `iterable` to the current sequence.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the `Iterable<Long>` to prepend to the current sequence|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> append = LongSequence.of(longs1)
    .prepend(longs2)
    .toList();
// [8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L, 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L]
```


---
### Intermediate Operations
##### `public virtual override LongEnumerable filter(IPredicate predicate)`

Returns a `LongEnumerable` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Long> filtered = LongSequence.of(new List<Long>{ 0L, 5L, 1L, 1L, 5L })
    .filter(Predicates.isEqual(5L))
    .toList(); // [5L, 5L]
```


##### `public virtual override LongEnumerable take(IPredicate predicate)`

Returns a `LongEnumerable` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Long> firstFiltered = LongSequence.of(new List<Long>{ 0L, 0L, 1L, 1L, 5L })
    .take(Predicates.isEqual(0L))
    .toList(); // [0L, 0L]
```


##### `public virtual override LongEnumerable drop(IPredicate predicate)`

Returns a `LongEnumerable` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Long> rest = LongSequence.of(new List<Long>{ 0L, 0L, 1L, 1L, 5L })
    .drop(Predicates.isEqual(0L))
    .toList(); // [1L, 1L, 5L]
```


##### `public virtual override LongEnumerable mapTo(IOperator mapper)`

Returns a `LongEnumerable` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class MultiplyLongOperator extends Operator {
    private final Long l;
    public MultiplyLongOperator(Long l) { this.l = l; }
    public override Object apply(Object j) { return (Long) j * l; }
}
List<Long> doubledLongs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .mapTo(new MultiplyLongOperator(2))
    .toList(); // [0L, 10L, 2L, -20L]
```


##### `public virtual override IntEnumerable mapToInt(IFunction mapper)`

Returns a `IntEnumerable` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class MultiplyIntFunction extends Function {
    private final Integer i;
    public MultiplyIntFunction(Integer i) { this.i = i; }
    public override Object apply(Object j) { return (Long) j * i; }
}
List<Integer> doubledInts = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .mapToLong(new MultiplyIntFunction(2))
    .toList(); // [0, 10, 2, -20]
```


##### `public virtual override DoubleEnumerable mapToDouble(IFunction mapper)`

Returns a `DoubleEnumerable` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `DoubleEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class MultiplyDoubleFunction extends Function {
    private final Double d;
    public MultiplyDoubleFunction(Double d) { this.d = d; }
    public override Object apply(Object j) { return (Long) j * d; }
}
List<Double> doubledDoubles = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .mapToDouble(new MultiplyDoubleFunction(2))
    .toList(); // [0.0, 10.0, 2.0, -20.0]
```


##### `public virtual override SObjectEnumerable mapToSObject(IFunction mapper)`

Returns a `SObjectEnumerable` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class CreateAccountFunction extends Function {
    public override Object apply(Object i) { return new Account(AnnualRevenue = (Long) i); }
}
List<Account> accounts = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .mapToSObject(new CreateAccountFunction())
    .toList(); //
[
  { AnnualRevenue: 0 },
  { AnnualRevenue: 5 },
  { AnnualRevenue: 1 },
  { AnnualRevenue: 10 }
]
```


##### `public virtual override ObjectEnumerable mapToObject(IFunction mapper)`

Returns a `ObjectEnumerable` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class ToStringFunction extends Function {
    public override Object apply(Object i) { return String.valueOf(i); }
}
List<String> strings = (List<String>) LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .mapToObject(new ToStringFunction())
    .toList(String.class); // ['0', '5', '1', '10']
```


##### `public virtual override LongEnumerable flatMapTo(IFunction mapper)`

Returns a new `LongEnumerable` with `Long` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class MultiplyLongFunction extends Function {
    private final Long l;
    public MultiplyLongFunction(Long l) { this.l = l; }
    public override Object apply(Object o) { return new List<Long>{ ((Long) o) * l }; }
}
List<Long> longs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .flatMapTo(new MultiplyLongFunction(2L))
    .toList(); // [0L, 10L, 2L, -20L]
```


##### `public virtual override LongEnumerable forEach(IConsumer consumer)`

Returns a `LongEnumerable` after performing `consumer` action on each element. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|this `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

###### Example
```apex
public class DebugConsumer extends Consumer {
    public override void accept(Object o) { System.debug(o); }
}
List<Long> longs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .forEach(new DebugConsumer()) // prints 0, 5, 1, -10
    .toList(); // [0L, 5L, 1L, -10L ]
```


##### `public virtual override LongEnumerable distinct()`

Returns a `LongEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

###### Example
```apex
List<Long> distinct = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L, 0L, 5L })
    .distinct()
    .toList(); // [0L, 5L, 1L, -10L]
```


##### `public virtual override LongEnumerable sort()`

Returns a `LongEnumerable` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

###### Example
```apex
List<Long> sorted = LongSequence.of(new List<Long>{ 0L, 5L, null, 1L, -10L })
    .sort()
    .toList(); // [null, -10L, 0L, 1L, 5L]
```


##### `public virtual override LongEnumerable sort(SortOrder order)`

Returns a `LongEnumerable` with sorted elements considering `order`. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`order`|the sort order|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `order` is null|

###### Example
```apex
List<Long> sorted = LongSequence.of(new List<Long>{ 0L, 5L, null, 1L, -10L })
    .sort(SortOrder.DESCENDING)
    .toList(); // [5L, 1L, 0L, -10L, null]
```


##### `public virtual override LongEnumerable lim(Integer lim)`

Returns a `LongEnumerable` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `lim` is less than 0|
|`NullPointerException`|if `lim` is null|

###### Example
```apex
List<Long> first3Longs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .lim(3)
    .toList(); // [0L, 5L, 1L]
```


##### `public virtual override LongEnumerable skip(Integer n)`

Returns a new `LongEnumerable` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `n` is less than 0|
|`NullPointerException`|if `n` is null|

###### Example
```apex
List<Long> restLongs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .skip(1)
    .toList(); // [5L, 1L, -10L]
```


---
### Terminal Operations
##### `public virtual override Long reduce(Long identity, IBiOperator accumulator)`

Performs a reduction on `Long` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Returns

|Type|Description|
|---|---|
|`Long`|the `Long` result of the reduction|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
public class SumBiOperator extends BiOperator {
    public override Object apply(Object o1, Object o2) { return (Long) o1 + (Long) o2; }
}
public class ProductBiOperator extends BiOperator {
    public override Object apply(Object o1, Object o2) { return (Long) o1 * (Long) o2; }
}
Long sum = LongSequence.of(new List<Long>{ 0, 5L, 1L, -10 }).reduce(0L, new SumBiOperator()); // -4L
Long factorialOfN = LongSequence.range(1, n).reduce(1, new ProductBiOperator());
```


##### `public virtual override Optional reduce(IBiOperator accumulator)`

Performs a reduction on `Long` elements, using `identity` value and associative `accumulator` function, and returns an `Optional` Long describing the reduced value. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Long result of the reduction|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
public class SumBiOperator extends BiOperator {
    public override Object apply(Object o1, Object o2) { return (Long) o1 + (Long) o2; }
}
Long sum = (Long) LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .reduce(new SumBiOperator())
    .get(); // -4L
```


##### `public virtual override Object collect(ICollector collector)`

Performs a mutable reduction operation on elements, collecting elements to a container using `collector`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`collector`|the function that returns a mutable result container|

###### Returns

|Type|Description|
|---|---|
|`Object`|the `Object` result of the collection|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `collector` is null|

###### Example
```apex
public class AddToLongSetBiConsumer extends BiConsumer {
    public override void accept(Object container, Object o) { ((Set<Long>) container).add((Long) o); }
}
Set<Long> longs = (Set<Long>)
    LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L, 5L, 0L })
    .collect(Collector.of(Supplier.of(Set<Long>.class), new AddToLongSetBiConsumer()));
// [0L, 5L, 1L, -10L]
```


##### `public virtual override Optional find(IPredicate predicate)`

Returns an `Optional` Long describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Long|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class IsEvenPredicate extends Predicate {
    public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
}
Long firstEvenLong = (Long) LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .find(new IsEvenPredicate())
    .get(); // 0L
```


##### `public virtual override Boolean every(IPredicate predicate)`

Returns whether all elements match `predicate`. If `LongEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class IsEvenPredicate extends Predicate {
    public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
}
Boolean isEveryLongEven = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .every(new IsEvenPredicate()); // false
```


##### `public virtual override Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `LongEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class IsEvenPredicate extends Predicate {
    public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
}
Boolean isSomeLongEven = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .some(new IsEvenPredicate()); // true
```


##### `public virtual override Long sum()`

Returns the sum of elements. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Long`|the sum of elements|

###### Example
```apex
Long sum = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .sum(); // -4L
```


##### `public virtual override Optional avg()`

Returns `Optional` Double describing the arithmetic mean of elements of this sequence, or an empty `Optional` if this sequence is empty. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Optional`|the arithmetic mean of elements|

###### Example
```apex
Double avg = (Double) LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .avg()
    .get(); // 1.0
```


##### `public virtual override Integer count()`

Returns the count of elements. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Integer`|the count of elements|

###### Example
```apex
Integer count = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .count(); // 4
```


##### `public virtual override Boolean isEmpty()`

Returns whether the count of elements is 0. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

###### Example
```apex
LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .isEmpty(); // false
LongSequence.of(new List<Long>())
    .isEmpty(); // true
```


##### `public virtual override List<Long> toList()`

Accumulates elements into a `List<Long>`. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`List<Long>`|the `List<Long>` containing the sequence elements|

###### Example
```apex
List<Long> longs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .skip(1)
    .toList(); // [5L, 1L, -10L]
```


##### `public virtual override Set<Long> toSet()`

Accumulates elements into a `Set<Long>`. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Set<Long>`|the `Set<Long>` containing the sequence elements|

###### Example
```apex
Set<Long> longs = LongSequence.of(new List<Long>{ 0L, 5L, 1L, -10L })
    .skip(1)
    .toSet(); // [5L, 1L, -10L, 0L]
```


---
### Other
##### `public virtual LongEnumerable union(Iterable<Long> iterable)`

*Inherited*


Returns a new `LongEnumerable` as a set union of the current and another iterables.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> union = [LongEnumerable].of(longs1)
    .union(longs2)
    .toList(); // [5L, 3L, 9L, 7L, 8L, 6L, 4L, 1L, 0L]
```


##### `public virtual LongEnumerable intersect(Iterable<Long> iterable)`

*Inherited*


Returns a new `LongEnumerable` as a set intersection of the current and another iterables.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> intersection = [LongEnumerable].of(longs1)
    .intersect(longs2)
    .toList(); // [3L, 9L]
```


##### `public virtual LongEnumerable except(Iterable<Long> iterable)`

*Inherited*


Returns a new `LongEnumerable` as a set difference of the current and another iterables.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> diff = [LongEnumerable].of(longs1)
    .except(longs2)
    .toList(); // [5L, 7L]
```


##### `public virtual LongEnumerable withoutNulls()`

*Inherited*


Returns a new `LongEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

###### Example
```apex
List<Long> withoutNulls = [LongEnumerable].of(new List<Long>{ 0L, 0L, null, 1L, 1L, null, 5L })
    .withoutNulls()
    .toList(); // [0L, 0L, 1L, 1L, 5L]
```


##### `public virtual Boolean none(IPredicate predicate)`

*Inherited*


Returns whether no elements match `predicate`. If `LongEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class IsEvenPredicate extends Predicate {
    public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
}
Boolean isNoneLongEven = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .none(new IsEvenPredicate()); // false
```


##### `public virtual Optional max()`

*Inherited*


Returns an `Optional` Long describing the maximum element. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Long|

###### Example
```apex
Long max = (Long) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .max()
    .get(); // 5L
```


##### `public virtual Optional min()`

*Inherited*


Returns an `Optional` Long describing the minimum element. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Long|

###### Example
```apex
Long min = (Long) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .min()
    .get(); // -10L
```


---
