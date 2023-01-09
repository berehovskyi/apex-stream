# SObjectToDoubleFunction

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides default and static methods of [ISObjectToDoubleFunction](/docs/Functional-Interfaces/ISObjectToDoubleFunction.md) functional interface.


**See** [ISObjectToDoubleFunction](/docs/Functional-Interfaces/ISObjectToDoubleFunction.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `apply(SObject sObj)`
###### Parameters
|Param|Description|
|---|---|

---
### Static Methods
##### `static compose(ISObjectFunction mapper)`

Returns a composed `SObjectToDoubleFunction` of the `ISObjectFunction`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

###### Return

**Type**

SObjectToDoubleFunction

**Description**

the `SObjectToDoubleFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

##### `static downcast(IFunction mapper)`

Returns a composed `SObjectToDoubleFunction` of the `IFunction`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function|

###### Return

**Type**

SObjectToDoubleFunction

**Description**

the `SObjectToDoubleFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

---
