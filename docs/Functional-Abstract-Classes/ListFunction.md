# ListFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Extends `Function` functions and provides `ListFunction` common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes

## Methods
### List Functions
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
