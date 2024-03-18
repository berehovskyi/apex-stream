# virtual DateFunctions

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides common implementations of `Date` [Function](/docs/Functional-Abstract-Classes/Function.md)
and related utilities.


**See** [Function](/docs/Functional-Abstract-Classes/Function.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Date Functions
##### `public static Function addDays(Integer days)`

Returns a `Function` that adds `days` to an input argument.

###### Parameters

|Param|Description|
|---|---|
|`days`|the number of additional days|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `days` is null|


**See** [Date.addDays](Date.addDays)

##### `public static Function addMonths(Integer months)`

Returns a `Function` that adds `months` to an input argument.

###### Parameters

|Param|Description|
|---|---|
|`months`|the number of additional months|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `months` is null|


**See** [Date.addMonths](Date.addMonths)

##### `public static Function addYears(Integer years)`

Returns a `Function` that adds `years` to an input argument.

###### Parameters

|Param|Description|
|---|---|
|`years`|the number of additional years|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `years` is null|


**See** [Date.addYears](Date.addYears)

##### `public static Function format()`

Returns a `Function` that returns the date as a string using the locale of the context user.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Date.format](Date.format)

##### `public static Function toStartOfMonth()`

Returns a `Function` that returns the first day of the month for an input argument.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Date.toStartOfMonth](Date.toStartOfMonth)

##### `public static Function toStartOfWeek()`

Returns a `Function` that returns the first day of the week for an input argument.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Date.toStartOfWeek](Date.toStartOfWeek)

---
