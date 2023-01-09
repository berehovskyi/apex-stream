# DateFunctions

`APIVERSION: 56`

`STATUS: ACTIVE`

Provides common implementations of `Date` [Function](/docs/Functional-Abstract-Classes/Function.md) and related utilities.


**See** [Function](/docs/Functional-Abstract-Classes/Function.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Date Functions
##### `static addDays(Integer days)`

Returns a `Function` that adds `days` to an input argument.

###### Parameters
|Param|Description|
|---|---|
|`days`|the number of additional days|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `days` is null|


**See** Date.addDays

##### `static addMonths(Integer months)`

Returns a `Function` that adds `months` to an input argument.

###### Parameters
|Param|Description|
|---|---|
|`months`|the number of additional months|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `months` is null|


**See** Date.addMonths

##### `static addYears(Integer years)`

Returns a `Function` that adds `years` to an input argument.

###### Parameters
|Param|Description|
|---|---|
|`years`|the number of additional years|

###### Return

**Type**

Function

**Description**

the `Function`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `years` is null|


**See** Date.addYears

##### `static format()`

Returns a `Function` that returns the date as a string using the locale of the context user.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Date.format

##### `static toStartOfMonth()`

Returns a `Function` that returns the first day of the month for an input argument.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Date.toStartOfMonth

##### `static toStartOfWeek()`

Returns a `Function` that returns the first day of the week for an input argument.

###### Return

**Type**

Function

**Description**

the `Function`


**See** Date.toStartOfWeek

---
