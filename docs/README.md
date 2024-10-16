# Classes
## Enumerables

### [DoubleEnumerable](/docs/Enumerables/DoubleEnumerable.md)

Provides a skeletal implementation of [IDoubleEnumerable](/docs/Enumerables/IDoubleEnumerable.md).



### [DoubleSequence](/docs/Enumerables/DoubleSequence.md)

A sequence of `Double` elements supporting aggregate operations,
a primitive specialization of [ObjectSequence](/docs/Enumerables/ObjectSequence.md).
<p><a href="https://en.wikipedia.org/wiki/Monte_Carlo_method">Monte Carlo method</a></p>



### [DoubleStream](/docs/Enumerables/DoubleStream.md)

A sequence of `Double` elements supporting aggregate operations,
a primitive specialization of [ObjectStream](/docs/Enumerables/ObjectStream.md).



### [IDoubleEnumerable](/docs/Enumerables/IDoubleEnumerable.md)

A sequence of `Double` elements supporting aggregate operations.



### [IIntEnumerable](/docs/Enumerables/IIntEnumerable.md)

A sequence of `Integer` elements supporting aggregate operations.



### [ILongEnumerable](/docs/Enumerables/ILongEnumerable.md)

A sequence of `Long` elements supporting aggregate operations.



### [IObjectEnumerable](/docs/Enumerables/IObjectEnumerable.md)

A sequence of raw `Object` elements supporting aggregate operations.



### [ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md)

A sequence of `SObject` elements supporting aggregate operations.



### [IntEnumerable](/docs/Enumerables/IntEnumerable.md)

Provides a skeletal implementation of [IIntEnumerable](/docs/Enumerables/IIntEnumerable.md).



### [IntSequence](/docs/Enumerables/IntSequence.md)

A sequence of `Integer` elements supporting aggregate operations,
a primitive specialization of [ObjectSequence](/docs/Enumerables/ObjectSequence.md).



### [IntStream](/docs/Enumerables/IntStream.md)

A sequence of `Integer` elements supporting aggregate operations,
a primitive specialization of [ObjectStream](/docs/Enumerables/ObjectStream.md).



### [LongEnumerable](/docs/Enumerables/LongEnumerable.md)

Provides a skeletal implementation of [ILongEnumerable](/docs/Enumerables/ILongEnumerable.md).



### [LongSequence](/docs/Enumerables/LongSequence.md)

A sequence of `Long` elements supporting aggregate operations,
a primitive specialization of [ObjectSequence](/docs/Enumerables/ObjectSequence.md).



### [LongStream](/docs/Enumerables/LongStream.md)

A sequence of `Long` elements supporting aggregate operations,
a primitive specialization of [ObjectStream](/docs/Enumerables/ObjectStream.md).



### [ObjectEnumerable](/docs/Enumerables/ObjectEnumerable.md)

Provides a skeletal implementation of [IObjectEnumerable](/docs/Enumerables/IObjectEnumerable.md).



### [ObjectSequence](/docs/Enumerables/ObjectSequence.md)

A sequence of `Object` elements supporting aggregate operations.
Sequence operations are composed of sequence chain. A sequence chain consists of:
<ul>
    <li>A Source (which might be an iterable (such as list or set)).</li>
    <li>Zero or more Intermediate Operations (which transform a sequence...</li>
</ul>


### [ObjectStream](/docs/Enumerables/ObjectStream.md)

A sequence of `Object` elements supporting aggregate operations.
Stream operations are composed of stream chain. A stream chain consists of:
<ul>
    <li>A Source (which might be an iterable (such as list or set), an iterator, a generator function, etc).</li>
    <li>Zero or more Intermediate Opera...</li>
</ul>


### [SObjectEnumerable](/docs/Enumerables/SObjectEnumerable.md)

Provides a skeletal implementation of [ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md).



### [SObjectSequence](/docs/Enumerables/SObjectSequence.md)

A sequence of `SObject` elements supporting aggregate operations.
Sequence operations are composed of sequence chain. A sequence chain consists of:
<ul>
    <li>A Source (which might be an iterable (such as list or set)).</li>
    <li>Zero or more Intermediate Operations (which transform a sequence...</li>
</ul>

### [SObjectStream](/docs/Enumerables/SObjectStream.md)

A sequence of `SObject` elements supporting aggregate operations.
Stream operations are composed of stream chain. A stream chain consists of:
<ul>
    <li>A Source (which might be an iterable (such as list or set), an iterator, a generator function, etc).</li>
    <li>Zero or more Intermediate Oper...</li>
</ul>


### [Sequence](/docs/Enumerables/Sequence.md)

An entry point that returns a sequence of a certain type,
depending on the type of the parameter.



### [Stream](/docs/Enumerables/Stream.md)

An entry point that returns a stream of a certain type,
depending on the type of the parameter.


## Functional Interfaces

### [IBiConsumer](/docs/Functional-Interfaces/IBiConsumer.md)

A function that takes two arguments of `Object` type and returns no value.



### [IBiFunction](/docs/Functional-Interfaces/IBiFunction.md)

An entity that takes two arguments of `Object` type and returns an `Object`
value.



### [IBiOperator](/docs/Functional-Interfaces/IBiOperator.md)

An entity that takes two arguments of `Object` type and returns an `Object`
value. The types of the arguments and the of returned value <strong>must</strong> be the same.



### [IBiPredicate](/docs/Functional-Interfaces/IBiPredicate.md)

A function that takes two arguments of `Object` type and returns a Boolean value
(`true` or `false`).



### [ICollector](/docs/Functional-Interfaces/ICollector.md)

A mutable reduction operation that accumulates input arguments
into a mutable result `container`, optionally transforming the accumulated result into
a final representation after all input elements have been processed.



### [IComparer](/docs/Functional-Interfaces/IComparer.md)

A function that takes two arguments of `Object` type and returns
an `Integer` value, which represents a comparison result. Typically, is used
for sorting. Permits comparison of null arguments.



### [IConsumer](/docs/Functional-Interfaces/IConsumer.md)

A function that takes one argument of `Object` type and returns no value.



### [IFunction](/docs/Functional-Interfaces/IFunction.md)

An entity that takes one argument of `Object` type and returns an `Object` value.



### [IOperator](/docs/Functional-Interfaces/IOperator.md)

An entity that takes one argument of `Object` type and returns an `Object` value.



### [IOptional](/docs/Functional-Interfaces/IOptional.md)

A container which may or may not contain a value.



### [IPredicate](/docs/Functional-Interfaces/IPredicate.md)

A function that takes one argument of `Object` type and returns a Boolean value
(`true` or `false`).



### [IRunnable](/docs/Functional-Interfaces/IRunnable.md)

A function that takes no arguments and returns nothing.



### [ISupplier](/docs/Functional-Interfaces/ISupplier.md)

A function that takes no arguments and returns an `Object` value.


## Functional Built-In Class V2 Aliases

### [IdSup](/docs/Functional-Built-In-Class-V2-Aliases/IdSup.md)

An alias for [IdSupplierProvider](/docs/Functional-Built-In-Classes-V2/IdSupplierProvider.md).



### [SApxBiPred](/docs/Functional-Built-In-Class-V2-Aliases/SApxBiPred.md)

An alias for [SObjectApexComparerBiPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectApexComparerBiPredicateProvider.md).



### [SApxPred](/docs/Functional-Built-In-Class-V2-Aliases/SApxPred.md)

An alias for [SObjectApexComparerPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectApexComparerPredicateProvider.md).



### [SCol](/docs/Functional-Built-In-Class-V2-Aliases/SCol.md)

An alias for [SObjectCollectorProvider](/docs/Functional-Built-In-Classes-V2/SObjectCollectorProvider.md).



### [SCon](/docs/Functional-Built-In-Class-V2-Aliases/SCon.md)

An alias for [SObjectConsumerProvider](/docs/Functional-Built-In-Classes-V2/SObjectConsumerProvider.md).



### [SDefBiPred](/docs/Functional-Built-In-Class-V2-Aliases/SDefBiPred.md)

An alias for [SObjectDefaultComparerPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectDefaultComparerPredicateProvider.md).



### [SDefPred](/docs/Functional-Built-In-Class-V2-Aliases/SDefPred.md)

An alias for [SObjectDefaultComparerPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectDefaultComparerPredicateProvider.md).



### [SFn](/docs/Functional-Built-In-Class-V2-Aliases/SFn.md)

An alias for [SObjectFunctionProvider](/docs/Functional-Built-In-Classes-V2/SObjectFunctionProvider.md).



### [SIterPred](/docs/Functional-Built-In-Class-V2-Aliases/SIterPred.md)

An alias for [SObjectIterablePredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectIterablePredicateProvider.md).



### [SOp](/docs/Functional-Built-In-Class-V2-Aliases/SOp.md)

An alias for [SObjectOperatorProvider](/docs/Functional-Built-In-Classes-V2/SObjectOperatorProvider.md).



### [SStrPred](/docs/Functional-Built-In-Class-V2-Aliases/SStrPred.md)

An alias for [SObjectStringPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectStringPredicateProvider.md).



### [SSup](/docs/Functional-Built-In-Class-V2-Aliases/SSup.md)

An alias for [SObjectSupplierProvider](/docs/Functional-Built-In-Classes-V2/SObjectSupplierProvider.md).



### [StrSup](/docs/Functional-Built-In-Class-V2-Aliases/StrSup.md)

An alias for [StringSupplierProvider](/docs/Functional-Built-In-Classes-V2/StringSupplierProvider.md).


## Functional Built-In Classes V2

### [IdSupplierProvider](/docs/Functional-Built-In-Classes-V2/IdSupplierProvider.md)

A provider class that supplies `Supplier` instances for generating sequential `Id` values
for a given `SObjectType`. Each supplier generated by this class returns a new, unique Id value
for the specified SObject type, following Salesforce's 15-character Id format.



### [SObjectApexComparerBiPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectApexComparerBiPredicateProvider.md)

Provides a fluent interface for building bi-predicates
that uses a non-antisymmetric comparer for comparing two SObjects.
<p><strong>Note: </strong></p>
<p>Bi-predicates built with this builder may return `false` when comparing a non-null value with a null value,
aligning with Apex's native behavio&hellip;


### [SObjectApexComparerPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectApexComparerPredicateProvider.md)

Provides a fluent interface for building predicates
that uses a non-antisymmetric comparer for SObject comparisons.
<p><strong>Note: </strong></p>
<p>Predicates built with this builder may return `false` when comparing a non-null value with a null value,
aligning with Apex's native behavior for cer&hellip;


### [SObjectCollectorProvider](/docs/Functional-Built-In-Classes-V2/SObjectCollectorProvider.md)

`CollectorProvider` for `SObject` instances.



### [SObjectComparerBiPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectComparerBiPredicateProvider.md)

Provides a fluent interface for building bi-predicates that compare two SObjects
using a comparer and currying. This builder allows you to create bi-predicates for equality,
inequality, and relational comparisons between two SObjects with the ability to use fields, constants,
or functions as compar&hellip;


### [SObjectComparerPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectComparerPredicateProvider.md)

Provides a fluent interface for building predicates that compare SObjects
using a comparer and currying. This builder allows you to create predicates for equality,
inequality, and relational comparisons with the ability to use fields, constants, or functions as comparands.



### [SObjectConsumerProvider](/docs/Functional-Built-In-Classes-V2/SObjectConsumerProvider.md)

Provides a fluent interface for building consumers that operate on SObjects, allowing you
to set fields, add errors, and perform other operations on SObjects.



### [SObjectDefComparerBiPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectDefComparerBiPredicateProvider.md)

Provides a fluent interface for building bi-predicates
that uses the default comparer for comparing two SObjects.
<p><strong>Note: </strong></p>
<p>Bi-predicates built with this builder consider a non-null value as always greater than a null value.</p>



### [SObjectDefaultComparerPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectDefaultComparerPredicateProvider.md)

Provides a fluent interface for building predicates
that uses the default comparer for SObject comparisons.
<p><strong>Note: </strong></p>
<p>Predicates built with this builder consider a non-null value as always greater than a null value.</p>



### [SObjectFunctionProvider](/docs/Functional-Built-In-Classes-V2/SObjectFunctionProvider.md)

A provider class that offers various functions for retrieving values from SObjects,
supporting cross-reference fields, safe navigation, and complex field paths.
This class acts as a factory for different types of functions that can be applied to SObjects.



### [SObjectIterablePredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectIterablePredicateProvider.md)

Provides a fluent interface for building predicates
that operate on iterable collections using currying.
This builder allows you to create predicates for checking if an object is in or not in a given collection,
as well as if a string is included in or excluded from a iterable of strings.



### [SObjectOperatorProvider](/docs/Functional-Built-In-Classes-V2/SObjectOperatorProvider.md)

Provides a fluent interface for building operators that operate on SObjects, allowing you
to set fields, and perform other operations on SObjects.



### [SObjectStringPredicateProvider](/docs/Functional-Built-In-Classes-V2/SObjectStringPredicateProvider.md)

Provides a fluent interface for building string-related predicates
that operate on SObject fields using currying. This builder allows you to create predicates
for checking various string conditions such as whether a string is blank, contains a value, starts with a value, etc.



### [SObjectSupplierProvider](/docs/Functional-Built-In-Classes-V2/SObjectSupplierProvider.md)

A provider class that supplies various `Supplier` instances capable of creating new `SObject` instances.
This class serves as a factory for generating suppliers that can instantiate specific SObject types.
The `Supplier` interface returned by the methods of this class allows for flexible creation o&hellip;


### [StringSupplierProvider](/docs/Functional-Built-In-Classes-V2/StringSupplierProvider.md)

A provider class that supplies `Supplier` instances for generating various types of strings.
This includes generating unique UUIDs and creating strings in a customizable autonumber format.


## Enums

### [SortOrder](/docs/Enums/SortOrder.md)

SortOrder


