# Predicate

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [IPredicate](/docs/Functional-Interfaces/IPredicate.md) functional interface.


**See** [IPredicate](/docs/Functional-Interfaces/IPredicate.md)


**See** IObjectIterable.filter


**See** IObjectIterable.take


**See** IObjectIterable.drop


**See** IObjectIterable.find


**See** IObjectIterable.some


**See** IObjectIterable.every


**See** IObjectIterable.none


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `test(Object o)`
###### Parameters
|Param|Description|
|---|---|

---
### Default Methods
##### `orElse(IPredicate other)`

Returns a composed `Predicate` that applies short-circuiting logical OR} operator to `this` `IPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `Predicate`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
somePredicate1.orElse(somePredicate2);
```

##### `andAlso(IPredicate other)`

Returns a composed `Predicate` that applies short-circuiting logical AND} operator to `this` `IPredicate` and `other` in that order.

###### Parameters
|Param|Description|
|---|---|
|`other`|the other `Predicate`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|

###### Example
```apex
somePredicate1.andAlso(somePredicate2);
```

##### `negate()`

Returns a `Predicate` that applies logical `NOT` operator to `this` `IPredicate`.

###### Return

**Type**

Predicate

**Description**

the negated `Predicate`

###### Example
```apex
somePredicate1.negate();
```

---
### Static Methods
##### `static some(List<IPredicate> predicates)`

Returns a composed `Predicate` that applies sequentially short-circuiting logical `OR` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IPredicates`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
Predicate.some(somePredicates);
```

##### `static every(List<IPredicate> predicates)`

Returns a composed `Predicate` that applies sequentially short-circuiting logical `AND` operator to `predicates` in the same order as the order of the input list.

###### Parameters
|Param|Description|
|---|---|
|`predicates`|the list of`IPredicates`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null or some of the list element is null|

###### Example
```apex
Predicate.every(somePredicates);
```

##### `static negate(IPredicate predicate)`

Returns a `Predicate` that applies logical `NOT` operator to `predicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the `IPredicate`|

###### Return

**Type**

Predicate

**Description**

the negated `Predicate`

###### Example
```apex
Predicate.negate(somePredicate);
```

##### `static always(Boolean value)`

Returns a `Predicate` that always evaluates to the Boolean `value` (`true` or `false`).

###### Parameters
|Param|Description|
|---|---|
|`value`|the evaluated value|

###### Return

**Type**

Predicate

**Description**

predicate the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
Predicate.always(true);
```

##### `static compose(IFunction mapper, IPredicate predicate)`

Returns a composed `Predicate` of the `IFunction` and the `IPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
Predicate.compose(someFunction, somePredicate);
```

##### `static compose(IToIntFunction mapper, IIntPredicate predicate)`

Returns a composed `Predicate` of the `IToIntFunction` and the `IIntPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
Predicate.compose(someToIntFunction, someIntPredicate);
```

##### `static compose(IToLongFunction mapper, ILongPredicate predicate)`

Returns a composed `Predicate` of the `IToLongFunction` and the `ILongPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
Predicate.compose(someToLongFunction, someLongPredicate);
```

##### `static compose(IToDoubleFunction mapper, IDoublePredicate predicate)`

Returns a composed `Predicate` of the `IToDoubleFunction` and the `IDoublePredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
Predicate.compose(someToDoubleFunction, someDoublePredicate);
```

##### `static compose(IToSObjectFunction mapper, ISObjectPredicate predicate)`

Returns a composed `Predicate` of the `IToSObjectFunction` and the `ISObjectPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`mapper`|the function applied to the input argument|
|`predicate`|the predicate to the result returned by the `mapper`|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `predicate` is null|

###### Example
```apex
Predicate.compose(someToSObjectFunction, someSObjectPredicate);
```

##### `static compose(IIntPredicate predicate)`

Returns a composed `Predicate` of the `IIntPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Predicate.compose(someIntPredicate);
```

##### `static compose(ILongPredicate predicate)`

Returns a composed `Predicate` of the `ILongPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Predicate.compose(someLongPredicate);
```

##### `static compose(IDoublePredicate predicate)`

Returns a composed `Predicate` of the `IDoublePredicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Predicate.compose(someDoublePredicate);
```

##### `static compose(ISObjectPredicate predicate)`

Returns a composed `Predicate` of the `ISObjectPredicate`.

###### Parameters
|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Return

**Type**

Predicate

**Description**

the composed `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Predicate.compose(someSObjectPredicate);
```

---
