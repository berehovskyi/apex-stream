# IObjectEnumerable

`APIVERSION: 59`

`STATUS: ACTIVE`

A sequence of raw `Object` elements supporting aggregate operations.


**Extended types**

[IEnumerable<Object>](IEnumerable<Object>)

**See** [ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md)


**See** [IIntEnumerable](/docs/Enumerables/IIntEnumerable.md)


**See** [ILongEnumerable](/docs/Enumerables/ILongEnumerable.md)


**See** [IDoubleEnumerable](/docs/Enumerables/IDoubleEnumerable.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### `public Iterator<Object> iterator()`

Returns an instance of an iterator for this enumerable. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Iterator<Object>`|the iterator|

### `public IIntEnumerable mapToInt(IFunction mapper)`

Returns a new `IIntEnumerable` with `Integer` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public ILongEnumerable mapToLong(IFunction mapper)`

Returns a new `ILongEnumerable` with `Long` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public IDoubleEnumerable mapToDouble(IFunction mapper)`

Returns a new `IDoubleEnumerable` with `Double` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public ISObjectEnumerable mapToSObject(IFunction mapper)`

Returns a new `ISObjectEnumerable` with `SObject` elements returned by `mapper`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping operator|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public IIntEnumerable flatMapToInt(IFunction mapper)`

Returns a new `IIntEnumerable` with `Integer` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Integer>`|

#### Returns

|Type|Description|
|---|---|
|`IIntEnumerable`|the new `IIntEnumerable`|

### `public ILongEnumerable flatMapToLong(IFunction mapper)`

Returns a new `ILongEnumerable` with `Long` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

#### Returns

|Type|Description|
|---|---|
|`ILongEnumerable`|the new `ILongEnumerable`|

### `public IDoubleEnumerable flatMapToDouble(IFunction mapper)`

Returns a new `IDoubleEnumerable` with `Double` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Double>`|

#### Returns

|Type|Description|
|---|---|
|`IDoubleEnumerable`|the new `IDoubleEnumerable`|

### `public ISObjectEnumerable flatMapToSObject(IFunction mapper)`

Returns a new `ISObjectEnumerable` with `SObject` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<SObject>`|

#### Returns

|Type|Description|
|---|---|
|`ISObjectEnumerable`|the new `ISObjectEnumerable`|

### `public Object reduce(Object identity, IBiOperator accumulator)`

Performs a reduction on `Object` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Object` result of the reduction|

### `public List<Object> toList(Type elementType)`

Accumulates `Object` elements into a `List<T>`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`elementType`|the element type argument of List|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<T>` containing the enumerable elements|

---
