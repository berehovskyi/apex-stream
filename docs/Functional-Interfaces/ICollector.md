# ICollector

`APIVERSION: 58`

`STATUS: ACTIVE`

A mutable reduction operation that accumulates input arguments
into a mutable result `container`, optionally transforming the accumulated result into
a final representation after all input elements have been processed.


**Author** Oleh Berehovskyi


**Group** Functional Interfaces

## Methods
### `public ISupplier supplier()`

Returns a `ISupplier` that creates and returns a new mutable result `container`.

#### Returns

|Type|Description|
|---|---|
|`ISupplier`|the `ISupplier`|

### `public IBiConsumer accumulator()`

Returns a `IBiConsumer` that incorporates a new data element into a result `container`.

#### Returns

|Type|Description|
|---|---|
|`IBiConsumer`|the `IBiConsumer`|

### `public IFunction finisher()`

Returns a `IFunction` that performs an optional final transform on the `container`.

#### Returns

|Type|Description|
|---|---|
|`IFunction`|the `IFunction`|

---
