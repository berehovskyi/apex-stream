# LongPredicate

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides default and static methods of [ILongPredicate](/docs/Functional-Interfaces/ILongPredicate.md) functional interface.


**See** [ILongPredicate](/docs/Functional-Interfaces/ILongPredicate.md)


**See** ILongIterable.filter


**See** ILongIterable.take


**See** ILongIterable.drop


**See** ILongIterable.find


**See** ILongIterable.some


**See** ILongIterable.every


**See** ILongIterable.none


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `test(Long l)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `orElse(ILongPredicate other)`

Returns a composed `LongPredicate` that applies short-circuiting logical `OR` operator to `this` `ILongPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `ILongPredicate`|

###### Return

**Type**

LongPredicate

**Description**

the composed `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someLongPredicate1.orElse(someLongPredicate2);
```

##### `andAlso(ILongPredicate other)`

Returns a composed `LongPredicate` that applies short-circuiting logical `AND` operator to `this` `ILongPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `ILongPredicate`|

###### Return

**Type**

LongPredicate

**Description**

the composed `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someLongPredicate1.andAlso(someLongPredicate2);
```

##### `negate()`

Returns a `LongPredicate` that applies logical `NOT` operator to `this` `ILongPredicate`.

###### Return

**Type**

LongPredicate

**Description**

the negated `LongPredicate`

###### Example
```apex
someLongPredicate.negate();
```

---
### Static Methods
##### `static some(List<ILongPredicate> predicates)`

Returns a composed `LongPredicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`ILongPredicate`|

###### Return

**Type**

LongPredicate

**Description**

the composed `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
LongPredicate.some(someLongPredicates);
```

##### `static every(List<ILongPredicate> predicates)`

Returns a composed `LongPredicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`ILongPredicates`|

###### Return

**Type**

LongPredicate

**Description**

the composed `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
LongPredicate.every(someLongPredicates);
```

##### `static negate(ILongPredicate predicate)`

Returns a `LongPredicate` that applies logical `NOT` operator to `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the `ILongPredicate`|

###### Return

**Type**

LongPredicate

**Description**

the negated `LongPredicate`

###### Example
```apex
LongPredicate.negate(someLongPredicate);
```

##### `static always(Boolean value)`

Returns a `LongPredicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Return

**Type**

LongPredicate

**Description**

predicate the `LongPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
LongPredicate.always(true);
```

---
