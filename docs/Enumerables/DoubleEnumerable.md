# abstract DoubleEnumerable

`SUPPRESSWARNINGS`

`APIVERSION: 58`

`STATUS: ACTIVE`

Provides a skeletal implementation of [IDoubleEnumerable](/docs/Enumerables/IDoubleEnumerable.md).


**Implemented types**

[IDoubleEnumerable](/docs/Enumerables/IDoubleEnumerable.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### `public Iterator<Double> iterator()`

Returns an instance of an iterator for this enumerable. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Iterator<Double>`|the iterator|

### `public DoubleEnumerable append(Iterable<Double> iterable)`

Returns a new `DoubleEnumerable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
List<Double> append = [DoubleEnumerable].of(doubles1)
    .append(doubles2)
    .toList();
// [5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0, 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0]
```


### `public DoubleEnumerable prepend(Iterable<Double> iterable)`

Returns a new `DoubleEnumerable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
List<Double> prepend = [DoubleEnumerable].of(doubles1)
    .prepend(doubles2)
    .toList();
// [8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0, 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0]
```


### `public virtual DoubleEnumerable union(Iterable<Double> iterable)`

Returns a new `DoubleIterable` as a set union of the current and another iterables.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleIterable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
List<Double> union = [DoubleEnumerable].of(doubles1)
    .union(doubles2)
    .toList();
// [5.0, 3.0, 9.0, 7.0, 8.0, 6.0, 4.0, 1.0, 0.0]
```


### `public virtual DoubleEnumerable intersect(Iterable<Double> iterable)`

Returns a new `DoubleIterable` as a set intersection of the current and another iterables.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleIterable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
List<Double> intersection = [DoubleEnumerable].of(doubles1)
    .intersect(doubles2)
    .toList(); // [3.0, 9.0]
```


### `public virtual DoubleEnumerable except(Iterable<Double> iterable)`

Returns a new `DoubleEnumerable` as a set difference of the current and another iterables.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
List<Double> doubles1 = new List<Double>{ 5.0, 3.0, 9.0, 7.0, 5.0, 9.0, 3.0, 7.0 };
List<Double> doubles2 = new List<Double>{ 8.0, 3.0, 6.0, 4.0, 4.0, 9.0, 1.0, 0.0 };
// doublesIterable1 = instance from
List<Double> diff = [DoubleEnumerable].of(doubles1)
    .except(doubles2)
    .toList(); // [5.0, 7.0]
```


### `public DoubleEnumerable distinct()`

Returns a `DoubleEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `DoubleEnumerable`|

#### Example
```apex
List<Double> distinct = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI, 1.5, 5 })
    .distinct()
    .toList(); // [0.1, 5, 1.5, Math.PI]
```


### `public DoubleEnumerable filter(IPredicate predicate)`

Returns a `DoubleEnumerable` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
List<Double> filtered = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI, 1.5, 5 })
    .filter(BasePredicates.isEqual(5))
    .toList(); // [5, 5]
```


### `public DoubleEnumerable take(IPredicate predicate)`

Returns a `DoubleEnumerable` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
List<Double> firstFiltered = [DoubleEnumerable].of(new List<Double>{ 0.1, 0.1, 5, 1.5, Math.PI })
    .filter(BasePredicates.isEqual(0.1))
    .toList(); // [0.1, 0.1]
```


### `public DoubleEnumerable drop(IPredicate predicate)`

Returns a `DoubleEnumerable` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
List<Double> rest = [DoubleEnumerable].of(new List<Double>{ 0.1, 0.1, 5, 1.5, Math.PI })
    .drop(BasePredicates.isEqual(0.1))
    .toList(); // [5, 1.5, Math.PI]
```


### `public virtual DoubleEnumerable withoutNulls()`

Returns a new DoubleEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `DoubleEnumerable`|

#### Example
```apex
List<Double> withoutNulls = [DoubleEnumerable].of(new List<Double>{ 0.1, null, 5, 1.5, null, 5 })
    .withoutNulls()
    .toList(); // [0.1, 5, 1.5, 5]
```


### `public DoubleEnumerable mapTo(IOperator mapper)`

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
public class MultiplyDoubleOperator extends Operator {
    private final Double d;
    public MultiplyDoubleOperator(Double d) { this.d = d; }
    public override Object apply(Object j) { return (Double) j * d; }
}
List<Double> doubledDoubles = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
    .mapTo(new MultiplyDoubleOperator(2))
    .toList(); // [11, 0.02, 2.0, 6.0]
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
public class RoundToIntFunction extends Function {
    public override Object apply(Object x) { return Math.round((Double) x); }
}
List<Integer> ints = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
    .mapToInt(new RoundToIntFunction())
    .toList(); // [6, 0, 1, 3, -9, -6, 4, 4]
```


### `public LongEnumerable mapToLong(IFunction mapper)`

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
public class RoundToLongFunction extends Function {
    public override Object apply(Object x) { return Math.roundToLong((Double) x); }
}
List<Long> longs = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
    .mapToLong(new RoundToLongFunction())
    .toList(); // [6L, 0L, 1L, 3L, -9L, -6L, 4L, 4L]
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
    public override Object apply(Object d) { return new Account(AnnualRevenue = (Double) d); }
}
List<Account> accounts = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
    .mapToSObject(new CreateAccountFunction())
    .toList(); //
[
  { AnnualRevenue: 5.5 },
  { AnnualRevenue: 0.01 },
  { AnnualRevenue: 1.0 },
  { AnnualRevenue: 3 }
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
    public override Object apply(Object d) { return String.valueOf(d); }
}
List<String> strings = (List<String>) [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
    .mapToObject(new ToStringFunction())
    .toList(String.class); // ['5.5', '0.01', '1.0', '3']
```


### `public DoubleEnumerable flatMapTo(IFunction mapper)`

Returns a new `DoubleEnumerable` with `Double` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Double>`|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class MultiplyDoubleFunction extends Function {
    private final Double d;
    public MultiplyDoubleFunction(Double d) { this.d = d; }
    public override Object apply(Object o) { return new List<Double>{ ((Double) o) * d }; }
}
List<Double> doubles = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
    .flatMapTo(new MultiplyDoubleFunction(2))
    .toList(); // [11, 0.02, 2.0, 6.0]
```


### `public DoubleEnumerable forEach(IConsumer consumer)`

Returns a `DoubleEnumerable` after performing `consumer` action on each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|this `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

#### Example
```apex
public class DebugConsumer extends Consumer {
    public override void accept(Object o) { System.debug(o); }
}
List<Double> doubles = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3 })
    .forEach(new DebugConsumer()) // prints 5.5, 0.01, 1.0, 3
    .toList(); // [5.5, 0.01, 1.0, 3]
```


### `public DoubleEnumerable sort()`

Returns a `DoubleEnumerable` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `DoubleEnumerable`|

#### Example
```apex
List<Double> sorted = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 })
    .sort()
    .toList(); // [null, -8.99, -6, 0.01, 1.0, 3, 4.01, 4.01, 5.5]
```


### `public DoubleEnumerable sort(SortOrder order)`

Returns a new `DoubleEnumerable` with sorted elements considering `order`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `order` is null|

#### Example
```apex
List<Double> sorted = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, null, -8.99, -6, 4.01, 4.01 })
    .sort(SortOrder.DESCENDING)
    .toList(); // [5.5, 4.01, 4.01, 3, 1.0, 0.01, -6, -8.99, null]
```


### `public DoubleEnumerable lim(Integer lim)`

Returns a `DoubleEnumerable` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `lim` is less than 0|
|`NullPointerException`|if `lim` is null|

#### Example
```apex
List<Double> first3Doubles = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .lim(3)
    .toList(); // [0.1, 5, 1.5]
```


### `public DoubleEnumerable skip(Integer n)`

Returns a new `DoubleEnumerable` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `n` is less than 0|
|`NullPointerException`|if `n` is null|

#### Example
```apex
List<Double> restDoubles = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .skip(1)
    .toList(); // [5, 1.5, Math.PI]
```


### `public Double reduce(Double identity, IBiOperator accumulator)`

Performs a reduction on `Double` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Double`|the `Double` result of the reduction|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

#### Example
```apex
Double max = [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
    .reduce((Double) 0.0, BaseBiOperators.max()); // 5.5
```


### `public Optional reduce(IBiOperator operator)`

Performs a reduction on `Double` elements, using `identity` value and associative `accumulator` function, and returns an `Optional` Double describing the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`operator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Double result of the reduction|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

#### Example
```apex
Double max = (Double) [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
    .reduce(BaseBiOperators.max())
    .get(); // 5.5
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
public class AddToDoubleSetBiConsumer extends BiConsumer {
    public override void accept(Object container, Object o) { ((Set<Double>) container).add((Double) o); }
}
Set<Double> doubles = (Set<Double>)
    [DoubleEnumerable].of(new List<Double>{ 5.5, 0.01, 1.0, 3, -8.99, -6, 4.01, 4.01 })
    .collect(Collector.of(Supplier.of(Set<Double>.class), new AddToDoubleSetBiConsumer()));
// [5.5, 0.01, 1.0, 3, -8.99, -6, 4.01]
```


### `public Optional find(IPredicate predicate)`

Returns an `Optional` Double describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Double|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
public class IsGreaterPredicate extends Predicate {
    private final Double d;
    public IsGreaterPredicate(Double d) { this.d = d; }
    public override Boolean test(Object o) { return (Double) o > d; }
}
Double firstGreaterThan4Double = [DoubleEnumerable].of(new List<Double>{ 0.01, 1.0, 3, 5.5 -8.99, -6, 4.01 })
    .find(new IsGreaterPredicate(4))
    .get(); // 5.5
```


### `public Boolean every(IPredicate predicate)`

Returns whether all elements match `predicate`. If `DoubleEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
public class IsGreaterPredicate extends Predicate {
    private final Double d;
    public IsGreaterPredicate(Double d) { this.d = d; }
    public override Boolean test(Object o) { return (Double) o > d; }
}
Boolean isEveryDoublePositive = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .every(new IsGreaterPredicate(0)); // true
```


### `public Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `DoubleEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
public class IsGreaterPredicate extends Predicate {
    private final Double d;
    public IsGreaterPredicate(Double d) { this.d = d; }
    public override Boolean test(Object o) { return (Double) o > d; }
}
Boolean isSomeDoubleGreaterThan6 = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .some(new IsGreaterPredicate(6)); // false
```


### `public virtual Boolean none(IPredicate predicate)`

Returns whether no elements match `predicate`. If `DoubleEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

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
public class IsGreaterPredicate extends Predicate {
    private final Double d;
    public IsGreaterPredicate(Double d) { this.d = d; }
    public override Boolean test(Object o) { return (Double) o > d; }
}
Boolean isNoneDoubleGreaterThan6 = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .none(new IsGreaterPredicate(6)); // false
```


### `public virtual Optional max()`

Returns an `Optional` Double describing the maximum element. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Double|

#### Example
```apex
Double max = (Double) [DoubleEnumerable].of(new List<Double>{ 0.01, 1.0, 3, 5.5 -8.99, -6, 4.01 })
    .max()
    .get(); // 5.5
```


### `public virtual Optional min()`

Returns an `Optional` Double describing the minimum element. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Double|

#### Example
```apex
Double min = (Double) [DoubleEnumerable].of(new List<Double>{ 0.01, 1.0, 3, 5.5 -8.99, -6, 4.01 })
    .min()
    .get(); // -8.99
```


### `public virtual Double sum()`

Returns the arithmetic sum of elements. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Double`|the sum of elements|

#### Example
```apex
Double sum = [DoubleEnumerable].of(new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9 })
    .sum(); // 3.7
```


### `public virtual Optional avg()`

Returns the arithmetic mean of of elements. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Double describing the result|

#### Example
```apex
Double avg = (Double)
    [DoubleEnumerable].of(new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.3 })
    .avg()
    .get(); // 0.4
```


### `public Integer count()`

Returns the count of elements. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Integer`|the count of elements|

#### Example
```apex
Integer count = [DoubleEnumerable].of(new List<Double>{ 0.1, 0.2, 0.3, -0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.3 })
    .count(); // 10
```


### `public Boolean isEmpty()`

Returns whether the count of elements is 0. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Example
```apex
[DoubleEnumerable].of(new List<Double>{ 0.1, 0.2, 0.3 })
    .isEmpty(); // false
[DoubleEnumerable].of(new List<Double>())
    .isEmpty(); // true
```


### `public List<Double> toList()`

Accumulates elements into a `List<Double>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`List<Double>`|the `List<Double>` containing the enumerable elements|

#### Example
```apex
List<Double> doubles = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI })
    .skip(1)
    .toList(); // [5, 1.5, Math.PI]
```


### `public Set<Double> toSet()`

Accumulates elements into a `Set<Double>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Set<Double>`|the `Set<Double>` containing the enumerable elements|

#### Example
```apex
Set<Double> doubles = [DoubleEnumerable].of(new List<Double>{ 0.1, 5, 1.5, Math.PI, 5 })
    .skip(1)
    .toSet(); // [5, 1.5, Math.PI]
```


---
