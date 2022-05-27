# ObjectStream

`APIVERSION: 54`

`STATUS: ACTIVE`

A sequence of `Object` elements supporting aggregate operations. Stream operations are composed of stream chain. A stream chain consists of: <ul>     <li>A Source (which might be an iterable (such as list or set), an iterator, a generator function, etc).</li>     <li>Zero or more Intermediate Operations (which transform a stream into another stream,     such as ObjectStream.filter(IPredicate)).</li>     <li>A Terminal Operation (which produces a result such as     ObjectStream.count() or ObjectStream.collect(ICollector)).</li> </ul> <p>Streams are <strong>lazy</strong>:</p> <ul>     <li>Intermediate operations describe how a stream is processed without performing any action.</li>     <li>Computation is only performed when the terminal operation is initiated, and source elements are consumed only as needed.</li> </ul> <p>A stream may not consume all elements. It may be infinite and complete in finite time.</p> <p>A stream should be operated on (invoking an intermediate or terminal stream operation) only <strong>once</strong>. A stream throws [IllegalStateException](/docs/Exceptions/IllegalStateException.md) if it detects that the stream is being reused.</p> <p>Intermediate operations describe how a stream is processed without performing any action.</p> <p>Contract:</p> <ul>     <li>Must be non-interfering (do not modify the stream source but may mutate its elements).</li>     <li>Should be stateless in most cases.</li> </ul> <p>Unlike in Java, an Apex Streams may execute only <strong>sequentially</strong>, i.e. do not support `spliterator()`.</p> <p>There are primitive specializations for [IntStream](/docs/Iterables/IntStream.md), [LongStream](/docs/Iterables/LongStream.md), and [DoubleStream](/docs/Iterables/DoubleStream.md) and [SObjectStream](/docs/Iterables/SObjectStream.md) for SObject references.</p> <p>Sequences and streams equally ensure the fulfillment of the set goals, but are implemented in different ways.</p>


**Author** O. Berehovskyi


**Group** Iterables


**See** [ObjectSequence](/docs/Iterables/ObjectSequence.md)


**See** [SObjectStream](/docs/Iterables/SObjectStream.md)


**See** [IntStream](/docs/Iterables/IntStream.md)


**See** [LongStream](/docs/Iterables/LongStream.md)


**See** [DoubleStream](/docs/Iterables/DoubleStream.md)

## Properties

### `isOperated` → `Boolean`


A flag defining whether this stream has been linked or consumed.

---
## Methods
### Other
##### `iterator()`

Returns an internal iterator for the elements of this stream. <p>Terminal Operation.</p>

###### Return

**Type**

Iterator<Object>

**Description**

the internal `Iterator<Object>`

###### Throws
|Exception|Description|
|---|---|
|`IllegalArgumentException`|if this stream has been operated (linked or consumed)|

---
### Sources
##### `static of(Iterator<Object> iterator)`

Returns a `ObjectStream` created from `iterator`.

###### Parameters
|Param|Description|
|---|---|
|`iterator`|the iterator|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

###### Example
```apex
IObjectIterable peopleStream = ObjectStream.of(new List<Person>(people).iterator());
IObjectIterable peopleStream = ObjectStream.of(new Set<Person>(people).iterator());
IObjectIterable peopleStream = ObjectStream.of(otherStream.iterator());
```

##### `static of(List<Object> objects)`

Returns a `ObjectStream` created from `List<Object>`.

###### Parameters
|Param|Description|
|---|---|
|`objects`|the list|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `objects` is null|

###### Example
```apex
IObjectIterable peopleStream = ObjectStream.of(new List<Person>(people));
```

##### `static of(Set<Object> objects)`

Returns a `ObjectStream` created from `Set<Object>`.

###### Parameters
|Param|Description|
|---|---|
|`objects`|the set|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `objects` is null|

###### Example
```apex
IObjectIterable peopleStream = ObjectStream.of(new Set<Object>(people));
```

##### `static ofNullable(List<Object> objects)`

Returns a `ObjectStream` created from `objects` if non-null, otherwise returns an empty `ObjectStream`.

###### Parameters
|Param|Description|
|---|---|
|`objects`|the list|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream` if `objects` is non-null, otherwise an empty `ObjectStream`

###### Example
```apex
IObjectIterable peopleStream = ObjectStream.ofNullable(new List<Person>(people));
```

##### `static ofNullable(Set<Object> objects)`

Returns a `ObjectStream` created from `objects` if non-null, otherwise returns an empty `ObjectStream`.

###### Parameters
|Param|Description|
|---|---|
|`objects`|the set|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream` if `objects` is non-null, otherwise an empty `ObjectStream`

###### Example
```apex
IObjectIterable peopleStream = ObjectStream.ofNullable(new Set<Object>(people));
```

##### `static empty()`

Returns an empty `ObjectStream`.

###### Return

**Type**

IObjectIterable

**Description**

the empty `ObjectStream`

##### `static generate(ISupplier supplier)`

Returns an infinite `ObjectStream` where each element is generated by `supplier`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier of generated elements|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

##### `static iterate(Object seed, IUnaryOperator operator)`

Returns an infinite `ObjectStream` produced by iterative application of `operator` to an initial element `seed`, producing a `ObjectStream` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

###### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

##### `static iterate(Object seed, IPredicate predicate, IUnaryOperator operator)`

Returns an infinite `ObjectStream` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

##### `static concat(Iterable<Object> iterable1, Iterable<Object> iterable2)`

Returns lazily concatenated `ObjectStream` whose elements are all the elements of the first `Iterable<Object>` followed by all the elements of the second `Iterable<Object>`.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Object>`|
|`iterable2`|the second `Iterable<Object>`|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

###### Example
```apex
IObjectIterable peopleStream = ObjectStream.concat(stream1, stream2);
```

##### `static concat(List<Iterable<Object>> iterables)`

Returns lazily concatenated `List<Iterable<Object>>`.

###### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<Object>`|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

###### Example
```apex
IObjectIterable peopleStream = ObjectStream.concat(streams);
```

##### `static zip(Iterable<Object> iterable1, Iterable<Object> iterable2, IBinaryOperator combiner)`

Returns a combined `ObjectStream` by applying `combiner` function to each element at the same position.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Object>`|
|`iterable2`|the second `Iterable<Object>`|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

##### `static zip(Iterable<Object> iterable1, Iterable<Object> iterable2, IBiPredicate predicate, IBinaryOperator combiner)`

Returns a combined `ObjectStream` by applying `combiner` function to each element at the same position, conditioned on satisfying `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Object>`|
|`iterable2`|the second `Iterable<Object>`|
|`predicate`|the binary predicate|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2`, `predicate` or `combiner` is null|

##### `override append(Iterable<Object> iterable)`

Returns new `ObjectStream` by appending `iterable` to the current stream.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `Iterable<Object>` to append to the current stream|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
IObjectIterable peopleStream = stream1.append(stream2);
```

##### `prepend(Iterable<Object> iterable)`

Returns new `ObjectStream` by prepending `iterable` to the current stream.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `Iterable<Object>` to prepend to the current stream|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
IObjectIterable peopleStream = stream1.prepend(stream2);
```

---
### Intermediate Operations
##### `sequence()`

Returns new `ObjectSequence` from the current stream. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

###### Example
```apex
IObjectIterable peopleSeq = ObjectStream.of(people).sequence();
```

##### `override filter(IPredicate predicate)`

Returns a `ObjectStream` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Person> filtered = (List<Person>) ObjectStream.of(people)
    .filter(predicate)
    .toList();
```

##### `take(IPredicate predicate)`

Returns a `ObjectStream` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Person> firstFiltered = (List<Person>) ObjectStream.of(people)
    .take(predicate)
    .toList();
```

##### `drop(IPredicate predicate)`

Returns a `ObjectStream` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Person> rest = (List<Person>) ObjectStream.of(people)
    .drop(predicate)
    .toList();
```

##### `mapTo(IFunction mapper)`

Returns a `ObjectStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<String> peopleNames = (List<String>) ObjectStream.of(people)
    .mapTo(getName)
    .toList();
```

##### `mapToInt(IToIntFunction mapper)`

Returns a `IntStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IIntIterable

**Description**

the `IntStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Integer> peopleAges = ObjectStream.of(people)
    .mapToInt(getAge)
    .toList();
```

##### `mapToLong(IToLongFunction mapper)`

Returns a `LongStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

ILongIterable

**Description**

the `LongStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Long> peopleIds = ObjectStream.of(people)
    .mapToLong(getId)
    .toList();
```

##### `mapToDouble(IToDoubleFunction mapper)`

Returns a `DoubleStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IDoubleIterable

**Description**

the `DoubleStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Double> peopleHeights = ObjectStream.of(people)
    .mapToDouble(getHeight)
    .toList();
```

##### `mapToSObject(IToSObjectFunction mapper)`

Returns a `SObjectStream` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Contact> contacts = ObjectStream.of(people)
    .mapToSObject(getAsContact)
    .toList();
```

##### `flatMapTo(IFunction mapper)`

Returns a new `ObjectStream` with `Object` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Object>`|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Example
```apex
List<Property> flattenedProperties = (List<Property>) ObjectStream.of(people)
    .flatMapTo(getListProperty)
    .toList(List<Property>.class);
List<List<String>> containedStrings; // [ ['foo'], null, [], ['baz', 'bar'], [null] ]
List<String> flattenedStrings = (List<String>) ObjectStream.of(containedStrings)
    .flatMapTo(Function.identity())
    .toList(List<String>.class); // ['foo', 'baz', 'bar', null]
```

##### `flatMapToInt(IFunction mapper)`

Returns a new `IntStream` with `Integer` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Integer>`|

###### Return

**Type**

IIntIterable

**Description**

the new `IntStream`

###### Example
```apex
List<Integer> flattenedProperties = (List<Integer>) ObjectStream.of(people)
    .flatMapToInt(getIntListProperty)
    .toList();
List<List<Integer>> containedInts; // [ [1], null, [], [0, 10], [null] ]
List<Integer> flattenedInts = ObjectStream.of(containedInts)
    .flatMapToInt(Function.identity())
    .toList(); // [1, 0, 10, null]
```

##### `flatMapToLong(IFunction mapper)`

Returns a new `LongStream` with `Long` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

###### Return

**Type**

ILongIterable

**Description**

the new `LongStream`

###### Example
```apex
List<Long> flattenedProperties = (List<Long>) ObjectStream.of(people)
    .flatMapToLong(getLongListProperty)
    .toList();
List<List<Long>> containedLongs; // [ [1L], null, [], [0L, 10L], [null] ]
List<Long> flattenedLongs = ObjectStream.of(containedLongs)
    .flatMapToLong(Function.identity())
    .toList(); // [1L, 0L, 10L, null]
```

##### `flatMapToDouble(IFunction mapper)`

Returns a new `DoubleStream` with `Double` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Double>`|

###### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleStream`

###### Example
```apex
List<Double> flattenedProperties = (List<Double>) ObjectStream.of(people)
    .flatMapToDouble(getDoubleListProperty)
    .toList();
List<List<Double>> containedDoubles; // [ [1.0], null, [], [0.5, Math.PI], [null] ]
List<Double> flattenedDoubles = ObjectStream.of(containedDoubles)
    .flatMapToDouble(Function.identity())
    .toList(); // [1.0, 0.5, Math.PI, null]
```

##### `flatMapToSObject(IFunction mapper)`

Returns a new `SObjectStream` with `SObject` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<SObject>`|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectStream`

###### Example
```apex
List<List<Account>> containedAccounts; // [ [acc1], null, [], [acc2, acc3], [null] ]
List<Account> flattenedAccounts = ObjectStream.of(containedDoubles)
    .flatMapToSObject(Function.identity())
    .toList(); // [acc1, acc2, acc3, null]
```

##### `forEach(IConsumer consumer)`

Returns a `ObjectStream` after performing `consumer` action on each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

###### Example
```apex
List<Person> editedPeople = (List<Person>) ObjectStream.of(people)
    .forEach(setSomeProperty)
    .toList();
```

##### `override distinct()`

Returns a `ObjectStream` with distinct elements. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Example
```apex
List<Person> distinctPeople = (List<Person>) ObjectStream.of(people)
    .distinct()
    .toList();
```

##### `distinct(IFunction classifier)`

Returns a `ObjectStream` with distinct elements according to `classifier` function. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the classifier function|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
List<Person> distinctPeopleByName = (List<Person>) ObjectStream.of(people)
    .distinct(getName)
    .toList();
```

##### `sort()`

Returns a `ObjectStream` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Example
```apex
List<Person> sortedPeople = (List<Person>) ObjectStream.of(people)
    .sort()
    .toList();
```

##### `override sort(IComparator comparator)`

Returns a `ObjectStream` with sorted elements according to `comparator`. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`comparator`|the non-interfering, stateless comparator to compare stream elements|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

###### Example
```apex
List<Person> sortedPeopleByName = (List<Person>) ObjectStream.of(people)
    .sort(getName)
    .toList();
```

##### `lim(Integer lim)`

Returns a `ObjectStream` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `lim` is null|
|`IllegalStateException`|if `lim` is less than 0|

###### Example
```apex
List<Person> first100People = (List<Person>) ObjectStream.of(people)
    .lim(100)
    .toList();
```

##### `skip(Integer n)`

Returns a new `ObjectStream` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectStream`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `n` is null|
|`IllegalStateException`|if `n` is less than 0|

###### Example
```apex
List<Person> restPeople = (List<Person>) ObjectStream.of(people)
    .skip(100)
    .toList();
```

---
### Terminal Operations
##### `reduce(Object identity, IBinaryOperator accumulator)`

Performs a reduction on `Object` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Return

**Type**

Object

**Description**

the `Object` result of the reduction

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

##### `override reduce(IBinaryOperator accumulator)`

Performs a reduction on `Object` elements, using `identity` value and associative `accumulator` function, and returns an `Optional` describing the reduced value. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Return

**Type**

Optional

**Description**

the `Optional` result of the reduction

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
Person eldestPerson = (Person) ObjectStream.of(people)
    .reduce(maxBy(getAge))
    .get();
```

##### `collect(ISupplier supplier, IBiConsumer accumulator)`

Performs a mutable reduction operation on elements, collecting elements to a container returned by `supplier` by applying `accumulator` function. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the function that returns a mutable result container|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Return

**Type**

Object

**Description**

the `Object` result of the collection

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `accumulator` is null|

###### Example
```apex
List<String> peopleNames = (List<String>) ObjectStream.of(people)
    .collect(
        Supplier.of(List<String>.class),
        ListObjectConsumer.addToList(getName)
    );
```

##### `override collect(ICollector collector)`

Performs a mutable reduction operation on elements, collecting elements to a container using `collector`. <p>Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`collector`|the collector|

###### Return

**Type**

Object

**Description**

the `Object` result of the collection

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `collector` is null|

###### Example
```apex
// Group people by city
Map<String, List<Person>> peopleByCity = (Map<String, List<Person>>)
    ObjectStream.of(people)
         .collect(Collector.groupingByString(getCityProperty).cast(Map<String, List<Person>>.class));
// Group people by city and by country, cascading two collectors
Map<String, Map<String, List<Person>>> peopleByCityByCountry
    = (Map<String, Map<String, List<Person>>>)
        ObjectStream.of(people)
            .collect(Collector.groupingByString(
                getCountry,
                Collector.groupingByString(getCity)
            ).cast(Map<String, Map<String, List<Person>>>.class));
```

##### `find(IPredicate predicate)`

Returns an `Optional` describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Optional

**Description**

the `Optional`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Person firstActivePerson = (Person) ObjectStream.of(people)
    .find(isActive)
    .get();
```

##### `every(IPredicate predicate)`

Returns whether all elements match `predicate`. If `ObjectStream` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Boolean

**Description**

`true` or `false`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Boolean isEveryPersonActive = ObjectStream.of(people).every(isActive);
```

##### `override some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `ObjectStream` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Boolean

**Description**

`true` or `false`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Boolean isSomePersonActive = ObjectStream.of(people).some(isActive);
```

##### `count()`

Returns the count of elements. <p>Terminal Operation.</p>

###### Return

**Type**

Integer

**Description**

the count of elements

##### `isEmpty()`

Returns whether the count of elements is 0. <p>Terminal Operation.</p>

###### Return

**Type**

Boolean

**Description**

`true` or `false`

##### `toList()`

Accumulates elements into a `List<Object>`. <p>Terminal Operation.</p>

###### Return

**Type**

List<Object>

**Description**

the `List<Object>` containing the stream elements

###### Example
```apex
List<Person> activePeople = (List<Person>) ObjectStream.of(people)
    .filter(isActive)
    .toList();
```

##### `toSet()`

Accumulates elements into a `Set<Object>`. <p>Terminal Operation.</p>

###### Return

**Type**

Set<Object>

**Description**

the `Set<Object>` containing the stream elements

###### Example
```apex
List<Object> activePeople = ObjectStream.of(people)
    .filter(isActive)
    .toSet();
```

---
