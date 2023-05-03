# LongSupplier

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides default and static methods of [ILongSupplier](/docs/Functional-Interfaces/ILongSupplier.md) functional interface.


**See** [ILongSupplier](/docs/Functional-Interfaces/ILongSupplier.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `get()`
---
### Static Methods
##### `static constant(Long value)`

Returns a `LongSupplier` that returns a `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the value|

###### Return

**Type**

LongSupplier

**Description**

the `LongSupplier`

###### Example
```apex
ILongSupplier constant = LongSupplier.constant(42L);
constant.get(); // 42L
constant.get(); // 42L
constant.get(); // 42L
```

##### `static repeat(Iterable<Long> iterable)`

Returns a `LongSupplier` that infinitely returns the elements in order.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the iterable|

###### Return

**Type**

LongSupplier

**Description**

the `LongSupplier`

###### Example
```apex
ILongSupplier repeat = LongSupplier.repeat(new List<Long>{ 1L, 3L, 8L });
repeat.get(); // 1L
repeat.get(); // 3L
repeat.get(); // 8L
repeat.get(); // 1L
```

---
