# SObjectBinaryOperator

`APIVERSION: 54`

`STATUS: ACTIVE`

Inherits [ISObjectBinaryOperator](/docs/Functional-Interfaces/ISObjectBinaryOperator.md) functional interface and provides default methods, common class level implementations, and related utilities.


**Author** O. Berehovskyi


**Group** Functional Abstract Classes


**See** SObjectStream.zip


**See** SObjectSequence.zip


**See** ISObjectIterable.reduce


**See** [SObjectCollector](/docs/Collectors/SObjectCollector.md)

## Methods
### Function
##### `apply(SObject sObj1, SObject sObj2)`
###### Parameters
|Param|Description|
|---|---|

---
### Static Methods
##### `static left()`

Returns a `SObjectBinaryOperator` that return the first input argument.

###### Return

**Type**

SObjectBinaryOperator

**Description**

the `SObjectBinaryOperator`

##### `static right()`

Returns a `SObjectBinaryOperator` that return the second input argument.

###### Return

**Type**

SObjectBinaryOperator

**Description**

the `SObjectBinaryOperator`

##### `static minBy(ISObjectComparator comparator)`

Returns a `SObjectBinaryOperator` that returns a lesser input argument according to the `comparator`.

###### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator to compare arguments|

###### Return

**Type**

SObjectBinaryOperator

**Description**

the `SObjectBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

##### `static minBy(String fieldName)`

Returns a `SObjectBinaryOperator` that returns a lesser input argument according to the `fieldName`.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to compare|

###### Return

**Type**

SObjectBinaryOperator

**Description**

the `SObjectBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

##### `static minBy(SObjectField field)`

Returns a `SObjectBinaryOperator` that returns a lesser input argument according to the `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to compare|

###### Return

**Type**

SObjectBinaryOperator

**Description**

the `SObjectBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

##### `static maxBy(ISObjectComparator comparator)`

Returns a `SObjectBinaryOperator` that returns a greater input argument according to the `comparator`.

###### Parameters
|Param|Description|
|---|---|
|`comparator`|the comparator to compare arguments|

###### Return

**Type**

SObjectBinaryOperator

**Description**

the `SObjectBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `comparator` is null|

##### `static maxBy(String fieldName)`

Returns a `SObjectBinaryOperator` that returns a greater input argument according to the `fieldName`.

###### Parameters
|Param|Description|
|---|---|
|`fieldName`|the field value to compare|

###### Return

**Type**

SObjectBinaryOperator

**Description**

the `SObjectBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `fieldName` is blank|

##### `static maxBy(SObjectField field)`

Returns a `SObjectBinaryOperator` that returns a greater input argument according to the `field`.

###### Parameters
|Param|Description|
|---|---|
|`field`|the field value to compare|

###### Return

**Type**

SObjectBinaryOperator

**Description**

the `SObjectBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

##### `static combine(ISObjectBiConsumer consumer, ISObjectBinaryOperator merger)`

Returns a combined `SObjectBinaryOperator` of the `consumer` and the `merger`.

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the binary consumer|
|`merger`|the binary operator that merges the input arguments after its consumption|

###### Return

**Type**

SObjectBinaryOperator

**Description**

the `SObjectBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` or `merger` is null|

##### `static forBiConsumer(ISObjectBiConsumer consumer)`

Returns a combined `SObjectBinaryOperator` of the `consumer` and the `right` binary operator.

###### Parameters
|Param|Description|
|---|---|
|`consumer`|the binary consumer|

###### Return

**Type**

SObjectBinaryOperator

**Description**

the `SObjectBinaryOperator`

###### Throws
|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

---
