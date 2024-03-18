# abstract Supplier

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides default and static methods of
[ISupplier](/docs/Functional-Interfaces/ISupplier.md) functional interface.


**Implemented types**

[ISupplier](/docs/Functional-Interfaces/ISupplier.md)


**See** [ISupplier](/docs/Functional-Interfaces/ISupplier.md)


**See** [Collector](/docs/Functional-Abstract-Classes/Collector.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

## Methods
### Function
##### `public Object get()`
---
### Static Methods
##### `public static Supplier of(Type t)`

Returns a `Supplier` that returns a new instance of the given type.

###### Parameters

|Param|Description|
|---|---|
|`t`|Type of the new instance to create|

###### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `t` is null|


**See** [Type.newInstance](Type.newInstance)

###### Example
```apex
ISupplier of = Supplier.of(List<Account>.class);
List<Account> accounts = (List<Account>) of.get(); // new List<Account>()
```


##### `public static Supplier constant(Object o)`

Returns a stateful `Supplier` that returns a reference of the `o` object.

###### Parameters

|Param|Description|
|---|---|
|`o`|the Object|

###### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|

###### Example
```apex
ISupplier constant = Supplier.constant('a');
constant.get(); // 'a'
constant.get(); // 'a'
constant.get(); // 'a'
```


##### `public static Supplier repeat(Iterable<Object> iterable)`

Returns a `Supplier` that infinitely returns the elements in order.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the iterable|

###### Returns

|Type|Description|
|---|---|
|`Supplier`|the `Supplier`|

###### Example
```apex
ISupplier repeat = Supplier.repeat(new List<Object>{ 'a', 'b', 'c' });
repeat.get(); // 'a'
repeat.get(); // 'b'
repeat.get(); // 'c'
repeat.get(); // 'a'
```


---
