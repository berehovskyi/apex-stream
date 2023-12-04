# abstract Operator

`APIVERSION: 59`

`STATUS: ACTIVE`

Provides default and static methods of
[IOperator](/docs/Functional-Interfaces/IOperator.md) functional interface.


**Implemented types**

[IOperator](/docs/Functional-Interfaces/IOperator.md)


**See** [IOperator](/docs/Functional-Interfaces/IOperator.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `public Object apply(Object o)`
---
### Default Methods
##### `public virtual Operator andThen(IOperator after)`

Returns a composed `Operator` that executes `this` operation first, then the `after` operation in that order.

###### Parameters

|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the composed `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

##### `public virtual Operator compose(IOperator before)`

Returns a composed `Operator` that executes `before` operation first, then the `this` operation in that order.

###### Parameters

|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the composed `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `before` is null|

---
### Static Methods
##### `public static Operator compose(List<IOperator> operators)`

Returns a composed `Operator` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters

|Param|Description|
|---|---|
|`operators`|the operations to sequentially perform|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the composed `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `operators` is null or some element is null|

##### `public static Operator identity()`

Returns a `Operator` that always returns the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

##### `public static Operator constant(Object value)`

Returns a `Operator` that always returns the `value`.

###### Parameters

|Param|Description|
|---|---|
|`value`|the value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

##### `public static Operator compose(IConsumer consumer)`

Returns a composed `Operator` of the `consumer`.

###### Parameters

|Param|Description|
|---|---|
|`consumer`|the consumer|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

##### `public static Operator compose(ISupplier supplier)`

Returns a composed `Operator` of the `supplier`.

###### Parameters

|Param|Description|
|---|---|
|`supplier`|the supplier|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

##### `public static Operator combine(IOperator operator, IBiOperator merger)`

Returns a combined `Operator` of the `operator` and the `merger`.

###### Parameters

|Param|Description|
|---|---|
|`operator`|the operator|
|`merger`|the binary operator that merges the input argument and a value returned by the `operator`.|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `operator` or `merger` is null|

---
