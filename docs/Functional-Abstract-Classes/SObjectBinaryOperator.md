# SObjectBinaryOperator

`APIVERSION: 55`

`STATUS: ACTIVE`

Provides default and static methods of [ISObjectBinaryOperator](/docs/Functional-Interfaces/ISObjectBinaryOperator.md) functional interface.


**See** [ISObjectBinaryOperator](/docs/Functional-Interfaces/ISObjectBinaryOperator.md)


**See** SObjectStream.zip


**See** SObjectSequence.zip


**See** ISObjectBaseIterable.reduce


**See** [SObjectCollector](/docs/Functional-Abstract-Classes/SObjectCollector.md)


**Author** Oleh Berehovskyi


**Group** Functional Abstract Classes

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
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

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
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

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
