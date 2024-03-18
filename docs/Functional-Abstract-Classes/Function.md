# abstract Function

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides default and static methods of
[IFunction](/docs/Functional-Interfaces/IFunction.md) functional interface.


**Implemented types**

[IFunction](/docs/Functional-Interfaces/IFunction.md)


**See** [IFunction](/docs/Functional-Interfaces/IFunction.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `public Object apply(Object o)`
---
### Default Methods
##### `public virtual Function andThen(IFunction after)`

Returns a composed `Function` that executes `this` operation first, then the `after` operation in that order.

###### Parameters

|Param|Description|
|---|---|
|`after`|the operation to perform after this operation|

###### Returns

|Type|Description|
|---|---|
|`Function`|the composed `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `after` is null|

##### `public virtual Function compose(IFunction before)`

Returns a composed `Function` that executes `before` operation first, then the `this` operation in that order.

###### Parameters

|Param|Description|
|---|---|
|`before`|the operation to perform before this operation|

###### Returns

|Type|Description|
|---|---|
|`Function`|the composed `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `before` is null|

---
### Static Methods
##### `public static Function compose(List<IFunction> functions)`

Returns a composed `Function` that sequentially executes the operations in the same order as the order of the consumers input list.

###### Parameters

|Param|Description|
|---|---|
|`functions`|the functions to sequentially perform|

###### Returns

|Type|Description|
|---|---|
|`Function`|the composed `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `operators` is null or some element is null|

##### `public static Function identity()`

Returns a `Function` that always returns the input argument.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

##### `public static Function constant(Object value)`

Returns a `Function` that always returns the `value`.

###### Parameters

|Param|Description|
|---|---|
|`value`|the value|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

##### `public static Function compose(IPredicate predicate)`

Returns a composed `Function` of the `predicate`.

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

##### `public static Function compose(ISupplier supplier)`

Returns a composed `SObjectFunction` of the `supplier`.

###### Parameters

|Param|Description|
|---|---|
|`supplier`|the supplier|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `SObjectFunction`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

---
