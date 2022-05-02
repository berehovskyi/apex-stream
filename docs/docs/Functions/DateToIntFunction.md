# DateToIntFunction

`APIVERSION: 54`

`STATUS: ACTIVE`

Extends `ToIntFunction` functions and provides `DateToIntFunction` common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### Date To Int Functions
##### `static day()`

Returns a `ToIntFunction` that returns the day-of-month component of the Date input argument in the local time zone of the context user.

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`


**See** Date.day

##### `static dayOfYear()`

Returns a `ToIntFunction` that returns the day-of-year component of the Date input argument in the local time zone of the context user.

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`


**See** Date.day

##### `static daysBetween(Date other)`

Returns a `ToIntFunction` that returns the number of days between the Date input argument and the `other` Date.

###### Parameters
|Param|Description|
|---|---|
|`other`|the Date to compare|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|


**See** Date.daysBetween

##### `static month()`

Returns a `ToIntFunction` that returns the month component of the Date input argument in the local time zone of the context user (1 = Jan).

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`


**See** Date.month

##### `static monthsBetween(Date other)`

Returns a `ToIntFunction` that returns the number of months between the Date input argument and the `other` Date, ignoring the difference in days.

###### Parameters
|Param|Description|
|---|---|
|`other`|the Date to compare|

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `other` is null|


**See** Date.monthsBetween

##### `static year()`

Returns a `ToIntFunction` that returns the year component of the Date input argument in the local time zone of the context user.

###### Return

**Type**

ToIntFunction

**Description**

the `ToIntFunction`


**See** Date.year

---
