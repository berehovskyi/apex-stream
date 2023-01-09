# DoubleSupplier

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides default and static methods of [IDoubleSupplier](/docs/Functional-Interfaces/IDoubleSupplier.md) functional interface.


**See** [IDoubleSupplier](/docs/Functional-Interfaces/IDoubleSupplier.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `get()`
---
### Static Methods
##### `static constant(Double value)`

Returns a `DoubleSupplier` that returns a `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the value|

###### Return

**Type**

DoubleSupplier

**Description**

the `DoubleSupplier`

###### Example
```apex
IDoubleSupplier constant = DoubleSupplier.constant((Double) 42.0);
constant.get(); // 42.0
constant.get(); // 42.0
constant.get(); // 42.0
```

##### `static repeat(Iterable<Double> iterable)`

Returns a `DoubleSupplier` that infinitely returns the elements in order.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the iterable|

###### Return

**Type**

DoubleSupplier

**Description**

the `DoubleSupplier`

###### Example
```apex
IDoubleSupplier repeat = DoubleSupplier.repeat(new List<Double>{ 1.35, 3.6, 8.2 });
repeat.get(); // 1.35
repeat.get(); // 3.6
repeat.get(); // 8.2
repeat.get(); // 1.35
```

---
