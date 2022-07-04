# DoublePredicate

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [IDoublePredicate](/docs/Functional-Interfaces/IDoublePredicate.md) functional interface.


**See** [IDoublePredicate](/docs/Functional-Interfaces/IDoublePredicate.md)


**See** IDoubleIterable.filter


**See** IDoubleIterable.take


**See** IDoubleIterable.drop


**See** IDoubleIterable.find


**See** IDoubleIterable.some


**See** IDoubleIterable.every


**See** IDoubleIterable.none


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `test(Double d)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `orElse(IDoublePredicate other)`

Returns a composed `DoublePredicate` that applies short-circuiting logical `OR` operator to `this` `IDoublePredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `IDoublePredicate`|

###### Return

**Type**

DoublePredicate

**Description**

the composed `DoublePredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someDoublePredicate1.orElse(someDoublePredicate2);
```

##### `andAlso(IDoublePredicate other)`

Returns a composed `DoublePredicate` that applies short-circuiting logical `AND` operator to `this` `IDoublePredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `IDoublePredicate`|

###### Return

**Type**

DoublePredicate

**Description**

the composed `IDoublePredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someDoublePredicate1.andAlso(someDoublePredicate2);
```

##### `negate()`

Returns a `DoublePredicate` that applies logical `NOT` operator to `this` `IDoublePredicate`.

###### Return

**Type**

DoublePredicate

**Description**

the negated `DoublePredicate`

###### Example
```apex
someDoublePredicate.negate();
```

---
### Static Methods
##### `static some(List<IDoublePredicate> predicates)`

Returns a composed `DoublePredicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IDoublePredicates`|

###### Return

**Type**

DoublePredicate

**Description**

the composed `DoublePredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
DoublePredicate.some(someDoublePredicates);
```

##### `static every(List<IDoublePredicate> predicates)`

Returns a composed `DoublePredicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IDoublePredicates`|

###### Return

**Type**

DoublePredicate

**Description**

the composed `DoublePredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
DoublePredicate.every(someDoublePredicates);
```

##### `static negate(IDoublePredicate predicate)`

Returns a `DoublePredicate` that applies logical `NOT` operator to `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the `IDoublePredicate`|

###### Return

**Type**

DoublePredicate

**Description**

the negated `DoublePredicate`

###### Example
```apex
DoublePredicate.negate(someDoublePredicate);
```

##### `static always(Boolean value)`

Returns a `DoublePredicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Return

**Type**

DoublePredicate

**Description**

predicate the `DoublePredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
DoublePredicate.always(true);
```

---
