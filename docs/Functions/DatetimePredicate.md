# DatetimePredicate

`APIVERSION: 54`

`STATUS: ACTIVE`

Extends `Predicate` functions and provides `DatetimePredicate` common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functions

## Methods
### `static isSameDay(Datetime datetimeToCompare)`

Returns a `Predicate` that tests the input datetime if it is the same as the specified `datetimeToCompare` in the local time zone of the context user.

#### Parameters
|Param|Description|
|---|---|
|`datetimeToCompare`|datetime|

#### Return

**Type**

Predicate

**Description**

the `Predicate`

#### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if the `dateToCompare` is null|


**See** Datetime.isSameDay

---
