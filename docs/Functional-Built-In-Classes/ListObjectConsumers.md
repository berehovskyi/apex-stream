# ListObjectConsumers

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of `List<T> - Object` [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md) and related utilities that are used by [Collectors](/Functional-Built-In-Classes/Collectors.md).


**See** [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)


**See** [Collectors](/docs/Functional-Built-In-Classes/Collectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Add To List<Object>
##### `static addToList(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List` and adds to this `List<Object>` the result returned by the `mapper` applied to the second input argument.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** Collectors.toList

---
### List-String BiConsumers
##### `static joining(String delimiter, String prefix)`

Returns a `BiConsumer` that casts the first input argument to `List<String>`, gets the first element and appends to it the second argument as `String` using the `delimiter`.

###### Parameters
|Param|Description|
|---|---|
|`delimiter`|the `String` to be used between each element|
|`prefix`|the `String` to be used at the beginning of the joined result|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `delimiter` or `prefix` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** Collectors.joining

---
### List-Integer BiConsumers
##### `static averagingInt(IToIntFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List<Integer>`, which is used as a container to track the number of elements and the total sum.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** Collectors.averagingInt

##### `static summingInt(IToIntFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List<Integer>`, which is used as a container to track the total sum.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** Collectors.summingInt

---
### List-Long BiConsumers
##### `static averagingLong(IToLongFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List<Long>`, which is used as a container to track the number of elements and the total sum.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** Collectors.averagingLong

##### `static summingLong(IToLongFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List<Long>`, which is used as a container to track the total sum.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** Collectors.summingLong

---
### List-Double BiConsumers
##### `static averagingDouble(IToDoubleFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List<Double>`, which is used as a container to track the number of elements and the total sum using `Kahan Summation`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** Collectors.averagingDouble

##### `static summingDouble(IToDoubleFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List<Double>`, which is used as a container to track the total sum using `Kahan Summation`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** Collectors.summingDouble

---
### List-Object BiConsumers
##### `static reducing(IBinaryOperator accumulator)`

Returns a `BiConsumer` that casts the first input argument to `List<Object>`, gets the first element and reduces its value using `accumulator`.

###### Parameters
|Param|Description|
|---|---|
|`accumulator`|the `IBinaryOperator` to be used between each element|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.reducing

##### `static reducing(IBinaryOperator accumulator, IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List<Object>`, gets the first element and reduces its value using `accumulator`.

###### Parameters
|Param|Description|
|---|---|
|`accumulator`|the `IBinaryOperator` to be used between each element|
|`mapper`|the `IFunction` applied to the second input argument|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` or `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.reducing

##### `static reducingOptional(IBinaryOperator accumulator)`

Returns a `BiConsumer` that casts the first input argument to `List<Object>`, if it is empty puts the first element as the second input argument. Otherwise, gets the first element and reduces its value using `accumulator`.

###### Parameters
|Param|Description|
|---|---|
|`accumulator`|the `IBinaryOperator` to be used between each element|

###### Return

**Type**

BiConsumer

**Description**

the `BiConsumer`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|
|`NullPointerException`|if the first input argument is null|


**See** Collectors.reducing

---
