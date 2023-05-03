# Collector

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides default and static methods of [ICollector](/docs/Functional-Interfaces/ICollector.md) functional interface.


**See** [ICollector](/docs/Functional-Interfaces/ICollector.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Functions
##### `supplier()`
##### `accumulator()`
##### `finisher()`
---
### Static Methods
##### `static of(ISupplier supplier, IBiConsumer accumulator)`

Returns a `Collector` by the given `supplier` and `accumulator`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier function for the `Collector`|
|`accumulator`|the accumulator function for the `Collector`|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `accumulator` is null|

##### `static of(ISupplier supplier, IBiConsumer accumulator, IFunction finisher)`

Returns a `Collector` by the given `supplier`, `accumulator`, and `finisher`.

###### Parameters
|Param|Description|
|---|---|
|`supplier`|the supplier function for the `Collector`|
|`accumulator`|the accumulator function for the `Collector`|
|`finisher`|the final transformation function for the `Collector`|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `accumulator` is null|

---
### Default Methods
##### `cast(Type t)`

Returns a `Collector` that recursively reconstructs collector&apos;s suppliers and returns a new `Collector` according to a given container type. <p>Supports casting list type for methods:</p> <ul>     <li>#toList()</li>     <li>#toList(IFunction)</li> </ul> <p>Supports casting map value type (but not map key type) for methods:</p> <ul>     <li>#toBy<T>map(IFunction)</li>     <li>#groupingBy<T>(IFunction)</li>     <li>#partitioningBy(IPredicate)</li>     <li>#partitioningBy(IPredicate, ICollector)</li> </ul>

###### Parameters
|Param|Description|
|---|---|
|`t`|the Type to cast the result container to|

###### Return

**Type**

Collector

**Description**

the `Collector`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `t` is null|
|`TypeException`|if invalid `t` is provided|

###### Example
```apex
Collector.toList(getNameFunction).cast(List<String>.class);
```

---
