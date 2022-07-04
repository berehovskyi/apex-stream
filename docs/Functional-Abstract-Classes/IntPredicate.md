# IntPredicate

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [IIntPredicate](/docs/Functional-Interfaces/IIntPredicate.md) functional interface.


**See** [IIntPredicate](/docs/Functional-Interfaces/IIntPredicate.md)


**See** IIntIterable.filter


**See** IIntIterable.take


**See** IIntIterable.drop


**See** IIntIterable.find


**See** IIntIterable.some


**See** IIntIterable.every


**See** IIntIterable.none


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `test(Integer i)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `orElse(IIntPredicate other)`

Returns a composed `IntPredicate` that applies short-circuiting logical `OR` operator to `this` `IIntPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `IIntPredicate`|

###### Return

**Type**

IntPredicate

**Description**

the composed `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someIntPredicate1.orElse(someIntPredicate2);
```

##### `andAlso(IIntPredicate other)`

Returns a composed `IntPredicate` that applies short-circuiting logical `AND` operator to `this` `IIntPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `IIntPredicate`|

###### Return

**Type**

IntPredicate

**Description**

the composed `IIntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someIntPredicate1.andAlso(someIntPredicate2);
```

##### `negate()`

Returns a `IntPredicate` that applies logical `NOT` operator to `this` `IIntPredicate`.

###### Return

**Type**

IntPredicate

**Description**

the negated `IntPredicate`

###### Example
```apex
someIntPredicate.negate();
```

---
### Static Methods
##### `static some(List<IIntPredicate> predicates)`

Returns a composed `IntPredicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IIntPredicates`|

###### Return

**Type**

IntPredicate

**Description**

the composed `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
IntPredicate.some(someIntPredicates);
```

##### `static every(List<IIntPredicate> predicates)`

Returns a composed `IntPredicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IIntPredicates`|

###### Return

**Type**

IntPredicate

**Description**

the composed `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
IntPredicate.every(someIntPredicates);
```

##### `static negate(IIntPredicate predicate)`

Returns a `IntPredicate` that applies logical `NOT` operator to `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the `IIntPredicate`|

###### Return

**Type**

IntPredicate

**Description**

the negated `IntPredicate`

###### Example
```apex
IntPredicate.negate(someIntPredicate);
```

##### `static always(Boolean value)`

Returns a `IntPredicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Return

**Type**

IntPredicate

**Description**

predicate the `IntPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
IntPredicate.always(true);
```

---
