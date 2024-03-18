# virtual LongOperators

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides common implementations of Long [Operator](/docs/Functional-Abstract-Classes/Operator.md)
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

##### `public static Operator add(Long l)`

Returns a `Operator` that returns the sum of the input argument and the `l`.

###### Parameters

|Param|Description|
|---|---|
|`l`|the Long value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|

##### `public static Operator decrement()`

Returns a `Operator` that returns the input argument decremented by 1.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

##### `public static Operator divide(Long l)`

Returns a `Operator` that returns the division of the input argument and the `l`.

###### Parameters

|Param|Description|
|---|---|
|`l`|the Long value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `l` is 0|
|`NullPointerException`|if `l` is null|

##### `public static Operator increment()`

Returns a `Operator` that returns the input argument incremented by 1.

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

##### `public static Operator max(Long l)`

Returns a `Operator` that returns a larger value between the input argument and the `l`.

###### Parameters

|Param|Description|
|---|---|
|`l`|the Long value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|


**See** [Math.max](Math.max)

##### `public static Operator min(Long l)`

Returns a `Operator` that returns a smaller value between the input argument and the `l`.

###### Parameters

|Param|Description|
|---|---|
|`l`|the Long value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|


**See** [Math.min](Math.min)

##### `public static Operator mod(Long l)`

Returns a `Operator` that returns a remainder of the input argument divided by the `l`.

###### Parameters

|Param|Description|
|---|---|
|`l`|the Long value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `l` is 0|
|`NullPointerException`|if `l` is null|


**See** [Math.mod](Math.mod)

##### `public static Operator multiply(Long l)`

Returns a `Operator` that returns the multiplication of the of the input argument and the `l`.

###### Parameters

|Param|Description|
|---|---|
|`l`|the Long value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|

##### `public static Operator subtract(Long l)`

Returns a `Operator` that returns the subtraction of the input argument and the `l`.

###### Parameters

|Param|Description|
|---|---|
|`l`|the Long value|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `l` is null|

---
