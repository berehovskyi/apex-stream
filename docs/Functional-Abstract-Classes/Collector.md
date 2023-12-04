# abstract Collector

`APIVERSION: 59`

`STATUS: ACTIVE`

Provides default and static methods of
[ICollector](/docs/Functional-Interfaces/ICollector.md) functional interface.


**Implemented types**

[ICollector](/docs/Functional-Interfaces/ICollector.md)


**See** [ICollector](/docs/Functional-Interfaces/ICollector.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Functions
##### `public ISupplier supplier()`
##### `public IBiConsumer accumulator()`
##### `public IFunction finisher()`
---
### Static Methods
##### `public static Collector of(ISupplier supplier, IBiConsumer accumulator)`

Returns a `Collector` by the given `supplier` and `accumulator`.

###### Parameters

|Param|Description|
|---|---|
|`supplier`|the supplier function for the `Collector`|
|`accumulator`|the accumulator function for the `Collector`|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `accumulator` is null|

##### `public static Collector of(ISupplier supplier, IBiConsumer accumulator, IFunction finisher)`

Returns a `Collector` by the given `supplier`, `accumulator`, and `finisher`.

###### Parameters

|Param|Description|
|---|---|
|`supplier`|the supplier function for the `Collector`|
|`accumulator`|the accumulator function for the `Collector`|
|`finisher`|the final transformation function for the `Collector`|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `accumulator` is null|

---
### Default Methods
##### `public virtual Collector cast(Type t)`

Returns a `Collector` that recursively reconstructs collector's suppliers and returns a new `Collector` according to a given container type. <p>Supports casting list type for methods:</p> <ul>     <li>[#toList()](#toList())</li>     <li>[#toList(IFunction)](#toList(IFunction))</li> </ul> <p>Supports casting map value type (but not map key type) for methods:</p> <ul>     <li>[#toBy<T>map(IFunction)](#toBy<T>map(IFunction))</li>     <li>[#groupingBy<T>(IFunction)](#groupingBy<T>(IFunction))</li>     <li>[#partitioningBy(IPredicate)](#partitioningBy(IPredicate))</li>     <li>[#partitioningBy(IPredicate, ICollector)](#partitioningBy(IPredicate, ICollector))</li> </ul>

###### Parameters

|Param|Description|
|---|---|
|`t`|the Type to cast the result container to|

###### Returns

|Type|Description|
|---|---|
|`Collector`|the `Collector`|

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
