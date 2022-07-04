# SObjectCollector

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [ISObjectCollector](/docs/Functional-Interfaces/ISObjectCollector.md) functional interface.


**See** [ISObjectCollector](/docs/Functional-Interfaces/ISObjectCollector.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Functions
##### `supplier()`
##### `accumulator()`
##### `finisher()`
---
### Static Methods
##### `static of(ISupplier supplier, IObjectSObjectConsumer accumulator)`

Returns a `SObjectCollector` by the given `supplier` and `accumulator`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier function for the `SObjectCollector`|
|`accumulator`|the accumulator function for the `SObjectCollector`|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `accumulator` is null|

##### `static of(ISupplier supplier, IObjectSObjectConsumer accumulator, IFunction finisher)`

Returns a `SObjectCollector` by the given `supplier`, `accumulator`, and `finisher`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier function for the `SObjectCollector`|
|`accumulator`|the accumulator function for the `SObjectCollector`|
|`finisher`|the final transformation function for the `SObjectCollector`|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `accumulator` is null|

##### `cast(Type t)`

Returns a `SObjectCollector` that recursively reconstructs collector&apos;s suppliers and returns a new `SObjectCollector` according to a given container type. <p>Supports casting list type for methods:</p> <ul>     <li>#toList(ISObjectFunction)</li>     <li>#toList(String)</li>     <li>#toList(SObjectField)</li> <p/> </ul> <p>Supports casting map value type (but not map key type) for methods:</p> <ul>     <li>#toBy<T>map(ISObjectFunction)</li>     <li>#toBy<T>map(String)</li>     <li>#toBy<T>map(SObjectField)</li>     <li>#groupingBy<T>(ISObjectFunction)</li>     <li>#groupingBy<T>(String)</li>     <li>#groupingBy<T>(SObjectField)</li>     <li>#partitioningBy(ISObjectPredicate)</li>     <li>#partitioningBy(ISObjectPredicate, ISObjectCollector)</li> </ul>

###### Parameters
|Param|Description|
|---|---|
|`t`|the Type to cast the result container to|

###### Return

**Type**

SObjectCollector

**Description**

the `SObjectCollector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `t` is null|
|`TypeException`|if invalid `t` is provided|

###### Example
```apex
SObjectCollector.toList('Name').cast(List<String>.class);
```

---
