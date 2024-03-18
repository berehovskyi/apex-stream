# abstract ObjectEnumerable

`SUPPRESSWARNINGS`

`APIVERSION: 60`

`STATUS: ACTIVE`

Provides a skeletal implementation of [IObjectEnumerable](/docs/Enumerables/IObjectEnumerable.md).


**Implemented types**

[IObjectEnumerable](/docs/Enumerables/IObjectEnumerable.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### `public Iterator<Object> iterator()`

Returns an instance of an iterator for this enumerable. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Iterator<Object>`|the iterator|

### `public ObjectEnumerable append(Iterable<Object> iterable)`

Returns a new `ObjectEnumerable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

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
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> append = (List<String>) [ObjectEnumerable].of(strs1)
    .append(strs2)
    .toList(String.class);
// ['foo', 'bar', 'baz', 'qux', 'fred', 'foo']
```


### `public ObjectEnumerable prepend(Iterable<Object> iterable)`

Returns a new `ObjectEnumerable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

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
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> prepend = (List<String>) [ObjectEnumerable].of(strs1)
    .prepend(strs2)
    .toList(String.class);
// ['qux', 'fred', 'foo', 'foo', 'bar', 'baz']
```


### `public virtual ObjectEnumerable union(Iterable<Object> iterable)`

Returns a new `ObjectEnumerable` as a set union of the current and another iterables.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

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
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> union = (List<String>) [ObjectEnumerable].of(strs1)
    .union(strs2)
    .toList(String.class);
// ['foo', 'bar', 'baz', 'qux', 'fred']
```


### `public virtual ObjectEnumerable union(Iterable<Object> iterable, IFunction classifier)`

Returns a new `ObjectEnumerable` as a set union of the current and another iterables according to `classifier`.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `classifier` is null|

#### Example
```apex
public class ToLowerCaseOperator extends Operator {
    public override Object apply(Object o) { return ((String) o).toLowerCase(); }
}
List<Object> strs1 = new List<String>{ 'foo', 'Bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'Foo' };
List<String> union = (List<String>) [ObjectEnumerable].of(strs1)
    .union(strs2, new ToLowerCaseOperator())
    .toList(String.class);
// ['foo', 'Bar', 'baz', 'qux', 'fred']
```


### `public virtual ObjectEnumerable intersect(Iterable<Object> iterable)`

Returns a new `ObjectEnumerable` as a set intersection of the current and another iterables.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

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
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> intersect = (List<String>) [ObjectEnumerable].of(strs1)
    .intersect(strs2)
    .toList(String.class);
// ['foo']
```


### `public virtual ObjectEnumerable intersect(Iterable<Object> iterable, IFunction classifier)`

Returns a new `ObjectEnumerable` as a set intersection of the current and another iterables according to `classifier`.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `classifier` is null|

#### Example
```apex
public class ToLowerCaseOperator extends Operator {
    public override Object apply(Object o) { return ((String) o).toLowerCase(); }
}
List<Object> strs1 = new List<String>{ 'foo', 'Bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'Foo' };
List<String> intersect = (List<String>) [ObjectEnumerable].of(strs1)
    .intersect(strs2, new ToLowerCaseOperator())
    .toList(String.class);
// ['foo']
```


### `public virtual ObjectEnumerable except(Iterable<Object> iterable)`

Returns a new `ObjectEnumerable` as a set difference of the current and another iterables.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

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
List<Object> strs1 = new List<String>{ 'foo', 'bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'foo' };
List<String> except = (List<String>) [ObjectEnumerable].of(strs1)
    .except(strs2)
    .toList(String.class);
// ['bar', 'baz']
List<String> except1 = (List<String>) [ObjectEnumerable].of(strs2)
    .except(strs1)
    .toList(String.class);
// ['qux', 'fred']
```


### `public virtual ObjectEnumerable except(Iterable<Object> iterable, IFunction classifier)`

Returns a new `ObjectEnumerable` as a set difference of the current and another iterables according to `classifier`.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `classifier` is null|

#### Example
```apex
public class ToLowerCaseOperator extends Operator {
    public override Object apply(Object o) { return ((String) o).toLowerCase(); }
}
List<Object> strs1 = new List<String>{ 'foo', 'Bar', 'baz' };
List<Object> strs2 = new List<String>{ 'qux', 'fred', 'Foo' };
List<String> except = (List<String>) [ObjectEnumerable].of(strs1)
    .except(strs2, new ToLowerCaseOperator())
    .toList(String.class);
// ['Bar', 'baz']
List<String> except1 = (List<String>) [ObjectEnumerable].of(strs2)
    .except(strs1, new ToLowerCaseOperator())
    .toList(String.class);
// ['qux', 'fred']
```


### `public ObjectEnumerable distinct()`

Returns a `ObjectEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

#### Example
```apex
List<String> distinct = (List<String>)
    [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'foo', 'bar' })
    .distinct()
    .toList(String.class); // ['foo', 'bar', 'baz']
```


### `public ObjectEnumerable distinct(IFunction classifier)`

Returns a new `ObjectEnumerable` with distinct elements according to `classifier` function. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

#### Example
```apex
public class ToLowerCaseOperator extends Operator {
    public override Object apply(Object o) { return ((String) o).toLowerCase(); }
}
List<String> distinct = (List<String>)
    [ObjectEnumerable].of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
    .distinct(new ToLowerCaseOperator())
    .toList(String.class); // ['foo', 'Bar', 'baz']
```


### `public ObjectEnumerable filter(IPredicate predicate)`

Returns a new `ObjectEnumerable` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
List<String> filtered = (List<String>)
    [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .filter(new ContainsPredicate('a'))
    .toList(String.class); // ['bar', 'baz']
```


### `public ObjectEnumerable take(IPredicate predicate)`

Returns a new `ObjectEnumerable` that takes elements while `predicate` returns `true`. <p>Short-circuiting Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
List<String> firstMatched = (List<String>)
    [ObjectEnumerable].of(new List<String>{ 'bar', 'baz', 'foo' })
    .take(new ContainsPredicate('a'))
    .toList(String.class); // ['bar', 'baz']
```


### `public ObjectEnumerable drop(IPredicate predicate)`

Returns a new `ObjectEnumerable` that drops elements while `predicate` returns `true`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
List<String> rest = (List<String>)
    [ObjectEnumerable].of(new List<String>{ 'bar', 'baz', 'foo' })
    .take(new ContainsPredicate('a'))
    .toList(String.class); // ['foo']
```


### `public virtual ObjectEnumerable withoutNulls()`

Returns a new `ObjectEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

#### Example
```apex
List<String> withoutNulls = (List<String>)
    [ObjectEnumerable].of(new List<String>{ 'foo', null, 'bar', 'baz', null })
    .withoutNulls()
    .toList(String.class); // ['foo', 'bar', 'baz']
```


### `public ObjectEnumerable mapTo(IOperator mapper)`

Returns a `ObjectEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class ToLowerCaseOperator extends Operator {
    public override Object apply(Object o) { return ((String) o).toLowerCase(); }
}
List<String> normalizedStrings = (List<String>)
    [ObjectEnumerable].of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
    .mapTo(new ToLowerCaseOperator())
    .toList(String.class); // ['foo', 'bar', 'baz', 'foo', 'bar']
```


### `public IntEnumerable mapToInt(IFunction mapper)`

Returns a `ObjectEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class LengthFunction extends Function {
    public override Object apply(Object o) { return ((String) o).length(); }
}
List<Integer> ints = [ObjectEnumerable].of(new List<String>{ 'f', 'ba', 'baz' })
    .mapToInt(new LengthFunction())
    .toList(); // [1, 2, 3]
```


### `public LongEnumerable mapToLong(IFunction mapper)`

Returns a `ObjectEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class LengthFunction extends Function {
    public override Object apply(Object o) { return (Long) ((String) o).length(); }
}
List<Long> longs = [ObjectEnumerable].of(new List<String>{ 'f', 'ba', 'baz' })
    .mapToLong(new LengthFunction())
    .toList(); // [1L, 2L, 3L]
```


### `public DoubleEnumerable mapToDouble(IFunction mapper)`

Returns a `ObjectEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class LengthFunction extends Function {
    public override Object apply(Object o) { return (Double) ((String) o).length(); }
}
List<Double> doubles = [ObjectEnumerable].of(new List<String>{ 'f', 'ba', 'baz' })
    .mapToDouble(new LengthFunction())
    .toList(); // [1.0, 2.0, 3.0]
```


### `public SObjectEnumerable mapToSObject(IFunction mapper)`

Returns a `SObjectEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class CreateAccountFunction extends Function {
    public override Object apply(Object o) { return new Account(Name = (String) o); }
}
List<Account> accounts = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .mapToSObject(new CreateAccountFunction())
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' }
]
```


### `public ObjectEnumerable flatMapTo(IFunction mapper)`

Returns a new `ObjectEnumerable` with `Object` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Object>`|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class ToLowerCaseFunction extends Function {
    public override Object apply(Object o) { return new List<String>{ ((String) o).toLowerCase() }; }
}
List<String> normalizedStrings = (List<String>)
    [ObjectEnumerable].of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
    .flatMapTo(new ToLowerCaseFunction())
    .toList(String.class); // ['foo', 'bar', 'baz', 'foo', 'bar']
```


### `public IntEnumerable flatMapToInt(IFunction mapper)`

Returns a new `IntEnumerable` with `Integer` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Integer>`|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class LengthFunction extends Function {
    public override Object apply(Object o) { return new List<Integer>{ ((String) o).length() }; }
}
List<Integer> ints = [ObjectEnumerable].of(new List<String>{ 'f', 'ba', 'baz' })
    .flatMapToInt(new LengthFunction())
    .toList(); // [1, 2, 3]
```


### `public LongEnumerable flatMapToLong(IFunction mapper)`

Returns a new `LongEnumerable` with `Long` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class LengthFunction extends Function {
    public override Object apply(Object o) { return new List<Long>{ ((String) o).length() }; }
}
List<Long> longs = [ObjectEnumerable].of(new List<String>{ 'f', 'ba', 'baz' })
    .flatMapToLong(new LengthFunction())
    .toList(); // [1L, 2L, 3L]
```


### `public DoubleEnumerable flatMapToDouble(IFunction mapper)`

Returns a new `DoubleEnumerable` with `Double` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Double>`|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class LengthFunction extends Function {
    public override Object apply(Object o) { return new List<Double>{ ((String) o).length() }; }
}
List<Double> doubles = [ObjectEnumerable].of(new List<String>{ 'f', 'ba', 'baz' })
    .flatMapToDouble(new LengthFunction())
    .toList(); // [1.0, 2.0, 3.0]
```


### `public SObjectEnumerable flatMapToSObject(IFunction mapper)`

Returns a new `SObjectEnumerable` with `SObject` elements as a result of replacing each element with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<SObject>`|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class CreateAccountFunction extends Function {
    public override Object apply(Object o) { return new List<Account>{ new Account(Name = (String) o) }; }
}
List<Account> accounts = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .flatMapToSObject(new CreateAccountFunction())
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' }
]
```


### `public ObjectEnumerable forEach(IConsumer consumer)`

Returns a `ObjectEnumerable` after performing `consumer` action on each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|this `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

#### Example
```apex
public class DebugConsumer extends Consumer {
    public override void accept(Object o) { System.debug(o); }
}
List<String> strings = (List<String>) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .forEach(new DebugConsumer()) // prints 'foo', 'bar', 'baz'
    .toList(String.class); // ['foo', 'bar', 'baz']
```


### `public ObjectEnumerable sort()`

Returns a `ObjectEnumerable` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

#### Example
```apex
List<String> sorted = (List<String>) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', null })
    .sort()
    .toList(String.class); // [null, 'bar', 'baz', 'foo']
```


### `public virtual ObjectEnumerable sort(SortOrder order)`

Returns a new `ObjectEnumerable` with sorted elements considering `order`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `order` is null|

#### Example
```apex
List<String> sorted = (List<String>) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', null })
    .sort(SortOrder.DESCENDING)
    .toList(String.class); // ['foo', 'baz', 'bar', null]
```


### `public ObjectEnumerable sort(IComparer comparer)`

Returns a new `ObjectEnumerable` with sorted elements according to `comparer`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

#### Example
```apex
public class SecondLetterComparer extends Comparer {
    public override Integer compare(Object o1, Object o2) {
        String s1 = (String) o1;
        String s2 = (String) o2;
        if (s1.length() > 1 && s2.length() > 1) {
            return s1.split('')[1].compareTo(s2.split('')[1]);
        }
        return s1.length() <= 1 ? -1 : 1;
    }
}
List<String> sorted = (List<String>)
    [ObjectEnumerable].of(new List<String>{ 'foo', 'Bar', 'baz', 'Foo', 'bar' })
    .sort(new SecondCharComparer())
    .toList(String.class); // ['Bar', 'baz', 'bar', 'foo', 'Foo']
```


### `public ObjectEnumerable lim(Integer lim)`

Returns a `ObjectEnumerable` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `lim` is less than 0|
|`NullPointerException`|if `lim` is null|

#### Example
```apex
List<String> first2 = (List<String>) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .lim(2)
    .toList(String.class); // ['foo', 'baz']
```


### `public ObjectEnumerable skip(Integer n)`

Returns a new `ObjectEnumerable` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `n` is less than 0|
|`NullPointerException`|if `n` is null|

#### Example
```apex
List<String> rest = (List<String>) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .skip(1)
    .toList(String.class); // ['bar', 'baz']
```


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

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

#### Example
```apex
public class ConcatenateBiOperator extends BiOperator {
    private final String separator;
    public ConcatenateBiOperator(String separator) { this.separator = separator; }
    public override Object apply(Object o1, Object o2) {
        return String.isEmpty((String) o1) ? (String) o2 : o1 + separator + o2;
    }
}
String concatenated = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .reduce('', new ConcatenateBiOperator('-')); // 'foo-bar-baz'
String concatenated1 = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .reduce('seed', new ConcatenateBiOperator(';')); // 'seed;foo;bar;baz'
```


### `public Optional reduce(IBiOperator accumulator)`

Performs a reduction on `Object` elements, using `identity` value and associative `accumulator` function, and returns an `Optional` Object describing the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Object result of the reduction|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

#### Example
```apex
public class ConcatenateBiOperator extends BiOperator {
    private final String separator;
    public ConcatenateBiOperator(String separator) { this.separator = separator; }
    public override Object apply(Object o1, Object o2) {
        return String.isEmpty((String) o1) ? (String) o2 : o1 + separator + o2;
    }
}
String concatenated = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .reduce(new ConcatenateBiOperator('-'))
    .get(); // 'foo-bar-baz'
String concatenated1 = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .reduce(new ConcatenateBiOperator(';'))
    .get(); // 'seed;foo;bar;baz'
```


### `public Object collect(ICollector collector)`

Performs a mutable reduction operation on elements, collecting elements to a container using `collector`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`collector`|the function that returns a mutable result container|

#### Returns

|Type|Description|
|---|---|
|`Object`|the `Object` result of the collection|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `collector` is null|

#### Example
```apex
// Simple collecting
public class AddToStringSetBiConsumer extends BiConsumer {
    public override void accept(Object container, Object o) { ((Set<String>) container).add((String) o); }
}
Set<String> strings = (Set<String>)
    [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', 'foo', 'bar' })
    .collect(Collector.of(Supplier.of(Set<String>.class), new AddToStringSetBiConsumer()));
// ['foo', 'bar', 'baz', 'quux', 'a']
// Cascaded operation
public class LengthFunction extends Function {
    public override Object apply(Object o) { return ((String) o).length(); }
}
public class PutToObjectsByIntMap extends BiConsumer {
    private final IFunction classifier;
    public PutToObjectsByIntMap(ICollector downstream, IFunction classifier) {
        this.downstream = downstream;
        this.classifier = classifier;
    }
    public override void accept(Object container, Object o) {
        final Map<Integer, Set<String>> m = (Map<Integer, Set<String>>) container;
        final Integer key = (Integer) classifier.apply(o);
        if (!m.containsKey(key)) { m.put(key, (Set<String>) downstream.supplier().get()); }
        downstream.accumulator().accept(m.get(key), o);
    }
}
// the classifier function mapping input elements to keys.
IFunction classificationFunction = new LengthFunction();
// the supplier providing a new empty Map into which the results will be inserted.
ISupplier mapSupplier = Supplier.of(Map<Integer, Set<String>>.class);
// the Collector implementing the downstream reduction.
ICollector downstreamCollector = Collector.of(Supplier.of(Set<String>.class), new AddToStringSetBiConsumer());
// the function that folds an element into a result container.
IBiConsumer accumulator = new PutToObjectsByIntMap(downstreamCollector, new LengthFunction());
// the Collector implementing the cascaded group-by operation.
ICollector groupByLengthCollector = Collector.of(mapSupplier, accumulator);
Map<Integer, Set<String>> stringsByLength = (Map<Integer, Set<String>>)
    [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', 'foo', 'bar' })
    .collect(groupByLengthCollector); //
{
  1: ['a'],
  3: ['foo', 'bar', 'baz'],
  4: ['quux']
}
// The same result can be obtained by using built-in Collectors
Map<Integer, Set<String>> stringsByLength1 = (Map<Integer, Set<String>>)
    [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', 'foo', 'bar' })
    .collect(
        Collectors.groupingByInt(new LengthFunction(), Collectors.toStringSet())
            .cast(Map<Integer, Set<String>>.class)
    );
```


### `public Optional find(IPredicate predicate)`

Returns an `Optional` Object describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Object|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
String firstFound = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .find(new ContainsPredicate('a'))
    .get(); // 'bar'
```


### `public Boolean every(IPredicate predicate)`

Returns whether all elements match `predicate`. If `ObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
Boolean doesEveryStringContainA = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .every(new ContainsPredicate('a')); // false
```


### `public Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `ObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
Boolean doesSomeStringContainA = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .some(new ContainsPredicate('a')); // true
```


### `public virtual Boolean none(IPredicate predicate)`

Returns whether no elements match `predicate`. If `ObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String s;
    public ContainsPredicate(String s) { this.s = s; }
    public override Boolean test(Object o) { return ((String) o).contains(s); }
}
Boolean doesNoneStringContainA = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .none(new ContainsPredicate('a')); // false
```


### `public virtual Optional max(IComparer comparer)`

Returns an `Optional` Object describing the maximum element according to `comparer`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Object|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

#### Example
```apex
public class LengthComparer extends Comparer {
   public override Integer compare(Object o1, Object o2) {
       Integer len1 = o1 == null ? -1 : ((String) o1).length();
       Integer len2 = o2 == null ? -1 : ((String) o2).length();
       return len1 > len2 ? 1 : len1 == len2 ? 0 : -1;
   }
}
String maxLen = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', null })
    .max()
    .get(); // 'quux'
```


### `public virtual Optional min(IComparer comparer)`

Returns an `Optional` Object describing the minimum element according to `comparer`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`comparer`|comparer the comparer|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` Object|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

#### Example
```apex
public class LengthComparer extends Comparer {
   public override Integer compare(Object o1, Object o2) {
       Integer len1 = o1 == null ? -1 : ((String) o1).length();
       Integer len2 = o2 == null ? -1 : ((String) o2).length();
       return len1 > len2 ? 1 : len1 == len2 ? 0 : -1;
   }
}
String minLen = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a', null })
    .min()
    .get(); // null
String minLen1 = (String) [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'quux', 'a' })
    .min()
    .get(); // 'a'
```


### `public Integer count()`

Returns the count of elements. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Integer`|the count of elements|

#### Example
```apex
Integer count = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .count(); // 3
```


### `public Boolean isEmpty()`

Returns whether the count of elements is 0. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Example
```apex
[ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz' })
    .isEmpty(); // false
[ObjectEnumerable].of(new List<String>())
    .isEmpty(); // true
```


### `public List<Object> toList()`

Accumulates elements into a `List<Object>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the enumerable elements|

#### Example
```apex
List<Object> strings = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'qux' })
    .skip(1)
    .toList(); // ['bar', 'baz', 'qux']
```


### `public virtual List<Object> toList(Type elementType)`

Accumulates `Object` elements into a `List<T>` so it can be cast. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`elementType`|the element type argument of List|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the iterable elements that can be cast to `List<T>`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `elementType` is null|

#### Example
```apex
List<String> strings = (List<String>.class)
    [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'qux' })
    .skip(1)
    .toList(String.class); // ['bar', 'baz', 'qux']
```


### `public Set<Object> toSet()`

Accumulates elements into a `Set<Object>` cannot be cast. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Set<Object>`|the `Set<Object>` containing the enumerable elements|

#### Example
```apex
Set<Object> strings = [ObjectEnumerable].of(new List<String>{ 'foo', 'bar', 'baz', 'qux', 'foo', 'bar' })
    .skip(1)
    .toSet(); // ['bar', 'baz', 'qux']
```


---
