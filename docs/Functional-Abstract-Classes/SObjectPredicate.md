# SObjectPredicate

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides default and static methods of [ISObjectPredicate](/docs/Functional-Interfaces/ISObjectPredicate.md) functional interface.


**See** [ISObjectPredicate](/docs/Functional-Interfaces/ISObjectPredicate.md)


**See** ISObjectIterable.filter


**See** ISObjectIterable.take


**See** ISObjectIterable.drop


**See** ISObjectIterable.find


**See** ISObjectIterable.some


**See** ISObjectIterable.every


**See** ISObjectIterable.none


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `test(SObject sObj)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `orElse(ISObjectPredicate other)`

Returns a composed `SObjectPredicate` that applies short-circuiting logical `OR` operator to `this` `ISObjectPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `ISObjectPredicate`|

###### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someSObjectPredicate1.orElse(someSObjectPredicate2);
```

##### `andAlso(ISObjectPredicate other)`

Returns a composed `SObjectPredicate` that applies short-circuiting logical `AND` operator to `this` `ISObjectPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `ISObjectPredicate`|

###### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
someSObjectPredicate1.andAlso(someSObjectPredicate2);
```

##### `negate()`

Returns a `SObjectPredicate` that applies logical `NOT` operator to `this` `ISObjectPredicate`.

###### Return

**Type**

SObjectPredicate

**Description**

the negated `SObjectPredicate`

###### Example
```apex
someSObjectPredicate.negate();
```

---
### Static Methods
##### `static some(List<ISObjectPredicate> predicates)`

Returns a composed `SObjectPredicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`ISObjectPredicates`|

###### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
SObjectPredicate.some(someSObjectPredicates);
```

##### `static every(List<ISObjectPredicate> predicates)`

Returns a composed `SObjectPredicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`ISObjectPredicates`|

###### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
SObjectPredicate.every(someSObjectPredicates);
```

##### `static negate(ISObjectPredicate predicate)`

Returns a `SObjectPredicate` that applies logical `NOT` operator to `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the `ISObjectPredicate`|

###### Return

**Type**

SObjectPredicate

**Description**

the negated `SObjectPredicate`

###### Example
```apex
SObjectPredicate.negate(someSObjectPredicate);
```

##### `static always(Boolean value)`

Returns a `SObjectPredicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Return

**Type**

SObjectPredicate

**Description**

predicate the `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
SObjectPredicate.always(true);
```

##### `static compose(ISObjectFunction mapper, IPredicate predicate)`

Returns a composed `SObjectPredicate` of the `ISObjectFunction` and the `IPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
SObjectPredicate.compose(someSObjectFunction, somePredicate);
SObjectPredicate.compose(SObjectFunctions.get('Name'), StringPredicate.startsWith('A'));
```

##### `static compose(ISObjectToIntFunction mapper, IIntPredicate predicate)`

Returns a composed `SObjectPredicate` of the `ISObjectToIntFunction` and the `IIntPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
SObjectPredicate.compose(someSObjectToIntFunction, someIntPredicate);
SObjectPredicate.compose(
    SObjectToIntFunctions.get('NumberOfEmployees'),
    IntPredicates.isEven()
);
```

##### `static compose(ISObjectToLongFunction mapper, ILongPredicate predicate)`

Returns a composed `SObjectPredicate` of the `ISObjectToLongFunction` and the `ILongPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
SObjectPredicate.compose(someSObjectToLongFunction, someLongPredicate);
SObjectPredicate.compose(
    SObjectToLongFunctions.get('NumberOfEmployees'),
    LongPredicates.isEven()
);
```

##### `static compose(ISObjectToDoubleFunction mapper, IDoublePredicate predicate)`

Returns a composed `SObjectPredicate` of the `ISObjectToDoubleFunction` and the `IDoublePredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

SObjectPredicate

**Description**

the composed `SObjectPredicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
SObjectPredicate.compose(someSObjectToDoubleFunction, someDoublePredicate);
SObjectPredicate.compose(
    SObjectToDoubleFunctions.get('ShippingLatitude'),
    DoublePredicates.isPositive()
);
```

---
