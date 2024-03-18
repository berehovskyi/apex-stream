# virtual DoubleOperators

`SUPPRESSWARNINGS`

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides common implementations of Double [Operator](/docs/Functional-Abstract-Classes/Operator.md)
and related utilities.


**See** [Operator](/docs/Functional-Abstract-Classes/Operator.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static Operator abs()`

Returns a `Operator` that returns the absolute value of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.abs](Math.abs)

##### `public static Operator add(Double d)`

Returns a `Operator` that returns the sum of the input argument and the `d`.

###### Parameters

|Param|Description|
|---|---|
|`d`|the Double value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|

##### `public static Operator acos()`

Returns a `Operator` that returns the arc cos of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.acos](Math.acos)

##### `public static Operator asin()`

Returns a `Operator` that returns the arc sin of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.asin](Math.asin)

##### `public static Operator atan()`

Returns a `Operator` that returns the arc tan of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.atan](Math.atan)

##### `public static Operator cbrt()`

Returns a `Operator` that returns the cube root of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.cbrt](Math.cbrt)

##### `public static Operator ceil()`

Returns a `Operator` that returns the ceil of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.ceil](Math.ceil)

##### `public static Operator cos()`

Returns a `Operator` that returns the cos of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.cos](Math.cos)

##### `public static Operator cosh()`

Returns a `Operator` that returns the cosh of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.cosh](Math.cosh)

##### `public static Operator divide(Double d)`

Returns a `Operator` that returns the division of the input argument and the `d`.

###### Parameters

|Param|Description|
|---|---|
|`d`|the Double value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `d` is 0|
|`NullPointerException`|if `d` is null|

##### `public static Operator exp()`

Returns a `Operator` that returns the e ^ the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.exp](Math.exp)

##### `public static Operator floor()`

Returns a `Operator` that returns the floor of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.floor](Math.floor)

##### `public static Operator ln()`

Returns a `Operator` that returns the ln of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.log](Math.log)

##### `public static Operator log()`

Returns a `Operator` that returns the log of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.log10](Math.log10)

##### `public static Operator max(Double d)`

Returns a `Operator` that returns a larger value between the input argument and the `d`.

###### Parameters

|Param|Description|
|---|---|
|`d`|the Double value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|


**See** [Math.max](Math.max)

##### `public static Operator min(Double d)`

Returns a `Operator` that returns a smaller value between the input argument and the `d`.

###### Parameters

|Param|Description|
|---|---|
|`d`|the Double value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|


**See** [Math.min](Math.min)

##### `public static Operator multiply(Double d)`

Returns a `Operator` that returns the multiplication of the of the input argument and the `d`.

###### Parameters

|Param|Description|
|---|---|
|`d`|the Double value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|

##### `public static Operator pow(Double exp)`

Returns a `Operator` that returns the input argument raised to the power of the `exp`.

###### Parameters

|Param|Description|
|---|---|
|`exp`|the Double power value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|


**See** [Math.pow](Math.pow)

##### `public static Operator rint()`

Returns a `Operator` that returns the rint of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.rint](Math.rint)

##### `public static Operator signum()`

Returns a `Operator` that returns the signum of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.signum](Math.signum)

##### `public static Operator sin()`

Returns a `Operator` that returns the sin of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.sin](Math.sin)

##### `public static Operator sinh()`

Returns a `Operator` that returns the sinh of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.sinh](Math.sinh)

##### `public static Operator sqrt()`

Returns a `Operator` that returns the square root of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.sqrt](Math.sqrt)

##### `public static Operator subtract(Double d)`

Returns a `Operator` that returns the subtraction of the input argument and the `d`.

###### Parameters

|Param|Description|
|---|---|
|`d`|the Double value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `d` is null|

##### `public static Operator tan()`

Returns a `Operator` that returns the tan of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.tan](Math.tan)

##### `public static Operator tanh()`

Returns a `Operator` that returns the tanh of the input argument.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|


**See** [Math.tanh](Math.tanh)

---
