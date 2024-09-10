# abstract LongEnumerable

`SUPPRESSWARNINGS`

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides a skeletal implementation of [ILongEnumerable](/docs/Enumerables/ILongEnumerable.md).


**Implemented types**

[ILongEnumerable](/docs/Enumerables/ILongEnumerable.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### `public Iterator<Long> iterator()`

Returns an instance of an iterator for this enumerable. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Iterator<Long>`|the iterator|

### `public LongEnumerable append(Iterable<Long> iterable)`

Returns a new `LongEnumerable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> append = [LongEnumerable].of(longs1)
    .append(longs2)
    .toList();
// [5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L, 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L]
```


### `public LongEnumerable prepend(Iterable<Long> iterable)`

Returns a new `LongEnumerable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> append = [LongEnumerable].of(longs1)
    .prepend(longs2)
    .toList();
// [8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L, 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L]
```


### `public virtual LongEnumerable union(Iterable<Long> iterable)`

Returns a new `LongEnumerable` as a set union of the current and another iterables.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> union = [LongEnumerable].of(longs1)
    .union(longs2)
    .toList(); // [5L, 3L, 9L, 7L, 8L, 6L, 4L, 1L, 0L]
```


### `public virtual LongEnumerable intersect(Iterable<Long> iterable)`

Returns a new `LongEnumerable` as a set intersection of the current and another iterables.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> intersection = [LongEnumerable].of(longs1)
    .intersect(longs2)
    .toList(); // [3L, 9L]
```


### `public virtual LongEnumerable except(Iterable<Long> iterable)`

Returns a new `LongEnumerable` as a set difference of the current and another iterables.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
List<Long> longs1 = new List<Long>{ 5L, 3L, 9L, 7L, 5L, 9L, 3L, 7L };
List<Long> longs2 = new List<Long>{ 8L, 3L, 6L, 4L, 4L, 9L, 1L, 0L };
List<Long> diff = [LongEnumerable].of(longs1)
    .except(longs2)
    .toList(); // [5L, 7L]
```


### `public LongEnumerable distinct()`

Returns a `LongEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

#### Example
```apex
List<Long> distinct = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L, 0L, 5L })
    .distinct()
    .toList(); // [0L, 5L, 1L, -10L]
```


### `public LongEnumerable filter(IPredicate predicate)`

Returns a `LongEnumerable` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
List<Long> filtered = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, 1L, 5L })
    .filter(BasePredicates.isEqual(5L))
    .toList(); // [5L, 5L]
```


### `public LongEnumerable take(IPredicate predicate)`

Returns a `LongEnumerable` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
List<Long> firstFiltered = [LongEnumerable].of(new List<Long>{ 0L, 0L, 1L, 1L, 5L })
    .take(BasePredicates.isEqual(0L))
    .toList(); // [0L, 0L]
```


### `public LongEnumerable drop(IPredicate predicate)`

Returns a `LongEnumerable` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
List<Long> rest = [LongEnumerable].of(new List<Long>{ 0L, 0L, 1L, 1L, 5L })
    .drop(BasePredicates.isEqual(0L))
    .toList(); // [1L, 1L, 5L]
```


### `public virtual LongEnumerable withoutNulls()`

Returns a new `LongEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

#### Example
```apex
List<Long> withoutNulls = [LongEnumerable].of(new List<Long>{ 0L, 0L, null, 1L, 1L, null, 5L })
    .withoutNulls()
    .toList(); // [0L, 0L, 1L, 1L, 5L]
```


### `public LongEnumerable mapTo(IOperator mapper)`

Returns a `LongEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class MultiplyLongOperator extends Operator {
    private final Long l;
    public MultiplyLongOperator(Long l) { this.l = l; }
    public override Object apply(Object j) { return (Long) j * l; }
}
List<Long> doubledLongs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .mapTo(new MultiplyLongOperator(2))
    .toList(); // [0L, 10L, 2L, -20L]
```


### `public IntEnumerable mapToInt(IFunction mapper)`

Returns a `IntEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class MultiplyIntFunction extends Function {
    private final Integer i;
    public MultiplyIntFunction(Integer i) { this.i = i; }
    public override Object apply(Object j) { return (Long) j * i; }
}
List<Integer> doubledInts = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .mapToLong(new MultiplyIntFunction(2))
    .toList(); // [0, 10, 2, -20]
```


### `public DoubleEnumerable mapToDouble(IFunction mapper)`

Returns a `DoubleEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class MultiplyDoubleFunction extends Function {
    private final Double d;
    public MultiplyDoubleFunction(Double d) { this.d = d; }
    public override Object apply(Object j) { return (Long) j * d; }
}
List<Double> doubledDoubles = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .mapToDouble(new MultiplyDoubleFunction(2))
    .toList(); // [0.0, 10.0, 2.0, -20.0]
```


### `public SObjectEnumerable mapToSObject(IFunction mapper)`

Returns a `SObjectEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class CreateAccountFunction extends Function {
    public override Object apply(Object i) { return new Account(AnnualRevenue = (Long) i); }
}
List<Account> accounts = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .mapToSObject(new CreateAccountFunction())
    .toList(); //
[
  { AnnualRevenue: 0 },
  { AnnualRevenue: 5 },
  { AnnualRevenue: 1 },
  { AnnualRevenue: 10 }
]
```


### `public ObjectEnumerable mapToObject(IFunction mapper)`

Returns a `ObjectEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class ToStringFunction extends Function {
    public override Object apply(Object i) { return String.valueOf(i); }
}
List<String> strings = (List<String>) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .mapToObject(new ToStringFunction())
    .toList(String.class); // ['0', '5', '1', '10']
```


### `public LongEnumerable flatMapTo(IFunction mapper)`

Returns a new `LongEnumerable` with `Long` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class MultiplyLongFunction extends Function {
    private final Long l;
    public MultiplyLongFunction(Long l) { this.l = l; }
    public override Object apply(Object o) { return new List<Long>{ ((Long) o) * l }; }
}
List<Long> longs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .flatMapTo(new MultiplyLongFunction(2L))
    .toList(); // [0L, 10L, 2L, -20L]
```


### `public LongEnumerable forEach(IConsumer consumer)`

Returns a `LongEnumerable` after performing `consumer` action on each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|this `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

#### Example
```apex
public class DebugConsumer extends Consumer {
    public override void accept(Object o) { System.debug(o); }
}
List<Long> longs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .forEach(new DebugConsumer()) // prints 0, 5, 1, -10
    .toList(); // [0L, 5L, 1L, -10L ]
```


### `public LongEnumerable sort()`

Returns a `LongEnumerable` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

#### Example
```apex
List<Long> sorted = [LongEnumerable].of(new List<Long>{ 0L, 5L, null, 1L, -10L })
    .sort()
    .toList(); // [null, -10L, 0L, 1L, 5L]
```


### `public LongEnumerable sort(SortOrder order)`

Returns a `LongEnumerable` with sorted elements considering `order`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `order` is null|

#### Example
```apex
List<Long> sorted = [LongEnumerable].of(new List<Long>{ 0L, 5L, null, 1L, -10L })
    .sort(SortOrder.DESCENDING)
    .toList(); // [5L, 1L, 0L, -10L, null]
```


### `public LongEnumerable lim(Integer lim)`

Returns a `LongEnumerable` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `lim` is less than 0|
|`NullPointerException`|if `lim` is null|

#### Example
```apex
List<Long> first3Longs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .lim(3)
    .toList(); // [0L, 5L, 1L]
```


### `public LongEnumerable skip(Integer n)`

Returns a new `LongEnumerable` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `n` is less than 0|
|`NullPointerException`|if `n` is null|

#### Example
```apex
List<Long> restLongs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .skip(1)
    .toList(); // [5L, 1L, -10L]
```


### `public Long reduce(Long identity, IBiOperator accumulator)`

Performs a reduction on `Long` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Long`|the `Long` result of the reduction|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

#### Example
```apex
public class SumBiOperator extends BiOperator {
    public override Object apply(Object o1, Object o2) { return (Long) o1 + (Long) o2; }
}
Long sum = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .reduce(0L, new SumBiOperator()); // -4L
```


### `public Optional reduce(IBiOperator operator)`

Performs a reduction on `Long` elements, using `identity` value and associative `accumulator` function, and returns an `Optional` Long describing the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`operator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Long` Long result of the reduction|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

#### Example
```apex
public class SumBiOperator extends BiOperator {
    public override Object apply(Object o1, Object o2) { return (Long) o1 + (Long) o2; }
}
Long sum = (Long) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .reduce(new SumBiOperator())
    .get(); // -4L
```


### `public Object collect(ICollector collector)`

Performs a mutable reduction operation on elements, collecting elements to a container using `collector`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`collector`|the function that returns a mutable result container|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Object` result of the collection|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `collector` is null|

#### Example
```apex
public class AddToLongSetBiConsumer extends BiConsumer {
    public override void accept(Object container, Object o) { ((Set<Long>) container).add((Long) o); }
}
Set<Long> longs = (Set<Long>)
    [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L, 5L, 0L })
    .collect(Collector.of(Supplier.of(Set<Long>.class), new AddToLongSetBiConsumer()));
// [0L, 5L, 1L, -10L]
```


### `public Optional find(IPredicate predicate)`

Returns an `Optional` Long describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Long|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
public class IsEvenPredicate extends Predicate {
    public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
}
Long firstEvenLong = (Long) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .find(new IsEvenPredicate())
    .get(); // 0L
```


### `public Boolean every(IPredicate predicate)`

Returns whether all elements match `predicate`. If `LongEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
public class IsEvenPredicate extends Predicate {
    public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
}
Boolean isEveryLongEven = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .every(new IsEvenPredicate()); // false
```


### `public Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `LongEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
public class IsEvenPredicate extends Predicate {
    public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
}
Boolean isSomeLongEven = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .some(new IsEvenPredicate()); // true
```


### `public virtual Boolean none(IPredicate predicate)`

Returns whether no elements match `predicate`. If `LongEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
public class IsEvenPredicate extends Predicate {
    public override Boolean test(Object o) { return Math.mod((Long) o, 2) == 0; }
}
Boolean isNoneLongEven = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .none(new IsEvenPredicate()); // false
```


### `public virtual Optional max()`

Returns an `Optional` Long describing the maximum element. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Long|

#### Example
```apex
Long max = (Long) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .max()
    .get(); // 5L
```


### `public virtual Optional min()`

Returns an `Optional` Long describing the minimum element. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Long|

#### Example
```apex
Long min = (Long) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .min()
    .get(); // -10L
```


### `public Long sum()`

Returns the arithmetic sum of elements. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Long`|the sum of elements|

#### Example
```apex
Long sum = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .sum(); // -4L
```


### `public Optional avg()`

Returns the arithmetic mean of of elements. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Double describing the result|

#### Example
```apex
Double avg = (Double) [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .avg()
    .get(); // 1.0
```


### `public Integer count()`

Returns the count of elements. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Integer`|the count of elements|

#### Example
```apex
Integer count = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .count(); // 4
```


### `public Boolean isEmpty()`

Returns whether the count of elements is 0. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Example
```apex
[LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .isEmpty(); // false
[LongEnumerable].of(new List<Long>())
    .isEmpty(); // true
```


### `public List<Long> toList()`

Accumulates elements into a `List<Long>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`List<Long>`|the `List<Long>` containing the enumerable elements|

#### Example
```apex
List<Long> longs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .skip(1)
    .toList(); // [5L, 1L, -10L]
```


### `public Set<Long> toSet()`

Accumulates elements into a `Set<Long>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Set<Long>`|the `Set<Long>` containing the enumerable elements|

#### Example
```apex
Set<Long> longs = [LongEnumerable].of(new List<Long>{ 0L, 5L, 1L, -10L })
    .skip(1)
    .toSet(); // [5L, 1L, -10L, 0L]
```


---
