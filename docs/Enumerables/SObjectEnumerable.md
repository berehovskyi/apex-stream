# abstract SObjectEnumerable

`SUPPRESSWARNINGS`

`APIVERSION: 58`

`STATUS: ACTIVE`

Provides a skeletal implementation of [ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md).


**Implemented types**

[ISObjectEnumerable](/docs/Enumerables/ISObjectEnumerable.md)


**Author** Oleh Berehovskyi


**Group** Enumerables

## Methods
### `public Iterator<SObject> iterator()`

Returns an instance of an iterator for this enumerable. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Iterator<SObject>`|the iterator|

### `public SObjectEnumerable append(Iterable<SObject> iterable)`

Returns a new `SObjectEnumerable` from the current to which another `iterable` is appended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
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
List<Account> append = [SObjectEnumerable].of(accounts1)
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


### `public SObjectEnumerable prepend(Iterable<SObject> iterable)`

Returns a new `SObjectEnumerable` from the current to which another `iterable` is prepended. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
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
List<Account> prepend = [SObjectEnumerable].of(accounts1)
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


### `public virtual SObjectEnumerable union(Iterable<SObject> iterable)`

Returns a new `SObjectEnumerable` as a set union of the current and another iterables.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
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


### `public virtual SObjectEnumerable union(Iterable<SObject> iterable, IFunction classifier)`

Returns a new `SObjectEnumerable` as a set union of the current and another iterables according to `classifier`.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `classifier` is null|

#### Example
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


### `public virtual SObjectEnumerable union(Iterable<SObject> iterable, String fieldName)`

Returns a new `SObjectEnumerable` as a set intersection of the current and another iterables according to `fieldName`.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `iterable` or `fieldName` is null|

#### Example
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


### `public virtual SObjectEnumerable union(Iterable<SObject> iterable, SObjectField field)`

Returns a new `SObjectEnumerable` as a set intersection of the current and another iterables according to `field`.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `field` is null|

#### Example
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


### `public virtual SObjectEnumerable intersect(Iterable<SObject> iterable)`

Returns a new `SObjectEnumerable` as a set intersection of the current and another iterables.

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
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


### `public virtual SObjectEnumerable intersect(Iterable<SObject> iterable, IFunction classifier)`

Returns a new `SObjectEnumerable` as a set intersection of the current and another iterables according to `classifier`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `classifier` is null|

#### Example
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


### `public virtual SObjectEnumerable intersect(Iterable<SObject> iterable, String fieldName)`

Returns a new `SObjectEnumerable` as a set intersection of the current and another iterables according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `iterable` or `fieldName` is null|

#### Example
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


### `public virtual SObjectEnumerable intersect(Iterable<SObject> iterable, SObjectField field)`

Returns a new `SObjectEnumerable` as a set intersection of the current and another iterables according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `field` is null|

#### Example
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


### `public virtual SObjectEnumerable except(Iterable<SObject> iterable)`

Returns a new `SObjectEnumerable` as a set difference of the current and another iterables. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` is null|

#### Example
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


### `public virtual SObjectEnumerable except(Iterable<SObject> iterable, IFunction classifier)`

Returns a new `SObjectEnumerable` as a set difference of the current and another iterables according to `classifier` function. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `classifier` is null|

#### Example
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


### `public virtual SObjectEnumerable except(Iterable<SObject> iterable, String fieldName)`

Returns a new `SObjectEnumerable` as a set difference of the current and another iterables according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `iterable` or `fieldName` is null|

#### Example
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


### `public virtual SObjectEnumerable except(Iterable<SObject> iterable, SObjectField field)`

Returns a new `SObjectEnumerable` as a set difference of the current and another iterables according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`iterable`|the other iterable|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `iterable` or `field` is null|

#### Example
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


### `public SObjectEnumerable distinct()`

Returns a `SObjectEnumerable` with distinct elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

#### Example
```apex
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'bar'),
    new Account(Name = 'baz'),
    new Account(Name = 'foo'),
    new Account(Name = 'bar')
};
List<Account> distinct = [SObjectEnumerable].of(accounts)
    .distinct()
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' }
]
```


### `public SObjectEnumerable distinct(IFunction classifier)`

Returns a new `SObjectEnumerable` with distinct elements according to `classifier` function. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

#### Example
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
List<Account> distinct = [SObjectEnumerable].of(accounts)
    .distinct(new GetFieldValueToLowerCaseFunction('Name'))
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'Bar' },
  { Name: 'baz' }
]
```


### `public virtual SObjectEnumerable distinct(String fieldName)`

Returns a new `SObjectEnumerable` with distinct `SObject` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300),
    new Account(Name = 'foo', NumberOfEmployees = 400),
    new Account(Name = 'bar', NumberOfEmployees = 500)
};
List<Account> distinct = [SObjectEnumerable].of(accounts)
    .distinct('Name')
    .toList(); //
[
  { Name: 'foo', NumberOfEmployees: 100 },
  { Name: 'bar', NumberOfEmployees: 200 },
  { Name: 'baz', NumberOfEmployees: 300 }
]
```


### `public virtual SObjectEnumerable distinct(SObjectField field)`

Returns a new `SObjectEnumerable` with distinct `SObject` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo', NumberOfEmployees = 100),
    new Account(Name = 'bar', NumberOfEmployees = 200),
    new Account(Name = 'baz', NumberOfEmployees = 300),
    new Account(Name = 'foo', NumberOfEmployees = 400),
    new Account(Name = 'bar', NumberOfEmployees = 500)
};
List<Account> distinct = [SObjectEnumerable].of(accounts)
    .distinct(Account.Name)
    .toList(); //
[
  { Name: 'foo', NumberOfEmployees: 100 },
  { Name: 'bar', NumberOfEmployees: 200 },
  { Name: 'baz', NumberOfEmployees: 300 }
]
```


### `public SObjectEnumerable filter(IPredicate predicate)`

Returns a new `SObjectEnumerable` with elements that match `predicate`. <p>Stateless Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
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
List<Account> filtered = [SObjectEnumerable].of(accounts)
    .filter(new ContainsPredicate('Name', 'a'))
    .toList(); //
[
  { Name: 'bar', NumberOfEmployees: 200 },
  { Name: 'baz', NumberOfEmployees: 300 }
]
```


### `public virtual SObjectEnumerable filter(String fieldName, Object value)`

Returns a new `SObjectEnumerable` with `SObject` elements that have field's value. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
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
List<Account> accountsWithHotRating = [SObjectEnumerable].of(accounts)
    .filter('Rating', 'Hot')
    .toList(); //
[
  { Name: 'baz', Rating: 'Hot' }
]
List<Contact> contactsWithHotRatingAccount = [SObjectEnumerable].of(contacts)
    .filter('Account?.Rating', 'Hot')
    .toList(); //
[
  { LastName: 'baz', Account: acc3 }
]
```


### `public virtual SObjectEnumerable filter(SObjectField field, Object value)`

Returns a new `SObjectEnumerable` with `SObject` elements that have field's value. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Cold');
Account acc2 = new Account(Name = 'bar', Rating = 'Warm');
Account acc3 = new Account(Name = 'baz', Rating = 'Hot');
Account acc4 = new Account(Name = 'qux');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4 };
List<Account> accountsWithHotRating = [SObjectEnumerable].of(accounts)
    .filter(Account.Rating, 'Hot')
    .toList(); //
[
  { Name: 'baz', Rating: 'Hot' }
]
```


### `public SObjectEnumerable take(IPredicate predicate)`

Returns a new `SObjectEnumerable` that takes elements while `predicate` returns `true`. <p>Short-circuiting Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
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
List<Account> firstMatched = [SObjectEnumerable].of(accounts)
    .take(new ContainsPredicate('Name', 'a'))
    .toList(); //
[
  { Name: 'bar', NumberOfEmployees: 200 },
  { Name: 'baz', NumberOfEmployees: 300 }
]
```


### `public virtual SObjectEnumerable take(String fieldName, Object value)`

Returns a new `SObjectEnumerable` that takes `SObject` elements while `fieldName` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Hot');
Account acc2 = new Account(Name = 'bar', Rating = 'Hot');
Account acc3 = new Account(Name = 'baz', Rating = 'Warm');
Account acc4 = new Account(Name = 'qux');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4 };
List<Contact> contacts = new List<Contact>{
    new Contact(LastName = 'foo', Account = acc1),
    new Contact(LastName = 'bar', Account = acc2),
    new Contact(LastName = 'baz', Account = acc3),
    new Contact(LastName = 'qux', Account = acc4),
    new Contact(LastName = 'fred')
};
List<Account> firstAccountsWithHotRating = [SObjectEnumerable].of(accounts)
    .take('Rating', 'Hot')
    .toList(); //
[
  { Name: 'foo', Rating: 'Hot' },
  { Name: 'bar', Rating: 'Hot' }
]
List<Contact> firstContactsWithHotRatingAccount = [SObjectEnumerable].of(contacts)
    .take('Account?.Rating', 'Hot')
    .toList(); //
[
  { LastName: 'foo', Account: acc1 },
  { LastName: 'bar', Account: acc2 },
]
```


### `public virtual SObjectEnumerable take(SObjectField field, Object value)`

Returns a new `SObjectEnumerable` that takes `SObject` elements while `field` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Hot');
Account acc2 = new Account(Name = 'bar', Rating = 'Hot');
Account acc3 = new Account(Name = 'baz', Rating = 'Warm');
Account acc4 = new Account(Name = 'qux');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4 };
List<Account> firstAccountsWithHotRating = [SObjectEnumerable].of(accounts)
    .take(Account.Rating, 'Hot')
    .toList(); //
[
  { Name: 'foo', Rating: 'Hot' },
  { Name: 'bar', Rating: 'Hot' }
]
```


### `public SObjectEnumerable drop(IPredicate predicate)`

Returns a new `SObjectEnumerable` that drops elements while `predicate` returns `true`. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
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
List<Account> rest = [SObjectEnumerable].of(accounts)
    .drop(new ContainsPredicate('Name', 'a'))
    .toList(); //
[
  { Name: 'foo', NumberOfEmployees: 100 }
]
```


### `public virtual SObjectEnumerable drop(String fieldName, Object value)`

Returns a new `SObjectEnumerable` that drops `SObject` elements while `fieldName` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Hot');
Account acc2 = new Account(Name = 'bar', Rating = 'Hot');
Account acc3 = new Account(Name = 'baz', Rating = 'Warm');
Account acc4 = new Account(Name = 'qux');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4 };
List<Contact> contacts = new List<Contact>{
    new Contact(LastName = 'foo', Account = acc1),
    new Contact(LastName = 'bar', Account = acc2),
    new Contact(LastName = 'baz', Account = acc3),
    new Contact(LastName = 'qux', Account = acc4),
    new Contact(LastName = 'fred')
};
List<Account> restAccounts = [SObjectEnumerable].of(accounts)
    .drop('Rating', 'Hot')
    .toList(); //
[
  { Name: 'baz', Rating: 'Warm' },
  { Name: 'qux' }
]
List<Contact> restContacts = [SObjectEnumerable].of(contacts)
    .drop('Account?.Rating', 'Hot')
    .toList(); //
[
  { LastName: 'baz', Account: acc3 },
  { LastName: 'qux', Account: acc4 },
  { LastName: 'fred' }
]
```


### `public virtual SObjectEnumerable drop(SObjectField field, Object value)`

Returns a new `SObjectEnumerable` that drops `SObject` elements while `field` equals to `value`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Hot');
Account acc2 = new Account(Name = 'bar', Rating = 'Hot');
Account acc3 = new Account(Name = 'baz', Rating = 'Warm');
Account acc4 = new Account(Name = 'qux');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4 };
List<Account> restAccounts = [SObjectEnumerable].of(accounts)
    .drop(Account.Rating, 'Hot')
    .toList(); //
[
  { Name: 'baz', Rating: 'Warm' },
  { Name: 'qux' }
]
```


### `public virtual SObjectEnumerable withoutNulls()`

Returns a new `SObjectEnumerable` without null elements. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Example
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


### `public SObjectEnumerable mapTo(IOperator mapper)`

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
List<Contact> contacts = [SObjectEnumerable].of(accounts)
    .mapTo(new MapToContactOperator())
    .toList(); //
[
  { LastName: 'foo', AccountId: '001000000000001AAA' },
  { LastName: 'bar', AccountId: '001000000000002AAA' },
  { LastName: 'baz', AccountId: '001000000000003AAA' }
]
```


### `public virtual SObjectEnumerable mapTo(String fieldName)`

Returns a new `SObjectEnumerable` with `SObject` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the parent reference field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'qux');
Account parent2 = new Account(Name = 'fred');
Account acc1 = new Account(Name = 'foo', Parent = parent1);
Account acc2 = new Account(Name = 'bar', Parent = parent2);
Account acc3 = new Account(Name = 'baz');
Contact con1 = new Contact(Account = acc1);
Contact con2 = new Contact(Account = acc2);
Contact con3 = new Contact(Account = acc3);
List<Contact> contacts = new List<Contact>{ con1, con2, con3 };
List<Account> accounts = [SObjectEnumerable].of(contacts)
    .mapTo('Account')
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' }
]
List<Account> parentAccounts = [SObjectEnumerable].of(contacts)
    .mapTo('Account?.Parent')
    .toList(); //
[
  { Name: 'qux' },
  { Name: 'fred' },
  null
]
```


### `public virtual SObjectEnumerable mapTo(SObjectField field)`

Returns a new `SObjectEnumerable` with `SObject` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the parent reference field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo');
Account acc2 = new Account(Name = 'bar');
Account acc3 = new Account(Name = 'baz');
Contact con1 = new Contact(Account = acc1);
Contact con2 = new Contact(Account = acc2);
Contact con3 = new Contact(Account = acc3);
List<Contact> contacts = new List<Contact>{ con1, con2, con3 };
List<Account> accounts = [SObjectEnumerable].of(contacts)
    .mapTo(Contact.AccountId)
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' },
  { Name: 'baz' }
]
```


### `public IntEnumerable mapToInt(IFunction mapper)`

Returns a `IntEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the `IntEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
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
List<Integer> totalPrices = [SObjectEnumerable].of(items)
    .mapToInt(new TotalPriceFunction())
    .toList(); // [10000, 40000, 5000]
```


### `public virtual IntEnumerable mapToInt(String fieldName)`

Returns a new `IntEnumerable` with `Integer` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'qux', NumberOfEmployees = 1000);
Account parent2 = new Account(Name = 'fred', NumberOfEmployees = 5000);
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100, Parent = parent1);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200, Parent = parent2);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Integer> numberOfEmployees = [SObjectEnumerable].of(accounts)
    .mapToInt('NumberOfEmployees')
    .toList(); // [100, 200, 300]
List<Integer> parentNumberOfEmployees = [SObjectEnumerable].of(accounts)
    .mapToInt('Parent?.NumberOfEmployees')
    .toList(); // [1000, 5000, null]
```


### `public virtual IntEnumerable mapToInt(SObjectField field)`

Returns a new `IntEnumerable` with `Integer` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`IntEnumerable`|the new `IntEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Integer> numberOfEmployees = [SObjectEnumerable].of(accounts)
    .mapToInt(Account.NumberOfEmployees)
    .toList(); // [100, 200, 300]
```


### `public LongEnumerable mapToLong(IFunction mapper)`

Returns a `LongEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
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
List<Long> totalPrices = [SObjectEnumerable].of(items)
    .mapToLong(new TotalPriceFunction())
    .toList(); // [100000000, 400000000, 500000000]
```


### `public virtual LongEnumerable mapToLong(String fieldName)`

Returns a new `LongEnumerable` with `Long` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'qux', NumberOfEmployees = 1000);
Account parent2 = new Account(Name = 'fred', NumberOfEmployees = 5000);
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100, Parent = parent1);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200, Parent = parent2);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Long> numberOfEmployees = [SObjectEnumerable].acc1(accounts)
    .mapToLong('NumberOfEmployees')
    .toList(); // [100, 200, 300]
List<Long> parentNumberOfEmployees = [SObjectEnumerable].of(contacts)
    .mapToLong('Parent?.NumberOfEmployees')
    .toList(); // [1000, 5000, null]
```


### `public virtual LongEnumerable mapToLong(SObjectField field)`

Returns a new `LongEnumerable` with `Long` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`LongEnumerable`|the new `LongEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Long> numberOfEmployees = [SObjectEnumerable].acc1(accounts)
    .mapToLong(Account.NumberOfEmployees)
    .toList(); // [100, 200, 300]
```


### `public DoubleEnumerable mapToDouble(IFunction mapper)`

Returns a `DoubleEnumerable` with elements returned by `mapper` function, applied to the elements of this enumerable. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the non-interfering, stateless operator|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
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
  List<Double> haversineDistancesFromNyInKms = [SObjectEnumerable].of(accounts)
      .mapToDouble(new HaversineDistanceFunction(newYorkLat, newYorkLon))
      .toList(); // [4129.0861, 5570.2221, 5837.2409]
```


### `public virtual DoubleEnumerable mapToDouble(String fieldName)`

Returns a new `DoubleEnumerable` with `Double` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `DoubleEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'qux', AnnualRevenue = 159.5);
Account parent2 = new Account(Name = 'fred', AnnualRevenue = 350.1);
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 10.8, Parent = parent1);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 5.5, Parent = parent2);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 6.0);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Double> annualRevenues = [SObjectEnumerable].of(accounts)
    .mapToDouble('AnnualRevenue')
    .toList(); // [10.8, 5.5, 6.0]
List<Double> parentAnnualRevenues = [SObjectEnumerable].of(accounts)
    .mapToDouble('Parent?.AnnualRevenue')
    .toList(); // [159.5, 350.1, null]
```


### `public virtual DoubleEnumerable mapToDouble(SObjectField field)`

Returns a new `DoubleEnumerable` with `Double` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`DoubleEnumerable`|the new `field`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 10.8);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 5.5);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 6.0);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Double> annualRevenues = [SObjectEnumerable].of(accounts)
    .mapToDouble(Account.AnnualRevenue)
    .toList(); // [10.8, 5.5, 6.0]
```


### `public ObjectEnumerable mapToObject(IFunction mapper)`

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
List<String> normalizedNames = (List<String>) [SObjectEnumerable].of(accounts)
    .mapToObject(new GetFieldValueToLowerCaseFunction('Name'))
    .toList(String.class); // ['foo', 'bar', 'baz', 'foo', 'bar']
```


### `public virtual ObjectEnumerable mapToObject(String fieldName)`

Returns a new `ObjectEnumerable` with `Object` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'qux');
Account parent2 = new Account(Name = 'fred');
Account acc1 = new Account(Name = 'foo', Parent = parent1);
Account acc2 = new Account(Name = 'bar', Parent = parent2);
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
    .mapToObject('Name')
    .toList(String.class); // ['foo', 'bar', 'baz']
List<String> parentNames = [SObjectEnumerable].of(accounts)
    .mapToObject('Parent?.Name')
    .toList(String.class); // ['qux', 'fred', null]
```


### `public virtual ObjectEnumerable mapToObject(SObjectField field)`

Returns a new `ObjectEnumerable` with `Object` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`ObjectEnumerable`|the new `ObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo');
Account acc2 = new Account(Name = 'bar');
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
    .mapToObject(Account.Name)
    .toList(String.class); // ['foo', 'bar', 'baz']
```


### `public SObjectEnumerable flatMapTo(IFunction mapper)`

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
public class MapPayloadToContacts extends Function {
    public override Object apply(Object o) {
        Account acc = ((Account) o);
        String payload = acc?.Payload__c;
        if (String.isBlank(payload)) { return null; }
        return [SObjectEnumerable].of((List<Contact>) JSON.deserialize(payload, List<Contact>.class))
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
List<Contact> contacts = [SObjectEnumerable].of(accounts)
    .flatMapTo(new MapPayloadToContacts())
    .toList(); //
[
  { LastName: 'qux', AccountId: '001000000000001AAA' },
  { LastName: 'fred', AccountId: '001000000000001AAA' },
  { LastName: 'thud', AccountId: '001000000000002AAA' }
]
```


### `public virtual SObjectEnumerable flatMapTo(String fieldName)`

Returns a new `SObjectEnumerable` with `SObject` elements as a result of replacing each element with the contents of a mapped iterable according to child relationship `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the child relationship field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Contact con1 = new Contact(LastName = 'qux');
Contact con2 = new Contact(LastName = 'fred');
Contact con3 = new Contact(LastName = 'thud');
Account acc1 = new Account(Name = 'foo', Contacts = new List<Contact>{ con1, con2 }); // pseudo assignment
Account acc2 = new Account(Name = 'bar', Contacts = new List<Contact>{ con3 });
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Contact> contacts = [SObjectEnumerable].of(accounts)
    .flatMapTo('Contacts')
    .toList(); //
[
  { LastName: 'qux' },
  { LastName: 'fred' },
  { LastName: 'thud' }
]
```


### `public virtual SObjectEnumerable flatMapTo(SObjectField field)`

Returns a new `SObjectEnumerable` with `SObject` elements as a result of replacing each element with the contents of a mapped iterable according to child relationship `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the child relationship field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Contact con1 = new Contact(LastName = 'qux');
Contact con2 = new Contact(LastName = 'fred');
Contact con3 = new Contact(LastName = 'thud');
Account acc1 = new Account(Name = 'foo', Contacts = new List<Contact>{ con1, con2 }); // pseudo assignment
Account acc2 = new Account(Name = 'bar', Contacts = new List<Contact>{ con3 });
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Contact> contacts = [SObjectEnumerable].of(accounts)
    .flatMapTo(Contact.AccountId)
    .toList(); //
[
  { LastName: 'qux' },
  { LastName: 'fred' },
  { LastName: 'thud' }
]
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
|`IntEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class MapToNumberOfEmployees extends Function {
    public override Object apply(Object o) {
        Account acc = ((Account) o);
        List<Account> childAccounts = acc?.ChildAccounts;
        if (childAccounts?.isEmpty() != false) { return null; }
        return [SObjectEnumerable].of(childAccounts).mapToInt(Account.NumberOfEmployees);
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
List<Integer> numberOfEmployees = [SObjectEnumerable].of(parentAccounts)
    .flatMapToInt(new MapToNumberOfEmployees())
    .toList(); // [100, 200, 500]
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
public class MapToNumberOfEmployees extends Function {
    public override Object apply(Object o) {
        Account acc = ((Account) o);
        List<Account> childAccounts = acc?.ChildAccounts;
        if (childAccounts?.isEmpty() != false) { return null; }
        return [SObjectEnumerable].of(childAccounts).mapToLong(Account.NumberOfEmployees);
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
List<Long> numberOfEmployees = [SObjectEnumerable].of(parentAccounts)
    .flatMapToLong(new MapToNumberOfEmployees())
    .toList(); // [100, 200, 500]
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
public class MapToAnnualRevenue extends Function {
    public override Object apply(Object o) {
        Account acc = ((Account) o);
        List<Account> childAccounts = acc?.ChildAccounts;
        if (childAccounts?.isEmpty() != false) { return null; }
        return [SObjectEnumerable].of(childAccounts).mapToDouble(Account.AnnualRevenue);
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
List<Double> annualRevenues = [SObjectEnumerable].of(parentAccounts)
    .flatMapToDouble(new MapToAnnualRevenue())
    .toList(); // [10.8, 5.5, 6.0]
```


### `public ObjectEnumerable flatMapToObject(IFunction mapper)`

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
public class MapToName extends Function {
    public override Object apply(Object o) {
        Account acc = ((Account) o);
        List<Account> childAccounts = acc?.ChildAccounts;
        if (childAccounts?.isEmpty() != false) { return null; }
        return [SObjectEnumerable].of(childAccounts).mapToObject(Account.Name);
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
List<String> names = (List<String>) [SObjectEnumerable].of(parentAccounts)
    .flatMapToObject(new MapToName())
    .toList(String.class); // ['qux', fred', 'thud']
```


### `public SObjectEnumerable forEach(IConsumer consumer)`

Returns a `SObjectEnumerable` after performing `consumer` action on each element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`consumer`|the non-interfering, stateless action to be performed on each element. Expected to operate via side effects.|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|this `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `consumer` is null|

#### Example
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
List<Account> processedAccounts = [SObjectEnumerable].of(accounts)
    .forEach(new SetRatingConsumer())
    .toList(); //
[
  { AnnualRevenue: 100, Rating: 'Cold' },
  { AnnualRevenue: 200, Rating: 'Warm' },
  { AnnualRevenue: 500, Rating: 'Hot' }
]
```


### `public virtual SObjectEnumerable forEach(String fieldName, Object value)`

Returns a new `SObjectEnumerable` after setting `value` for `fieldName` on each `SObject` element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'qux', AnnualRevenue = 1000);
Account parent2 = new Account(Name = 'fred', AnnualRevenue = 2000);
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100, Parent = parent1);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200, Parent = parent2);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Account> processedAccounts = [SObjectEnumerable].of(accounts)
    .forEach('AnnualRevenue', 0)
    .toList(); //
[
  { Name: 'foo', AnnualRevenue: 0 },
  { Name: 'bar', AnnualRevenue: 0 },
  { Name: 'baz', AnnualRevenue: 0 }
]
List<Account> processedParentAccounts = [SObjectEnumerable].of(accounts)
    .forEach('Parent?.AnnualRevenue', 0)
    .mapTo('Parent')
    .toList(); //
[
  { Name: 'qux', AnnualRevenue: 100 },
  { Name: 'fred', AnnualRevenue: 200 },
  null
]
```


### `public virtual SObjectEnumerable forEach(SObjectField field, Object value)`

Returns a new `SObjectEnumerable` after setting `value` for `field` on each `SObject` element. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the value|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Account> processedAccounts = [SObjectEnumerable].of(accounts)
    .forEach(Account.AnnualRevenue, 0)
    .toList(); //
[
  { Name: 'foo', AnnualRevenue: 0 },
  { Name: 'bar', AnnualRevenue: 0 },
  { Name: 'baz', AnnualRevenue: 0 }
]
```


### `public SObjectEnumerable sort()`

Returns a `SObjectEnumerable` with sorted elements in ascending order. <p>Stateful Intermediate Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Account> sortedAccounts = [SObjectEnumerable].of(accounts)
    .sort()
    .toList(); //
[
  { Name: 'bar', AnnualRevenue: 200 },
  { Name: 'baz', AnnualRevenue: 500 },
  { Name: 'foo', AnnualRevenue: 100 }
]
```


### `public SObjectEnumerable sort(IComparer comparer)`

Returns a new `SObjectEnumerable` with sorted elements according to `comparer`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

#### Example
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
List<Account> sortedAccounts = [SObjectEnumerable].of(accounts)
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


### `public virtual SObjectEnumerable sort(SortOrder order)`

Returns a new `SObjectEnumerable` with sorted `SObject` elements considering `order`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `order` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Account> sortedAccounts = [SObjectEnumerable].of(accounts)
    .sort(SortOrder.DESCENDING)
    .toList(); //
[
  { Name: 'foo', AnnualRevenue: 100 },
  { Name: 'baz', AnnualRevenue: 500 },
  { Name: 'bar', AnnualRevenue: 200 }
]
```


### `public virtual SObjectEnumerable sort(String fieldName)`

Returns a new `SObjectEnumerable` with sorted `SObject` elements according to `fieldName`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
Account acc4 = new Account(Name = 'qux', AnnualRevenue = 600);
Account acc5 = new Account(Name = 'fred', AnnualRevenue = 800);
Account acc6 = new Account(Name = 'thud', AnnualRevenue = 100);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6 };
List<Account> sortedAccountsByName = [SObjectEnumerable].of(accounts)
    .sort('Name')
    .toList(); //
[
  { Name: 'bar', AnnualRevenue: 200 },
  { Name: 'baz', AnnualRevenue: 500 },
  { Name: 'foo', AnnualRevenue: 100 },
  { Name: 'fred', AnnualRevenue: 800 },
  { Name: 'qux', AnnualRevenue: 600 },
  { Name: 'thud', AnnualRevenue: 100 }
]
```


### `public virtual SObjectEnumerable sort(String fieldName, SortOrder order)`

Returns a new `SObjectEnumerable` with sorted `SObject` elements taken from `fieldName` values considering `order`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `order` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
Account acc4 = new Account(Name = 'qux', AnnualRevenue = 600);
Account acc5 = new Account(Name = 'fred', AnnualRevenue = 800);
Account acc6 = new Account(Name = 'thud', AnnualRevenue = 100);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6 };
List<Account> sortedAccountsByName = [SObjectEnumerable].of(accounts)
    .sort('Name', SortOrder.DESCENDING)
    .toList(); //
[
  { Name: 'thud', AnnualRevenue: 100 },
  { Name: 'qux', AnnualRevenue: 600 },
  { Name: 'fred', AnnualRevenue: 800 },
  { Name: 'foo', AnnualRevenue: 100 },
  { Name: 'baz', AnnualRevenue: 500 },
  { Name: 'bar', AnnualRevenue: 200 }
]
```


### `public virtual SObjectEnumerable sort(SObjectField field)`

Returns a new `SObjectEnumerable` with sorted `SObject` elements according to `field`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
Account acc4 = new Account(Name = 'qux', AnnualRevenue = 600);
Account acc5 = new Account(Name = 'fred', AnnualRevenue = 800);
Account acc6 = new Account(Name = 'thud', AnnualRevenue = 100);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6 };
List<Account> sortedAccountsByName = [SObjectEnumerable].of(accounts)
    .sort(Account.Name)
    .toList(); //
[
  { Name: 'bar', AnnualRevenue: 200 },
  { Name: 'baz', AnnualRevenue: 500 },
  { Name: 'foo', AnnualRevenue: 100 },
  { Name: 'fred', AnnualRevenue: 800 },
  { Name: 'qux', AnnualRevenue: 600 },
  { Name: 'thud', AnnualRevenue: 100 }
]
```


### `public virtual SObjectEnumerable sort(SObjectField field, SortOrder order)`

Returns a new `SObjectEnumerable` with sorted `SObject` elements taken from `field` values considering `order`. <p>Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`order`|the sort order|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the new `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `order` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', AnnualRevenue = 100);
Account acc2 = new Account(Name = 'bar', AnnualRevenue = 200);
Account acc3 = new Account(Name = 'baz', AnnualRevenue = 500);
Account acc4 = new Account(Name = 'qux', AnnualRevenue = 600);
Account acc5 = new Account(Name = 'fred', AnnualRevenue = 800);
Account acc6 = new Account(Name = 'thud', AnnualRevenue = 100);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4, acc5, acc6 };
List<Account> sortedAccountsByName = [SObjectEnumerable].of(accounts)
    .sort(Account.Name, SortOrder.DESCENDING)
    .toList(); //
[
  { Name: 'thud', AnnualRevenue: 100 },
  { Name: 'qux', AnnualRevenue: 600 },
  { Name: 'fred', AnnualRevenue: 800 },
  { Name: 'foo', AnnualRevenue: 100 },
  { Name: 'baz', AnnualRevenue: 500 },
  { Name: 'bar', AnnualRevenue: 200 }
]
```


### `public SObjectEnumerable lim(Integer lim)`

Returns a `SObjectEnumerable` with first `lim` elements. <p>Short-circuiting Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`lim`|the number of elements to limit|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `lim` is less than 0|
|`NullPointerException`|if `lim` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo');
Account acc2 = new Account(Name = 'bar');
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Account> first2 = [SObjectEnumerable].of(accounts)
    .lim(2)
    .toList(); //
[
  { Name: 'foo' },
  { Name: 'bar' }
]
```


### `public SObjectEnumerable skip(Integer n)`

Returns a new `SObjectEnumerable` that skips first `n` elements and returns remaining elements. <p>Stateful Intermediate Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`n`|the number of elements to skip|

#### Returns

|Type|Description|
|---|---|
|`SObjectEnumerable`|the `SObjectEnumerable`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if `n` is less than 0|
|`NullPointerException`|if `n` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo');
Account acc2 = new Account(Name = 'bar');
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Account> rest = [SObjectEnumerable].of(accounts)
    .skip(1)
    .toList(); //
[
  { Name: 'bar' },
  { Name: 'baz' }
]
```


### `public SObject reduce(SObject identity, IBiOperator accumulator)`

Performs a reduction on `SObject` elements, using `identity` value and an associative `accumulator` function, and returns the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`identity`|the identity value for `accumulator`|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`SObject`|the `SObject` result of the reduction|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

#### Example
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
Account total = (Account) [SObjectEnumerable].of(accounts)
    .reduce(identity, new AnnualRevenueAccumulator()); // { Name: 'total', AnnualRevenue: 800 }
```


### `public Optional reduce(IBiOperator accumulator)`

Performs a reduction on `SObject` elements, using `identity` value and associative `accumulator` function, and returns an `Optional` SObject describing the reduced value. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`accumulator`|the associative, non-interfering, stateless accumulation function|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject result of the reduction|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `accumulator` is null|

#### Example
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
Account total = (Account) [SObjectEnumerable].of(accounts)
    .reduce(new AccountAccumulator())
    .get(); // { Name: 'foo;bar;baz', AnnualRevenue: 800 }
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
Set<String> names = (Set<String>) [SObjectEnumerable].of(accounts)
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
    [SObjectEnumerable].of(accounts)
    .collect(groupByNumberOfEmployeesCollector); //
{
  100: ['foo', 'qux'],
  300: ['baz', 'bar'],
  400: ['bar']
}
// The same result can be obtained by using built-in Collectors
Map<Integer, List<String>> namesByNumberOfEmployees1 = (Map<Integer, List<String>>)
    [SObjectEnumerable].of(accounts)
    .collect(
        SObjectCollectors.groupingByInt('NumberOfEmployees', 'Name')
            .cast(Map<Integer, List<String>>.class)
    );
```


### `public Optional find(IPredicate predicate)`

Returns an `Optional` SObject describing the first element that matches `predicate`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
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
Account firstFound = (Account) [SObjectEnumerable].of(accounts)
    .find(new ContainsPredicate('Name', 'a'))
    .get(); // { Name: 'bar', NumberOfEmployees: 200 }
```


### `public virtual Optional find(String fieldName, Object value)`

Returns an `Optional` SObject describing the first element which has `value` of `fieldName`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
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
Account firstAccountWithHotRating = (Account) [SObjectEnumerable].of(accounts)
    .find('Rating', 'Hot')
    .get(); // { Name: 'baz', Rating: 'Hot' }
Contact firstContactWithHotRatingAccount = (Contact) [SObjectEnumerable].of(contacts)
    .find('Account?.Rating', 'Hot')
    .get(); // { LastName: 'baz', Account: acc3 }
```


### `public virtual Optional find(SObjectField field, Object value)`

Returns an `Optional` SObject describing the first element which has `value` of `field`. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Cold');
Account acc2 = new Account(Name = 'bar', Rating = 'Warm');
Account acc3 = new Account(Name = 'baz', Rating = 'Hot');
Account acc4 = new Account(Name = 'qux');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4 };
Account firstAccountWithHotRating = (Account) [SObjectEnumerable].of(accounts)
    .find(Account.Rating, 'Hot')
    .get(); // { Name: 'baz', Rating: 'Hot' }
```


### `public Boolean every(IPredicate predicate)`

Returns whether all elements match `predicate`. If `SObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
Boolean doesEveryAccountNameContainA = [SObjectEnumerable].of(accounts)
    .every(new ContainsPredicate('Name', 'a')); // false
```


### `public virtual Boolean every(String fieldName, Object value)`

Returns whether all `SObject` elements have `field` `value`. If `SObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
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
Boolean isEveryAccountWithHotRating = [SObjectEnumerable].of(accounts)
    .every('Rating', 'Hot'); // false
Boolean isEveryContactWithHotRatingAccount = [SObjectEnumerable].of(contacts)
    .every('Account?.Rating', 'Hot'); // false
```


### `public virtual Boolean every(SObjectField field, Object value)`

Returns whether all `SObject` elements have `field` `value`. If `SObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Cold');
Account acc2 = new Account(Name = 'bar', Rating = 'Warm');
Account acc3 = new Account(Name = 'baz', Rating = 'Hot');
Account acc4 = new Account(Name = 'qux');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4 };
Boolean isEveryAccountWithHotRating = [SObjectEnumerable].of(accounts)
    .every(Account.Rating, 'Hot'); // false
```


### `public Boolean some(IPredicate predicate)`

Returns whether some element matches `predicate`. If `SObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

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
Boolean doesSomeAccountNameContainA = [SObjectEnumerable].of(accounts)
    .some(new ContainsPredicate('Name', 'a')); // true
```


### `public virtual Boolean some(String fieldName, Object value)`

Returns whether some `SObject` element has `field` `value`. If `SObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
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
Boolean isSomeAccountWithHotRating = [SObjectEnumerable].of(accounts)
    .every('Rating', 'Hot'); // true
Boolean isSomeContactWithHotRatingAccount = [SObjectEnumerable].of(contacts)
    .every('Account?.Rating', 'Hot'); // true
```


### `public virtual Boolean some(SObjectField field, Object value)`

Returns whether some `SObject` element has `field` `value`. If `SObjectEnumerable` is empty then `false` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Cold');
Account acc2 = new Account(Name = 'bar', Rating = 'Warm');
Account acc3 = new Account(Name = 'baz', Rating = 'Hot');
Account acc4 = new Account(Name = 'qux');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4 };
Boolean isSomeAccountWithHotRating = [SObjectEnumerable].of(accounts)
    .every(Account.Rating, 'Hot'); // true
```


### `public virtual Boolean none(IPredicate predicate)`

Returns whether no `SObject` elements match `predicate`. If `SObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

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


### `public virtual Boolean none(String fieldName, Object value)`

Returns whether no `SObject` elements have `field` `value`. If `SObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
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


### `public virtual Boolean none(SObjectField field, Object value)`

Returns whether no `SObject` elements have `field` `value`. If `SObjectEnumerable` is empty then `true` is returned. <p>Short-circuiting Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the field value|

#### Returns

|Type|Description|
|---|---|
|`Boolean`|`true` or `false`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Cold');
Account acc2 = new Account(Name = 'bar', Rating = 'Warm');
Account acc3 = new Account(Name = 'baz', Rating = 'Hot');
Account acc4 = new Account(Name = 'qux');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3, acc4 };
Boolean isNoneAccountWithHotRating = [SObjectEnumerable].of(accounts)
    .none(Account.Rating, 'Hot'); // false
```


### `public virtual Optional max(IComparer comparer)`

Returns an `Optional` describing the maximum `SObject` element according to `comparer`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject describing the result|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

#### Example
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


### `public virtual Optional max(String fieldName)`

Returns an `Optional` SObject describing the maximum `SObject` element according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject describing the result|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
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


### `public virtual Optional max(SObjectField field)`

Returns an `Optional` describing the maximum `SObject` element according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject describing the result|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
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


### `public virtual Optional min(IComparer comparer)`

Returns an `Optional` describing the minimum `SObject` element according to `comparer`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`comparer`|the comparer|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject describing the result|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `comparer` is null|

#### Example
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


### `public virtual Optional min(String fieldName)`

Returns an `Optional` describing the minimum `SObject` element according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject describing the result|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
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


### `public virtual Optional min(SObjectField field)`

Returns an `Optional` describing the minimum `SObject` element according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the `Optional` SObject describing the result|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
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


### `public virtual Double sum(IFunction classifier)`

Returns the arithmetic sum of values returned by `classifier` function. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`Double`|the sum of elements returned by function|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

#### Example
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


### `public virtual Double sum(String fieldName)`

Returns the arithmetic sum of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field to sum values|

#### Returns

|Type|Description|
|---|---|
|`Double`|the sum of field values|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
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


### `public virtual Double sum(SObjectField field)`

Returns the arithmetic sum of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field to sum values|

#### Returns

|Type|Description|
|---|---|
|`Double`|field sum of field values|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Double sumOfNumberOfEmployees = [SObjectEnumerable].of(accounts)
    .sum(Account.NumberOfEmployees); // 600.0
```


### `public virtual Optional avg(IFunction classifier)`

Returns the arithmetic mean of values returned by `classifier` function. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`classifier`|the classifier function|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the arithmetic mean of elements returned by function|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `classifier` is null|

#### Example
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


### `public virtual Optional avg(String fieldName)`

Returns the arithmetic mean of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field to sum values|

#### Returns

|Type|Description|
|---|---|
|`Optional`|the arithmetic mean of field values|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
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


### `public virtual Optional avg(SObjectField field)`

Returns the arithmetic mean of field values of `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field to sum values|

#### Returns

|Type|Description|
|---|---|
|`Optional`|field arithmetic mean of field values|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Double avgOfNumberOfEmployees = [SObjectEnumerable].of(accounts)
    .avg(Account.NumberOfEmployees); // 200.0
```


### `public Integer count()`

Returns the count of elements. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Integer`|the count of elements|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Integer count = [SObjectEnumerable].of(accounts)
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
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
[SObjectEnumerable].of(accounts)
    .isEmpty(); // false
[SObjectEnumerable].of(new List<Account>()))
    .isEmpty(); // true
```


### `public List<SObject> toList()`

Accumulates elements into a `List<SObject>`. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`List<SObject>`|the `List<SObject>` containing the enumerable elements|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', NumberOfEmployees = 100);
Account acc2 = new Account(Name = 'bar', NumberOfEmployees = 200);
Account acc3 = new Account(Name = 'baz', NumberOfEmployees = 300);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
List<Account> accounts1 = [SObjectEnumerable].of(accounts)
    .skip(1)
    .toList(); //
[
  { Name: 'bar', NumberOfEmployees: 200 },
  { Name: 'baz', NumberOfEmployees: 200 }
]
```


### `public virtual List<Object> toList(IFunction mapper)`

Accumulates elements returned by `mapper` into a `List<Object>`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
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
List<Object> normalizedNames = [SObjectEnumerable].of(accounts)
    .toList(new GetFieldValueToLowerCaseFunction('Name')); // ['foo', 'bar', 'baz', 'foo', 'bar']
```


### `public virtual List<Object> toList(String fieldName)`

Accumulates `Object` elements into a `List<Object>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'Bar'),
    new Account(Name = 'baz'),
    new Account(Name = 'Foo'),
    new Account(Name = 'bar')
};
List<Object> accountNames = [SObjectEnumerable].of(accounts)
    .toList('Name'); // ['foo', 'Bar', 'baz', 'Foo', 'bar']
```


### `public virtual List<Object> toList(SObjectField field)`

Accumulates `Object` elements into a `List<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'Bar'),
    new Account(Name = 'baz'),
    new Account(Name = 'Foo'),
    new Account(Name = 'bar')
};
List<Object> accountNames = [SObjectEnumerable].of(accounts)
    .toList(Account.Name); // ['foo', 'Bar', 'baz', 'Foo', 'bar']
```


### `public List<Object> toList(IFunction mapper, Type elementType)`

Accumulates `T` elements into a `List<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the field|
|`elementType`|thr type of the element|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements, which can be cast to `List<T>`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` or `elementType` is null|

#### Example
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
List<String> normalizedNames = (List<String>) [SObjectEnumerable].of(accounts)
    .toList(new GetFieldValueToLowerCaseFunction('Name'), String.class);
    // ['foo', 'bar', 'baz', 'foo', 'bar']
```


### `public virtual List<Object> toList(String fieldName, Type elementType)`

Accumulates `T` elements into a `List<Object>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`elementType`|the type of the element|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements, which can be cast to `List<T>`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null or `elementType` is null|

#### Example
```apex
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'Bar'),
    new Account(Name = 'baz'),
    new Account(Name = 'Foo'),
    new Account(Name = 'bar')
};
List<String> accountNames = (List<String>) [SObjectEnumerable].of(accounts)
    .toList('Name', String.class); // ['foo', 'Bar', 'baz', 'Foo', 'bar']
```


### `public virtual List<Object> toList(SObjectField field, Type elementType)`

Accumulates `Object` elements into a `List<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`elementType`|the type of the element|

#### Returns

|Type|Description|
|---|---|
|`List<Object>`|the `List<Object>` containing the collected elements, which can be cast to `List<T>`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` or `elementType` is null|

#### Example
```apex
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'Bar'),
    new Account(Name = 'baz'),
    new Account(Name = 'Foo'),
    new Account(Name = 'bar')
};
List<String> accountNames = (List<String>) [SObjectEnumerable].of(accounts)
    .toList(Account.Name, String.class); // ['foo', 'Bar', 'baz', 'Foo', 'bar']
```


### `public Set<SObject> toSet()`

Accumulates elements into a `Set<SObject>` cannot be cast. <p>Terminal Operation.</p>

#### Returns

|Type|Description|
|---|---|
|`Set<SObject>`|the `Set<SObject>` containing the enumerable elements|

#### Example
```apex
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'bar'),
    new Account(Name = 'baz')
};
Set<SObject> sobjects = [ObjectEnumerable].of(accounts)
    .skip(1)
    .toSet(); //
[
  { Name: 'bar' },
  { Name: 'baz' }
]
```


### `public Set<Object> toSet(IFunction mapper)`

Accumulates elements returned by `mapper` into a `List<Object>`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`Set<Object>`|the `List<Object>` containing the collected elements|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
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
Set<Object> normalizedNames = [SObjectEnumerable].of(accounts)
    .toSet(new GetFieldValueToLowerCaseFunction('Name')); // ['foo', 'bar', 'baz']
```


### `public virtual Set<Object> toSet(String fieldName)`

Accumulates `Object` elements into a `Set<Object>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Set<Object>`|the `Set<Object>` containing the collected elements field values|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'bar'),
    new Account(Name = 'baz'),
    new Account(Name = 'foo'),
    new Account(Name = 'bar')
};
Set<Object> names = [SObjectEnumerable].of(accounts)
    .toSet('Name'); // ['foo', 'bar', 'baz']
```


### `public virtual Set<Object> toSet(SObjectField field)`

Accumulates `Object` elements into a `Set<Object>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Set<Object>`|the `Set<Object>` containing the collected elements field values|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
List<Account> accounts = new List<Account>{
    new Account(Name = 'foo'),
    new Account(Name = 'bar'),
    new Account(Name = 'baz'),
    new Account(Name = 'foo'),
    new Account(Name = 'bar')
};
Set<Object> names = [SObjectEnumerable].of(accounts)
    .toSet(Account.Name); // [ 'foo', 'bar', 'baz']
```


### `public virtual Set<Id> toIdSet()`

Accumulates `Id` elements into a `Set<Id>`. <p>Terminal Operation.</p> <p>Unlike `new Map<Id, SObject>(sobjects).keySet()` mapping approach this one doesn't throw ListException if some of the element has nullish Id.</p>

#### Returns

|Type|Description|
|---|---|
|`Set<Id>`|the `Set<Id>` containing the enumerable element field values|

#### Example
```apex
List<Account> accounts = new List<Account>{
    new Account(Id = '001000000000001AAA'),
    new Account(Id = '001000000000002AAA'),
    new Account(Id = '001000000000003AAA'),
    new Account()
};
Set<Id> ids = [SObjectEnumerable].of(accounts)
    .toIdSet(); // [ '001000000000001AAA', '001000000000002AAA', '001000000000003AAA', null]
```


### `public Set<Id> toIdSet(IFunction mapper)`

Accumulates elements returned by `mapper` into a `Set<Id>`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`Set<Id>`|the `Set<Id>` containing the collected elements|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class GetChildrenIdOfTheLatestFunction extends Function {
    private final String childRelField;
    public GetChildrenIdOfTheLatestFunction(String childRelField) { this.childRelField = childRelField; }
    public override Object apply(Object o) {
        SObject sObj = (Account) o;
        List<SObject> children = sObj.getSObjects(childRelField);
        if (children?.isEmpty() != false) {
            return null;
        }
        return [SObjectEnumerable].of(children)
            .sort('CreatedDate')
            .toList()
            [0]
            .Id;
    }
}
Contact con1 = new Contact(Id = '003000000000001AAA', LastName = 'qux', CreatedDate = '2025-10-10 20:00:00');
Contact con2 = new Contact(Id = '003000000000002AAA', LastName = 'fred', CreatedDate = '2025-10-11 21:00:00');
Contact con3 = new Contact(Id = '003000000000003AAA', LastName = 'thud', CreatedDate = '2025-10-12 22:00:00');
Account acc1 = new Account(Name = 'foo', Contacts = new List<Contact>{ con1, con2 }); // pseudo assignment
Account acc2 = new Account(Name = 'bar', Contacts = new List<Contact>{ con3 });
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Set<Id> contactIds = [SObjectEnumerable].of(accounts)
    .toIdSet(new GetChildrenIdOfTheLatestFunction('Contacts')); //
['003000000000002AAA', '003000000000003AAA', null]
```


### `public virtual Set<Id> toIdSet(String fieldName)`

Accumulates `Id` elements into a `Set<Id>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Set<Id>`|the `Set<Id>` containing the collected elements field values|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'qux', OwnerId = '005000000000004AAA');
Account parent2 = new Account(Name = 'fred', OwnerId = '005000000000005AAA');
Account acc1 = new Account(Name = 'foo', OwnerId = '005000000000001AAA', Parent = parent1);
Account acc2 = new Account(Name = 'bar', OwnerId = '005000000000002AAA', Parent = parent2);
Account acc3 = new Account(Name = 'baz', OwnerId = '005000000000003AAA');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Set<Id> ownerIds = [SObjectEnumerable].of(accounts)
    .toIdSet('OwnerId'); //
['005000000000001AAA', '005000000000002AAA', '005000000000003AAA']
Set<Id> parentOwnerIds = [SObjectEnumerable].of(accounts)
    .toIdSet('Parent?.OwnerId'); //
['005000000000004AAA', '005000000000005AAA', null]
```


### `public virtual Set<Id> toIdSet(SObjectField field)`

Accumulates `Id` elements into a `Set<Id>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Set<Id>`|the `Set<Id>` containing the collected elements field values|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', OwnerId = '005000000000001AAA');
Account acc2 = new Account(Name = 'bar', OwnerId = '005000000000002AAA');
Account acc3 = new Account(Name = 'baz', OwnerId = '005000000000003AAA');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Set<Id> ownerIds = [SObjectEnumerable].of(accounts)
    .toIdSet(Account.OwnerId); //
['005000000000001AAA', '005000000000002AAA', '005000000000003AAA']
```


### `public Set<String> toStringSet(IFunction mapper)`

Accumulates elements returned by `mapper` into a `Set<String>`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`mapper`|the mapping function|

#### Returns

|Type|Description|
|---|---|
|`Set<String>`|the `Set<String>` containing the collected elements|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

#### Example
```apex
public class GetChildrenFieldOfTheLatestFunction extends Function {
    private final String childRelField;
    private final String fieldName;
    public GetChildrenFieldOfTheLatestFunction(String childRelField, String fieldName) {
        this.childRelField = childRelField;
        this.fieldName = fieldName;
    }
    public override Object apply(Object o) {
        SObject sObj = (Account) o;
        List<SObject> children = sObj.getSObjects(childRelField);
        if (children?.isEmpty() != false) {
            return null;
        }
        return [SObjectEnumerable].of(children)
            .sort('CreatedDate')
            .toList()
            [0]
            .get(fieldName);
    }
}
Contact con1 = new Contact(Id = '003000000000001AAA', LastName = 'qux', CreatedDate = '2025-10-10 20:00:00');
Contact con2 = new Contact(Id = '003000000000002AAA', LastName = 'fred', CreatedDate = '2025-10-11 21:00:00');
Contact con3 = new Contact(Id = '003000000000003AAA', LastName = 'thud', CreatedDate = '2025-10-12 22:00:00');
Account acc1 = new Account(Name = 'foo', Contacts = new List<Contact>{ con1, con2 }); // pseudo assignment
Account acc2 = new Account(Name = 'bar', Contacts = new List<Contact>{ con3 });
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Set<String> contactLastNames = [SObjectEnumerable].of(accounts)
    .toStringSet(new GetChildrenFieldOfTheLatestFunction('Contacts', 'LastName')); //
['fred', 'thud', null]
```


### `public virtual Set<String> toStringSet(String fieldName)`

Accumulates `String` elements into a `Set<String>` according to `fieldName`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Set<String>`|the `Set<String>` containing the collected elements field values|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'qux');
Account parent2 = new Account(Name = 'fred');
Account acc1 = new Account(Name = 'foo', Parent = parent1);
Account acc2 = new Account(Name = 'bar', Parent = parent2);
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Set<String> names = [SObjectEnumerable].of(accounts)
    .toStringSet('Name'); // ['foo', 'bar', 'baz']
Set<String> parentNames = [SObjectEnumerable].of(accounts)
    .toStringSet('Parent?.Name'); // ['qux', 'fred', null]
```


### `public virtual Set<String> toStringSet(SObjectField field)`

Accumulates `String` elements into a `Set<String>` according to `field`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Set<String>`|the `Set<String>`containing the collected elements field values|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo');
Account acc2 = new Account(Name = 'bar');
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Set<String> names = [SObjectEnumerable].of(accounts)
    .toStringSet(Account.Name); // ['foo', 'bar', 'baz']
```


### `public Map<Id,SObject> toMap()`

Accumulates elements into a `Map<Id, SObject>`. <p>Terminal Operation.</p> <p><strong>Note: </strong></p> <p>Unlike `new Map<Id, SObject>(sobjects)` mapping approach this one doesn't throw ListException if some of the element has nullish Id.</p>

#### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the collected elements|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|

#### Example
```apex
Account acc1 = new Account(Id = '001000000000001AAA', Name = 'foo');
Account acc2 = new Account(Id = '001000000000002AAA', Name = 'bar');
Account acc3 = new Account(Id = '001000000000003AAA', Name = 'baz');
Account acc4 = new Account(Name = 'qux');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<Id, SObject> accountById = [SObjectEnumerable].of(accounts)
    .toMap(); //
{
  '005000000000001AAA': { Id: '001000000000001AAA', Name = 'foo' },
  '001000000000002AAA': { Id: '001000000000002AAA', Name = 'bar' },
  '001000000000003AAA': { Id: '001000000000003AAA', Name = 'baz' },
   null: { Name: 'foo' }
}
```


### `public Map<Id,SObject> toByIdMap(IFunction keyMapper, Type valueType)`

Accumulates `SObject` elements into a `Map<Id, ? extends SObject>` of specific `valueType` whose keys are produced by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueType`|the value type|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the collected elements|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates, which can be cast to `Map<Id, T>`|
|`NullPointerException`|if `keyMapper` or `valueType` is null|

#### Example
```apex
public class GetChildrenIdOfTheLatestFunction extends Function {
    private final String childRelField;
    public GetChildrenIdOfTheLatestFunction(String childRelField) { this.childRelField = childRelField; }
    public override Object apply(Object o) {
        SObject sObj = (Account) o;
        List<SObject> children = sObj.getSObjects(childRelField);
        if (children?.isEmpty() != false) {
            return null;
        }
        return [SObjectEnumerable].of(children)
            .sort('CreatedDate')
            .toList()
            [0]
            .Id;
    }
}
Contact con1 = new Contact(Id = '003000000000001AAA', LastName = 'qux', CreatedDate = '2025-10-10 20:00:00');
Contact con2 = new Contact(Id = '003000000000002AAA', LastName = 'fred', CreatedDate = '2025-10-11 21:00:00');
Contact con3 = new Contact(Id = '003000000000003AAA', LastName = 'thud', CreatedDate = '2025-10-12 22:00:00');
Account acc1 = new Account(
    Id = '001000000000001AAA',
    Name = 'foo',
    Contacts = new List<Contact>{ con1, con2 }
); // pseudo assignment
Account acc2 = new Account(
    Id = '001000000000002AAA',
    Name = 'bar',
    Contacts = new List<Contact>{ con3 }
);
Account acc3 = new Account(Id = '001000000000003AAA', Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<Id, Account> accountByLatestContactId = (Map<Id, Account>) [SObjectEnumerable].of(accounts)
    .toByIdMap(new GetChildrenIdOfTheLatestFunction('Contacts'), Account.class); //
{
  '003000000000002AAA': { Id: '001000000000001AAA', Name: 'foo' },
  '003000000000003AAA': { Id: '001000000000002AAA', Name: 'bar' },
   null: { Id: '001000000000003AAA', Name: 'baz' }
}
```


### `public virtual Map<Id,SObject> toByIdMap(String fieldName, Type valueType)`

Accumulates `SObject` elements into a `Map<Id, SObject>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`valueType`|the value type|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the collected elements, which can be cast to `Map<Id, T>`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `valueType` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'qux', OwnerId = '005000000000004AAA');
Account parent2 = new Account(Name = 'fred', OwnerId = '005000000000005AAA');
Account acc1 = new Account(Name = 'foo', OwnerId = '005000000000001AAA', Parent = parent1);
Account acc2 = new Account(Name = 'bar', OwnerId = '005000000000002AAA', Parent = parent2);
Account acc3 = new Account(Name = 'baz', OwnerId = '005000000000003AAA');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<Id, Account> accountByOwnerId = (Map<Id, Account>) [SObjectEnumerable].of(accounts)
    .toByIdMap('OwnerId', Account.SObject); //
{
  '005000000000001AAA': { Name: 'foo', OwnerId: '005000000000001AAA' },
  '005000000000002AAA': { Name: 'bar', OwnerId: '005000000000002AAA' },
  '005000000000003AAA': { Name: 'baz', OwnerId: '005000000000003AAA' }
}
Map<Id, Account> accountByParentOwnerId = (Map<Id, Account>) [SObjectEnumerable].of(accounts)
    .toByIdMap('Parent?.OwnerId', Account.SObject); //
{
  '005000000000004AAA': { Name: 'foo', OwnerId: '005000000000004AAA' },
  '005000000000005AAA': { Name: 'bar', OwnerId: '005000000000005AAA' },
   null: { Name: 'baz' }
}
```


### `public virtual Map<Id,SObject> toByIdMap(SObjectField field, Type valueType)`

Accumulates `SObject` elements into a `Map<Id, SObject>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`valueType`|the value type|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,SObject>`|the `Map<Id, SObject>` containing the collected elements, which can be cast to `Map<Id, T>`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `field` is null or `valueType` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', OwnerId = '005000000000001AAA');
Account acc2 = new Account(Name = 'bar', OwnerId = '005000000000002AAA');
Account acc3 = new Account(Name = 'baz', OwnerId = '005000000000003AAA');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<Id, Account> accountByOwnerId = (Map<Id, Account>) [SObjectEnumerable].of(accounts)
    .toByIdMap(Account.OwnerId, Account.SObject); //
{
  '005000000000001AAA': { Name: 'foo', OwnerId: '005000000000001AAA' },
  '005000000000002AAA': { Name: 'bar', OwnerId: '005000000000002AAA' },
  '005000000000003AAA': { Name: 'baz', OwnerId: '005000000000003AAA' }
}
```


### `public Map<String,SObject> toByStringMap(IFunction keyMapper, Type valueType)`

Accumulates `SObject` elements into a `Map<String, ? extends SObject>` of specific `valueType` whose keys are produced by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|
|`valueType`|the value type|

#### Returns

|Type|Description|
|---|---|
|`Map<String,SObject>`|the `Map<Id, SObject>` containing the collected elements|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates, which can be cast to `Map<String, T>`|
|`NullPointerException`|if `keyMapper` or `valueType` is null|

#### Example
```apex
public class GetChildrenFieldOfTheLatestFunction extends Function {
    private final String childRelField;
    private final String fieldName;
    public GetChildrenFieldOfTheLatestFunction(String childRelField, String fieldName) {
        this.childRelField = childRelField;
        this.fieldName = fieldName;
    }
    public override Object apply(Object o) {
        SObject sObj = (Account) o;
        List<SObject> children = sObj.getSObjects(childRelField);
        if (children?.isEmpty() != false) {
            return null;
        }
        return [SObjectEnumerable].of(children)
            .sort('CreatedDate')
            .toList()
            [0]
            .get(fieldName);
    }
}
Contact con1 = new Contact(LastName = 'qux', CreatedDate = '2025-10-10 20:00:00');
Contact con2 = new Contact(LastName = 'fred', CreatedDate = '2025-10-11 21:00:00');
Contact con3 = new Contact(LastName = 'thud', CreatedDate = '2025-10-12 22:00:00');
Account acc1 = new Account(
    Name = 'foo',
    Contacts = new List<Contact>{ con1, con2 }
); // pseudo assignment
Account acc2 = new Account(
    Name = 'bar',
    Contacts = new List<Contact>{ con3 }
);
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<String, Account> accountByLatestContactLastName = (Map<String, Account>) [SObjectEnumerable].of(accounts)
    .toByStringMap(new GetChildrenFieldOfTheLatestFunction('Contacts', 'LastName'), Account.class); //
{
  'fred': { Name: 'foo' },
  'thud': { Name: 'bar' },
   null: { Name: 'baz' }
}
```


### `public virtual Map<String,SObject> toByStringMap(String fieldName, Type valueType)`

Accumulates `SObject` elements into a `Map<String, SObject>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`valueType`|the value type|

#### Returns

|Type|Description|
|---|---|
|`Map<String,SObject>`|the `Map<String, SObject>` containing the collected elements, which can be cast to `Map<String, T>`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `valueType` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'qux');
Account parent2 = new Account(Name = 'fred');
Account acc1 = new Account(Name = 'foo', Parent = parent1);
Account acc2 = new Account(Name = 'bar', Parent = parent2);
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<String, Account> accountByName = (Map<String, Account>) [SObjectEnumerable].of(accounts)
    .toByStringMap('Name', Account.SObject); //
{
  'foo': { Name: 'foo' },
  'bar': { Name: 'bar' },
  'baz': { Name: 'baz' }
}
Map<String, Account> accountByParentName = (Map<String, Account>) [SObjectEnumerable].of(accounts)
    .toByStringMap('Parent?.Name', Account.SObject); //
{
  'foo': { Name: 'foo' },
  'bar': { Name: 'bar' },
   null: { Name: 'baz' }
}
```


### `public virtual Map<String,SObject> toByStringMap(SObjectField field, Type valueType)`

Accumulates `SObject` elements into a `Map<String, SObject>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`valueType`|the value type|

#### Returns

|Type|Description|
|---|---|
|`Map<String,SObject>`|the `Map<String, SObject>` containing the collected elements, which can be cast to `Map<String, T>`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalStateException`|if mapped keys contain duplicates|
|`NullPointerException`|if `field` or `valueType` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo');
Account acc2 = new Account(Name = 'bar');
Account acc3 = new Account(Name = 'baz');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<String, Account> accountByName = (Map<String, Account>) [SObjectEnumerable].of(accounts)
    .toByStringMap(Account.Name, Account.SObject); //
{
  'foo': { Name: 'foo' },
  'bar': { Name: 'bar' },
  'baz': { Name: 'baz' }
}
```


### `public Map<Id,List<SObject>> groupById(IFunction keyMapper)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,List<SObject>>`|the `Map<Id, List<SObject>>` containing the enumerable elements|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` is null|

#### Example
```apex
public class GetChildrenIdOfTheLatestFunction extends Function {
    private final String childRelField;
    public GetChildrenIdOfTheLatestFunction(String childRelField) { this.childRelField = childRelField; }
    public override Object apply(Object o) {
        SObject sObj = (Account) o;
        List<SObject> children = sObj.getSObjects(childRelField);
        if (children?.isEmpty() != false) {
            return null;
        }
        return [SObjectEnumerable].of(children)
            .sort('CreatedDate')
            .toList()
            [0]
            .Id;
    }
}
Contact con1 = new Contact(Id = '003000000000001AAA', LastName = 'qux', CreatedDate = '2025-10-10 20:00:00');
Contact con2 = new Contact(Id = '003000000000002AAA', LastName = 'fred', CreatedDate = '2025-10-11 21:00:00');
Contact con3 = new Contact(Id = '003000000000003AAA', LastName = 'thud', CreatedDate = '2025-10-12 22:00:00');
Account acc1 = new Account(
    Id = '001000000000001AAA',
    Name = 'foo',
    Contacts = new List<Contact>{ con1, con2 }
); // pseudo assignment
Account acc2 = new Account(
    Id = '001000000000002AAA',
    Name = 'bar',
    Contacts = new List<Contact>{ con3 }
);
Account acc3 = new Account(
    Id = '001000000000003AAA',
    Name = 'baz',
    Contacts = new List<Contact>{ con2, con3 }
);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<Id, List<Account>> accountsByLatestContactId = [SObjectEnumerable].of(accounts)
    .groupById(new GetChildrenIdOfTheLatestFunction('Contacts')); //
{
  '003000000000002AAA': [{ Id: '001000000000001AAA', Name: 'foo' }],
  '003000000000003AAA': [
    { Id: '001000000000002AAA', Name: 'bar' },
    { Id: '001000000000003AAA', Name: 'baz' }
  ]
}
```


### `public virtual Map<Id,List<SObject>> groupById(String fieldName)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,List<SObject>>`|the `Map<Id, List<SObject>>` containing the enumerable elements|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'qux', OwnerId = '005000000000004AAA');
Account parent2 = new Account(Name = 'fred', OwnerId = '005000000000005AAA');
Account acc1 = new Account(Name = 'foo', OwnerId = '005000000000001AAA', Parent = parent1);
Account acc2 = new Account(Name = 'bar', OwnerId = '005000000000002AAA', Parent = parent2);
Account acc3 = new Account(Name = 'baz', OwnerId = '005000000000001AAA', Parent = parent1);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<Id, List<Account>> accountsByOwnerId = [SObjectEnumerable].of(accounts)
    .groupById('OwnerId'); //
{
  '005000000000001AAA': [
    { Name: 'foo', OwnerId: '005000000000001AAA' },
    { Name: 'baz', OwnerId: '005000000000001AAA' }
  ],
  '005000000000002AAA': [{ Name: 'bar', OwnerId: '005000000000002AAA' }]
}
Map<Id, Account> accountsByParentOwnerId = (Map<Id, Account>) [SObjectEnumerable].of(accounts)
    .groupById('Parent?.OwnerId'); //
{
  '005000000000004AAA': [
    { Name: 'foo', OwnerId: '005000000000001AAA' },
    { Name: 'baz', OwnerId: '005000000000001AAA' }
  ],
  '005000000000005AAA': [{ Name: 'bar', OwnerId: '005000000000002AAA' }]
}
```


### `public virtual Map<Id,List<SObject>> groupById(SObjectField field)`

Groups `SObject` elements into a `Map<Id, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Map<Id,List<SObject>>`|the `Map<Id, List<SObject>>` containing the enumerable elements|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', OwnerId = '005000000000001AAA');
Account acc2 = new Account(Name = 'bar', OwnerId = '005000000000002AAA');
Account acc3 = new Account(Name = 'baz', OwnerId = '005000000000001AAA');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<Id, List<Account>> accountsByOwnerId = [SObjectEnumerable].of(accounts)
    .groupById('OwnerId'); //
{
  '005000000000001AAA': [
    { Name: 'foo', OwnerId: '005000000000001AAA' },
    { Name: 'baz', OwnerId: '005000000000001AAA' }
  ],
  '005000000000002AAA': [{ Name: 'bar', OwnerId: '005000000000002AAA' }]
}
```


### `public Map<String,List<SObject>> groupByString(IFunction keyMapper)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are values returned by `keyMapper` and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`keyMapper`|the mapping function producing keys|

#### Returns

|Type|Description|
|---|---|
|`Map<String,List<SObject>>`|the `Map<String, List<SObject>>` containing the enumerable elements|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `keyMapper` is null|

#### Example
```apex
public class GetChildrenFieldOfTheLatestFunction extends Function {
    private final String childRelField;
    private final String fieldName;
    public GetChildrenFieldOfTheLatestFunction(String childRelField, String fieldName) {
        this.childRelField = childRelField;
        this.fieldName = fieldName;
    }
    public override Object apply(Object o) {
        SObject sObj = (Account) o;
        List<SObject> children = sObj.getSObjects(childRelField);
        if (children?.isEmpty() != false) {
            return null;
        }
        return [SObjectEnumerable].of(children)
            .sort('CreatedDate')
            .toList()
            [0]
            .get(fieldName);
    }
}
Contact con1 = new Contact(LastName = 'qux', CreatedDate = '2025-10-10 20:00:00');
Contact con2 = new Contact(LastName = 'fred', CreatedDate = '2025-10-11 21:00:00');
Contact con3 = new Contact(LastName = 'thud', CreatedDate = '2025-10-12 22:00:00');
Account acc1 = new Account(
    Name = 'foo',
    Contacts = new List<Contact>{ con1, con2 }
); // pseudo assignment
Account acc2 = new Account(
    Name = 'bar',
    Contacts = new List<Contact>{ con3 }
);
Account acc3 = new Account(
    Name = 'baz',
    Contacts = new List<Contact>{ con2, con3 }
);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<String, List<Account>> accountsByLatestContactLastName = [SObjectEnumerable].of(accounts)
    .groupByString(new GetChildrenFieldOfTheLatestFunction('Contacts', 'LastName')); //
{
  'fred': [{ Name: 'foo' }],
  'thud': [
    { Name: 'bar' },
    { Name: 'baz' }
  ]
}
```


### `public virtual Map<String,List<SObject>> groupByString(String fieldName)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `fieldName` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|

#### Returns

|Type|Description|
|---|---|
|`Map<String,List<SObject>>`|the `Map<String, List<SObject>>` containing the enumerable elements|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'qux');
Account parent2 = new Account(Name = 'fred');
Account acc1 = new Account(Name = 'foo', Rating = 'Hot', Parent = parent1);
Account acc2 = new Account(Name = 'bar', Rating = 'Warm', Parent = parent2);
Account acc3 = new Account(Name = 'foo', Rating = 'Cold', Parent = parent1);
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<String, List<Account>> accountsByName = [SObjectEnumerable].of(accounts)
    .groupByString('Name'); //
{
  'foo': [{ Name: 'foo', Rating: 'Hot' }, { Name: 'foo', Rating: 'Cold' }],
  'bar': [{ Name: 'bar', Rating: 'Warm' }]
}
Map<String, List<Account>> accountsByParentName = [SObjectEnumerable].of(accounts)
    .groupByString('Parent?.Name'); //
{
  'qux': [{ Name: 'foo', Rating: 'Hot' }, { Name: 'foo', Rating: 'Cold' }],
  'fred': [{ Name: 'bar', Rating: 'Warm' }]
}
```


### `public virtual Map<String,List<SObject>> groupByString(SObjectField field)`

Groups `SObject` elements into a `Map<String, List<SObject>>` whose keys are `field` values and values are `SObject` elements. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|

#### Returns

|Type|Description|
|---|---|
|`Map<String,List<SObject>>`|the `Map<String, List<SObject>>` containing the enumerable elements|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Hot');
Account acc2 = new Account(Name = 'bar', Rating = 'Warm');
Account acc3 = new Account(Name = 'foo', Rating = 'Cold');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<String, List<Account>> accountsByName = [SObjectEnumerable].of(accounts)
    .groupByString(Account.Name); //
{
  'foo': [{ Name: 'foo', Rating: 'Hot' }, { Name: 'foo', Rating: 'Cold' }],
  'bar': [{ Name: 'bar', Rating: 'Warm' }]
}
```


### `public Map<Boolean,List<SObject>> partition(IPredicate predicate)`

Partition `SObject` elements by `predicate`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`predicate`|the predicate|

#### Returns

|Type|Description|
|---|---|
|`Map<Boolean,List<SObject>>`|the `Map<Boolean, List<SObject>>` containing the enumerable elements|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `predicate` is null|

#### Example
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
Account acc1 = new Account(Name = 'foo', Rating = 'Hot');
Account acc2 = new Account(Name = 'bar', Rating = 'Warm');
Account acc3 = new Account(Name = 'baz', Rating = 'Cold');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<Boolean, List<Account>> accountsPartitionedByContainingAInName = [SObjectEnumerable].of(accounts)
    .partition(new ContainsPredicate('Name', 'a')); //
{
  true: [{ Name: 'bar', Rating: 'Warm' }, { Name: 'baz', Rating: 'Cold' }],
  false: [{ Name: 'foo', Rating: 'Hot' }]
}
```


### `public virtual Map<Boolean,List<SObject>> partition(String fieldName, Object value)`

Partition `SObject` elements by `fieldName` having `value`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`Map<Boolean,List<SObject>>`|the `Map<Boolean, List<SObject>>` containing the enumerable elements|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
Account parent1 = new Account(Name = 'Hot');
Account parent2 = new Account(Name = 'Cold');
Account acc1 = new Account(Name = 'foo', Rating = 'Hot', Parent = parent1);
Account acc2 = new Account(Name = 'bar', Rating = 'Warm', Parent = parent2);
Account acc3 = new Account(Name = 'baz', Rating = 'Hot');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating = [SObjectEnumerable].of(accounts)
    .partition('Rating', 'Hot')); //
{
  true: [{ Name: 'foo', Rating: 'Hot' }, { Name: 'baz', Rating: 'Hot' }],
  false: [{ Name: 'bar', Rating: 'Warm' }]
}
Map<Boolean, List<Account>> accountsPartitionedByHavingHotParentRating = [SObjectEnumerable].of(accounts)
    .partition('Parent?.Rating', 'Hot')); //
{
  true: [{ Name: 'foo', Rating: 'Hot' }],
  false: [{ Name: 'bar', Rating: 'Warm' }, { Name: 'baz', Rating: 'Hot' }]
}
```


### `public virtual Map<Boolean,List<SObject>> partition(SObjectField field, Object value)`

Partition `SObject` elements by `field` having `value`. <p>Terminal Operation.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the field|
|`value`|the satisfying value|

#### Returns

|Type|Description|
|---|---|
|`Map<Boolean,List<SObject>>`|the `Map<Boolean, List<SObject>>` containing the enumerable elements|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
Account acc1 = new Account(Name = 'foo', Rating = 'Hot');
Account acc2 = new Account(Name = 'bar', Rating = 'Warm');
Account acc3 = new Account(Name = 'baz', Rating = 'Hot');
List<Account> accounts = new List<Account>{ acc1, acc2, acc3 };
Map<Boolean, List<Account>> accountsPartitionedByHavingHotRating = [SObjectEnumerable].of(accounts)
    .partition(Account.Rating, 'Hot')); //
{
  true: [{ Name: 'foo', Rating: 'Hot' }, { Name: 'baz', Rating: 'Hot' }],
  false: [{ Name: 'bar', Rating: 'Warm' }]
}
```


---
