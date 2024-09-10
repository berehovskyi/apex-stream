# virtual ObjectSequence

`SUPPRESSWARNINGS`

`APIVERSION: 61`

`STATUS: ACTIVE`

A sequence of `Object` elements supporting aggregate operations.
Sequence operations are composed of sequence chain. A sequence chain consists of:
<ul>
    <li>A Source (which might be an iterable (such as list or set)).</li>
    <li>Zero or more Intermediate Operations (which transform a sequence into another sequence,
    such as [ObjectSequence.filter(IPredicate))](ObjectSequence.filter(IPredicate))).</li>
    <li>A Terminal Operation (which produces a result such as
    [ObjectSequence.count()](ObjectSequence.count()) or [ObjectSequence.collect(ICollector)](ObjectSequence.collect(ICollector))).</li>
</ul>
<p>Sequences are <strong>eager</strong>:</p>
<ul>
    <li>Intermediate operations describe how a sequence is processed eagerly performing every action.</li>
    <li>Computation is performed every time when the intermediate or the terminal operation is initiated.</li>
</ul>
<p>A sequence may not consume all elements. It may not be infinite.</p>
<p>A sequence can be operated on (invoking an intermediate or terminal sequence operation)
<strong>multiple times</strong>.
<p>Contract:</p>
<ul>
    <li>Must be non-interfering (do not modify the sequence source but may mutate its elements).</li>
</ul>
<p>There are primitive specializations for [IntSequence](/docs/Enumerables/IntSequence.md), [LongSequence](/docs/Enumerables/LongSequence.md),
and [DoubleSequence](/docs/Enumerables/DoubleSequence.md) and [SObjectSequence](/docs/Enumerables/SObjectSequence.md) for SObject references.</p>
<p>Sequences and streams equally ensure the fulfillment of the set goals,
but are implemented in different ways.</p>


**Inheritance**

[ObjectEnumerable](/docs/Enumerables/ObjectEnumerable.md)
 > 
ObjectSequence


**See** [SObjectSequence](/docs/Enumerables/SObjectSequence.md)


**See** [IntSequence](/docs/Enumerables/IntSequence.md)


**See** [LongSequence](/docs/Enumerables/LongSequence.md)


**See** [DoubleSequence](/docs/Enumerables/DoubleSequence.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### Iterator
##### `public override Iterator<Object> iterator()`

Returns an internal iterator for the elements of this sequence. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Iterator<Object>`|the internal `Iterator<Object>`|

---
### Sources
##### `public static ObjectEnumerable of(List<Object> objects)`

Returns a `ObjectEnumerable` created from `objects` list.

###### Parameters

|Param|Description|
|---|---|
|`objects`|the list of Objects|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `objects` is null|

###### Example
```apex
ObjectEnumerable peopleSeq = ObjectSequence.of(new List<Person>(people));
```


##### `public static ObjectEnumerable of(Set<Object> objects)`

Returns a `ObjectEnumerable` created from `objects` set.

###### Parameters

|Param|Description|
|---|---|
|`objects`|the set of Objects|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `objects` is null|

###### Example
```apex
ObjectEnumerable peopleSeq = ObjectSequence.of(new Set<Person>(people));
```


##### `public static ObjectEnumerable ofNullable(List<Object> objects)`

Returns a `ObjectEnumerable` created from `objects` list if non-null, otherwise returns an empty `ObjectEnumerable`.

###### Parameters

|Param|Description|
|---|---|
|`objects`|the list of Objects|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable` if `objects` is non-null, otherwise an empty `ObjectEnumerable`|

###### Example
```apex
ObjectEnumerable peopleSeq = ObjectSequence.ofNullable(new List<Person>(people));
ObjectEnumerable emptyPeopleSeq = ObjectSequence.ofNullable((List<Object>) null);
```


##### `public static ObjectEnumerable ofNullable(Set<Object> objects)`

Returns a `ObjectEnumerable` created from `objects` set if non-null, otherwise returns an empty `ObjectEnumerable`.

###### Parameters

|Param|Description|
|---|---|
|`objects`|the set of Objects|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable` if `objects` is non-null, otherwise an empty `ObjectEnumerable`|

###### Example
```apex
ObjectEnumerable peopleSeq = ObjectSequence.ofNullable(new Set<Person>(people));
ObjectEnumerable emptySeq = ObjectSequence.ofNullable((Set<Object>) null);
```


##### `public static ObjectEnumerable empty()`

Returns an empty `ObjectEnumerable`.

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the empty `ObjectEnumerable`|

##### `public static ObjectEnumerable concat(Iterable<Object> iterable1, Iterable<Object> iterable2)`

Returns eagerly concatenated `ObjectEnumerable` whose elements are all the elements of the first `Iterable<Object>` followed by all the elements of the second `Iterable<Object>`.

###### Parameters

|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Object>`|
|`iterable2`|the second `Iterable<Object>`|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

###### Example
```apex
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> append = (List<String>) ObjectSequence.concat(strs1, strs2)
    .toList(String.class);
// ['foo', 'bar', 'baz', 'qux', 'fred', 'foo']
```


##### `public static ObjectEnumerable concat(List<Iterable<Object>> iterables)`

Returns eagerly concatenates `List<Iterable<Object>>`.

###### Parameters

|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<Object>`|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

###### Example
```apex
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> concat = (List<String>) ObjectSequence.concat(new List<Iterable<Object>>{ strs1, strs2 })
    .toList(String.class);
// ['foo', 'bar', 'baz', 'qux', 'fred', 'foo']
```


##### `public static ObjectEnumerable zip(Iterable<Object> iterable1, Iterable<Object> iterable2, IBiOperator combiner)`

Returns a combined `ObjectEnumerable` by applying `combiner` function to each element at the same position.

###### Parameters

|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Object>`|
|`iterable2`|the second `Iterable<Object>`|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

###### Example
```apex
public class ConcatBiOperator extends BiOperator {
    public override Object apply(Object o1, Object o2) { return (String) o1 + '-' + (String) o2; }
}
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> zip = ObjectSequence.zip(strs1, strs2, new ConcatBiOperator())
    .toList();
// ['foo-qux', 'bar-fred', 'baz-foo']
```


##### `public static ObjectEnumerable zip(Iterable<Object> iterable1, Iterable<Object> iterable2, IBiPredicate predicate, IBiOperator combiner)`

Returns a combined `ObjectEnumerable` by applying `combiner` function to each element at the same position, conditioned on satisfying `predicate`.

###### Parameters

|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Object>`|
|`iterable2`|the second `Iterable<Object>`|
|`predicate`|the binary predicate|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2`, `predicate` or `combiner` is null|

###### Example
```apex
public class ContainsAnyBiPredicate extends BiPredicate {
    private final String s;
    public ContainsAnyBiPredicate(String s) { this.s = s; }
    public override Boolean test(Object o1, Object o2) {
        return ((String) o1).contains(s) || ((String) o2).contains(s);
    }
}
public class ConcatBiOperator extends BiOperator {
    public override Object apply(Object o1, Object o2) { return (String) o1 + '-' + (String) o2; }
}
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> zip = (List<String>) ObjectSequence.zip(
    strs1,
    strs2,
    new ContainsAnyBiPredicate('a'),
    new ConcatBiOperator()
)
    .toList(String.class);
// ['bar-fred', 'baz-foo']
```


##### `public virtual override ObjectEnumerable append(Iterable<Object> iterable)`

Returns new `ObjectEnumerable` by appending `iterable` to the current sequence.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the `Iterable<Object>` to append to the current sequence|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> append = (List<String>) ObjectSequence.of(strs1)
    .append(strs2)
    .toList(String.class);
// ['foo', 'bar', 'baz', 'qux', 'fred', 'foo']
```


##### `public virtual override ObjectEnumerable prepend(Iterable<Object> iterable)`

Returns new `ObjectEnumerable` by prepending `iterable` to the current sequence.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the `Iterable<Object>` to prepend to the current sequence|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> union = (List<String>) ObjectSequence.of(strs1)
    .union(strs2)
    .toList(String.class);
// ['foo', 'bar', 'baz', 'qux', 'fred']
```


---
### Intermediate Operations
##### `public virtual override ObjectEnumerable filter(IPredicate predicate)`

Returns a `ObjectEnumerable` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
List<String> filtered = (List<String>)
    ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .filter(new ContainsPredicate('a'))
    .toList(String.class); // ['bar', 'baz']
```


##### `public virtual override ObjectEnumerable take(IPredicate predicate)`

Returns a `ObjectEnumerable` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
List<String> firstMatched = (List<String>)
    ObjectSequence.of(new List<String>{ 'bar', 'baz', 'foo' })
    .take(new ContainsPredicate('a'))
    .toList(String.class); // ['bar', 'baz']
```


##### `public virtual override ObjectEnumerable drop(IPredicate predicate)`

Returns a `ObjectEnumerable` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
List<String> rest = (List<String>)
    ObjectSequence.of(new List<String>{ 'bar', 'baz', 'foo' })
    .take(new ContainsPredicate('a'))
    .toList(String.class); // ['foo']
```


##### `public virtual override ObjectEnumerable mapTo(IOperator mapper)`

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
public class ToLowerCaseOperator extends Operator {
    public override Object apply(Object o) { return ((String) o).toLowerCase(); }
}
List<String> normalizedStrings = (List<String>)
    ObjectSequence.of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
    .mapTo(new ToLowerCaseOperator())
    .toList(String.class); // ['foo', 'bar', 'baz', 'foo', 'bar']
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
public class LengthFunction extends Function {
    public override Object apply(Object o) { return ((String) o).length(); }
}
List<Integer> ints = ObjectSequence.of(new List<String>{ 'f', 'ba', 'baz' })
    .mapToInt(new LengthFunction())
    .toList(); // [1, 2, 3]
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
public class LengthFunction extends Function {
    public override Object apply(Object o) { return (Long) ((String) o).length(); }
}
List<Long> longs = ObjectSequence.of(new List<String>{ 'f', 'ba', 'baz' })
    .mapToLong(new LengthFunction())
    .toList(); // [1L, 2L, 3L]
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
public class LengthFunction extends Function {
    public override Object apply(Object o) { return (Double) ((String) o).length(); }
}
List<Double> doubles = ObjectSequence.of(new List<String>{ 'f', 'ba', 'baz' })
    .mapToDouble(new LengthFunction())
    .toList(); // [1.0, 2.0, 3.0]
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
    public override Object apply(Object o) { return new Account(Name = (String) o); }
}
List<Account> accounts = ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .mapToSObject(new CreateAccountFunction())
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' }
]
```


##### `public virtual override ObjectEnumerable flatMapTo(IFunction mapper)`

Returns a new `ObjectEnumerable` with `Object` elements as a result of replacing each element of this sequence with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Object>`|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Example
```apex
public class ToLowerCaseFunction extends Function {
    public override Object apply(Object o) { return new List<String>{ ((String) o).toLowerCase() }; }
}
List<String> normalizedStrings = (List<String>)
    ObjectSequence.of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
    .flatMapTo(new ToLowerCaseFunction())
    .toList(String.class); // ['foo', 'bar', 'baz', 'foo', 'bar']
```


##### `public virtual override IntEnumerable flatMapToInt(IFunction mapper)`

Returns a new `IntEnumerable` with `Integer` elements as a result of replacing each element of this sequence with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Integer>`|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

###### Example
```apex
public class LengthFunction extends Function {
    public override Object apply(Object o) { return new List<Integer>{ ((String) o).length() }; }
}
List<Integer> ints = ObjectSequence.of(new List<String>{ 'f', 'ba', 'baz' })
    .flatMapToInt(new LengthFunction())
    .toList(); // [1, 2, 3]
```


##### `public virtual override LongEnumerable flatMapToLong(IFunction mapper)`

Returns a new `LongEnumerable` with `Long` elements as a result of replacing each element of this sequence with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Example
```apex
public class LengthFunction extends Function {
    public override Object apply(Object o) { return new List<Long>{ ((String) o).length() }; }
}
List<Long> longs = ObjectSequence.of(new List<String>{ 'f', 'ba', 'baz' })
    .flatMapToLong(new LengthFunction())
    .toList(); // [1L, 2L, 3L]
```


##### `public virtual override DoubleEnumerable flatMapToDouble(IFunction mapper)`

Returns a new `DoubleEnumerable` with `Double` elements as a result of replacing each element of this sequence with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Double>`|

###### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

###### Example
```apex
public class LengthFunction extends Function {
    public override Object apply(Object o) { return new List<Double>{ ((String) o).length() }; }
}
List<Double> doubles = ObjectSequence.of(new List<String>{ 'f', 'ba', 'baz' })
    .flatMapToDouble(new LengthFunction())
    .toList(); // [1.0, 2.0, 3.0]
```


##### `public virtual override SObjectEnumerable flatMapToSObject(IFunction mapper)`

Returns a new `SObjectEnumerable` with `SObject` elements as a result of replacing each element of this sequence with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<SObject>`|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Example
```apex
public class CreateAccountFunction extends Function {
    public override Object apply(Object o) { return new List<Account>{ new Account(Name = (String) o) }; }
}
List<Account> accounts = ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .flatMapToSObject(new CreateAccountFunction())
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' }
]
```


##### `public virtual override ObjectEnumerable forEach(IConsumer consumer)`

Returns a `SObjectEnumerable` after performing `consumer` action on each element. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|this `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

###### Example
```apex
public class DebugConsumer extends Consumer {
    public override void accept(Object o) { System.debug(o); }
}
List<String> strings = (List<String>) ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .forEach(new DebugConsumer()) // prints 'foo', 'bar', 'baz'
    .toList(String.class); // ['foo', 'bar', 'baz']
```


##### `public virtual override ObjectEnumerable distinct()`

Returns a `ObjectEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

###### Example
```apex
List<String> distinct = (List<String>)
    ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz', 'foo', 'bar' })
    .distinct()
    .toList(String.class); // ['foo', 'bar', 'baz']
```


##### `public virtual override ObjectEnumerable distinct(IFunction classifier)`

Returns a `ObjectEnumerable` with distinct elements according to `classifier` function. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the classifier function|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
public class ToLowerCaseOperator extends Operator {
    public override Object apply(Object o) { return ((String) o).toLowerCase(); }
}
List<String> distinct = (List<String>)
    ObjectSequence.of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
    .distinct(new ToLowerCaseOperator())
    .toList(String.class); // ['foo', 'Bar', 'baz']
```


##### `public virtual override ObjectEnumerable sort()`

Returns a `ObjectEnumerable` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

###### Example
```apex
List<String> sorted = (List<String>) ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz', null })
    .sort()
    .toList(String.class); // [null, 'bar', 'baz', 'foo']
```


##### `public virtual override ObjectEnumerable sort(IComparer comparer)`

Returns a `ObjectEnumerable` with sorted elements according to `comparer`. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`comparer`|the non-interfering, stateless comparer to compare sequence elements|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

###### Example
```apex
public class SecondLetterComparer extends Comparer {
    public override Integer compare(Object o1, Object o2) {
        String s1 = (String) o1;
        String s2 = (String) o2;
        if (s1.length() > 1 && s2.length() > 1) {
            return s1.split('')[1].compareTo(s2.split('')[1]);
        }
        return s1.length() <= 1 ? -1 : 1;
    }
}
List<String> sorted = (List<String>)
    ObjectSequence.of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
    .sort(new SecondCharComparer())
    .toList(String.class); // ['Bar', 'baz', 'bar', 'foo', 'Foo']
```


##### `public virtual override ObjectEnumerable lim(Integer lim)`

Returns a `ObjectEnumerable` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `lim` is less than 0|
|`NullPointerException`|if `lim` is null|

###### Example
```apex
List<String> first2 = (List<String>) ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .lim(2)
    .toList(String.class); // ['foo', 'baz']
```


##### `public virtual override ObjectEnumerable skip(Integer n)`

Returns a new `ObjectEnumerable` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `n` is less than 0|
|`NullPointerException`|if `n` is null|

###### Example
```apex
List<String> rest = (List<String>) ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .skip(1)
    .toList(String.class); // ['bar', 'baz']
```


---
### Terminal Operations
##### `public virtual override Object reduce(Object identity, IBiOperator accumulator)`

Performs a reduction on `Object` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Returns

|Type|Description|
|---|---|
|`Object`|the `Object` result of the reduction|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
public class ConcatenateBiOperator extends BiOperator {
    private final String separator;
    public ConcatenateBiOperator(String separator) { this.separator = separator; }
    public override Object apply(Object o1, Object o2) {
        return String.isEmpty((String) o1) ? (String) o2 : o1 + separator + o2;
    }
}
String concatenated = (String) ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .reduce('', new ConcatenateBiOperator('-')); // 'foo-bar-baz'
String concatenated1 = (String) ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .reduce('seed', new ConcatenateBiOperator(';')); // 'seed;foo;bar;baz'
```


##### `public virtual override Optional reduce(IBiOperator accumulator)`

Performs a reduction on `Object` elements, using `identity` value and associative `accumulator` function, and returns an `Optional` describing the reduced value. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` result of the reduction|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
public class ConcatenateBiOperator extends BiOperator {
    private final String separator;
    public ConcatenateBiOperator(String separator) { this.separator = separator; }
    public override Object apply(Object o1, Object o2) {
        return String.isEmpty((String) o1) ? (String) o2 : o1 + separator + o2;
    }
}
String concatenated = (String) ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .reduce(new ConcatenateBiOperator('-'))
    .get(); // 'foo-bar-baz'
String concatenated1 = (String) ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .reduce(new ConcatenateBiOperator(';'))
    .get(); // 'seed;foo;bar;baz'
```


##### `public virtual override Object collect(ICollector collector)`

Performs a mutable reduction operation on elements, collecting elements to a container using `collector`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`collector`|the collector|

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
// Simple collecting
public class AddToStringSetBiConsumer extends BiConsumer {
    public override void accept(Object container, Object o) { ((Set<String>) container).add((String) o); }
}
Set<String> strings = (Set<String>)
    ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', 'foo', 'bar' })
    .collect(Collector.of(Supplier.of(Set<String>.class), new AddToStringSetBiConsumer()));
// ['foo', 'bar', 'baz', 'quux', 'a']
// Cascaded operation
public class LengthFunction extends Function {
    public override Object apply(Object o) { return ((String) o).length(); }
}
public class PutToObjectsByIntMap extends BiConsumer {
    private final IFunction classifier;
    public PutToObjectsByIntMap(ICollector downstream, IFunction classifier) {
        this.downstream = downstream;
        this.classifier = classifier;
    }
    public override void accept(Object container, Object o) {
        final Map<Integer, Set<String>> m = (Map<Integer, Set<String>>) container;
        final Integer key = (Integer) classifier.apply(o);
        if (!m.containsKey(key)) { m.put(key, (Set<String>) downstream.supplier().get()); }
        downstream.accumulator().accept(m.get(key), o);
    }
}
// the classifier function mapping input elements to keys.
IFunction classificationFunction = new LengthFunction();
// the supplier providing a new empty Map into which the results will be inserted.
ISupplier mapSupplier = Supplier.of(Map<Integer, Set<String>>.class);
// the Collector implementing the downstream reduction.
ICollector downstreamCollector = Collector.of(Supplier.of(Set<String>.class), new AddToStringSetBiConsumer());
// the function that folds an element into a result container.
IBiConsumer accumulator = new PutToObjectsByIntMap(downstreamCollector, new LengthFunction());
// the Collector implementing the cascaded group-by operation.
ICollector groupByLengthCollector = Collector.of(mapSupplier, accumulator);
Map<Integer, Set<String>> stringsByLength = (Map<Integer, Set<String>>)
    ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', 'foo', 'bar' })
    .collect(groupByLengthCollector); //
{
  1: ['a'],
  3: ['foo', 'bar', 'baz'],
  4: ['quux']
}
// The same result can be obtained by using built-in Collectors
Map<Integer, Set<String>> stringsByLength1 = (Map<Integer, Set<String>>)
    ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', 'foo', 'bar' })
    .collect(
        Collectors.groupingByInt(new LengthFunction(), Collectors.toStringSet())
            .cast(Map<Integer, Set<String>>.class)
    );
```


##### `public virtual override Optional find(IPredicate predicate)`

Returns an `Optional` describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
String firstFound = (String) ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .find(new ContainsPredicate('a'))
    .get(); // 'bar'
```


##### `public virtual override Boolean every(IPredicate predicate)`

Returns whether all elements match `predicate`. If `ObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
Boolean doesEveryStringContainA = ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .every(new ContainsPredicate('a')); // false
```


##### `public virtual override Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `ObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
Boolean doesSomeStringContainA = ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .some(new ContainsPredicate('a')); // true
```


##### `public virtual override Integer count()`

Returns the count of elements. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Integer`|the count of elements|

###### Example
```apex
Integer count = ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .count(); // 3
```


##### `public virtual override Boolean isEmpty()`

Returns whether the count of elements is 0. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

###### Example
```apex
ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz' })
    .isEmpty(); // false
ObjectSequence.of(new List<String>()))
    .isEmpty(); // true
```


##### `public virtual override List<Object> toList()`

Accumulates elements into a `List<Object>`. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the sequence elements|

###### Example
```apex
List<Object> strings = ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz', 'qux' })
    .skip(1)
    .toList(); // ['bar', 'baz', 'qux']
```


##### `public virtual override Set<Object> toSet()`

Accumulates elements into a `Set<Object>`. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Set<Object>`|the `Set<Object>` containing the sequence elements|

###### Example
```apex
Set<Object> strings = ObjectSequence.of(new List<String>{ 'foo', 'bar', 'baz', 'qux', 'foo', 'bar' })
    .skip(1)
    .toSet(); // ['bar', 'baz', 'qux']
```


---
### Other
##### `public virtual ObjectEnumerable union(Iterable<Object> iterable)`

*Inherited*


Returns a new `ObjectEnumerable` as a set union of the current and another iterables.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> union = (List<String>) [ObjectEnumerable].of(strs1)
    .union(strs2)
    .toList(String.class);
// ['foo', 'bar', 'baz', 'qux', 'fred']
```


##### `public virtual ObjectEnumerable union(Iterable<Object> iterable, IFunction classifier)`

*Inherited*


Returns a new `ObjectEnumerable` as a set union of the current and another iterables according to `classifier`.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `classifier` is null|

###### Example
```apex
public class ToLowerCaseOperator extends Operator {
    public override Object apply(Object o) { return ((String) o).toLowerCase(); }
}
List<Object> strs1 = new List<String>{ 'foo', 'Bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'Foo' };
List<String> union = (List<String>) [ObjectEnumerable].of(strs1)
    .union(strs2, new ToLowerCaseOperator())
    .toList(String.class);
// ['foo', 'Bar', 'baz', 'qux', 'fred']
```


##### `public virtual ObjectEnumerable intersect(Iterable<Object> iterable)`

*Inherited*


Returns a new `ObjectEnumerable` as a set intersection of the current and another iterables.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> intersect = (List<String>) [ObjectEnumerable].of(strs1)
    .intersect(strs2)
    .toList(String.class);
// ['foo']
```


##### `public virtual ObjectEnumerable intersect(Iterable<Object> iterable, IFunction classifier)`

*Inherited*


Returns a new `ObjectEnumerable` as a set intersection of the current and another iterables according to `classifier`.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `classifier` is null|

###### Example
```apex
public class ToLowerCaseOperator extends Operator {
    public override Object apply(Object o) { return ((String) o).toLowerCase(); }
}
List<Object> strs1 = new List<String>{ 'foo', 'Bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'Foo' };
List<String> intersect = (List<String>) [ObjectEnumerable].of(strs1)
    .intersect(strs2, new ToLowerCaseOperator())
    .toList(String.class);
// ['foo']
```


##### `public virtual ObjectEnumerable except(Iterable<Object> iterable)`

*Inherited*


Returns a new `ObjectEnumerable` as a set difference of the current and another iterables.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> except = (List<String>) [ObjectEnumerable].of(strs1)
    .except(strs2)
    .toList(String.class);
// ['bar', 'baz']
List<String> except1 = (List<String>) [ObjectEnumerable].of(strs2)
    .except(strs1)
    .toList(String.class);
// ['qux', 'fred']
```


##### `public virtual ObjectEnumerable except(Iterable<Object> iterable, IFunction classifier)`

*Inherited*


Returns a new `ObjectEnumerable` as a set difference of the current and another iterables according to `classifier`.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `classifier` is null|

###### Example
```apex
public class ToLowerCaseOperator extends Operator {
    public override Object apply(Object o) { return ((String) o).toLowerCase(); }
}
List<Object> strs1 = new List<String>{ 'foo', 'Bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'Foo' };
List<String> except = (List<String>) [ObjectEnumerable].of(strs1)
    .except(strs2, new ToLowerCaseOperator())
    .toList(String.class);
// ['Bar', 'baz']
List<String> except1 = (List<String>) [ObjectEnumerable].of(strs2)
    .except(strs1, new ToLowerCaseOperator())
    .toList(String.class);
// ['qux', 'fred']
```


##### `public virtual ObjectEnumerable withoutNulls()`

*Inherited*


Returns a new `ObjectEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

###### Example
```apex
List<String> withoutNulls = (List<String>)
    [ObjectEnumerable].of(new List<String>{ 'foo', null, 'bar', 'baz', null })
    .withoutNulls()
    .toList(String.class); // ['foo', 'bar', 'baz']
```


##### `public virtual Boolean none(IPredicate predicate)`

*Inherited*


Returns whether no elements match `predicate`. If `ObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

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
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
Boolean doesNoneStringContainA = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .none(new ContainsPredicate('a')); // false
```


##### `public virtual Optional max(IComparer comparer)`

*Inherited*


Returns an `Optional` Object describing the maximum element according to `comparer`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Object|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

###### Example
```apex
public class LengthComparer extends Comparer {
   public override Integer compare(Object o1, Object o2) {
       Integer len1 = o1 == null ? -1 : ((String) o1).length();
       Integer len2 = o2 == null ? -1 : ((String) o2).length();
       return len1 > len2 ? 1 : len1 == len2 ? 0 : -1;
   }
}
String maxLen = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', null })
    .max()
    .get(); // 'quux'
```


##### `public virtual Optional min(IComparer comparer)`

*Inherited*


Returns an `Optional` Object describing the minimum element according to `comparer`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`comparer`|comparer the comparer|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Object|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

###### Example
```apex
public class LengthComparer extends Comparer {
   public override Integer compare(Object o1, Object o2) {
       Integer len1 = o1 == null ? -1 : ((String) o1).length();
       Integer len2 = o2 == null ? -1 : ((String) o2).length();
       return len1 > len2 ? 1 : len1 == len2 ? 0 : -1;
   }
}
String minLen = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', null })
    .min()
    .get(); // null
String minLen1 = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a' })
    .min()
    .get(); // 'a'
```


---
