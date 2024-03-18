# virtual SObjectStream

`SUPPRESSWARNINGS`

`APIVERSION: 60`

`STATUS: ACTIVE`

A sequence of `SObject` elements supporting aggregate operations.
Stream operations are composed of stream chain. A stream chain consists of:
<ul>
    <li>A Source (which might be an iterable (such as list or set), an iterator, a generator function, etc).</li>
    <li>Zero or more Intermediate Operations (which transform a stream into another stream,
    such as [SObjectStream.filter(IPredicate))](SObjectStream.filter(IPredicate))).</li>
    <li>A Terminal Operation (which produces a result such as
    [SObjectStream.count()](SObjectStream.count()) or [SObjectStream.collect(ICollector)](SObjectStream.collect(ICollector))).</li>
</ul>
<p>Streams are <strong>lazy</strong>:</p>
<ul>
    <li>Intermediate operations describe how a stream is processed without performing any action.</li>
    <li>Computation is only performed when the terminal operation is initiated,
and source elements are consumed only as needed.</li>
</ul>
<p>A stream may not consume all elements. It may be infinite and complete in finite time.</p>
<p>A stream should be operated on (invoking an intermediate or terminal stream operation)
only <strong>once</strong>.
A stream throws [IllegalStateException](IllegalStateException) if it detects that the stream is being reused.</p>
<p>Contract:</p>
<ul>
    <li>Must be non-interfering (do not modify the stream source but may mutate its elements).</li>
    <li>Should be stateless in most cases.</li>
</ul>
<p>Unlike in Java, an Apex Streams may execute only <strong>sequentially</strong>,
i.e. do not support `spliterator()`.</p>
<p>There are primitive specializations for [IntStream](/docs/Enumerables/IntStream.md), [LongStream](/docs/Enumerables/LongStream.md),
and [DoubleStream](/docs/Enumerables/DoubleStream.md) and [ObjectStream](/docs/Enumerables/ObjectStream.md) for Object references.</p>
<p>Sequences and streams equally ensure the fulfillment of the set goals,
but are implemented in different ways.</p>


**Inheritance**

[SObjectEnumerable](/docs/Enumerables/SObjectEnumerable.md)
 > 
SObjectStream


**See** [ObjectStream](/docs/Enumerables/ObjectStream.md)


**See** [IntStream](/docs/Enumerables/IntStream.md)


**See** [LongStream](/docs/Enumerables/LongStream.md)


**See** [DoubleStream](/docs/Enumerables/DoubleStream.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Properties

### `public isOperated` → `Boolean`


A flag defining whether this stream has been linked or consumed.

---
## Methods
### Iterator
##### `public override Iterator<SObject> iterator()`

Returns an internal iterator for the elements of this stream. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Iterator<SObject>`|the internal `Iterator<SObject>`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if this stream has been operated (linked or consumed)|

---
### Sources
##### `public static SObjectEnumerable of(Iterator<SObject> iterator)`

Returns a `SObjectEnumerable` created from `iterator`.

###### Parameters

|Param|Description|
|---|---|
|`iterator`|the iterator|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterator` is null|

###### Example
```apex
SObjectEnumerable accStream = SObjectStream.of(new List<Account>(accounts).iterator());
SObjectEnumerable accStream = SObjectStream.of(new Set<Account>(accounts).iterator());
SObjectEnumerable accStream = SObjectStream.of(
    (Iterator<Account>) Database.getQueryLocator('SELECT Id FROM Account').iterator()
);
SObjectEnumerable accStream = SObjectStream.of(otherStream.iterator());
```


##### `public static SObjectEnumerable of(Iterable<SObject> iterable)`

Returns a `SObjectEnumerable` created from `iterable`.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the iterable|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
SObjectEnumerable accStream = SObjectStream.of(new List<Account>(accounts));
SObjectEnumerable accStream = SObjectStream.of((Iterable<Account>) new Set<Account>(accounts));
SObjectEnumerable accStream = SObjectStream.of(stream1);
```


##### `public static SObjectEnumerable ofNullable(Iterable<SObject> iterable)`

Returns a `SObjectEnumerable` created from `iterable` if non-null, otherwise returns an empty `SObjectEnumerable`.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the iterable|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable` if `iterable` is non-null, otherwise an empty `SObjectEnumerable`|

###### Example
```apex
SObjectEnumerable accStream = SObjectStream.ofNullable(new List<Account>(accounts));
SObjectEnumerable accStream = SObjectStream.ofNullable((Iterable<Account>) new Set<Account>(accounts));
SObjectEnumerable accStream = SObjectStream.ofNullable(stream1);
```


##### `public static SObjectEnumerable empty()`

Returns an empty `SObjectEnumerable`.

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the empty `SObjectEnumerable`|

##### `public static SObjectEnumerable generate(ISupplier supplier)`

Returns an infinite `SObjectEnumerable` where each element is generated by `supplier`.

###### Parameters

|Param|Description|
|---|---|
|`supplier`|the supplier of generated elements|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

###### Example
```apex
SObjectEnumerable accStream = SObjectStream.generate(Supplier.of(Account.class));
```


##### `public static SObjectEnumerable iterate(SObject seed, IOperator operator)`

Returns an infinite `SObjectEnumerable` produced by iterative application of `operator` to an initial element `seed`, producing a `SObjectEnumerable` consisting of `seed`, `operator(seed)`, `operator(operator(seed))`, etc.

###### Parameters

|Param|Description|
|---|---|
|`seed`|the initial element|
|`operator`|the operator to be applied to the previous element to produce a new element|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` is null|

##### `public static SObjectEnumerable iterate(SObject seed, IPredicate predicate, IOperator operator)`

Returns an infinite `SObjectEnumerable` produced by iterative application of `operator` to an initial element `seed`, conditioned on satisfying `predicate`.

###### Parameters

|Param|Description|
|---|---|
|`seed`|the initial element|
|`predicate`|the predicate to determine when the stream must be terminated|
|`operator`|the operator to be applied to the previous element to produce a new element|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `supplier` or `supplier` is null|

##### `public static SObjectEnumerable concat(Iterable<SObject> iterable1, Iterable<SObject> iterable2)`

Returns lazily concatenated `SObjectEnumerable` whose elements are all the elements of the first `Iterable<SObject>` followed by all the elements of the second `Iterable<SObject>`.

###### Parameters

|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<SObject>`|
|`iterable2`|the second `Iterable<SObject>`|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1` or `iterable2` is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'bar'),
    new Account(Name = 'baz')
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux'),
    new Account(Name = 'fred'),
    new Account(Name = 'foo')
};
List<Account> concat = SObjectSequence.concat(accounts1, accounts2)
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' },
  { Name: 'qux' },
  { Name: 'fred' },
  { Name: 'foo' }
]
```


##### `public static SObjectEnumerable concat(List<Iterable<SObject>> iterables)`

Returns lazily concatenated `List<Iterable<SObject>>`.

###### Parameters

|Param|Description|
|---|---|
|`iterables`|the list of `Iterable<SObject>`|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterables` or some element in a list is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'bar'),
    new Account(Name = 'baz')
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux'),
    new Account(Name = 'fred'),
    new Account(Name = 'foo')
};
List<Account> concat = SObjectSequence.concat(final List<Iterable<SObject>>{ accounts1, accounts2 })
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' },
  { Name: 'qux' },
  { Name: 'fred' },
  { Name: 'foo' }
]
```


##### `public static SObjectEnumerable zip(Iterable<SObject> iterable1, Iterable<SObject> iterable2, IBiOperator combiner)`

Returns a combined `SObjectEnumerable` by applying `combiner` function to each element at the same position.

###### Parameters

|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<SObject>`|
|`iterable2`|the second `Iterable<SObject>`|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2` or `combiner` is null|

###### Example
```apex
List<Account> triggerOld = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
List<Account> triggerNew = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 400),
    new Account(Name = 'bar', NumberOfEmployees = 100),
    new Account(Name = 'baz', NumberOfEmployees = 600)
};
SObjectSequence.zip(
    triggerOld,
    triggerNew,
    BiOperator.minBy(Comparator.comparing(BaseSObjectFunctions.get(Account.AnnualRevenue)))
).toList(); //
[
  { Name: 'foo', NumberOfEmployees: 100 },
  { Name: 'bar', NumberOfEmployees: 100 },
  { Name: 'baz', NumberOfEmployees: 300 }
]
```


##### `public static SObjectEnumerable zip(Iterable<SObject> iterable1, Iterable<SObject> iterable2, IBiPredicate predicate, IBiOperator combiner)`

Returns a combined `SObjectEnumerable` by applying `combiner` function to each element at the same position, conditioned on satisfying `predicate`.

###### Parameters

|Param|Description|
|---|---|
|`iterable1`|the first `Iterable<SObject>`|
|`iterable2`|the second `Iterable<SObject>`|
|`predicate`|the binary predicate|
|`combiner`|the binary operator to be applied to each element at the same position|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable1`, `iterable2`, `predicate` or `combiner` is null|

###### Example
```apex
public class ContainsAnyBiPredicate extends BiPredicate {
    private final String fieldName;
    private final String s;
    public ContainsPredicate(String fieldName, String s) {
        this.fieldName = fieldName;
        this.s = s;
    }
    public override Boolean test(Object o1, Object o2) {
        String value1 = (String) ((Account) o1).get(fieldName);
        String value2 = (String) ((Account) o2).get(fieldName);
        return value1.contains(s) || value2.contains(s);
    }
}
List<Account> triggerOld = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
List<Account> triggerNew = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 400),
    new Account(Name = 'bar', NumberOfEmployees = 100),
    new Account(Name = 'baz', NumberOfEmployees = 600)
};
SObjectSequence.zip(
    triggerOld,
    triggerNew,
    new ContainsAnyBiPredicate('Name', 'a'),
    BiOperator.minBy(BaseSObjectFunctions.get(Account.AnnualRevenue))
).toList(); //
[
  { Name: 'bar', NumberOfEmployees: 100 },
  { Name: 'baz', NumberOfEmployees: 300 }
]
```


##### `public virtual override SObjectEnumerable append(Iterable<SObject> iterable)`

Returns new `SObjectEnumerable` by appending `iterable` to the current stream.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the `Iterable<SObject>` to append to the current stream|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'bar'),
    new Account(Name = 'baz')
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux'),
    new Account(Name = 'fred'),
    new Account(Name = 'foo')
};
List<Account> append = SObjectSequence.of(accounts1)
    .append(accounts2)
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' },
  { Name: 'qux' },
  { Name: 'fred' },
  { Name: 'foo' }
]
```


##### `public virtual override SObjectEnumerable prepend(Iterable<SObject> iterable)`

Returns new `SObjectEnumerable` by prepending `iterable` to the current stream.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the `Iterable<SObject>` to prepend to the current stream|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'bar'),
    new Account(Name = 'baz')
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux'),
    new Account(Name = 'fred'),
    new Account(Name = 'foo')
};
List<Account> prepend = SObjectSequence.of(accounts1)
    .prepend(accounts2)
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' },
  { Name: 'qux' },
  { Name: 'fred' },
  { Name: 'foo' }
]
```


---
### Intermediate Operations
##### `public virtual override SObjectEnumerable filter(IPredicate predicate)`

Returns a `SObjectEnumerable` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String fieldName;
    private final String s;
    public ContainsPredicate(String fieldName, String s) {
        this.fieldName = fieldName;
        this.s = s;
    }
    public override Boolean test(Object o) {
        return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
    }
}
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
List<Account> filtered = SObjectSequence.of(accounts)
    .filter(new ContainsPredicate('Name', 'a'))
    .toList(); //
[
  { Name: 'bar', NumberOfEmployees: 200 },
  { Name: 'baz', NumberOfEmployees: 300 }
]
```


##### `public virtual override SObjectEnumerable take(IPredicate predicate)`

Returns a `SObjectEnumerable` which takes elements while elements match `predicate`. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String fieldName;
    private final String s;
    public ContainsPredicate(String fieldName, String s) {
        this.fieldName = fieldName;
        this.s = s;
    }
    public override Boolean test(Object o) {
        return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
    }
}
List<Account> accounts = new List<Account>{
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300),
    new Account(Name = 'foo', NumberOfEmployees = 100)
};
List<Account> firstMatched = SObjectSequence.of(accounts)
    .take(new ContainsPredicate('Name', 'a'))
    .toList(); //
[
  { Name: 'bar', NumberOfEmployees: 200 },
  { Name: 'baz', NumberOfEmployees: 300 }
]
```


##### `public virtual override SObjectEnumerable drop(IPredicate predicate)`

Returns a `SObjectEnumerable` which drops elements while elements match `predicate`, then takes the rest. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the non-interfering, stateless predicate|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String fieldName;
    private final String s;
    public ContainsPredicate(String fieldName, String s) {
        this.fieldName = fieldName;
        this.s = s;
    }
    public override Boolean test(Object o) {
        return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
    }
}
List<Account> accounts = new List<Account>{
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300),
    new Account(Name = 'foo', NumberOfEmployees = 100)
};
List<Account> rest = SObjectSequence.of(accounts)
    .drop(new ContainsPredicate('Name', 'a'))
    .toList(); //
[
  { Name: 'foo', NumberOfEmployees: 100 }
]
```


##### `public virtual override SObjectEnumerable mapTo(IOperator mapper)`

Returns a `SObjectEnumerable` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class MapToContactOperator extends Operator {
    public override Object apply(Object o) {
        Account acc = (Account) o;
        return new Contact(
            LastName = acc.Name,
            AccountId = acc.Id
        );
    }
}
Account acc1 = new Account(Id = '001000000000001AAA', Name = 'foo');
Account acc2 = new Account(Id = '001000000000002AAA', Name = 'bar');
Account acc3 = new Account(Id = '001000000000003AAA', Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Contact> contacts = SObjectSequence.of(accounts)
    .mapTo(new MapToContactOperator())
    .toList(); //
[
  { LastName: 'foo', AccountId: '001000000000001AAA' },
  { LastName: 'bar', AccountId: '001000000000002AAA' },
  { LastName: 'baz', AccountId: '001000000000003AAA' }
]
```


##### `public virtual override IntEnumerable mapToInt(IFunction mapper)`

Returns a `IntEnumerable` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class TotalPriceFunction extends Function {
    public override Object apply(Object o) {
        OpportunityLineItem item = (OpportunityLineItem) o;
        return (Integer) (item.Quantity * item.UnitPrice);
    }
}
List<OpportunityLineItem> items = new List<OpportunityLineItem>{
    new OpportunityLineItem(Quantity = 100, UnitPrice = 100),
    new OpportunityLineItem(Quantity = 20, UnitPrice = 2000),
    new OpportunityLineItem(Quantity = 50, UnitPrice = 1000)
};
List<Integer> totalPrices = SObjectSequence.of(items)
    .mapToInt(new TotalPriceFunction())
    .toList(); // [10000, 40000, 5000]
```


##### `public virtual override LongEnumerable mapToLong(IFunction mapper)`

Returns a `LongEnumerable` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class TotalPriceFunction extends Function {
    public override Object apply(Object o) {
        OpportunityLineItem item = (OpportunityLineItem) o;
        return (Long) (item.Quantity * item.UnitPrice);
    }
}
List<OpportunityLineItem> items = new List<OpportunityLineItem>{
    new OpportunityLineItem(Quantity = 10000, UnitPrice = 10000),
    new OpportunityLineItem(Quantity = 2000, UnitPrice = 200000),
    new OpportunityLineItem(Quantity = 5000, UnitPrice = 100000)
};
List<Long> totalPrices = SObjectSequence.of(items)
    .mapToLong(new TotalPriceFunction())
    .toList(); // [100000000, 400000000, 500000000]
```


##### `public virtual override DoubleEnumerable mapToDouble(IFunction mapper)`

Returns a `DoubleEnumerable` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `DoubleEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class HaversineDistanceFunction extends Function {
      private final Double RADIUS_OF_EARTH = 6371.0; // Earth's radius in kilometers
      private final Double srcLat;
      private final Double srcLon;
      public HaversineDistanceFunction(Double srcLat, Double srcLon) {
          this.srcLat = srcLat;
          this.srcLon = srcLon;
      }
      public override Object apply (Object o) {
          Account acc = (Account) o;
          Double lat = acc.BillingLatitude;
          Double lon = acc.BillingLongitude;
          Double latDistance = toRadians(lat - this.srcLat);
          Double lonDistance = toRadians(lon - this.srcLon);
          Double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2)
              + Math.cos(toRadians(this.srcLat)) * Math.cos(toRadians(lat))
              * Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
          Double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
          return RADIUS_OF_EARTH * c;
      }
      private Double toRadians(Double degrees) {
          return degrees * (Math.PI / 180);
      }
  }
  Account acc1 = new Account(Name = 'foo', BillingLatitude = 37.7749, BillingLongitude = -122.4194); // SF, CA
  Account acc2 = new Account(Name = 'bar', BillingLatitude = 51.5074, BillingLongitude = -0.1278); // London
  Account acc3 = new Account(Name = 'baz', BillingLatitude = 48.8566, BillingLongitude = 2.3522); // Paris
  Double newYorkLat = 40.7128;
  Double newYorkLon = -74.0060;
  List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
  List<Double> haversineDistancesFromNyInKms = SObjectSequence.of(accounts)
      .mapToDouble(new HaversineDistanceFunction(newYorkLat, newYorkLon))
      .toList(); // [4129.0861, 5570.2221, 5837.2409]
```


##### `public virtual override ObjectEnumerable mapToObject(IFunction mapper)`

Returns a `ObjectEnumerable` with elements returned by `mapper` function, applied to the elements of this stream. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class GetFieldValueToLowerCaseFunction extends Function {
    private final String fieldName;
    public GetFieldValueToLowerCaseFunction(String fieldName) { this.fieldName = fieldName; }
    public override Object apply(Object o) {
        return ((String) ((SObject) o).get(fieldName))?.toLowerCase();
    }
}
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'Bar'),
    new Account(Name = 'baz'),
    new Account(Name = 'Foo'),
    new Account(Name = 'bar')
};
List<String> normalizedNames = (List<String>) SObjectSequence.of(accounts)
    .mapToObject(new GetFieldValueToLowerCaseFunction('Name'))
    .toList(String.class); // ['foo', 'bar', 'baz', 'foo', 'bar']
```


##### `public virtual override SObjectEnumerable flatMapTo(IFunction mapper)`

Returns a new `SObjectEnumerable` with `SObject` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<SObject>`|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class MapPayloadToContacts extends Function {
    public override Object apply(Object o) {
        Account acc = ((Account) o);
        String payload = acc?.Payload__c;
        if (String.isBlank(payload)) { return null; }
        return SObjectSequence.of((List<Contact>) JSON.deserialize(payload, List<Contact>.class))
            .forEach(Contact.AccountId, acc.Id);
    }
}
Account acc1 = new Account(
    Id = '001000000000001AAA',
    Name = 'foo',
    Payload__c = '[{ "LastName": "qux" }, { "LastName": "fred" }]'
);
Account acc2 = new Account(
    Id = '001000000000002AAA',
    Name = 'bar',
    Payload__c = '[{ "LastName": "thud" }]'
);
Account acc3 = new Account(
    Id = '001000000000003AAA',
    Name = 'baz'
);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Contact> contacts = SObjectSequence.of(accounts)
    .flatMapTo(new MapPayloadToContacts())
    .toList(); //
[
  { LastName: 'qux', AccountId: '001000000000001AAA' },
  { LastName: 'fred', AccountId: '001000000000001AAA' },
  { LastName: 'thud', AccountId: '001000000000002AAA' }
]
```


##### `public virtual override IntEnumerable flatMapToInt(IFunction mapper)`

Returns a new `IntEnumerable` with `Integer` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Integer>`|

###### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class MapToNumberOfEmployees extends Function {
    public override Object apply(Object o) {
        Account acc = ((Account) o);
        List<Account> childAccounts = acc?.ChildAccounts;
        if (childAccounts?.isEmpty() != false) { return null; }
        return SObjectSequence.of(childAccounts).mapToInt(Account.NumberOfEmployees);
    }
}
Account acc1 = new Account(NumberOfEmployees = 100);
Account acc2 = new Account(NumberOfEmployees = 200);
Account acc3 = new Account(NumberOfEmployees = 500);
Account parentAcc1 = new Account(
    Name = 'foo',
    ChildAccounts = new List<Account>{ acc1, acc2 } // pseudo assignment
);
Account parentAcc2 = new Account(
    Name = 'bar',
    ChildAccounts = new List<Account>{ acc3 }
);
Account parentAcc3 = new Account(Name = 'baz');
List<Account> parentAccounts = new List<Account>{ parentAcc1, parentAcc2, parentAcc3 };
List<Integer> numberOfEmployees = SObjectSequence.of(parentAccounts)
    .flatMapToInt(new MapToNumberOfEmployees())
    .toList(); // [100, 200, 500]
```


##### `public virtual override LongEnumerable flatMapToLong(IFunction mapper)`

Returns a new `LongEnumerable` with `Long` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Long>`|

###### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class MapToNumberOfEmployees extends Function {
    public override Object apply(Object o) {
        Account acc = ((Account) o);
        List<Account> childAccounts = acc?.ChildAccounts;
        if (childAccounts?.isEmpty() != false) { return null; }
        return SObjectSequence.of(childAccounts).mapToLong(Account.NumberOfEmployees);
    }
}
Account acc1 = new Account(NumberOfEmployees = 100);
Account acc2 = new Account(NumberOfEmployees = 200);
Account acc3 = new Account(NumberOfEmployees = 500);
Account parentAcc1 = new Account(
    Name = 'foo',
    ChildAccounts = new List<Account>{ acc1, acc2 } // pseudo assignment
);
Account parentAcc2 = new Account(
    Name = 'bar',
    ChildAccounts = new List<Account>{ acc3 }
);
Account parentAcc3 = new Account(Name = 'baz');
List<Account> parentAccounts = new List<Account>{ parentAcc1, parentAcc2, parentAcc3 };
List<Long> numberOfEmployees = SObjectSequence.of(parentAccounts)
    .flatMapToLong(new MapToNumberOfEmployees())
    .toList(); // [100, 200, 500]
```


##### `public virtual override DoubleEnumerable flatMapToDouble(IFunction mapper)`

Returns a new `DoubleEnumerable` with `Double` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Double>`|

###### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class MapToAnnualRevenue extends Function {
    public override Object apply(Object o) {
        Account acc = ((Account) o);
        List<Account> childAccounts = acc?.ChildAccounts;
        if (childAccounts?.isEmpty() != false) { return null; }
        return SObjectSequence.of(childAccounts).mapToDouble(Account.AnnualRevenue);
    }
}
Account acc1 = new Account(AnnualRevenue = 10.8);
Account acc2 = new Account(AnnualRevenue = 5.5);
Account acc3 = new Account(AnnualRevenue = 6.0);
Account parentAcc1 = new Account(
    Name = 'foo',
    ChildAccounts = new List<Account>{ acc1, acc2 } // pseudo assignment
);
Account parentAcc2 = new Account(
    Name = 'bar',
    ChildAccounts = new List<Account>{ acc3 }
);
Account parentAcc3 = new Account(Name = 'baz');
List<Account> parentAccounts = new List<Account>{ parentAcc1, parentAcc2, parentAcc3 };
List<Double> annualRevenues = SObjectSequence.of(parentAccounts)
    .flatMapToDouble(new MapToAnnualRevenue())
    .toList(); // [10.8, 5.5, 6.0]
```


##### `public virtual override ObjectEnumerable flatMapToObject(IFunction mapper)`

Returns a new `ObjectEnumerable` with `Object` elements as a result of replacing each element of this stream with the contents of a mapped iterable created by applying the specified `mapper` function to each element. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function which must produce `Iterable<Object>`|

###### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
public class MapToName extends Function {
    public override Object apply(Object o) {
        Account acc = ((Account) o);
        List<Account> childAccounts = acc?.ChildAccounts;
        if (childAccounts?.isEmpty() != false) { return null; }
        return SObjectSequence.of(childAccounts).mapToObject(Account.Name);
    }
}
Account acc1 = new Account(Name = 'qux');
Account acc2 = new Account(Name = 'fred');
Account acc3 = new Account(Name = 'thud');
Account parentAcc1 = new Account(
    Name = 'foo',
    ChildAccounts = new List<Account>{ acc1, acc2 } // pseudo assignment
);
Account parentAcc2 = new Account(
    Name = 'bar',
    ChildAccounts = new List<Account>{ acc3 }
);
Account parentAcc3 = new Account(Name = 'baz');
List<Account> parentAccounts = new List<Account>{ parentAcc1, parentAcc2, parentAcc3 };
List<String> names = (List<String>) SObjectSequence.of(parentAccounts)
    .flatMapToObject(new MapToName())
    .toList(String.class); // ['qux', fred', 'thud']
```


##### `public virtual override SObjectEnumerable forEach(IConsumer consumer)`

Returns a `SObjectEnumerable` after performing `consumer` action on each element. <p>Stateless Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

###### Example
```apex
public class SetRatingConsumer extends Consumer {
    public override void accept(Object o) {
        Account acc = (Account) o;
        Integer annualRevenue = (Integer) acc?.AnnualRevenue;
        if (annualRevenue == null || annualRevenue <= 100) {
            acc.Rating = 'Cold';
            return;
        }
        if (annualRevenue <= 200) {
            acc.Rating = 'Warm';
            return;
        }
        acc.Rating = 'Hot';
    }
}
Account acc1 = new Account(AnnualRevenue = 100);
Account acc2 = new Account(AnnualRevenue = 200);
Account acc3 = new Account(AnnualRevenue = 500);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Account> processedAccounts = SObjectSequence.of(accounts)
    .forEach(new SetRatingConsumer())
    .toList(); //
[
  { AnnualRevenue: 100, Rating: 'Cold' },
  { AnnualRevenue: 200, Rating: 'Warm' },
  { AnnualRevenue: 500, Rating: 'Hot' }
]
```


##### `public virtual override SObjectEnumerable distinct()`

Returns a `SObjectEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

###### Example
```apex
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'bar'),
    new Account(Name = 'baz'),
    new Account(Name = 'foo'),
    new Account(Name = 'bar')
};
List<Account> distinct = SObjectSequence.of(accounts)
    .distinct()
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' }
]
```


##### `public virtual override SObjectEnumerable distinct(IFunction classifier)`

Returns a `SObjectEnumerable` with distinct elements according to `classifier` function. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the classifier function|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
public class GetFieldValueToLowerCaseFunction extends Function {
    private final String fieldName;
    public GetFieldValueToLowerCaseFunction(String fieldName) { this.fieldName = fieldName; }
    public override Object apply(Object o) { return ((String) ((SObject) o).get(fieldName))?.toLowerCase(); }
}
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'Bar'),
    new Account(Name = 'baz'),
    new Account(Name = 'Foo'),
    new Account(Name = 'bar')
};
List<Account> distinct = SObjectSequence.of(accounts)
    .distinct(new GetFieldValueToLowerCaseFunction('Name'))
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'Bar' },
  { Name: 'baz' }
]
```


##### `public virtual override SObjectEnumerable sort()`

Returns a `SObjectEnumerable` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Account> sortedAccounts = SObjectSequence.of(accounts)
    .sort()
    .toList(); //
[
  { Name: 'bar', AnnualRevenue: 200 },
  { Name: 'baz', AnnualRevenue: 500 },
  { Name: 'foo', AnnualRevenue: 100 }
]
```


##### `public virtual override SObjectEnumerable sort(IComparer comparer)`

Returns a `SObjectEnumerable` with sorted elements according to `comparer`. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`comparer`|the non-interfering, stateless comparer to compare stream elements|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

###### Example
```apex
public class NameAndThenAnnualRevenueComparer extends Comparer {
    public override Integer compare(Object o1, Object o2) {
        Account acc1 = (Account) o1;
        Account acc2 = (Account) o2;
        Integer nameComparison = acc1.Name.compareTo(acc2.Name);
        return nameComparison != 0
            ? nameComparison
            : acc1.AnnualRevenue > acc2.AnnualRevenue
                ? 1
                : acc1.AnnualRevenue == acc2.AnnualRevenue
                    ? 0
                    : -1;
    }
}
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
Account acc4 = new Account(Name = 'foo', AnnualRevenue = 600);
Account acc5 = new Account(Name = 'bar', AnnualRevenue = 800);
Account acc6 = new Account(Name = 'baz', AnnualRevenue = 100);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6 };
List<Account> sortedAccounts = SObjectSequence.of(accounts)
    .sort(new NameAndThenAnnualRevenueComparer())
    .toList(); //
[
  { Name: 'bar', AnnualRevenue: 200 },
  { Name: 'bar', AnnualRevenue: 800 },
  { Name: 'baz', AnnualRevenue: 100 },
  { Name: 'baz', AnnualRevenue: 500 },
  { Name: 'foo', AnnualRevenue: 100 },
  { Name: 'foo', AnnualRevenue: 600 }
]
```


##### `public virtual override SObjectEnumerable lim(Integer lim)`

Returns a `SObjectEnumerable` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `lim` is less than 0|
|`NullPointerException`|if `lim` is null|

###### Example
```apex
Account acc1 = new Account(Name = 'foo');
Account acc2 = new Account(Name = 'bar');
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Account> first2 = SObjectSequence.of(accounts)
    .lim(2)
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' }
]
```


##### `public virtual override SObjectEnumerable skip(Integer n)`

Returns a new `SObjectEnumerable` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `n` is less than 0|
|`NullPointerException`|if `n` is null|

###### Example
```apex
Account acc1 = new Account(Name = 'foo');
Account acc2 = new Account(Name = 'bar');
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Account> rest = SObjectSequence.of(accounts)
    .skip(1)
    .toList(); //
[
  { Name: 'bar' },
  { Name: 'baz' }
]
```


---
### Terminal Operations
##### `public virtual override SObject reduce(SObject identity, IBiOperator accumulator)`

Performs a reduction on `SObject` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Returns

|Type|Description|
|---|---|
|`SObject`|the `SObject` result of the reduction|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
public class AnnualRevenueAccumulator extends BiOperator {
    public override Object apply (Object o1, Object o2) {
        Account result = ((Account) o1);
        Account acc = ((Account) o2);
        result.AnnualRevenue += acc.AnnualRevenue;
        return result;
    }
}
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Account identity = new Account(Name = 'total', AnnualRevenue = 0);
Account total = (Account) SObjectSequence.of(accounts)
    .reduce(identity, new AnnualRevenueAccumulator()); // { Name: 'total', AnnualRevenue: 800 }
```


##### `public virtual override Optional reduce(IBiOperator accumulator)`

Performs a reduction on `SObject` elements, using `identity` value and associative `accumulator` function, and returns an `Optional` SObject describing the reduced value. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject result of the reduction|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

###### Example
```apex
public class AccountAccumulator extends BiOperator {
    public override Object apply (Object o1, Object o2) {
        Account result = ((Account) o1);
        Account acc = ((Account) o2);
        result.Name += ';' + acc.Name;
        result.AnnualRevenue += acc.AnnualRevenue;
        return result;
    }
}
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Account total = (Account) SObjectSequence.of(accounts)
    .reduce(new AccountAccumulator())
    .get(); // { Name: 'foo;bar;baz', AnnualRevenue: 800 }
```


##### `public virtual override Object collect(ICollector collector)`

Performs a mutable reduction operation on elements, collecting elements to a container using `collector`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`collector`|the collector|

###### Returns

|Type|Description|
|---|---|
|`Object`|the `Object` result of the collection|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `collector` is null|

###### Example
```apex
// Simple collecting
public class AddToStringSetBiConsumer extends BiConsumer {
    private final String fieldName;
    public AddToStringSetBiConsumer(String fieldName) { this.fieldName = fieldName; }
    public override void accept(Object container, Object o) {
        String value = (String) ((SObject) o).get(fieldName);
        ((Set<String>) container).add(value);
    }
}
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 400);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
Account acc4 = new Account(Name = 'qux', NumberOfEmployees = 100);
Account acc5 = new Account(Name = 'bar', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5 };
Set<String> names = (Set<String>) SObjectSequence.of(accounts)
    .collect(Collector.of(Supplier.of(Set<String>.class), new AddToStringSetBiConsumer('Name')));
// ['foo', 'bar', 'baz', 'qux']
// Cascaded operation
public class GetIntFieldFunction extends Function {
    private final String fieldName;
    public GetIntFieldFunction(String fieldName) { this.fieldName = fieldName; }
    public override Object apply(Object o) {
        return (Integer) ((SObject) o).get(fieldName);
    }
}
public class AddToListBiConsumer extends BiConsumer {
    private final String fieldName;
    public AddToListBiConsumer(String fieldName) { this.fieldName = fieldName; }
    public override void accept(Object container, Object o) {
        ((List<Object>) container).add(((SObject) o).get(fieldName));
    }
}
public class PutToObjectsByIntMap extends BiConsumer {
    private final IFunction classifier;
    public PutToObjectsByIntMap(ICollector downstream, IFunction classifier) {
        this.downstream = downstream;
        this.classifier = classifier;
    }
    public override void accept(Object container, Object o) {
        final Map<Integer, List<Object>> m = (Map<Integer, List<Object>>) container;
        final Integer key = (Integer) classifier.apply(o);
        if (!m.containsKey(key)) { m.put(key, (List<Object>) downstream.supplier().get()); }
        downstream.accumulator().accept(m.get(key), o);
    }
}
// the classifier function mapping input elements to keys.
IFunction classificationFunction = new GetIntFieldFunction('NumberOfEmployees');
// the supplier providing a new empty Map into which the results will be inserted.
ISupplier mapSupplier = Supplier.of(Map<Integer, List<String>>.class);
// the Collector implementing the downstream reduction.
ICollector downstreamCollector = Collector.of(
    Supplier.of(List<String>.class),
    new AddToListBiConsumer('Name')
);
// the function that folds an element into a result container.
IBiConsumer accumulator = new PutToObjectsByIntMap(downstreamCollector, classificationFunction);
// the Collector implementing the cascaded group-by operation.
ICollector groupByNumberOfEmployeesCollector = Collector.of(mapSupplier, accumulator);
Map<Integer, List<String>> namesByNumberOfEmployees = (Map<Integer, List<String>>)
    SObjectSequence.of(accounts)
    .collect(groupByNumberOfEmployeesCollector); //
{
  100: ['foo', 'qux'],
  300: ['baz', 'bar'],
  400: ['bar']
}
// The same result can be obtained by using built-in Collectors
Map<Integer, List<String>> namesByNumberOfEmployees1 = (Map<Integer, List<String>>)
    SObjectSequence.of(accounts)
    .collect(
        SObjectCollectors.groupingByInt('NumberOfEmployees', 'Name')
            .cast(Map<Integer, List<String>>.class)
    );
```


##### `public virtual override Optional find(IPredicate predicate)`

Returns an `Optional` SObject describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String fieldName;
    private final String s;
    public ContainsPredicate(String fieldName, String s) {
        this.fieldName = fieldName;
        this.s = s;
    }
    public override Boolean test(Object o) {
        return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
    }
}
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
Account firstFound = (Account) SObjectSequence.of(accounts)
    .find(new ContainsPredicate('Name', 'a'))
    .get(); // { Name: 'bar', NumberOfEmployees: 200 }
```


##### `public virtual override Boolean every(IPredicate predicate)`

Returns whether all elements match `predicate`. If `SObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String fieldName;
    private final String s;
    public ContainsPredicate(String fieldName, String s) {
        this.fieldName = fieldName;
        this.s = s;
    }
    public override Boolean test(Object o) {
        return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
    }
}
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
Boolean doesEveryAccountNameContainA = SObjectSequence.of(accounts)
    .every(new ContainsPredicate('Name', 'a')); // false
```


##### `public virtual override Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `SObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String fieldName;
    private final String s;
    public ContainsPredicate(String fieldName, String s) {
        this.fieldName = fieldName;
        this.s = s;
    }
    public override Boolean test(Object o) {
        return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
    }
}
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
Boolean doesSomeAccountNameContainA = SObjectSequence.of(accounts)
    .some(new ContainsPredicate('Name', 'a')); // true
```


##### `public virtual override Integer count()`

Returns the count of elements. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Integer`|the count of elements|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Integer count = SObjectSequence.of(accounts)
    .count(); // 3
```


##### `public virtual override Boolean isEmpty()`

Returns whether the count of elements is 0. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
SObjectSequence.of(accounts)
    .isEmpty(); // false
SObjectSequence.of(new List<Account>())
    .isEmpty(); // true
```


##### `public virtual override List<SObject> toList()`

Accumulates elements into a `List<SObject>`. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`List<SObject>`|the `List<SObject>` containing the stream elements|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Account> accounts1 = SObjectSequence.of(accounts)
    .skip(1)
    .toList(); //
[
  { Name: 'bar', NumberOfEmployees: 200 },
  { Name: 'baz', NumberOfEmployees: 200 }
]
```


##### `public virtual override List<Object> toList(IFunction mapper, Type elementType)`

Accumulates elements returned by `mapper` into a `List<?>` of specific `listType`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|
|`elementType`|the element type|

###### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the stream elements|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `listType` is null|

###### Example
```apex
List<String> accountNames = (List<String>) SObjectStream.of(accounts)
    .toList(SObjectFunctions.get('Name'), String.class);
```


##### `public virtual override Set<SObject> toSet()`

Accumulates elements into a `Set<SObject>`. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Set<SObject>`|the `Set<SObject>` containing the stream elements|

###### Example
```apex
Set<SObject> accountsWithHotRating = SObjectStream.of(accounts)
    .filter(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
    .toSet();
```


##### `public virtual override Set<Object> toSet(IFunction mapper)`

Accumulates `Object` elements returned by `mapper` into a `Set<Object>`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Set<Object>`|the `Set<Object>`containing the stream elements field values|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Set<Object> createdDates = SObjectStream.of(accounts).toSet(SObjectFunctions.get('CreatedDate'));
```


##### `public virtual override Set<Id> toIdSet(IFunction mapper)`

Accumulates `Id` elements returned by `mapper` into a `Set<Id>`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Set<Id>`|the `Set<Id>` containing the stream elements field values|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Set<Id> accountIds = SObjectStream.of(contacts).toIdSet(SObjectFunctions.get('AccountId'));
```


##### `public virtual override Set<String> toStringSet(IFunction mapper)`

Accumulates `String` elements returned by `mapper` into a `Set<String>`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

###### Returns

|Type|Description|
|---|---|
|`Set<String>`|the `Set<String>`containing the stream elements field values|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
Set<String> accountNames = SObjectStream.of(accounts).toStringSet(SObjectFunctions.get('Name'));
```


##### `public virtual override Map<Id,SObject> toMap()`

Accumulates elements into a `Map<Id, SObject>`. <p>Terminal Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the stream elements|

###### Example
```apex
Map<Id, SObject> accountsWithHotRating = SObjectStream.of(accounts)
    .filter(SObjectPredicates.isEqual(Account.Rating, 'Hot'))
    .toMap();
```


##### `public virtual override Map<Id,SObject> toByIdMap(IFunction keyMapper, Type valueType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `mapType` whose keys are produced by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueType`|the type of the value|

###### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the stream elements|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates, which can be cast to `mapType`|
|`NullPointerException`|if `keyMapper` or `mapType` is null|

###### Example
```apex
Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) SObjectStream.of(contacts)
    .toByIdMap(SObjectFunctions.get('AccountId'), Map<Id, Contact>.class);
```


##### `public virtual override Map<String,SObject> toByStringMap(IFunction keyMapper, Type valueType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `mapType` whose keys are produced by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueType`|the type of the value|

###### Returns

|Type|Description|
|---|---|
|`Map<String,SObject>`|the `Map<String, SObject>` containing the stream elements|

###### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates, which can be cast to `mapType`|
|`NullPointerException`|if `keyMapper` or `mapType` is null|

###### Example
```apex
Map<String, Account> accountByName = (Map<String, Account>) SObjectStream.of(accounts)
    .toByStringMap(SObjectFunctions.get('Name'), Map<String, Account>.class);
```


##### `public virtual override Map<Id,List<SObject>> groupById(IFunction keyMapper)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|

###### Returns

|Type|Description|
|---|---|
|`Map<Id,List<SObject>>`|the `Map<Id, List<SObject>>` containing the stream elements|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Map<Id, List<Contact>> contactsByAccountId = SObjectStream.of(contacts)
    .groupById(SObjectFunctions.get('AccountId'));
```


##### `public virtual override Map<String,List<SObject>> groupByString(IFunction keyMapper)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|

###### Returns

|Type|Description|
|---|---|
|`Map<String,List<SObject>>`|the `Map<String, List<SObject>>` containing the stream elements|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` is null|

###### Example
```apex
Map<String, List<Account>> accountsByRating = SObjectStream.of(accounts)
    .groupByString(SObjectFunctions.get('Rating'));
```


##### `public virtual override Map<Boolean,List<SObject>> partition(IPredicate predicate)`

Partition `SObject` elements by `predicate`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Returns

|Type|Description|
|---|---|
|`Map<Boolean,List<SObject>>`|the `Map<Boolean, List<SObject>>` containing the stream elements|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating
    = SObjectStream.of(accounts).partition(SObjectPredicates.isEqual(Account.Rating, 'Hot'));
```


---
### Other
##### `public virtual SObjectEnumerable union(Iterable<SObject> iterable)`

*Inherited*


Returns a new `SObjectEnumerable` as a set union of the current and another iterables.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'bar'),
    new Account(Name = 'baz')
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux'),
    new Account(Name = 'fred'),
    new Account(Name = 'foo')
};
List<Account> union = [SObjectEnumerable].of(accounts1)
    .union(accounts2)
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' },
  { Name: 'qux' },
  { Name: 'fred' }
]
```


##### `public virtual SObjectEnumerable union(Iterable<SObject> iterable, IFunction classifier)`

*Inherited*


Returns a new `SObjectEnumerable` as a set union of the current and another iterables according to `classifier`.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `classifier` is null|

###### Example
```apex
public class GetFieldValueToLowerCaseFunction extends Function {
    private final String fieldName;
    public GetFieldValueToLowerCaseFunction(String fieldName) { this.fieldName = fieldName; }
    public override Object apply(Object o) { return ((String) ((SObject) o).get(fieldName))?.toLowerCase(); }
}
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'Bar'),
    new Account(Name = 'baz')
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux'),
    new Account(Name = 'fred'),
    new Account(Name = 'Foo')
};
List<Account> union = [SObjectEnumerable].of(accounts1)
    .union(accounts2, new GetFieldValueToLowerCaseFunction('Name'))
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'Bar' },
  { Name: 'baz' },
  { Name: 'qux' },
  { Name: 'fred' }
]
```


##### `public virtual SObjectEnumerable union(Iterable<SObject> iterable, String fieldName)`

*Inherited*


Returns a new `SObjectEnumerable` as a set intersection of the current and another iterables according to `fieldName`.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`fieldName`|the field|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `iterable` or `fieldName` is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux', NumberOfEmployees = 400),
    new Account(Name = 'fred', NumberOfEmployees = 500),
    new Account(Name = 'foo', NumberOfEmployees = 600)
};
List<Account> union = [SObjectEnumerable].of(accounts1)
    .union(accounts2, 'Name')
    .toList(); //
[
  { Name: 'foo', NumberOfEmployees: 100 },
  { Name: 'bar', NumberOfEmployees: 200 },
  { Name: 'baz', NumberOfEmployees: 300 },
  { Name: 'qux', NumberOfEmployees: 400 },
  { Name: 'fred', NumberOfEmployees: 500 }
]
```


##### `public virtual SObjectEnumerable union(Iterable<SObject> iterable, SObjectField field)`

*Inherited*


Returns a new `SObjectEnumerable` as a set intersection of the current and another iterables according to `field`.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `field` is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux', NumberOfEmployees = 400),
    new Account(Name = 'fred', NumberOfEmployees = 500),
    new Account(Name = 'foo', NumberOfEmployees = 600)
};
List<Account> union = [SObjectEnumerable].of(accounts1)
    .union(accounts2, Account.Name)
    .toList(); //
[
  { Name: 'foo', NumberOfEmployees: 100 },
  { Name: 'bar', NumberOfEmployees: 200 },
  { Name: 'baz', NumberOfEmployees: 300 },
  { Name: 'qux', NumberOfEmployees: 400 },
  { Name: 'fred', NumberOfEmployees: 500 }
]
```


##### `public virtual SObjectEnumerable intersect(Iterable<SObject> iterable)`

*Inherited*


Returns a new `SObjectEnumerable` as a set intersection of the current and another iterables.

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'bar'),
    new Account(Name = 'baz')
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux'),
    new Account(Name = 'fred'),
    new Account(Name = 'foo')
};
List<Account> intersect = [SObjectEnumerable].of(accounts1)
    .intersect(accounts2)
    .toList(); //
[
  { Name: 'foo' }
]
```


##### `public virtual SObjectEnumerable intersect(Iterable<SObject> iterable, IFunction classifier)`

*Inherited*


Returns a new `SObjectEnumerable` as a set intersection of the current and another iterables according to `classifier`. <p>Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `classifier` is null|

###### Example
```apex
public class GetFieldValueToLowerCaseFunction extends Function {
    private final String fieldName;
    public GetFieldValueToLowerCaseFunction(String fieldName) { this.fieldName = fieldName; }
    public override Object apply(Object o) { return ((String) ((SObject) o).get(fieldName))?.toLowerCase(); }
}
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'Bar'),
    new Account(Name = 'baz')
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux'),
    new Account(Name = 'fred'),
    new Account(Name = 'Foo')
};
List<Account> union = [SObjectEnumerable].of(accounts1)
    .intersect(accounts2, new GetFieldValueFunction('Name'))
    .toList(); //
[
  { Name: 'foo' }
]
```


##### `public virtual SObjectEnumerable intersect(Iterable<SObject> iterable, String fieldName)`

*Inherited*


Returns a new `SObjectEnumerable` as a set intersection of the current and another iterables according to `fieldName`. <p>Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`fieldName`|the field|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `iterable` or `fieldName` is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux', NumberOfEmployees = 400),
    new Account(Name = 'fred', NumberOfEmployees = 500),
    new Account(Name = 'foo', NumberOfEmployees = 600)
};
List<Account> intersect = [SObjectEnumerable].of(accounts1)
    .intersect(accounts2, 'Name')
    .toList(); //
[
  { Name: 'foo', NumberOfEmployees: 100 }
]
```


##### `public virtual SObjectEnumerable intersect(Iterable<SObject> iterable, SObjectField field)`

*Inherited*


Returns a new `SObjectEnumerable` as a set intersection of the current and another iterables according to `field`. <p>Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `field` is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux', NumberOfEmployees = 400),
    new Account(Name = 'fred', NumberOfEmployees = 500),
    new Account(Name = 'foo', NumberOfEmployees = 600)
};
List<Account> intersect = [SObjectEnumerable].of(accounts1)
    .intersect(accounts2, Account.Name)
    .toList(); //
[
  { Name: 'foo', NumberOfEmployees: 100 }
]
```


##### `public virtual SObjectEnumerable except(Iterable<SObject> iterable)`

*Inherited*


Returns a new `SObjectEnumerable` as a set difference of the current and another iterables. <p>Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'bar'),
    new Account(Name = 'baz')
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux'),
    new Account(Name = 'fred'),
    new Account(Name = 'foo')
};
List<Account> union = [SObjectEnumerable].of(accounts1)
    .except(accounts2)
    .toList(); //
[
  { Name: 'bar' },
  { Name: 'baz' }
]
List<Account> union1 = [SObjectEnumerable].of(accounts2)
    .except(accounts1)
    .toList(); //
[
  { Name: 'qux' },
  { Name: 'fred' }
]
```


##### `public virtual SObjectEnumerable except(Iterable<SObject> iterable, IFunction classifier)`

*Inherited*


Returns a new `SObjectEnumerable` as a set difference of the current and another iterables according to `classifier` function. <p>Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `classifier` is null|

###### Example
```apex
public class GetFieldValueToLowerCaseFunction extends Function {
    private final String fieldName;
    public GetFieldValueToLowerCaseFunction(String fieldName) { this.fieldName = fieldName; }
    public override Object apply(Object o) { return ((String) ((SObject) o).get(fieldName))?.toLowerCase(); }
}
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'Bar'),
    new Account(Name = 'baz')
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux'),
    new Account(Name = 'fred'),
    new Account(Name = 'Foo')
};
List<Account> except = [SObjectEnumerable].of(accounts1)
    .except(accounts2, new GetFieldValueToLowerCaseFunction('Name'))
    .toList(); //
[
  { Name: 'Bar' },
  { Name: 'baz' }
]
List<Account> except1 = [SObjectEnumerable].of(accounts2)
    .except(accounts1)
    .toList(); //
[
  { Name: 'qux' },
  { Name: 'fred' }
]
```


##### `public virtual SObjectEnumerable except(Iterable<SObject> iterable, String fieldName)`

*Inherited*


Returns a new `SObjectEnumerable` as a set difference of the current and another iterables according to `fieldName`. <p>Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`fieldName`|the field|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `iterable` or `fieldName` is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux', NumberOfEmployees = 400),
    new Account(Name = 'fred', NumberOfEmployees = 500),
    new Account(Name = 'foo', NumberOfEmployees = 600)
};
List<Account> except = [SObjectEnumerable].of(accounts1)
    .except(accounts2, 'Name')
    .toList(); //
[
  { Name: 'bar', NumberOfEmployees: 200 },
  { Name: 'baz', NumberOfEmployees: 300 }
]
List<Account> except1 = [SObjectEnumerable].of(accounts2)
    .except(accounts1, 'Name')
    .toList(); //
[
  { Name: 'qux', NumberOfEmployees: 400 },
  { Name: 'fred', NumberOfEmployees: 500 }
]
```


##### `public virtual SObjectEnumerable except(Iterable<SObject> iterable, SObjectField field)`

*Inherited*


Returns a new `SObjectEnumerable` as a set difference of the current and another iterables according to `field`. <p>Intermediate Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `field` is null|

###### Example
```apex
List<Account> accounts1 = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
List<Account> accounts2 = new List<Account>{
    new Account(Name = 'qux', NumberOfEmployees = 400),
    new Account(Name = 'fred', NumberOfEmployees = 500),
    new Account(Name = 'foo', NumberOfEmployees = 600)
};
List<Account> except = [SObjectEnumerable].of(accounts1)
    .except(accounts2, Account.Name)
    .toList(); //
[
  { Name: 'bar', NumberOfEmployees: 200 },
  { Name: 'baz', NumberOfEmployees: 300 }
]
List<Account> except1 = [SObjectEnumerable].of(accounts2)
    .except(accounts1, Account.Name)
    .toList(); //
[
  { Name: 'qux', NumberOfEmployees: 400 },
  { Name: 'fred', NumberOfEmployees: 500 }
]
```


##### `public virtual SObjectEnumerable withoutNulls()`

*Inherited*


Returns a new `SObjectEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

###### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Hot');
Account acc2 = new Account(Name = 'bar', Rating = 'Warm');
Account acc3 = new Account(Name = 'baz', Rating = 'Cold');
List<Account> accounts = new List<Account>{ acc1, acc2, null, acc3, null };
List<Account> withoutNulls = [SObjectEnumerable].of(accounts)
    .withoutNulls()
    .toList(); //
[
  { Name: 'foo', Rating: 'Hot' },
  { Name: 'bar', Rating: 'Warm' },
  { Name: 'baz', Rating: 'Cold' }
]
```


##### `public virtual Boolean none(IPredicate predicate)`

*Inherited*


Returns whether no `SObject` elements match `predicate`. If `SObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

###### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

###### Example
```apex
public class ContainsPredicate extends Predicate {
    private final String fieldName;
    private final String s;
    public ContainsPredicate(String fieldName, String s) {
        this.fieldName = fieldName;
        this.s = s;
    }
    public override Boolean test(Object o) {
        return ((String) ((SObject) o).get(fieldName))?.contains(s) == true;
    }
}
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300)
};
Boolean doesNoneAccountNameContainA = [SObjectEnumerable].of(accounts)
    .none(new ContainsPredicate('Name', 'a')); // false
```


##### `public virtual Boolean none(String fieldName, Object value)`

*Inherited*


Returns whether no `SObject` elements have `field` `value`. If `SObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

###### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Cold');
Account acc2 = new Account(Name = 'bar', Rating = 'Warm');
Account acc3 = new Account(Name = 'baz', Rating = 'Hot');
Account acc4 = new Account(Name = 'qux');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4 };
List<Contact> contacts = new List<Contact>{
    new Contact(LastName = 'foo', Account = acc1),
    new Contact(LastName = 'bar', Account = acc2),
    new Contact(LastName = 'baz', Account = acc3),
    new Contact(LastName = 'qux', Account = acc4),
    new Contact(LastName = 'fred')
};
Boolean isNoneAccountWithHotRating = [SObjectEnumerable].of(accounts)
    .none('Rating', 'Hot'); // false
Boolean isNoneContactWithHotRatingAccount = [SObjectEnumerable].of(contacts)
    .none('Account?.Rating', 'Hot'); // false
```


##### `public virtual Boolean none(SObjectField field, Object value)`

*Inherited*


Returns whether no `SObject` elements have `field` `value`. If `SObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

###### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Cold');
Account acc2 = new Account(Name = 'bar', Rating = 'Warm');
Account acc3 = new Account(Name = 'baz', Rating = 'Hot');
Account acc4 = new Account(Name = 'qux');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4 };
Boolean isNoneAccountWithHotRating = [SObjectEnumerable].of(accounts)
    .none(Account.Rating, 'Hot'); // false
```


##### `public virtual Optional max(IComparer comparer)`

*Inherited*


Returns an `Optional` describing the maximum `SObject` element according to `comparer`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject describing the result|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

###### Example
```apex
public class NameAndThenAnnualRevenueComparer extends Comparer {
    public override Integer compare(Object o1, Object o2) {
        Account acc1 = (Account) o1;
        Account acc2 = (Account) o2;
        Integer nameComparison = acc1.Name.compareTo(acc2.Name);
        return nameComparison != 0
            ? nameComparison
            : acc1.AnnualRevenue > acc2.AnnualRevenue
                ? 1
                : acc1.AnnualRevenue == acc2.AnnualRevenue
                    ? 0
                    : -1;
    }
}
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
Account acc4 = new Account(Name = 'foo', AnnualRevenue = 600);
Account acc5 = new Account(Name = 'bar', AnnualRevenue = 800);
Account acc6 = new Account(Name = 'baz', AnnualRevenue = 100);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6 };
Account maxAccount = (Account) [SObjectEnumerable].of(accounts)
    .max(new NameAndThenAnnualRevenueComparer())
    .get(); // { Name: 'foo', AnnualRevenue: 600 }
```


##### `public virtual Optional max(String fieldName)`

*Inherited*


Returns an `Optional` SObject describing the maximum `SObject` element according to `fieldName`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject describing the result|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
Account acc4 = new Account(Name = 'qux', AnnualRevenue = 600);
Account acc5 = new Account(Name = 'fred', AnnualRevenue = 800);
Account acc6 = new Account(Name = 'thud', AnnualRevenue = 100);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6 };
Account accountsWithMaxAnnualRevenue = (Account) [SObjectEnumerable].of(accounts)
    .max('AnnualRevenue')
    .get(); // { Name: 'fred', AnnualRevenue: 800 }
```


##### `public virtual Optional max(SObjectField field)`

*Inherited*


Returns an `Optional` describing the maximum `SObject` element according to `field`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the field|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject describing the result|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
Account acc4 = new Account(Name = 'qux', AnnualRevenue = 600);
Account acc5 = new Account(Name = 'fred', AnnualRevenue = 800);
Account acc6 = new Account(Name = 'thud', AnnualRevenue = 100);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6 };
Account accountsWithMaxAnnualRevenue = (Account) [SObjectEnumerable].of(accounts)
    .max(Account.AnnualRevenue)
    .get(); // { Name: 'fred', AnnualRevenue: 800 }
```


##### `public virtual Optional min(IComparer comparer)`

*Inherited*


Returns an `Optional` describing the minimum `SObject` element according to `comparer`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject describing the result|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

###### Example
```apex
public class NameAndThenAnnualRevenueComparer extends Comparer {
    public override Integer compare(Object o1, Object o2) {
        Account acc1 = (Account) o1;
        Account acc2 = (Account) o2;
        Integer nameComparison = acc1.Name.compareTo(acc2.Name);
        return nameComparison != 0
            ? nameComparison
            : acc1.AnnualRevenue > acc2.AnnualRevenue
                ? 1
                : acc1.AnnualRevenue == acc2.AnnualRevenue
                    ? 0
                    : -1;
    }
}
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
Account acc4 = new Account(Name = 'foo', AnnualRevenue = 600);
Account acc5 = new Account(Name = 'bar', AnnualRevenue = 800);
Account acc6 = new Account(Name = 'baz', AnnualRevenue = 100);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6 };
Account minAccount = (Account) [SObjectEnumerable].of(accounts)
    .min(new NameAndThenAnnualRevenueComparer())
    .get(); // { Name: 'bar', AnnualRevenue: 200 }
```


##### `public virtual Optional min(String fieldName)`

*Inherited*


Returns an `Optional` describing the minimum `SObject` element according to `fieldName`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject describing the result|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
Account acc4 = new Account(Name = 'qux', AnnualRevenue = 600);
Account acc5 = new Account(Name = 'fred', AnnualRevenue = 800);
Account acc6 = new Account(Name = 'thud', AnnualRevenue = 100);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6 };
Account accountsWithMinAnnualRevenue = (Account) [SObjectEnumerable].of(accounts)
    .min('AnnualRevenue')
    .get(); // { Name: 'fred', AnnualRevenue: 800 }
```


##### `public virtual Optional min(SObjectField field)`

*Inherited*


Returns an `Optional` describing the minimum `SObject` element according to `field`. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the field|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject describing the result|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
Account acc4 = new Account(Name = 'qux', AnnualRevenue = 600);
Account acc5 = new Account(Name = 'fred', AnnualRevenue = 800);
Account acc6 = new Account(Name = 'thud', AnnualRevenue = 100);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6 };
Account accountsWithMinAnnualRevenue = (Account) [SObjectEnumerable].of(accounts)
    .min(Account.AnnualRevenue)
    .get(); // { Name: 'fred', AnnualRevenue: 800 }
```


##### `public virtual Double sum(IFunction classifier)`

*Inherited*


Returns the arithmetic sum of values returned by `classifier` function. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the classifier function|

###### Returns

|Type|Description|
|---|---|
|`Double`|the sum of elements returned by function|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
public class TotalPriceFunction extends Function {
    public override Object apply(Object o) {
        OpportunityLineItem item = (OpportunityLineItem) o;
        return (Integer) (item.Quantity * item.UnitPrice);
    }
}
List<OpportunityLineItem> items = new List<OpportunityLineItem>{
    new OpportunityLineItem(Quantity = 100, UnitPrice = 100),
    new OpportunityLineItem(Quantity = 20, UnitPrice = 2000),
    new OpportunityLineItem(Quantity = 50, UnitPrice = 1000)
};
Double totalSum = [SObjectEnumerable].of(items)
    .sum(new TotalPriceFunction()); // 100000.0
```


##### `public virtual Double sum(String fieldName)`

*Inherited*


Returns the arithmetic sum of field values of `SObject` elements. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field to sum values|

###### Returns

|Type|Description|
|---|---|
|`Double`|the sum of field values|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Account parent1 = new Account(Name = 'qux', NumberOfEmployees = 1000);
Account parent2 = new Account(Name = 'fred', NumberOfEmployees = 5000);
Account parent3 = new Account(Name = 'thud', NumberOfEmployees = 3000);
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100, Parent = parent1);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200, Parent = parent2);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300, Parent = parent3);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Double sumOfNumberOfEmployees = [SObjectEnumerable].of(accounts)
    .sum('NumberOfEmployees'); // 600.0
Double sumOfParentNumberOfEmployees = [SObjectEnumerable].of(accounts)
    .sum('Parent?.NumberOfEmployees'); // 9000.0
```


##### `public virtual Double sum(SObjectField field)`

*Inherited*


Returns the arithmetic sum of field values of `SObject` elements. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the field to sum values|

###### Returns

|Type|Description|
|---|---|
|`Double`|field sum of field values|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Double sumOfNumberOfEmployees = [SObjectEnumerable].of(accounts)
    .sum(Account.NumberOfEmployees); // 600.0
```


##### `public virtual Optional avg(IFunction classifier)`

*Inherited*


Returns the arithmetic mean of values returned by `classifier` function. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`classifier`|the classifier function|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the arithmetic mean of elements returned by function|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

###### Example
```apex
public class TotalPriceFunction extends Function {
    public override Object apply(Object o) {
        OpportunityLineItem item = (OpportunityLineItem) o;
        return (Integer) (item.Quantity * item.UnitPrice);
    }
}
List<OpportunityLineItem> items = new List<OpportunityLineItem>{
    new OpportunityLineItem(Quantity = 100, UnitPrice = 100),
    new OpportunityLineItem(Quantity = 20, UnitPrice = 2000),
    new OpportunityLineItem(Quantity = 50, UnitPrice = 1000),
    new OpportunityLineItem(Quantity = 0, UnitPrice = 0)
};
Double avgTotal = [SObjectEnumerable].of(items)
    .avg(new TotalPriceFunction()); // 25000.0
```


##### `public virtual Optional avg(String fieldName)`

*Inherited*


Returns the arithmetic mean of field values of `SObject` elements. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field to sum values|

###### Returns

|Type|Description|
|---|---|
|`Optional`|the arithmetic mean of field values|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
Account parent1 = new Account(Name = 'qux', NumberOfEmployees = 1000);
Account parent2 = new Account(Name = 'fred', NumberOfEmployees = 5000);
Account parent3 = new Account(Name = 'thud', NumberOfEmployees = 3000);
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100, Parent = parent1);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200, Parent = parent2);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300, Parent = parent3);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Double avgOfNumberOfEmployees = [SObjectEnumerable].of(accounts)
    .avg('NumberOfEmployees'); // 200.0
Double avgOfParentNumberOfEmployees = [SObjectEnumerable].of(accounts)
    .avg('Parent?.NumberOfEmployees'); // 3000.0
```


##### `public virtual Optional avg(SObjectField field)`

*Inherited*


Returns the arithmetic mean of field values of `SObject` elements. <p>Terminal Operation.</p>

###### Parameters

|Param|Description|
|---|---|
|`field`|the field to sum values|

###### Returns

|Type|Description|
|---|---|
|`Optional`|field arithmetic mean of field values|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Double avgOfNumberOfEmployees = [SObjectEnumerable].of(accounts)
    .avg(Account.NumberOfEmployees); // 200.0
```


---
