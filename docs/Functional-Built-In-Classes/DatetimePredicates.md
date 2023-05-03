# DatetimePredicates

`APIVERSION: 57`

`STATUS: ACTIVE`

Provides common implementations of `Datetime` [Predicate](/docs/Functional-Abstract-Classes/Predicate.md) and related utilities.


**See** [Predicate](/docs/Functional-Abstract-Classes/Predicate.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Datetime Predicates
##### `static isSameDay(Datetime datetimeToCompare)`

Returns a `Predicate` that tests the input datetime if it is the same as the specified `datetimeToCompare` in the local time zone of the context user.

###### Parameters
|Param|Description|
|---|---|
|`datetimeToCompare`|datetime|

###### Return

**Type**

Predicate

**Description**

the `Predicate`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `dateToCompare` is null|


**See** Datetime.isSameDay

---
