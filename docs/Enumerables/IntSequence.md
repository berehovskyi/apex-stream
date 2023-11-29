# virtual IntSequence

`SUPPRESSWARNINGS`

`APIVERSION: 58`

`STATUS: ACTIVE`

A sequence of `Integer` elements supporting aggregate operations,
a primitive specialization of [ObjectSequence](/docs/Enumerables/ObjectSequence.md).


**Inheritance**

[IntEnumerable](/docs/Enumerables/IntEnumerable.md)
 > 
IntSequence


**See** [SObjectSequence](/docs/Enumerables/SObjectSequence.md)


**See** [ObjectSequence](/docs/Enumerables/ObjectSequence.md)


**See** [DoubleSequence](/docs/Enumerables/DoubleSequence.md)


**See** [LongSequence](/docs/Enumerables/LongSequence.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### Iterator
##### `public override Iterator<Integer> iterator()`

Returns an internal iterator for the elements of this sequence. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Iterator<Integer>`|the internal `Iterator<Integer>`|

---
### Sources
##### `public static IntEnumerable of(List<Integer> integers)`

Returns a `IntEnumerable` created from `integers` list.

###### Parameters

|Param|Description|
|---|---|
|`integers`|the list of Longs|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

###### Example
```apex
IntEnumerable intSeq = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 });
```


##### `public static IntEnumerable of(Set<Integer> integers)`

Returns a `IntEnumerable` created from `integers` set.

###### Parameters

|Param|Description|
|---|---|
|`integers`|the set of Integers|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

###### Example
```apex
IntEnumerable intSeq = IntSequence.of(new Set<Integer>{ 0, 5, 1, -10 });
```


##### `public static IntEnumerable ofNullable(List<Integer> integers)`

Returns a `IntEnumerable` created from `integers` list if non-null, otherwise returns an empty `IntEnumerable`.

###### Parameters

|Param|Description|
|---|---|
|`integers`|the list of Integers|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable` if `integers` is non-null, otherwise an empty `IntEnumerable`|

###### Example
```apex
IntEnumerable intSeq = IntSequence.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
```


##### `public static IntEnumerable ofNullable(Set<Integer> integers)`

Returns a `IntEnumerable` created from `integers` set if non-null, otherwise returns an empty `IntEnumerable`.

###### Parameters

|Param|Description|
|---|---|
|`integers`|the set of Integers|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable` if `integers` is non-null, otherwise an empty `IntEnumerable`|

###### Example
```apex
IntEnumerable intSeq = IntSequence.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
```


##### `public static IntEnumerable empty()`

Returns an empty `IntEnumerable`.

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the empty `IntEnumerable`|

##### `public static IntEnumerable range(Integer fromInt, Integer toInt)`

Returns an ordered `IntEnumerable` from `fromInt` (inclusive) to `toInt` (inclusive) by an incremental step of 1.

###### Parameters

|Param|Description|
|---|---|
|`fromInt`|the inclusive initial value|
|`toInt`|the inclusive upper bound|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `fromInt` or `toInt` is null|

###### Example
```apex
IntEnumerable intSeqFrom0To100 = IntSequence.range(0, 100);
```


##### `public static IntEnumerable concat(Iterable<Integer> iterable1, Iterable<Integer> iterable2)`

Returns eagerly concatenated `IntEnumerable` whose elements are all the elements of the first `Iterable<Integer>` followed by all the elements of the second `Iterable<Integer>`.

###### Parameters

|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Integer>`|
|`iterable2`|the second `Iterable<Integer>`|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

###### Example
```apex
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
List<Integer> concat = IntSequence.concat(ints1, ints2)
    .toList();
// [5, 3, 9, 7, 5, 9, 3, 7, 8, 3, 6, 4, 4, 9, 1, 0]
```


##### `public static IntEnumerable concat(List<Iterable<Integer>> iterables)`

Returns eagerly concatenates `List<Iterable<Integer>>`.

###### Parameters

|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<Integer>`|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

###### Example
```apex
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
List<Integer> concat = IntSequence.concat(new List<Iterable<Integer>>{ ints1, ints2 })
    .toList();
// [5, 3, 9, 7, 5, 9, 3, 7, 8, 3, 6, 4, 4, 9, 1, 0]
```


##### `public static IntEnumerable zip(Iterable<Integer> iterable1, Iterable<Integer> iterable2, IBiOperator combiner)`

Returns a combined `IntEnumerable` by applying `combiner` function to each element at the same position.

###### Parameters

|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Integer>`|
|`iterable2`|the second `Iterable<Integer>`|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

###### Example
```apex
public class SumBiOperator extends BiOperator {
    public override Object apply(Object o1, Object o2) { return (Integer) o1 + (Integer) o2; }
}
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
List<Integer> zip = IntSequence.zip(ints1, ints2, new SumBiOperator())
    .toList();
// [13, 6, 15, 11, 9, 18, 4, 7]
```


##### `public virtual override IntEnumerable append(Iterable<Integer> iterable)`

Returns new `IntEnumerable` by appending `iterable` to the current sequence.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the `Iterable<Integer>` to append to the current sequence|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
List<Integer> append = IntSequence.of(ints1)
    .append(ints2)
    .toList();
// [5, 3, 9, 7, 5, 9, 3, 7, 8, 3, 6, 4, 4, 9, 1, 0]
```


##### `public virtual override IntEnumerable prepend(Iterable<Integer> iterable)`

Returns new `IntEnumerable` by prepending `iterable` to the current sequence.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the `Iterable<Integer>` to prepend to the current sequence|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
List<Integer> prepend = IntSequence.of(ints1)
    .prepend(ints2)
    .toList();
// [8, 3, 6, 4, 4, 9, 1, 0, 5, 3, 9, 7, 5, 9, 3, 7]
```


---
### Intermediate Operations
##### `public virtual override IntEnumerable filter(IPredicate predicate)`

Returns a `IntEnumerable` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Integer> filtered = IntSequence.of(new List<Integer>{ 0, 5, 1, 1, 5 })
    .filter(BasePredicates.isEqual(5))
    .toList(); // [5, 5]
```


##### `public virtual override IntEnumerable take(IPredicate predicate)`

Returns a `IntEnumerable` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Integer> firstFiltered = IntSequence.of(new List<Integer>{ 0, 0, 1, 1, 5 })
    .take(BasePredicates.isEqual(0))
    .toList(); // [0, 0]
```


##### `public virtual override IntEnumerable drop(IPredicate predicate)`

Returns a `IntEnumerable` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Integer> rest = IntSequence.of(new List<Integer>{ 0, 0, 1, 1, 5 })
    .drop(BasePredicates.isEqual(0))
    .toList(); // [1, 1, 5]
```


##### `public virtual override IntEnumerable mapTo(IOperator mapper)`

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
public class MultiplyIntOperator extends Operator {
    private final Integer i;
    public MultiplyIntOperator(Integer i) { this.i = i; }
    public override Object apply(Object j) { return (Integer) j * i; }
}
List<Integer> doubledInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .mapTo(new MultiplyIntOperator(2))
    .toList(); // [0, 10, 2, -20]
```


##### `public virtual override LongEnumerable mapToLong(IFunction mapper)`

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
public class MultiplyLongFunction extends Function {
    private final Long l;
    public MultiplyLongFunction(Long l) { this.l = l; }
    public override Object apply(Object j) { return (Integer) j * l; }
}
List<Long> doubledLongs = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .mapToLong(new MultiplyLongFunction(2))
    .toList(); // [0L, 10L, 2L, -20L]
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
    public override Object apply(Object j) { return (Integer) j * d; }
}
List<Double> doubledDoubles = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
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
    public override Object apply(Object i) { return new Account(AnnualRevenue = (Integer) i); }
}
List<Account> accounts = IntSequence.of(new List<Integer>{ 0, 5, 1, 10 })
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
List<String> strings = (List<String>) IntSequence.of(new List<Integer>{ 0, 5, 1, 10 })
    .mapToObject(new ToStringFunction())
    .toList(String.class); // ['0', '5', '1', '10']
```


##### `public virtual override IntEnumerable flatMapTo(IFunction mapper)`

Returns a new `IntEnumerable` with `Integer` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Integer>`|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class MultiplyIntFunction extends Function {
    private final Integer i;
    public MultiplyIntFunction(Integer i) { this.i = i; }
    public override Object apply(Object o) { return new List<Integer>{ ((Integer) o) * i }; }
}
List<Integer> ints = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .flatMapTo(new MultiplyIntFunction(2))
    .toList(); // [0, 10, 2, -20]
```


##### `public virtual override IntEnumerable forEach(IConsumer consumer)`

Returns a `IntEnumerable` after performing `consumer` action on each element. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|this `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

###### Example
```apex
public class DebugConsumer extends Consumer {
    public override void accept(Object o) { System.debug(o); }
}
List<Integer> ints = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .forEach(new DebugConsumer()) // prints 0, 5, 1, -10
    .toList(); // [0, 5, 1, -10 ]
```


##### `public virtual override IntEnumerable distinct()`

Returns a `IntEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

###### Example
```apex
List<Integer> distinct = IntSequence.of(new List<Integer>{ 0, 5, 1, -10, 0, 5 })
    .distinct()
    .toList(); // [0, 5, 1, -10];
```


##### `public virtual override IntEnumerable sort()`

Returns a `IntEnumerable` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

###### Example
```apex
List<Integer> sorted = IntSequence.of(new List<Integer>{ 0, 5, null, 1, -10 })
    .sort()
    .toList(); // [null, -10, 0, 1, 5]
```


##### `public virtual override IntEnumerable sort(SortOrder order)`

Returns a `IntEnumerable` with sorted elements considering `order`. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`order`|the sort order|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `order` is null|

###### Example
```apex
List<Integer> sorted = IntSequence.of(new List<Integer>{ 0, 5, null, 1, -10 })
    .sort(SortOrder.DESCENDING)
    .toList(); // [5, 1, 0, -10, null]
```


##### `public virtual override IntEnumerable lim(Integer lim)`

Returns a `IntEnumerable` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `lim` is less than 0|
|`NullPointerException`|if `lim` is null|

###### Example
```apex
List<Integer> first3Ints = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .lim(3)
    .toList(); // [0, 5, 1]
```


##### `public virtual override IntEnumerable skip(Integer n)`

Returns a new `IntEnumerable` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `n` is less than 0|
|`NullPointerException`|if `n` is null|

###### Example
```apex
List<Integer> restInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .skip(1)
    .toList(); // [5, 1, -10]
```


---
### Terminal Operations
##### `public virtual override Integer reduce(Integer identity, IBiOperator accumulator)`

Performs a reduction on `Integer` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Returns

|Type|Description|
|---|---|
|`Integer`|the `Integer` result of the reduction|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
public class SumBiOperator extends BiOperator {
    public override Object apply(Object o1, Object o2) { return (Integer) o1 + (Integer) o2; }
}
public class ProductBiOperator extends BiOperator {
    public override Object apply(Object o1, Object o2) { return (Integer) o1 * (Integer) o2; }
}
Integer sum = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 }).reduce(0, new SumBiOperator()); // -4
Integer factorialOfN = IntSequence.range(1, n).reduce(1, new ProductBiOperator());
```


##### `public override Optional reduce(IBiOperator accumulator)`

Performs a reduction on `Integer` elements, using `identity` value and associative `accumulator` function, and returns an `Optional` Integer describing the reduced value. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Integer result of the reduction|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
public class SumBiOperator extends BiOperator {
    public override Object apply(Object o1, Object o2) { return (Integer) o1 + (Integer) o2; }
}
Integer sum = (Integer) IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .reduce(new SumBiOperator())
    .get(); // -4
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
public class AddToIntSetBiConsumer extends BiConsumer {
    public override void accept(Object container, Object o) { ((Set<Integer>) container).add((Integer) o); }
}
Set<Integer> ints = (Set<Integer>)
    IntSequence.of(new List<Integer>{ 0, 5, 1, -10, 5, 0 })
    .collect(Collector.of(Supplier.of(Set<Integer>.class), new AddToIntSetBiConsumer()));
// [0, 5, 1, -10]
```


##### `public virtual override Optional find(IPredicate predicate)`

Returns an `Optional` Integer describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Integer|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class IsEvenPredicate extends Predicate {
    public override Boolean test(Object o) { return Math.mod((Integer) o, 2) == 0; }
}
Integer firstEvenInt = (Integer) IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .find(new IsEvenPredicate())
    .get(); // 0
```


##### `public virtual override Boolean every(IPredicate predicate)`

Returns whether all elements match `predicate`. If `IntEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
    public override Boolean test(Object o) { return Math.mod((Integer) o, 2) == 0; }
}
Boolean isEveryIntEven = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .every(new IsEvenPredicate()); // false
```


##### `public override Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `IntEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
    public override Boolean test(Object o) { return Math.mod((Integer) o, 2) == 0; }
}
Boolean isSomeIntEven = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .some(new IsEvenPredicate()); // true
```


##### `public virtual override Integer sum()`

Returns the sum of elements. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Integer`|the sum of elements|

###### Example
```apex
Integer sum = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .sum(); // -4
```


##### `public virtual override Optional avg()`

Returns `Optional` Double describing the arithmetic mean of elements of this sequence, or an empty `Optional` if this sequence is empty. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Optional`|the arithmetic mean of elements|

###### Example
```apex
Double avg = (Double) IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .avg()
    .get(); // -1.0
```


##### `public virtual override Integer count()`

Returns the count of elements. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Integer`|the count of elements|

###### Example
```apex
Integer count = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
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
IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .isEmpty(); // false
IntSequence.of(new List<Integer>())
    .isEmpty(); // true
```


##### `public virtual override List<Integer> toList()`

Accumulates elements into a `List<Integer>`. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`List<Integer>`|the `List<Integer>` containing the sequence elements|

###### Example
```apex
List<Integer> restInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .lim(1)
    .toList();
```


##### `public virtual override Set<Integer> toSet()`

Accumulates elements into a `Set<Integer>`. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Set<Integer>`|the `Set<Integer>` containing the sequence elements|

###### Example
```apex
Set<Integer> restInts = IntSequence.of(new List<Integer>{ 0, 5, 1, -10 })
    .lim(1)
    .toSet();
```


---
### Other
##### `public virtual IntEnumerable union(Iterable<Integer> iterable)`

*Inherited*


Returns a new `IntEnumerable` as a set union of the current and another iterables.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
List<Integer> union = [IntEnumerable].of(ints1)
    .union(ints2)
    .toList(); // [5, 3, 9, 7, 8, 6, 4, 1, 0]
```


##### `public virtual IntEnumerable intersect(Iterable<Integer> iterable)`

*Inherited*


Returns a new `IntIterable` as a set intersection of the current and another iterables.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntIterable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
List<Integer> intersection = [IntEnumerable].of(ints1)
    .intersect(ints2)
    .toList(); // [3, 9]
```


##### `public virtual IntEnumerable except(Iterable<Integer> iterable)`

*Inherited*


Returns a new `IntIterable` as a set difference of the current and another iterables.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntIterable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Integer> ints1 = new List<Integer>{ 5, 3, 9, 7, 5, 9, 3, 7 };
List<Integer> ints2 = new List<Integer>{ 8, 3, 6, 4, 4, 9, 1, 0 };
List<Integer> diff = [IntEnumerable].of(ints1)
    .except(ints2)
    .toList(); // [5, 7]
```


##### `public virtual IntEnumerable withoutNulls()`

*Inherited*


Returns a new `IntEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

###### Example
```apex
List<Integer> withoutNulls = [IntEnumerable].of(new List<Integer>{ 0, 0, null, 1, 1, null, 5 })
    .withoutNulls()
    .toList(); // [0, 0, 1, 1, 5]
```


##### `public virtual Boolean none(IPredicate predicate)`

*Inherited*


Returns whether no elements match `predicate`. If `IntEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

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
    public override Boolean test(Object o) { return Math.mod((Integer) o, 2) == 0; }
}
Boolean isNoneIntEven = [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
    .none(new IsEvenPredicate()); // false
```


##### `public virtual Optional max()`

*Inherited*


Returns an `Optional` Integer describing the maximum element. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Integer|

###### Example
```apex
Integer max = (Integer) [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
    .max()
    .get(); // 5
```


##### `public virtual Optional min()`

*Inherited*


Returns an `Optional` Integer describing the minimum element. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Integer|

###### Example
```apex
Integer min = (Integer) [IntEnumerable].of(new List<Integer>{ 0, 5, 1, -10 })
    .min()
    .get(); // -10
```


---
