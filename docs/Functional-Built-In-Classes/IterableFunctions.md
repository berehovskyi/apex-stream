# virtual IterableFunctions

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides common implementations of [Function](/docs/Functional-Abstract-Classes/Function.md)
and related utilities that are used by [Collectors](/docs/Functional-Built-In-Classes/Collectors.md).


**See** [Function](/docs/Functional-Abstract-Classes/Function.md)


**See** [Collectors](/docs/Functional-Built-In-Classes/Collectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Function get(Integer index)`

Returns a `Function` that returns the list element stored at the specified index.

###### Parameters

|Param|Description|
|---|---|
|`index`|the index|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `index` is null|


**See** [List.get](List.get)

---
