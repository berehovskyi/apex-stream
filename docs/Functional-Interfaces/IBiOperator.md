# IBiOperator

`APIVERSION: 66`

`STATUS: ACTIVE`

An entity that takes two arguments of `Object` type and returns an `Object`
value. The types of the arguments and of the returned value <strong>must</strong> be the same.


**Extended types**

[IBiFunction](/docs/Functional-Interfaces/IBiFunction.md)

**Author** Oleh Berehovskyi


**Group** Functional Interfaces

## Methods
### `public Object apply(Object o1, Object o2)`

Applies the function to the two input arguments. <p>Contract:</p> The method is expected to have the following properties: <ul>     <li>The arguments and the returned value must be of the same type.</li> </ul>

#### Parameters

|Param|Description|
|---|---|
|`o1`|the first input argument of `T` type|
|`o2`|the second input argument of `T` type|

#### Returns

|Type|Description|
|---|---|
|`Object`|the result of `T` type|

---
