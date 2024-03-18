# abstract Predicate

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides default and static methods of
[IPredicate](/docs/Functional-Interfaces/IPredicate.md) functional interface.


**Implemented types**

[IPredicate](/docs/Functional-Interfaces/IPredicate.md)


**See** [IPredicate](/docs/Functional-Interfaces/IPredicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `public Boolean test(Object o)`
---
### Default Methods
##### `public virtual Predicate orElse(IPredicate other)`

Returns a composed `Predicate` that applies short-circuiting logical OR} operator to `this` `IPredicate` and `other` in that order.

###### Parameters

|Param|Description|
|---|---|
|`other`|the other `Predicate`|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the composed `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
somePredicate1.orElse(somePredicate2);
```


##### `public virtual Predicate andAlso(IPredicate other)`

Returns a composed `Predicate` that applies short-circuiting logical AND} operator to `this` `IPredicate` and `other` in that order.

###### Parameters

|Param|Description|
|---|---|
|`other`|the other `Predicate`|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the composed `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
somePredicate1.andAlso(somePredicate2);
```


##### `public virtual Predicate negate()`

Returns a `Predicate` that applies logical `NOT` operator to `this` `IPredicate`.

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the negated `Predicate`|

###### Example
```apex
somePredicate1.negate();
```


---
### Static Methods
##### `public static Predicate some(List<IPredicate> predicates)`

Returns a composed `Predicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters

|Param|Description|
|---|---|
|`predicates`|the list of`IPredicates`|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the composed `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
Predicate.some(somePredicates);
```


##### `public static Predicate every(List<IPredicate> predicates)`

Returns a composed `Predicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters

|Param|Description|
|---|---|
|`predicates`|the list of`IPredicates`|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the composed `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
Predicate.every(somePredicates);
```


##### `public static Predicate negate(IPredicate predicate)`

Returns a `Predicate` that applies logical `NOT` operator to `predicate`.

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the `IPredicate`|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the negated `Predicate`|

###### Example
```apex
Predicate.negate(somePredicate);
```


##### `public static Predicate always(Boolean value)`

Returns a `Predicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters

|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|predicate the `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
Predicate.always(true);
```


##### `public static Predicate compose(IFunction mapper, IPredicate predicate)`

Returns a composed `Predicate` of the `IFunction` and the `IPredicate`.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Returns

|Type|Description|
|---|---|
|`Predicate`|the composed `Predicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
Predicate.compose(someFunction, somePredicate);
```


---
