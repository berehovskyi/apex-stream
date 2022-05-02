# DatetimeFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Extends `Function` functions and provides `DatetimeFunction` common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### `static addDays(Integer days)`

Returns a `Function` that adds `days` to an input argument.

#### Parameters
|Param|Description|
|---|---|
|`days`|the number of additional days|

#### Return

**Type**

Function

**Description**

the `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `days` is null|


**See** Datetime.addDays

### `static addHours(Integer hours)`

Returns a `Function` that adds `hours` to an input argument.

#### Parameters
|Param|Description|
|---|---|
|`hours`|the number of additional hours|

#### Return

**Type**

Function

**Description**

the `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `hours` is null|


**See** Datetime.addHours

### `static addMinutes(Integer minutes)`

Returns a `Function` that adds `minutes` to an input argument.

#### Parameters
|Param|Description|
|---|---|
|`minutes`|the number of additional minutes|

#### Return

**Type**

Function

**Description**

the `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `minutes` is null|


**See** Datetime.addMinutes

### `static addMonths(Integer months)`

Returns a `Function` that adds `months` to an input argument.

#### Parameters
|Param|Description|
|---|---|
|`months`|the number of additional months|

#### Return

**Type**

Function

**Description**

the `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `months` is null|


**See** Datetime.addMonths

### `static addSeconds(Integer seconds)`

Returns a `Function` that adds `seconds` to an input argument.

#### Parameters
|Param|Description|
|---|---|
|`seconds`|the number of additional seconds|

#### Return

**Type**

Function

**Description**

the `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `seconds` is null|


**See** Datetime.addSeconds

### `static addYears(Integer years)`

Returns a `Function` that adds `years` to an input argument.

#### Parameters
|Param|Description|
|---|---|
|`years`|the number of additional years|

#### Return

**Type**

Function

**Description**

the `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `years` is null|


**See** Datetime.addYears

### `static getDate()`

Returns a `Function` that returns the date component of a datetime input argument in the local time zone of the context user.

#### Return

**Type**

Function

**Description**

the `Function`


**See** Datetime.date

### `static dateGmt()`

Returns a `Function` that returns the date component of a datetime input argument in the GMT time zone.

#### Return

**Type**

Function

**Description**

the `Function`


**See** Datetime.dateGmt

### `static format()`

Returns a `Function` that returns the datetime as a string using the locale of the context user.

#### Return

**Type**

Function

**Description**

the `Function`


**See** Datetime.format

### `static format(String dateformat)`

Returns a `Function` that returns the datetime for the local time zone as a string using the supplied Java simple `dateformat`. If the time zone cannot be determined, GMT is used.

#### Parameters
|Param|Description|
|---|---|
|`dateformat`|the date format|

#### Return

**Type**

Function

**Description**

the `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `dateformat` is null|


**See** Datetime.format

### `static format(String dateformat, String timezone)`

Returns a `Function` that returns the datetime for the specified time zone as a string using the supplied Java simple `dateformat`. If the time zone cannot be determined, GMT is used.

#### Parameters
|Param|Description|
|---|---|
|`dateformat`|the date format|
|`timezone`|the time zone|

#### Return

**Type**

Function

**Description**

the `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `dateformat` or `timezone` is null|


**See** Datetime.format

### `static formatGmt(String dateformat)`

Returns a `Function` that returns the datetime as a string using the supplied Java simple `dateformat` and the GMT time zone.

#### Parameters
|Param|Description|
|---|---|
|`dateformat`|the date format|

#### Return

**Type**

Function

**Description**

the `Function`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `dateformat` is null|


**See** Datetime.formatGmt

### `static formatLong()`
### `static getTime()`

Returns a `Function` that returns the time component of a datetime input argument in the local time zone of the context user.

#### Return

**Type**

Function

**Description**

the `Function`


**See** Datetime.time

### `static timeGmt()`

Returns a `Function` that returns the time component of a datetime input argument in the GMT time zone.

#### Return

**Type**

Function

**Description**

the `Function`


**See** Datetime.timeGmt

### `static stringValueOfGmt()`

Returns a `Function` that returns the string that represents the specified datetime in the standard “yyyy-MM-dd HH:mm:ss” format for the GMT time zone.

#### Return

**Type**

Function

**Description**

the `Function`


**See** String.valueOfGmt

---
