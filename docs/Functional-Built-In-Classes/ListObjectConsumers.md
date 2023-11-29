# virtual ListObjectConsumers

`APIVERSION: 58`

`STATUS: ACTIVE`

Provides common implementations of `List<T> - Object` [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)
and related utilities that are used by [Collectors](/docs/Functional-Built-In-Classes/Collectors.md).


**Inheritance**

[BaseListObjectConsumers](/docs/Functional-Built-In-Classes/BaseListObjectConsumers.md)
 > 
ListObjectConsumers


**See** [BiConsumer](/docs/Functional-Abstract-Classes/BiConsumer.md)


**See** [Collectors](/docs/Functional-Built-In-Classes/Collectors.md)


**Author** Oleh Berehovskyi


**Group** Functional Built-In Classes

## Methods
### Built-Ins
##### `public static BiConsumer joining(IFunction mapper, String delimiter, String prefix)`

Returns a `BiConsumer` that casts the first input argument to `List<String>`, gets the first element and appends to it the function applied to the second argument as `String` using the `delimiter`.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|
|`delimiter`|the `String` to be used between each element|
|`prefix`|the `String` to be used at the beginning of the joined result|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `delimiter` or `prefix` is null|
|`NullPointerException`|if at least one of the input arguments is null|


**See** [Collectors.joining](Collectors.joining)

##### `public static BiConsumer averagingInt(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List<Integer>`, which is used as a container to track the number of elements and the total sum.

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


**See** [Collectors.averagingInt](Collectors.averagingInt)

##### `public static BiConsumer averagingLong(IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List<Long>`, which is used as a container to track the number of elements and the total sum.

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


**See** [Collectors.averagingLong](Collectors.averagingLong)

##### `public static BiConsumer reducing(IBiOperator accumulator)`

Returns a `BiConsumer` that casts the first input argument to `List<Object>`, gets the first element and reduces its value using `accumulator`.

###### Parameters

|Param|Description|
|---|---|
|`accumulator`|the `IBiOperator` to be used between each element|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.reducing](Collectors.reducing)

##### `public static BiConsumer reducing(IBiOperator accumulator, IFunction mapper)`

Returns a `BiConsumer` that casts the first input argument to `List<Object>`, gets the first element and reduces its value using `accumulator`.

###### Parameters

|Param|Description|
|---|---|
|`accumulator`|the `IBiOperator` to be used between each element|
|`mapper`|the `IFunction` applied to the second input argument|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` or `mapper` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.reducing](Collectors.reducing)

##### `public static BiConsumer reducingOptional(IBiOperator accumulator)`

Returns a `BiConsumer` that casts the first input argument to `List<Object>`, if it is empty puts the first element as the second input argument. Otherwise, gets the first element and reduces its value using `accumulator`.

###### Parameters

|Param|Description|
|---|---|
|`accumulator`|the `IBiOperator` to be used between each element|

###### Returns

|Type|Description|
|---|---|
|`BiConsumer`|the `BiConsumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|
|`NullPointerException`|if the first input argument is null|


**See** [Collectors.reducing](Collectors.reducing)

##### `public static BiConsumer addToList(IFunction mapper)`

*Inherited*


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

*Inherited*


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

*Inherited*


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
