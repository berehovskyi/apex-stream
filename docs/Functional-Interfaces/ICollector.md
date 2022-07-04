# ICollector

`APIVERSION: 55`

`STATUS: ACTIVE`

A mutable reduction operation that accumulates input arguments into a mutable result `container`, optionally transforming the accumulated result into a final representation after all input elements have been processed.


**Author** Oleh Berehovskyi


**Group** Functional Interfaces

## Methods
### `supplier()`

Returns a `ISupplier` that creates and returns a new mutable result `container`.

#### Return

**Type**

ISupplier

**Description**

the `ISupplier`

### `accumulator()`

Returns a `IBiConsumer` that incorporates a new data element into a result `container`.

#### Return

**Type**

IBiConsumer

**Description**

the `IBiConsumer`

### `finisher()`

Returns a `IFunction` that performs an optional final transform on the `container`.

#### Return

**Type**

IFunction

**Description**

the `IFunction`

---
