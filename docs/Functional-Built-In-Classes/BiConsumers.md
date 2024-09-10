# virtual BiConsumers

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides common implementations of [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)
and related utilities.


**See** [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static BiConsumer filtering(IPredicate predicate, IBiConsumer accumulator)`

Returns a composed `BiConsumer` that executes `accumulator` operation, if the second input argument satisfies the predicate.

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate applied to the second input argument|
|`accumulator`|the operation to perform after filtering|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the composed `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` or `accumulator` is null|

##### `public static BiConsumer mapping(IFunction mapper, IBiConsumer accumulator)`

Returns a composed `BiConsumer` that applies `accumulator` operation to the result returned by the mapper.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the operator applied to the second input argument|
|`accumulator`|the operation to perform|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the composed `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `accumulator` is null|

##### `public static BiConsumer flatMapping(IFunction mapper, IBiConsumer accumulator)`

Returns a composed `BiConsumer` that applies `accumulator` operation to the `Iterable<Object>` elements produced by the `mapper`.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the operator applied to the second input argument which must produce `Iterable<Object>`|
|`accumulator`|the operation to perform|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the composed `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `accumulator` is null|

---
