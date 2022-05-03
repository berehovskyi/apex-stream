# ListSObjectConsumer

`APIVERSION: 54`

`STATUS: ACTIVE`

Provides common class level implementations, and related utilities for `List<T> - SObject` two-arity consumers. Typically is used by collectors.


**Author** O. Berehovskyi


**Group** Functions


**See** [IObjectSObjectConsumer](/docs/Functional-Interfaces/IObjectSObjectConsumer.md)


**See** [SObjectCollector](/docs/Collectors/SObjectCollector.md)

## Methods
### Add to List<Object> ObjectSObjectConsumer
##### `static addToList(ISObjectFunction mapper)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `List<Object>` and adds to this `List` the result returned by the `mapper` applied to the second input argument.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollector.toList

---
### List-String ObjectSObjectConsumer
##### `static joining(ISObjectFunction mapper, String delimiter, String prefix)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `List<String>`, gets the first element and appends to it the second argument as `String` using the `delimiter`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|
|`delimiter`|the `String` to be used between each element|
|`prefix`|the `String` to be used at the beginning of the joined result|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper`, `delimiter`, or the `prefix` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollector.joining

---
### List-Integer ObjectSObjectConsumer
##### `static averagingInt(ISObjectToIntFunction mapper)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `List<Integer>`, which is used as a container to track the number of elements and the total sum.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollector.averagingInt

##### `static summingInt(ISObjectToIntFunction mapper)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `List<Integer>`, which is used as a container to track the total sum.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollector.summingInt

---
### List-Long ObjectSObjectConsumer
##### `static averagingLong(ISObjectToLongFunction mapper)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `List<Long>`, which is used as a container to track the number of elements and the total sum.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollector.averagingLong

##### `static summingLong(ISObjectToLongFunction mapper)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `List<Long>`, which is used as a container to track the total sum.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollector.summingLong

---
### List-Double ObjectSObjectConsumer
##### `static averagingDouble(ISObjectToDoubleFunction mapper)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `List<Double>`, which is used as a container to track the number of elements and the total sum using `Kahan Summation`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollector.averagingDouble

##### `static summingDouble(ISObjectToDoubleFunction mapper)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `List<Double>`, which is used as a container to track the total sum using `Kahan Summation`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollector.summingDouble

---
### List-SObject ObjectSObjectConsumer
##### `static reducing(ISObjectBinaryOperator accumulator)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `List<Object>`, gets the first element and reduces its value using `accumulator`.

###### Parameters
|Param|Description|
|---|---|
|`accumulator`|the `ISObjectBinaryOperator` to be used between each element|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `ObjectSObjectConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `accumulator` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.reducing

##### `static reducingOptional(ISObjectBinaryOperator accumulator)`

Returns a `ObjectSObjectConsumer` that casts the first input argument to `List<Object>`, if it is empty puts the first element as the second input argument. Otherwise, gets the first element and reduces its value using `accumulator`.

###### Parameters
|Param|Description|
|---|---|
|`accumulator`|the `ObjectSObjectConsumer` to be used between each element|

###### Return

**Type**

ObjectSObjectConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `accumulator` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollector.reducing

---
