# ISObjectBiPredicate

`APIVERSION: 56`

`STATUS: ACTIVE`

A function that takes two arguments of `SObject` type and returns a Boolean value (`true` or `false`).


**Author** Oleh Berehovskyi


**Group** Functional Interfaces

## Methods
### `test(SObject sObj1, SObject sObj2)`

Returns the result of applying this predicate to input. <p>Contract:</p> The method is expected to have the next properties: <ul>     <li>Does not cause any side effects.</li>     <li>Does not return `null`.</li> </ul>

#### Parameters
|Param|Description|
|---|---|
|`sObj1`|the first input argument of `SObject` type|
|`sObj2`|the second input argument of `SObject` type|

#### Return

**Type**

Boolean

**Description**

`true` if the input satisfies the predicate, `false` otherwise

---
