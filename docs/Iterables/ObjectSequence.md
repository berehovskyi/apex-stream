# ObjectSequence

`APIVERSION: 55`

`STATUS: ACTIVE`

A sequence of `Object` elements supporting aggregate operations. Sequence operations are composed of sequence chain. A sequence chain consists of: <ul>     <li>A Source (which might be an iterable (such as list or set)).</li>     <li>Zero or more Intermediate Operations (which transform a sequence into another sequence,     such as ObjectSequence.filter(IPredicate)).</li>     <li>A Terminal Operation (which produces a result such as     ObjectSequence.count() or ObjectSequence.collect(ICollector)).</li> </ul> <p>Sequences are <strong>eager</strong>:</p> <ul>     <li>Intermediate operations describe how a sequence is processed eagerly performing every action.</li>     <li>Computation is performed every time when the intermediate or the terminal operation is initiated.</li> </ul> <p>A sequence may not consume all elements. It may not be infinite.</p> <p>A sequence can be operated on (invoking an intermediate or terminal sequence operation) <strong>multiple times</strong>. <p>Contract:</p> <ul>     <li>Must be non-interfering (do not modify the sequence source but may mutate its elements).</li> </ul> <p>There are primitive specializations for [IntSequence](/docs/Iterables/IntSequence.md), [LongSequence](/docs/Iterables/LongSequence.md), and [DoubleSequence](/docs/Iterables/DoubleSequence.md) and [SObjectSequence](/docs/Iterables/SObjectSequence.md) for SObject references.</p> <p>Sequences and streams equally ensure the fulfillment of the set goals, but are implemented in different ways.</p>


**See** [ObjectStream](/docs/Iterables/ObjectStream.md)


**See** [SObjectSequence](/docs/Iterables/SObjectSequence.md)


**See** [IntSequence](/docs/Iterables/IntSequence.md)


**See** [LongSequence](/docs/Iterables/LongSequence.md)


**See** [DoubleSequence](/docs/Iterables/DoubleSequence.md)


**Author** Oleh Berehovskyi


**Group** Iterables

## Methods
### Other
##### `iterator()`

Returns an internal iterator for the elements of this sequence. <p>Terminal Operation.</p>

###### Return

**Type**

Iterator<Object>

**Description**

the internal `Iterator<Object>`

---
### Sources
##### `static of(List<Object> objects)`

Returns a `ObjectSequence` created from `objects` list.

###### Parameters
|Param|Description|
|---|---|
|`objects`|the list of Objects|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `objects` is null|

###### Example
```apex
IObjectIterable peopleSeq = ObjectSequence.of(new List<Person>(people));
```

##### `static of(Set<Object> objects)`

Returns a `ObjectSequence` created from `objects` set.

###### Parameters
|Param|Description|
|---|---|
|`objects`|the set of Objects|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `objects` is null|

###### Example
```apex
IObjectIterable peopleSeq = ObjectSequence.of(new Set<Person>(people));
```

##### `static ofNullable(List<Object> objects)`

Returns a `ObjectSequence` created from `objects` list if non-null, otherwise returns an empty `ObjectSequence`.

###### Parameters
|Param|Description|
|---|---|
|`objects`|the list of Objects|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence` if `objects` is non-null, otherwise an empty `ObjectSequence`

###### Example
```apex
IObjectIterable peopleSeq = ObjectSequence.ofNullable(new List<Person>(people));
IObjectIterable emptyPeopleSeq = ObjectSequence.ofNullable(null);
```

##### `static ofNullable(Set<Object> objects)`

Returns a `ObjectSequence` created from `objects` set if non-null, otherwise returns an empty `ObjectSequence`.

###### Parameters
|Param|Description|
|---|---|
|`objects`|the set of Objects|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence` if `objects` is non-null, otherwise an empty `ObjectSequence`

###### Example
```apex
IObjectIterable peopleSeq = ObjectSequence.ofNullable(new Set<Person>(people));
IObjectIterable emptySeq = ObjectSequence.ofNullable(null);
```

##### `static empty()`

Returns an empty `ObjectSequence`.

###### Return

**Type**

IObjectIterable

**Description**

the empty `ObjectSequence`

##### `static concat(Iterable<Object> iterable1, Iterable<Object> iterable2)`

Returns eagerly concatenated `ObjectSequence` whose elements are all the elements of the first `Iterable<Object>` followed by all the elements of the second `Iterable<Object>`.

###### Parameters
|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<Object>`|
|`iterable2`|the second `Iterable<Object>`|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

###### Example
```apex
IObjectIterable peopleSeq = ObjectSequence.concat(seq1, seq2);
```

##### `static concat(List<Iterable<Object>> iterables)`

Returns eagerly concatenates `List<Iterable<Object>>`.

###### Parameters
|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<Object>`|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

###### Example
```apex
IObjectIterable peopleSeq = ObjectSequence.concat(sequences);
```

##### `static zip(Iterable<Object> iterable1, Iterable<Object> iterable2, IBinaryOperator combiner)`

Returns a combined `ObjectSequence` by applying `combiner` function to each element at the same position.

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

the new `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

##### `static zip(Iterable<Object> iterable1, Iterable<Object> iterable2, IBiPredicate predicate, IBinaryOperator combiner)`

Returns a combined `ObjectSequence` by applying `combiner` function to each element at the same position, conditioned on satisfying `predicate`.

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

the new `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2`, `predicate` or `combiner` is null|

##### `override append(Iterable<Object> iterable)`

Returns new `ObjectSequence` by appending `iterable` to the current sequence.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `Iterable<Object>` to append to the current sequence|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
IObjectIterable peopleSeq = seq1.append(seq2);
```

##### `prepend(Iterable<Object> iterable)`

Returns new `ObjectSequence` by prepending `iterable` to the current sequence.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the `Iterable<Object>` to prepend to the current sequence|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
IObjectIterable peopleSeq = seq1.prepend(seq2);
```

---
### Intermediate Operations
##### `stream()`

Returns new `ObjectStream` from the current sequence. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectStream`

###### Example
```apex
IObjectIterable peopleStream = ObjectSequence.of(people).stream();
```

##### `override filter(IPredicate predicate)`

Returns a `ObjectSequence` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Person> filtered = (List<Person>) ObjectSequence.of(people)
    .filter(predicate)
    .toList();
```

##### `take(IPredicate predicate)`

Returns a `ObjectSequence` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Person> firstFiltered = (List<Person>) ObjectSequence.of(people)
    .take(predicate)
    .toList();
```

##### `drop(IPredicate predicate)`

Returns a `ObjectSequence` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
List<Person> rest = (List<Person>) ObjectSequence.of(people)
    .drop(predicate)
    .toList();
```

##### `mapTo(IFunction mapper)`

Returns a `ObjectSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<String> peopleNames = (List<String>) ObjectSequence.of(people)
    .mapTo(getName)
    .toList();
```

##### `mapToInt(IToIntFunction mapper)`

Returns a `IntSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IIntIterable

**Description**

the `IntSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Integer> peopleAges = ObjectSequence.of(people)
    .mapToInt(getAge)
    .toList();
```

##### `mapToLong(IToLongFunction mapper)`

Returns a `LongSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

ILongIterable

**Description**

the `LongSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Long> peopleIds = ObjectSequence.of(people)
    .mapToLong(getId)
    .toList();
```

##### `mapToDouble(IToDoubleFunction mapper)`

Returns a `DoubleSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

IDoubleIterable

**Description**

the `DoubleSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Double> peopleHeights = ObjectSequence.of(people)
    .mapToDouble(getHeight)
    .toList();
```

##### `mapToSObject(IToSObjectFunction mapper)`

Returns a `SObjectSequence` with elements returned by `mapper` function, applied to the elements of this sequence. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Return

**Type**

ISObjectIterable

**Description**

the `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
List<Contact> contacts = ObjectSequence.of(people)
    .mapToSObject(getAsContact)
    .toList();
```

##### `flatMapTo(IFunction mapper)`

Returns a new `ObjectSequence` with `Object` elements as a result of replacing each element of this sequence with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Object>`|

###### Return

**Type**

IObjectIterable

**Description**

the new `ObjectSequence`

###### Example
```apex
List<Property> flattenedProperties = (List<Property>) ObjectSequence.of(people)
    .flatMapTo(getListProperty)
    .toList(List<Property>.class);
List<List<String>> containedStrings; // [ ['foo'], null, [], ['baz', 'bar'], [null] ]
List<String> flattenedStrings = (List<String>) ObjectSequence.of(containedStrings)
    .flatMapTo(Function.identity())
    .toList(List<String>.class); // ['foo', 'baz', 'bar', null]
```

##### `flatMapToInt(IFunction mapper)`

Returns a new `IntSequence` with `Integer` elements as a result of replacing each element of this sequence with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Integer>`|

###### Return

**Type**

IIntIterable

**Description**

the new `IntSequence`

###### Example
```apex
List<Integer> flattenedProperties = (List<Integer>) ObjectSequence.of(people)
    .flatMapToInt(getIntListProperty)
    .toList();
List<List<Integer>> containedInts; // [ [1], null, [], [0, 10], [null] ]
List<Integer> flattenedInts = ObjectSequence.of(containedInts)
    .flatMapToInt(Function.identity())
    .toList(); // [1, 0, 10, null]
```

##### `flatMapToLong(IFunction mapper)`

Returns a new `LongSequence` with `Long` elements as a result of replacing each element of this sequence with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

###### Return

**Type**

ILongIterable

**Description**

the new `LongSequence`

###### Example
```apex
List<Long> flattenedProperties = (List<Long>) ObjectSequence.of(people)
    .flatMapToLong(getLongListProperty)
    .toList();
List<List<Long>> containedLongs; // [ [1L], null, [], [0L, 10L], [null] ]
List<Long> flattenedLongs = ObjectSequence.of(containedLongs)
    .flatMapToLong(Function.identity())
    .toList(); // [1L, 0L, 10L, null]
```

##### `flatMapToDouble(IFunction mapper)`

Returns a new `DoubleSequence` with `Double` elements as a result of replacing each element of this sequence with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Double>`|

###### Return

**Type**

IDoubleIterable

**Description**

the new `DoubleSequence`

###### Example
```apex
List<Double> flattenedProperties = (List<Double>) ObjectSequence.of(people)
    .flatMapToDouble(getDoubleListProperty)
    .toList();
List<List<Double>> containedDoubles; // [ [1.0], null, [], [0.5, Math.PI], [null] ]
List<Double> flattenedDoubles = ObjectSequence.of(containedDoubles)
    .flatMapToDouble(Function.identity())
    .toList(); // [1.0, 0.5, Math.PI, null]
```

##### `flatMapToSObject(IFunction mapper)`

Returns a new `SObjectSequence` with `SObject` elements as a result of replacing each element of this sequence with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<SObject>`|

###### Return

**Type**

ISObjectIterable

**Description**

the new `SObjectSequence`

###### Example
```apex
List<List<Account>> containedAccounts; // [ [acc1], null, [], [acc2, acc3], [null] ]
List<Account> flattenedAccounts = ObjectSequence.of(containedDoubles)
    .flatMapToSObject(Function.identity())
    .toList(); // [acc1, acc2, acc3, null]
```

##### `forEach(IConsumer consumer)`

Returns a `SObjectSequence` after performing `consumer` action on each element. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

###### Return

**Type**

IObjectIterable

**Description**

this `SObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

###### Example
```apex
List<Person> editedPeople = (List<Person>) ObjectSequence.of(people)
    .forEach(setSomeProperty)
    .toList();
```

##### `override distinct()`

Returns a `ObjectSequence` with distinct elements. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

###### Example
```apex
List<Person> distinctPeople = (List<Person>) ObjectSequence.of(people)
    .distinct()
    .toList();
```

##### `override distinct(IFunction classifier)`

Returns a `ObjectSequence` with distinct elements according to `classifier` function. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`classifier`|the classifier function|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
List<Person> distinctPeopleByName = (List<Person>) ObjectSequence.of(people)
    .distinct(getName)
    .toList();
```

##### `sort()`

Returns a `ObjectSequence` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

###### Example
```apex
List<Person> sortedPeople = (List<Person>) ObjectSequence.of(people)
    .sort()
    .toList();
```

##### `override sort(IComparator comparator)`

Returns a `ObjectSequence` with sorted elements according to `comparator`. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`comparator`|the non-interfering, stateless comparator to compare sequence elements|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

###### Example
```apex
List<Person> sortedPeopleByName = (List<Person>) ObjectSequence.of(people)
    .sort(getName)
    .toList();
```

##### `lim(Integer lim)`

Returns a `ObjectSequence` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `lim` is less than 0|
|`NullPointerException`|if `lim` is null|

###### Example
```apex
List<Person> first100People = (List<Person>) ObjectSequence.of(people)
    .lim(100)
    .toList();
```

##### `skip(Integer n)`

Returns a new `ObjectSequence` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

###### Parameters
|Param|Description|
|---|---|
|`n`|the number of elements to skip|

###### Return

**Type**

IObjectIterable

**Description**

the `ObjectSequence`

###### Throws
|Exception|Description|
|---|---|
|`IllegalStateException`|if `n` is less than 0|
|`NullPointerException`|if `n` is null|

###### Example
```apex
List<Person> restPeople = (List<Person>) ObjectSequence.of(people)
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
Person eldestPerson = (Person) ObjectSequence.of(people)
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
List<String> peopleNames = (List<String>) ObjectSequence.of(people)
    .collect(
        Supplier.of(List<String>.class),
        ListObjectConsumers.addToList(getName)
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
    ObjectSequence.of(people)
         .collect(Collectors.groupingByString(getCityProperty).cast(Map<String, List<Person>>.class));
// Group people by city and by country, cascading two collectors
Map<String, Map<String, List<Person>>> peopleByCityByCountry
    = (Map<String, Map<String, List<Person>>>)
        ObjectSequence.of(people)
            .collect(Collectors.groupingByString(
                getCountry,
                Collectors.groupingByString(getCity)
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
Person firstActivePerson = (Person) ObjectSequence.of(people)
    .find(isActive)
    .get();
```

##### `every(IPredicate predicate)`

Returns whether all elements match `predicate`. If `ObjectSequence` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
Boolean isEveryPersonActive = ObjectSequence.of(people).every(isActive);
```

##### `override some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `ObjectSequence` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
Boolean isSomePersonActive = ObjectSequence.of(people).some(isActive);
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

the `List<Object>` containing the sequence elements

###### Example
```apex
List<Person> activePeople = (List<Person>) ObjectSequence.of(people)
    .filter(isActive)
    .toList();
```

##### `toSet()`

Accumulates elements into a `Set<Object>`. <p>Terminal Operation.</p>

###### Return

**Type**

Set<Object>

**Description**

the `Set<Object>` containing the sequence elements

###### Example
```apex
List<Object> activePeople = ObjectSequence.of(people)
    .filter(isActive)
    .toSet();
```

---
