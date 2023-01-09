# SObjectUnaryOperator

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides default and static methods of [ISObjectUnaryOperator](/docs/Functional-Interfaces/ISObjectUnaryOperator.md) functional interface.


**See** [ISObjectUnaryOperator](/docs/Functional-Interfaces/ISObjectUnaryOperator.md)


**See** ISObjectIterable.mapTo


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `apply(SObject sObj)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `andThen(ISObjectUnaryOperator after)`

Returns a composed `SObjectUnaryOperator` that executes `this` operation first, then the `after` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the composed `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

##### `compose(ISObjectUnaryOperator before)`

Returns a composed `SObjectUnaryOperator` that executes `before` operation first, then the `this` operation in that order.

###### Parameters
|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the composed `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if before is null|

---
### Static Methods
##### `static compose(List<ISObjectUnaryOperator> operators)`

Returns a composed `SObjectUnaryOperator` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters
|Param|Description|
|---|---|
|`operators`|the operations to sequentially perform|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the composed `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operators` is null or some element is null|

##### `static identity()`

Returns a `SObjectUnaryOperator` that always returns the input argument.

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

##### `static constant(SObject value)`

Returns a `SObjectUnaryOperator` that always returns the `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the const value|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

##### `static compose(ISObjectConsumer consumer)`

Returns a composed `SObjectUnaryOperator` of the `consumer`.

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the consumer|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

##### `static compose(ISObjectSupplier supplier)`

Returns a composed `SObjectUnaryOperator` of the `supplier`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

##### `static combine(ISObjectUnaryOperator operator, ISObjectBinaryOperator merger)`

Returns a combined `SObjectUnaryOperator` of the `operator` and the `merger`.

###### Parameters
|Param|Description|
|---|---|
|`operator`|the operator|
|`merger`|the binary operator that merges the input argument and a value returned by the `operator`.|

###### Return

**Type**

SObjectUnaryOperator

**Description**

the `SObjectUnaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` or `merger` is null|

---
