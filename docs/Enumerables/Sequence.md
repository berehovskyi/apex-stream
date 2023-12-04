# Sequence

`SUPPRESSWARNINGS`

`APIVERSION: 59`

`STATUS: ACTIVE`

An entry point that returns a sequence of a certain type,
depending on the type of the parameter.


**See** [ObjectSequence](/docs/Enumerables/ObjectSequence.md)


**See** [SObjectSequence](/docs/Enumerables/SObjectSequence.md)


**See** [IntSequence](/docs/Enumerables/IntSequence.md)


**See** [LongSequence](/docs/Enumerables/LongSequence.md)


**See** [DoubleSequence](/docs/Enumerables/DoubleSequence.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### `public static ObjectEnumerable of(List<Object> objects)`

Returns a `ObjectSequence` created from `List<Object>`.

#### Parameters

|Param|Description|
|---|---|
|`objects`|the list|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
```apex
ObjectEnumerable peopleSeq = Sequence.of(new List<Person>(people));
```


### `public static SObjectEnumerable of(List<SObject> sObjects)`

Returns a `SObjectEnumerable` created from `sObjects`.

#### Parameters

|Param|Description|
|---|---|
|`sObjects`|the list|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null|

#### Example
```apex
SObjectEnumerable accSeq = Sequence.of(new List<Account>(accounts));
```


### `public static IntEnumerable of(List<Integer> integers)`

Returns a `IntEnumerable` created from `integers`.

#### Parameters

|Param|Description|
|---|---|
|`integers`|the list|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

#### Example
```apex
IntEnumerable intSeq = Sequence.of(new List<Integer>{ 0, 5, 1, -10 });
```


### `public static LongEnumerable of(List<Long> longs)`

Returns a `LongEnumerable` created from `longs`.

#### Parameters

|Param|Description|
|---|---|
|`longs`|the list|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

#### Example
```apex
LongEnumerable longSeq = Sequence.of(new List<Long>{ 0, 5L, 1L, -10 });
```


### `public static DoubleEnumerable of(List<Double> doubles)`

Returns a `DoubleEnumerable` created from `doubles`.

#### Parameters

|Param|Description|
|---|---|
|`doubles`|the list|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `doubles` is null|

#### Example
```apex
DoubleEnumerable doubleSeq = Sequence.of(new List<Double>{ 0.1, 5, 1.5, Math.PI });
```


### `public static ObjectEnumerable of(Set<Object> objects)`

Returns a `ObjectEnumerable` created from `Set<Object>`.

#### Parameters

|Param|Description|
|---|---|
|`objects`|the set|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `objects` is null|

#### Example
```apex
ObjectEnumerable peopleSeq = Sequence.of(new Set<Person>(people));
```


### `public static SObjectEnumerable of(Set<SObject> sObjects)`

Returns a `SObjectEnumerable` created from `sObjects`.

#### Parameters

|Param|Description|
|---|---|
|`sObjects`|the set|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `sObjects` is null|

#### Example
```apex
SObjectEnumerable accSeq = Sequence.of(new Set<SObject>(accounts));
```


### `public static IntEnumerable of(Set<Integer> integers)`

Returns a `IntEnumerable` created from `integers`.

#### Parameters

|Param|Description|
|---|---|
|`integers`|the set|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `integers` is null|

#### Example
```apex
IntEnumerable intSeq = Sequence.of(new Set<Integer>{ 0, 5, 1, -10 });
```


### `public static LongEnumerable of(Set<Long> longs)`

Returns a `LongEnumerable` created from `longs`.

#### Parameters

|Param|Description|
|---|---|
|`longs`|the set|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

#### Example
```apex
LongEnumerable longSeq = Sequence.of(new Set<Long>{ 0, 5L, 1L, -10 });
```


### `public static DoubleEnumerable of(Set<Double> doubles)`

Returns a `DoubleEnumerable` created from `doubles`.

#### Parameters

|Param|Description|
|---|---|
|`doubles`|the set|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `doubles` is null|

#### Example
```apex
DoubleEnumerable doubleSeq = Sequence.of(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
```


### `public static ObjectEnumerable ofNullable(List<Object> objects)`

Returns a `ObjectEnumerable` created from `objects` if non-null, otherwise returns an empty `ObjectEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`objects`|the list|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable` if `objects` is non-null, otherwise an empty `ObjectEnumerable`|

#### Example
```apex
ObjectEnumerable peopleSeq = Sequence.ofNullable(new List<Person>(people));
```


### `public static SObjectEnumerable ofNullable(List<SObject> sObjects)`

Returns a `SObjectEnumerable` created from `sObjects` if non-null, otherwise returns an empty `SObjectEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`sObjects`|the list|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable` if `iterable` is non-null, otherwise an empty `SObjectEnumerable`|

#### Example
```apex
SObjectEnumerable accSeq = Sequence.ofNullable(new List<Account>(accounts));
```


### `public static IntEnumerable ofNullable(List<Integer> integers)`

Returns a `IntEnumerable` created from `integers` if non-null, otherwise returns an empty `IntEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`integers`|the list|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable` if `integers` is non-null, otherwise an empty `IntEnumerable`|

#### Example
```apex
IntEnumerable intSeq = Sequence.ofNullable(new List<Integer>{ 0, 5, 1, -10 });
```


### `public static LongEnumerable ofNullable(List<Long> longs)`

Returns a `LongEnumerable` created from `longs` if non-null, otherwise returns an empty `LongEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`longs`|the list|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable` if `longs` is non-null, otherwise an empty `LongEnumerable`|

#### Example
```apex
LongEnumerable longSeq = Sequence.ofNullable(new List<Long>{ 0, 5L, 1L, -10 });
```


### `public static DoubleEnumerable ofNullable(List<Double> doubles)`

Returns a `DoubleEnumerable` created from `doubles` if non-null, otherwise returns an empty `DoubleEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`doubles`|the list|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable` if `doubles` is non-null, otherwise an empty `DoubleEnumerable`|

#### Example
```apex
DoubleEnumerable doubleSeq = Sequence.ofNullable(new List<Double>{ 0.1, 5, 1.5, Math.PI });
```


### `public static ObjectEnumerable ofNullable(Set<Object> objects)`

Returns a `ObjectEnumerable` created from `objects` if non-null, otherwise returns an empty `ObjectEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`objects`|the set|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable` if `objects` is non-null, otherwise an empty `ObjectEnumerable`|

#### Example
```apex
ObjectEnumerable peopleSeq = Sequence.ofNullable(new Set<Object>(people));
```


### `public static SObjectEnumerable ofNullable(Set<SObject> sObjects)`

Returns a `SObjectEnumerable` created from `sObjects` if non-null, otherwise returns an empty `SObjectEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`sObjects`|the set|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable` if `iterable` is non-null, otherwise an empty `SObjectEnumerable`|

#### Example
```apex
SObjectEnumerable accSeq = Sequence.ofNullable(new Set<SObject>(accounts));
```


### `public static IntEnumerable ofNullable(Set<Integer> integers)`

Returns a `IntEnumerable` created from `integers` if non-null, otherwise returns an empty `IntEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`integers`|the set|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable` if `integers` is non-null, otherwise an empty `IntEnumerable`|

#### Example
```apex
IntEnumerable intSeq = Sequence.ofNullable(new Set<Integer>{ 0, 5, 1, -10 });
```


### `public static LongEnumerable ofNullable(Set<Long> longs)`

Returns a `LongEnumerable` created from `longs` if non-null, otherwise returns an empty `LongEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`longs`|the list|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable` if `longs` is non-null, otherwise an empty `LongEnumerable`|

#### Example
```apex
LongEnumerable longSeq = Sequence.ofNullable(new Set<Long>{ 0, 5L, 1L, -10 });
```


### `public static DoubleEnumerable ofNullable(Set<Double> doubles)`

Returns a `DoubleEnumerable` created from `doubles` if non-null, otherwise returns an empty `DoubleEnumerable`.

#### Parameters

|Param|Description|
|---|---|
|`doubles`|the set|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable` if `doubles` is non-null, otherwise an empty `DoubleEnumerable`|

#### Example
```apex
DoubleEnumerable doubleSeq = Sequence.ofNullable(new Set<Double>{ 0.1, 5, 1.5, Math.PI });
```


---
