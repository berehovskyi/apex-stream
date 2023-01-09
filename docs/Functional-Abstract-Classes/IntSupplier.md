# IntSupplier

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [IIntSupplier](/docs/Functional-Interfaces/IIntSupplier.md) functional interface.


**See** [IIntSupplier](/docs/Functional-Interfaces/IIntSupplier.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `get()`
---
### Static Methods
##### `static constant(Integer value)`

Returns a `IntSupplier` that returns a `value`.

###### Parameters
|Param|Description|
|---|---|
|`value`|the value|

###### Return

**Type**

IntSupplier

**Description**

the `IntSupplier`

###### Example
```apex
IIntSupplier constant = IntSupplier.constant(42);
constant.get(); // 42
constant.get(); // 42
constant.get(); // 42
```

##### `static repeat(Iterable<Integer> iterable)`

Returns a `IntSupplier` that infinitely returns the elements in order.

###### Parameters
|Param|Description|
|---|---|
|`iterable`|the iterable|

###### Return

**Type**

IntSupplier

**Description**

the `IntSupplier`

###### Example
```apex
IIntSupplier repeat = IntSupplier.repeat(new List<Integer>{ 1, 3, 8 });
repeat.get(); // 1
repeat.get(); // 3
repeat.get(); // 8
repeat.get(); // 1
```

---
