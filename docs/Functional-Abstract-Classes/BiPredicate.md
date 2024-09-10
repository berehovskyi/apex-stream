# abstract BiPredicate

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides default and static methods of
[IBiPredicate](/docs/Functional-Interfaces/IBiPredicate.md) functional interface.


**Implemented types**

[IBiPredicate](/docs/Functional-Interfaces/IBiPredicate.md)


**See** [IBiPredicate](/docs/Functional-Interfaces/IBiPredicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `public Boolean test(Object o1, Object o2)`
---
### Default Methods
##### `public virtual BiPredicate orElse(IBiPredicate other)`

Returns a composed `BiPredicate` that applies short-circuiting logical `OR` operator to `this` `IBiPredicate` and `other` in that order.

###### Parameters

|Param|Description|
|---|---|
|`other`|the other `IBiPredicate`|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the composed `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someBiPredicate1.orElse(someBiPredicate2);
```


##### `public virtual BiPredicate andAlso(IBiPredicate other)`

Returns a composed `BiPredicate` that applies short-circuiting logical `AND` operator to `this` `IPredicate` and `other` in that order.

###### Parameters

|Param|Description|
|---|---|
|`other`|the other `IBiPredicate`|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the composed `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someBiPredicate1.andAlso(someBiPredicate2);
```


##### `public virtual BiPredicate negate()`

Returns a `BiPredicate` that applies logical `NOT` operator to `this` `IBiPredicate`.

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the negated `BiPredicate`|

###### Example
```apex
someBiPredicate.negate();
```


---
### Static Methods
##### `public static BiPredicate some(List<IBiPredicate> predicates)`

Returns a composed `BiPredicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters

|Param|Description|
|---|---|
|`predicates`|the list of`IBiPredicate`|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the composed `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
BiPredicate.some(someBiPredicates);
```


##### `public static BiPredicate every(List<IBiPredicate> predicates)`

Returns a composed `BiPredicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters

|Param|Description|
|---|---|
|`predicates`|the list of`IBiPredicate`|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the composed `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
BiPredicate.every(someBiPredicates);
```


##### `public static BiPredicate negate(IBiPredicate predicate)`

Returns a `BiPredicate` that applies logical `NOT` operator to `predicate`.

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the `IBiPredicate`|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the negated `BiPredicate`|

###### Example
```apex
BiPredicate.negate(someBiPredicate);
```


##### `public static BiPredicate some(IPredicate left, IPredicate right)`

Returns a composed `BiPredicate` that applies short-circuiting logical `OR` operator to `left` `IPredicate` and `right` in that order applied to the first and the second input arguments respectively.

###### Parameters

|Param|Description|
|---|---|
|`left`|the predicate applied to the first input argument|
|`right`|the predicate applied to the second input argument|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the composed `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
BiPredicate.some(somePredicate1, somePredicate2);
```


##### `public static BiPredicate every(IPredicate left, IPredicate right)`

Returns a composed `BiPredicate` that applies short-circuiting logical `AND` operator to `left` `IPredicate` and `right` in that order applied to the first and the second input arguments respectively.

###### Parameters

|Param|Description|
|---|---|
|`left`|the predicate applied to the first input argument|
|`right`|the predicate applied to the second input argument|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|the composed `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
BiPredicate.every(somePredicate1, somePredicate2);
```


##### `public static BiPredicate always(Boolean value)`

Returns a `BiPredicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters

|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Returns

|Type|Description|
|---|---|
|`BiPredicate`|predicate the `BiPredicate`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
BiPredicate.always(true);
```


---
