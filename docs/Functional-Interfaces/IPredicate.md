# IPredicate

`APIVERSION: 54`

`STATUS: ACTIVE`

A function that takes one argument of `Object` type and returns a Boolean value (`true` or `false`).


**Author** O. Berehovskyi


**Group** Functional Interfaces

## Methods
### `test(Object o)`

Returns the result of applying this predicate to input. <p>Contract:</p> The method is expected to have the next properties: <ul>     <li>Does not cause any side effects.</li>     <li>Does not return `null`.</li> </ul>

#### Parameters
|Param|Description|
|---|---|
|`o`|the input argument of `Object` type|

#### Return

**Type**

Boolean

**Description**

`true` if the input satisfies the predicate, `false` otherwise

---
