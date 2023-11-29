# virtual BaseBiOperators

`APIVERSION: 58`

`STATUS: ACTIVE`

Provides base implementations of [BiOperator](/docs/Functional-Abstract-Classes/BiOperator.md)
and related utilities that are used by [IEnumerable](IEnumerable).


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static BiOperator min()`

Returns a `BiOperator` that return a lesser input argument.

###### Returns

|Type|Description|
|---|---|
|`BiOperator`|the `BiOperator`|

###### Example
```apex
BaseBiOperators.min().apply(2, 5); // 2
```


##### `public static BiOperator max()`

Returns a `BiOperator` that return a greater input argument.

###### Returns

|Type|Description|
|---|---|
|`BiOperator`|the `BiOperator`|

###### Example
```apex
BaseBiOperators.max().apply(2, 5); // 5
```


---
