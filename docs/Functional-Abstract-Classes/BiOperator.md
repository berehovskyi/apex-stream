# abstract BiOperator

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides default and static methods of
[IBiOperator](/docs/Functional-Interfaces/IBiOperator.md) functional interface.


**Implemented types**

[IBiOperator](/docs/Functional-Interfaces/IBiOperator.md)


**See** [IBiOperator](/docs/Functional-Interfaces/IBiOperator.md)


**See** [Collector](/docs/Functional-Abstract-Classes/Collector.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `public Object apply(Object o1, Object o2)`
---
### Static Methods
##### `public static BiOperator left()`

Returns a `BiOperator` that return the first input argument.

###### Returns

|Type|Description|
|---|---|
|`BiOperator`|the `BiOperator`|

##### `public static BiOperator right()`

Returns a `BiOperator` that return the second input argument.

###### Returns

|Type|Description|
|---|---|
|`BiOperator`|the `BiOperator`|

##### `public static BiOperator minBy(IComparer comparer)`

Returns a `BiOperator` that returns a lesser input argument according to the `comparer`.

###### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer to compare arguments|

###### Returns

|Type|Description|
|---|---|
|`BiOperator`|the `BiOperator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

##### `public static BiOperator maxBy(IComparer comparer)`

Returns a `BiOperator` that returns a greater input argument according to the `comparer`.

###### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer to compare arguments|

###### Returns

|Type|Description|
|---|---|
|`BiOperator`|the `BiOperator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

##### `public static BiOperator combine(IBiConsumer consumer, IBiOperator merger)`

Returns a combined `BiOperator` of the `consumer` and the `merger`.

###### Parameters

|Param|Description|
|---|---|
|`consumer`|the binary consumer|
|`merger`|the binary operator that merges the input arguments after its consumption|

###### Returns

|Type|Description|
|---|---|
|`BiOperator`|the `BiOperator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` or `merger` is null|

##### `public static BiOperator combine(IBiConsumer consumer)`

Returns a combined `BiOperator` of the `consumer` and the `right` binary operator.

###### Parameters

|Param|Description|
|---|---|
|`consumer`|the binary consumer|

###### Returns

|Type|Description|
|---|---|
|`BiOperator`|the `BiOperator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

---
