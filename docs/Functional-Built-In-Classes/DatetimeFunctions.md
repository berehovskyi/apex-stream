# virtual DatetimeFunctions

`APIVERSION: 58`

`STATUS: ACTIVE`

Provides common implementations of `Datetime` [Function](/docs/Functional-Abstract-Classes/Function.md)
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


**See** [Datetime.addDays](Datetime.addDays)

##### `public static Function addHours(Integer hours)`

Returns a `Function` that adds `hours` to an input argument.

###### Parameters

|Param|Description|
|---|---|
|`hours`|the number of additional hours|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `hours` is null|


**See** [Datetime.addHours](Datetime.addHours)

##### `public static Function addMinutes(Integer minutes)`

Returns a `Function` that adds `minutes` to an input argument.

###### Parameters

|Param|Description|
|---|---|
|`minutes`|the number of additional minutes|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `minutes` is null|


**See** [Datetime.addMinutes](Datetime.addMinutes)

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


**See** [Datetime.addMonths](Datetime.addMonths)

##### `public static Function addSeconds(Integer seconds)`

Returns a `Function` that adds `seconds` to an input argument.

###### Parameters

|Param|Description|
|---|---|
|`seconds`|the number of additional seconds|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `seconds` is null|


**See** [Datetime.addSeconds](Datetime.addSeconds)

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


**See** [Datetime.addYears](Datetime.addYears)

##### `public static Function getDate()`

Returns a `Function` that returns the date component of a datetime input argument in the local time zone of the context user.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Datetime.date](Datetime.date)

##### `public static Function dateGmt()`

Returns a `Function` that returns the date component of a datetime input argument in the GMT time zone.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Datetime.dateGmt](Datetime.dateGmt)

##### `public static Function format()`

Returns a `Function` that returns the datetime as a string using the locale of the context user.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Datetime.format](Datetime.format)

##### `public static Function format(String dateformat)`

Returns a `Function` that returns the datetime for the local time zone as a string using the supplied Java simple `dateformat`. If the time zone cannot be determined, GMT is used.

###### Parameters

|Param|Description|
|---|---|
|`dateformat`|the date format|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `dateformat` is null|


**See** [Datetime.format](Datetime.format)

##### `public static Function format(String dateformat, String timezone)`

Returns a `Function` that returns the datetime for the specified time zone as a string using the supplied Java simple `dateformat`. If the time zone cannot be determined, GMT is used.

###### Parameters

|Param|Description|
|---|---|
|`dateformat`|the date format|
|`timezone`|the time zone|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `dateformat` or `timezone` is null|


**See** [Datetime.format](Datetime.format)

##### `public static Function formatGmt(String dateformat)`

Returns a `Function` that returns the datetime as a string using the supplied Java simple `dateformat` and the GMT time zone.

###### Parameters

|Param|Description|
|---|---|
|`dateformat`|the date format|

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `dateformat` is null|


**See** [Datetime.formatGmt](Datetime.formatGmt)

##### `public static Function formatLong()`
##### `public static Function getTime()`

Returns a `Function` that returns the time component of a datetime input argument in the local time zone of the context user.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Datetime.time](Datetime.time)

##### `public static Function timeGmt()`

Returns a `Function` that returns the time component of a datetime input argument in the GMT time zone.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [Datetime.timeGmt](Datetime.timeGmt)

##### `public static Function stringValueOfGmt()`

Returns a `Function` that returns the string that represents the specified datetime in the standard “yyyy-MM-dd HH:mm:ss” format for the GMT time zone.

###### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [String.valueOfGmt](String.valueOfGmt)

---
