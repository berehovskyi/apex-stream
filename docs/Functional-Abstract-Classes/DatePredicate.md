# DatePredicate

`APIVERSION: 54`

`STATUS: ACTIVE`

Extends `Predicate` functions and provides `DatePredicate` common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes

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
|`NullPointerException`|if the `dateToCompare` is null|


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
