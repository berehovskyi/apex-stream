# ListSObjectConsumers

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides common implementations of `List<T> - SObject` [ObjectSObjectConsumer](/docs/Functional-Abstract-Classes/ObjectSObjectConsumer.md) and related utilities that are used by [SObjectCollectors](/docs/Functional-Built-In-Classes/SObjectCollectors.md).


**See** [ObjectSObjectConsumer](/docs/Functional-Abstract-Classes/ObjectSObjectConsumer.md)


**See** [SObjectCollectors](/docs/Functional-Built-In-Classes/SObjectCollectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

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
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollectors.toList

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
|`NullPointerException`|if `mapper`, `delimiter`, or `prefix` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollectors.joining

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
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollectors.averagingInt

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
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollectors.summingInt

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
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollectors.averagingLong

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
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollectors.summingLong

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
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollectors.averagingDouble

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
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** SObjectCollectors.summingDouble

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
|`NullPointerException`|if `accumulator` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.reducing

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
|`NullPointerException`|if `accumulator` is null|
|`NullPointerException`|if the first input argument is null|


**See** SObjectCollectors.reducing

---
