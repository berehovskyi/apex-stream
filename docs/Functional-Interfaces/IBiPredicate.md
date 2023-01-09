# IBiPredicate

`APIVERSION: 56`

`STATUS: ACTIVE`

A function that takes two arguments of `Object` type and returns a Boolean value (`true` or `false`).


**Author** Oleh Berehovskyi


**Group** Functional Interfaces

## Methods
### `test(Object o1, Object o2)`

Returns the result of applying this predicate to input. <p>Contract:</p> The method is expected to have the next properties: <ul>     <li>Does not cause any side effects.</li>     <li>Does not return `null`.</li> </ul>

#### Parameters
|Param|Description|
|---|---|
|`o1`|the first input argument of `Object` type|
|`o2`|the second input argument of `Object` type|

#### Return

**Type**

Boolean

**Description**

`true` if the input satisfies the predicate, `false` otherwise

---
