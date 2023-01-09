# ListFunctions

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of [Function](/docs/Functional-Abstract-Classes/Function.md) and related utilities that are used by [SObjectCollectors](/docs/Functional-Built-In-Classes/SObjectCollectors.md).


**See** [Function](/docs/Functional-Abstract-Classes/Function.md)


**See** [SObjectCollectors](/docs/Functional-Built-In-Classes/SObjectCollectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `static get(Integer index)`

Returns a `Function` that returns the list element stored at the specified index.

###### Parameters
|Param|Description|
|---|---|
|`index`|the index|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `index` is null|


**See** List.get

---
