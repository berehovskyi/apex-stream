# SObjectBiPredicate

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides default and static methods of [ISObjectBiPredicate](/docs/Functional-Interfaces/ISObjectBiPredicate.md) functional interface.


**See** [ISObjectBiPredicate](/docs/Functional-Interfaces/ISObjectBiPredicate.md)


**See** SObjectStream.zip


**See** SObjectSequence.zip


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `test(SObject sObj1, SObject sObj2)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `orElse(ISObjectBiPredicate other)`

Returns a composed `SObjectBiPredicate` that applies short-circuiting logical `OR` operator to `this` `ISObjectBiPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `ISObjectBiPredicate`|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someSObjectBiPredicate1.orElse(someSObjectBiPredicate2);
```

##### `andAlso(ISObjectBiPredicate other)`

Returns a composed `SObjectBiPredicate` that applies short-circuiting logical `AND` operator to `this` `ISObjectPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `ISObjectBiPredicate`|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someSObjectBiPredicate1.andAlso(someSObjectBiPredicate2);
```

##### `negate()`

Returns a `SObjectBiPredicate` that applies logical `NOT` operator to `this` `ISObjectBiPredicate`.

###### Return

**Type**

SObjectBiPredicate

**Description**

the negated `SObjectBiPredicate`

###### Example
```apex
someSObjectBiPredicate.negate();
```

---
### Static Methods
##### `static some(List<ISObjectBiPredicate> predicates)`

Returns a composed `SObjectBiPredicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`ISObjectBiPredicate`|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
SObjectBiPredicate.some(someSObjectBiPredicates);
```

##### `static every(List<ISObjectBiPredicate> predicates)`

Returns a composed `SObjectBiPredicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`ISObjectBiPredicate`|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
SObjectBiPredicate.every(someSObjectBiPredicates);
```

##### `static negate(ISObjectBiPredicate predicate)`

Returns a `SObjectBiPredicate` that applies logical `NOT` operator to `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the `ISObjectBiPredicate`|

###### Return

**Type**

SObjectBiPredicate

**Description**

the negated `SObjectBiPredicate`

###### Example
```apex
SObjectBiPredicate.negate(someSObjectBiPredicate);
```

##### `static some(ISObjectPredicate left, ISObjectPredicate right)`

Returns a composed `SObjectBiPredicate` that applies short-circuiting logical `OR` operator to `left` `ISObjectPredicate` and `right` in that order applied to the first and the second input arguments respectively.

###### Parameters
|Param|Description|
|---|---|
|`left`|the predicate applied to the first input argument|
|`right`|the predicate applied to the second input argument|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
SObjectBiPredicate.some(someSObjectPredicate1, someSObjectPredicate2);
```

##### `static every(ISObjectPredicate left, ISObjectPredicate right)`

Returns a composed `SObjectBiPredicate` that applies short-circuiting logical `AND` operator to `left` `ISObjectPredicate` and `right` in that order applied to the first and the second input arguments respectively.

###### Parameters
|Param|Description|
|---|---|
|`left`|the predicate applied to the first input argument|
|`right`|the predicate applied to the second input argument|

###### Return

**Type**

SObjectBiPredicate

**Description**

the composed `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `left` or `right` is null|

###### Example
```apex
SObjectBiPredicate.every(someSObjectPredicate1, someSObjectPredicate2);
```

##### `static always(Boolean value)`

Returns a `SObjectBiPredicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Return

**Type**

SObjectBiPredicate

**Description**

predicate the `SObjectBiPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
SObjectBiPredicate.always(true);
```

---
