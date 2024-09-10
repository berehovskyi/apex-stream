# virtual IntOperators

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides common implementations of Integer [Operator](/docs/Functional-Abstract-Classes/Operator.md)
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

##### `public static Operator add(Integer i)`

Returns a `Operator` that returns the sum of the input argument and the `i`.

###### Parameters

|Param|Description|
|---|---|
|`i`|the int value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|

##### `public static Operator decrement()`

Returns a `Operator` that returns the input argument decremented by 1.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

##### `public static Operator divide(Integer i)`

Returns a `Operator` that returns the division of the input argument and the `i`.

###### Parameters

|Param|Description|
|---|---|
|`i`|the int value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `i` is 0|
|`NullPointerException`|if `i` is null|

##### `public static Operator increment()`

Returns a `Operator` that returns the input argument incremented by 1.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

##### `public static Operator max(Integer i)`

Returns a `Operator` that returns a larger value between the input argument and the `i`.

###### Parameters

|Param|Description|
|---|---|
|`i`|the int value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|


**See** [Math.max](Math.max)

##### `public static Operator min(Integer i)`

Returns a `Operator` that returns a smaller value between the input argument and the `i`.

###### Parameters

|Param|Description|
|---|---|
|`i`|the int value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|


**See** [Math.min](Math.min)

##### `public static Operator mod(Integer i)`

Returns a `Operator` that returns a remainder of the input argument divided by the `i`.

###### Parameters

|Param|Description|
|---|---|
|`i`|the int value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `i` is 0|
|`NullPointerException`|if `i` is null|


**See** [Math.mod](Math.mod)

##### `public static Operator multiply(Integer i)`

Returns a `Operator` that returns the multiplication of the of the input argument and the `i`.

###### Parameters

|Param|Description|
|---|---|
|`i`|the int value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|

##### `public static Operator subtract(Integer i)`

Returns a `Operator` that returns the subtraction of the input argument and the `i`.

###### Parameters

|Param|Description|
|---|---|
|`i`|the int value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `i` is null|

---
