# virtual BaseListObjectConsumers

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides base implementations of `List<T> - T` [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)
and related utilities that are used by [IEnumerable](IEnumerable).


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static BiConsumer addToList(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List` and adds to this `List<Object>` the result returned by the `mapper` applied to the second input argument.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** [BaseCollectors.toList](BaseCollectors.toList)

###### Example
```apex
List<String> container = new List<String>();
BaseListObjectConsumers.addToList(Function.identity()).accept(container, 'foo');
// container -> ['foo']
```


##### `public static BiConsumer averagingDouble(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List<Double>`, which is used as a container to track the number of elements and the total sum using `Kahan Summation`.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function applied to the second input argument|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** [BaseCollectors.averagingDouble](BaseCollectors.averagingDouble)

###### Example
```apex
// Floating point numbers arithmetic operations are inaccurate by nature
Double sum = 0.0;
for (Integer i = 0; i < 10; i++) {
    sum += 0.1;
}
// sum / 10 -> 0.009999999999999999
// Can be mitigated using compensated summation algorithms i.e. Kahan Summation
List<Double> container = new List<Double>{ 0, 0, 0, 0 };
for (Integer i = 0; i < 10; i++) {
    BaseListObjectConsumers.averagingDouble(Function.identity()).accept(container, 0.1);
}
// container -> [ 0.1, 3.469446951953614E-18, 10.0, 0.09999999999999999 ]
Double avg = (container[0] + container[1]) / container[2]; // 0.01
```


---
### Public Methods
##### `public static Double kahanSum(List<Double> intermediateSum, Double d)`

Integrates a new summand value to <a href="https://en.wikipedia.org/wiki/Kahan_summation_algorithm">Kahan Summation</a>. High-order bits of the sum are in intermediateSum[0], low-order bits of the sum are in intermediateSum[1]

###### Parameters

|Param|Description|
|---|---|
|`intermediateSum`|the high-order and low-order bits of the intermediate sum|
|`d`|the summand|

###### Returns

|Type|Description|
|---|---|
|`Double`|intermediate high-order / low-order sum container|

---
