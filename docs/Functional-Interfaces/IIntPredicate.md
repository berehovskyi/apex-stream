# IIntPredicate

`APIVERSION: 54`

`STATUS: ACTIVE`

A function that takes one argument of `Integer` type and returns a Boolean value (`true` or `false`).


**Author** O. Berehovskyi


**Group** Functional Interfaces

## Methods
### `test(Integer i)`

Returns the result of applying this predicate to input. <p>Contract:</p> The method is expected to have the next properties: <ul>     <li>Does not cause any side effects.</li>     <li>Does not return `null`.</li> </ul>

#### Parameters
|Param|Description|
|---|---|
|`i`|the input argument of `Integer` type|

#### Return

**Type**

Boolean

**Description**

`true` if the input satisfies the predicate, `false` otherwise

---
