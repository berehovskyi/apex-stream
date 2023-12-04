# virtual IntBiOperators

`APIVERSION: 59`

`STATUS: ACTIVE`

Provides common implementations of Integer [BiOperator](/docs/Functional-Abstract-Classes/BiOperator.md)
and related utilities.


**See** [BiOperator](/docs/Functional-Abstract-Classes/BiOperator.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static BiOperator sum()`

Returns a `BiOperator` that return a sum of two Integer input arguments.

###### Returns

|Type|Description|
|---|---|
|`BiOperator`|the `BiOperator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Integer input argument is null|

##### `public static BiOperator product()`

Returns a `BiOperator` that return a product of two Integer input arguments.

###### Returns

|Type|Description|
|---|---|
|`BiOperator`|the `BiOperator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Integer input argument is null|

##### `public static BiOperator min()`

Returns a `BiOperator` that return a lesser Integer input argument.

###### Returns

|Type|Description|
|---|---|
|`BiOperator`|the `BiOperator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Integer input argument is null|

##### `public static BiOperator max()`

Returns a `BiOperator` that return a greater Integer input argument.

###### Returns

|Type|Description|
|---|---|
|`BiOperator`|the `BiOperator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if one of the Integer input argument is null|

---
