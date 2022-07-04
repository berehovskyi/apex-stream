# ISObjectPredicate

`APIVERSION: 55`

`STATUS: ACTIVE`

A function that takes one argument of `SObject` type and returns a Boolean value (`true` or `false`).


**Author** Oleh Berehovskyi


**Group** Functional Interfaces

## Methods
### `test(SObject sObj)`

Returns the result of applying this predicate to input. <p>Contract:</p> The method is expected to have the next properties: <ul>     <li>Does not cause any side effects.</li>     <li>Does not return `null`.</li> </ul>

#### Parameters
|Param|Description|
|---|---|
|`sObj`|the input argument of `SObject` type|

#### Return

**Type**

Boolean

**Description**

`true` if the input satisfies the predicate, `false` otherwise

---
