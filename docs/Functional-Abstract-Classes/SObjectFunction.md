# SObjectFunction

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides default and static methods of [ISObjectFunction](/docs/Functional-Interfaces/ISObjectFunction.md) functional interface.


**See** [ISObjectFunction](/docs/Functional-Interfaces/ISObjectFunction.md)


**See** ISObjectIterable.mapToObject


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
##### `static identity()`

Returns a `SObjectFunction` that always returns the input argument.

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

##### `static constant(Object value)`

Returns a `SObjectFunction` that always returns the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the value|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

##### `static compose(ISObjectPredicate predicate)`

Returns a composed `SObjectFunction` of the `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

##### `static compose(ISObjectUnaryOperator operator)`

Returns a composed `SObjectFunction` of the `operator`.

###### Parameters
|Param|Description|
|---|---|
|`operator`|the operator|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` is null|

##### `static compose(ISupplier supplier)`

Returns a composed `SObjectFunction` of the `supplier`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier|

###### Return

**Type**

SObjectFunction

**Description**

the `SObjectFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

---
