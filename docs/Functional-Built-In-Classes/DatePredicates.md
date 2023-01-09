# DatePredicates

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides common implementations of `Date` [Predicate](/docs/Functional-Abstract-Classes/Predicate.md) and related utilities.


**See** [Predicate](/docs/Functional-Abstract-Classes/Predicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Date Predicates
##### `static isSameDay(Date dateToCompare)`

Returns a `Predicate` that tests the input date if it is the same as the specified `dateToCompare` in the local time zone of the context user.

###### Parameters
|Param|Description|
|---|---|
|`dateToCompare`|date|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `dateToCompare` is null|


**See** Date.isSameDay

##### `static isLeapYear()`

Returns a `Predicate` that tests the input date if it is the year is the leap year.

###### Return

**Type**

Predicate

**Description**

the `Predicate`


**See** Date.isLeapYear

---
