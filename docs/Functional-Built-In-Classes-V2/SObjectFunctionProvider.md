# virtual SObjectFunctionProvider

`APIVERSION: 61`

`STATUS: ACTIVE`

A provider class that offers various functions for retrieving values from SObjects,
supporting cross-reference fields, safe navigation, and complex field paths.
This class acts as a factory for different types of functions that can be applied to SObjects.


**Group** Functional Built-In Classes V2

## Methods
### `public virtual Function get(String fieldName)`

Returns a `Function` that gets a value for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field to get a value|

#### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.get](SObject.get)

#### Example
```apex
IFunction nameFunction = new SObjectFunctionProvider().get('Name');
nameFunction.apply(new Account(Name = 'John Doe')); // John Doe
IFunction parentNameFunction = new SObjectFunctionProvider().get('Parent.Name');
parentNameFunction.apply(new Account(Parent = new Account(Name = 'Acme Corp'))); // Acme Corp
// but
parentNameFunction.apply(new Account()); // throws NPE
IFunction safeParentNameFunction = new SObjectFunctionProvider().get('Parent?.Name');
safeParentNameFunction.apply(new Account(Parent = new Account(Name = 'Acme Corp'))); // Acme Corp
// but
safeParentNameFunction.apply(new Account()); // null
```


### `public virtual Function get(SObjectField field)`

Returns a `Function` that gets a value for the specified `field`.

#### Parameters

|Param|Description|
|---|---|
|`field`|the field to get a value|

#### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** [SObject.get](SObject.get)

#### Example
```apex
IFunction nameFieldFunction = new SObjectFunctionProvider().get(Account.Name);
nameFieldFunction.apply(new Account(Name = 'John Doe')); // John Doe
```


### `public virtual Function getSObject(String fieldName)`

Returns a `Function` that gets a single related sObject for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field to get the related sObject|

#### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross-reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.getSObject](SObject.getSObject)

#### Example
```apex
IFunction accountFunction = new SObjectFunctionProvider().getSObject('Account');
accountFunction.apply(new Contact(Account = new Account(Name = 'John Doe'))); // Account { Name: 'John Doe' }
```


### `public virtual Function getSObject(SObjectField field)`

Returns a `Function` that gets a single related sObject for the specified `field`.

#### Parameters

|Param|Description|
|---|---|
|`field`|the `SObjectField` to get the related sObject|

#### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** [SObject.getSObject](SObject.getSObject)

#### Example
```apex
IFunction accountFunction = new SObjectFunctionProvider().getSObject(Contact.AccountId);
accountFunction.apply(new Contact(Account = new Account(Name = 'John Doe'))); // Account { Name: 'John Doe' }
```


### `public virtual Function getSObjects(String fieldName)`

Returns a `Function` that gets children sobjects for the specified `fieldName`. Cross-reference fields and safe navigation are supported.

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field to get a value|

#### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|
|`SObjectException`|if provided invalid `fieldName`|


**See** [SObject.getSObjects](SObject.getSObjects)

#### Example
```apex
IFunction contactsFunction = new SObjectFunctionProvider().getSObjects('Contacts');
contactsFunction.apply(
    new Account(Id = '001000000000001AAA', Contacts = new List<Contact>{ new Contact(LastName = 'Doe') })
); // [{ Name: Doe }]
IFunction parentContactsFunction = new SObjectFunctionProvider().getSObjects('Parent.Contacts');
parentContactsFunction.apply(
    new Account(Parent = new Account(
        Id = '001000000000001AAA',
        Contacts = new List<Contact>{ new Contact(LastName = 'Doe') }
    ))
); // [{ Name: Doe }]
// but
parentContactsFunction.apply(new Account(Id = '001000000000001AAA')); // throws NPE
IFunction safeParentContactsFunction = new SObjectFunctionProvider().getSObjects('Parent?.Contacts');
safeParentContactsFunction.apply(
    new Account(Parent = new Account(
        Id = '001000000000001AAA',
        Contacts = new List<Contact>{ new Contact(LastName = 'Doe') }
    ))
); // [{ Name: Doe }]
// but
safeParentContactsFunction.apply(new Account(Id = '001000000000001AAA')); // null
```


### `public virtual Function getSObjects(SObjectField field)`

Returns a `Function` that gets children sobjects for the specified `field`. Cross-reference fields and safe navigation are supported.

#### Parameters

|Param|Description|
|---|---|
|`field`|the field to get a value|

#### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|
|`NullPointerException`|if `NullPointerException` occurs during unsafe cross- reference navigation|


**See** [SObject.getSObjects](SObject.getSObjects)

#### Example
```apex
IFunction contactsFunction = new SObjectFunctionProvider().getSObjects(Contact.AccountId);
contactsFunction.apply(
    new Account(Id = '001000000000001AAA', Contacts = new List<Contact>{ new Contact(LastName = 'Doe') })
); // [{ LastName: 'Doe' }]
```


### `public virtual Function getPopulatedFieldsAsMap()`

Returns a `Function` that returns a map of populated field names and their corresponding values for an input argument.

#### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [SObject.getPopulatedFieldsAsMap](SObject.getPopulatedFieldsAsMap)

#### Example
```apex
IFunction populatedFieldsMapFunction = new SObjectFunctionProvider().getPopulatedFieldsAsMap();
populatedFieldsMapFunction.apply(new Account(Name = 'John Doe', AnnualRevenue = 1000000));
// { Name = John Doe, AnnualRevenue = 1000000 }
```


### `public virtual Function getQuickActionName()`

Returns a `Function` that returns the name of a quick action associated with an input argument.

#### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [SObject.getQuickActionName](SObject.getQuickActionName)

#### Example
```apex
IFunction quickActionNameFunction = new SObjectFunctionProvider().getQuickActionName();
quickActionNameFunction.apply(acc); // some quick action, determined in trigger context
```


### `public virtual Function getSObjectType()`

Returns a `Function` that returns the `SObjectType` of an input argument.

#### Returns

|Type|Description|
|---|---|
|`Function`|the `Function`|


**See** [SObject.getSObjectType](SObject.getSObjectType)

#### Example
```apex
IFunction sObjectTypeFunction = new SObjectFunctionProvider().getSObjectType();
sObjectTypeFunction.apply(new Account()); // Account
```


### `public virtual ChainableMapSObjectFunction mapTo(ISupplier identitySupplier)`

Returns a `ChainableMapSObjectFunction` that allows mapping values from a supplier to an SObject. This method provides flexibility for complex mapping operations.

#### Parameters

|Param|Description|
|---|---|
|`identitySupplier`|the supplier that provides the initial SObject|

#### Returns

|Type|Description|
|---|---|
|`ChainableMapSObjectFunction`|the `ChainableMapSObjectFunction`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `identitySupplier` is null|

#### Example
```apex
.com', OwnerId: '005000000000000AAA' }
```


### `public virtual ChainableMapSObjectFunction mapTo(SObjectType destType)`

Returns a `ChainableMapSObjectFunction` that maps values to a specified SObject type, using the destination type to create the SObject.

#### Parameters

|Param|Description|
|---|---|
|`destType`|the SObjectType of the destination object|

#### Returns

|Type|Description|
|---|---|
|`ChainableMapSObjectFunction`|the `ChainableMapSObjectFunction`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `destType` is null|

#### Example
```apex
.com', OwnerId: '005000000000000AAA' }
```


---
## Classes
### ChainableMapSObjectFunction

Represents a chainable mapping function that maps values to fields of an SObject.
This function allows for a flexible and extensible mapping approach by supporting multiple
value mappers and destination consumers.


**Inheritance**

[Function](/docs/Functional-Abstract-Classes/Function.md)
 > 
ChainableMapSObjectFunction

#### Methods
##### `public override Object apply(Object o)`

`SUPPRESSWARNINGS`
##### `public virtual MapSObjectValueMapper val(IFunction mapper)`

Creates a `MapSObjectValueMapper` to map a value obtained from the provided function to a field on the SObject.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function that retrieves the value to be mapped|

###### Returns

|Type|Description|
|---|---|
|`MapSObjectValueMapper`|the `MapSObjectValueMapper`|

###### Example
```apex
IFunction mapToLead = new SObjectFunctionProvider().mapTo(Lead.SObjectType);
    .val(new SObjectFunctionProvider().get(Contact.LastName)).to(Lead.LastName);
mapToLead.apply(new Contact(LastName = 'Doe')); // Lead { LastName: 'Doe' }
```


##### `public virtual MapSObjectValueMapper val(String fieldName)`

Creates a `MapSObjectValueMapper` to map a value obtained from a field by specifying its `fieldName`, and mapping it to a field on the SObject. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the name of the field from which to retrieve the value|

###### Returns

|Type|Description|
|---|---|
|`MapSObjectValueMapper`|the `MapSObjectValueMapper`|

###### Example
```apex
IFunction mapToLead = new SObjectFunctionProvider().mapTo(Lead.SObjectType)
    .val('LastName').to('LastName');
mapToLead.apply(new Contact(LastName = 'Doe')); // Lead { LastName: 'Doe' }
```


##### `public virtual MapSObjectValueMapper val(SObjectField field)`

Creates a `MapSObjectValueMapper` to map a value obtained from a specified `field`, and mapping it to a field on the SObject.

###### Parameters

|Param|Description|
|---|---|
|`field`|the `SObjectField` from which to retrieve the value|

###### Returns

|Type|Description|
|---|---|
|`MapSObjectValueMapper`|the `MapSObjectValueMapper`|

###### Example
```apex
IFunction mapToLead = new SObjectFunctionProvider().mapTo(supplier)
    .val(Contact.LastName).to(Lead.LastName);
mapToLead.apply(new Contact(LastName = 'Doe')); // Lead { LastName: 'Doe' }
```


##### `public virtual MapSObjectValueMapper var(Object value)`

Creates a `MapSObjectValueMapper` to map a constant value to a field on the SObject.

###### Parameters

|Param|Description|
|---|---|
|`value`|the constant value to be mapped|

###### Returns

|Type|Description|
|---|---|
|`MapSObjectValueMapper`|the `MapSObjectValueMapper`|

###### Example
```apex
IFunction mapToLead = new SObjectFunctionProvider().mapTo(supplier)
    .var('John Doe').to(Lead.Name);
mapToLead.apply(new Contact()); // Lead { Name: 'John Doe' }
```


---

### MapSObjectValueMapper

A class that provides a mapping between a value retrieved by an `IFunction`
and a target field on an SObject. Supports cross-reference fields and safe navigation.
This class is used in conjunction with `ChainableMapSObjectFunction` to map values
from one SObject to another in a flexible and chainable manner.

#### Methods
##### `public virtual ChainableMapSObjectFunction to(String fieldName)`

Maps the value provided by the function to the specified field name on the SObject. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the name of the field on the destination SObject where the value will be mapped|

###### Returns

|Type|Description|
|---|---|
|`ChainableMapSObjectFunction`|the `ChainableMapSObjectFunction`|

###### Example
```apex
IFunction mapToLead = new SObjectFunctionProvider().mapTo(Lead.SObjectType)
    .val('LastName').to('LastName');
    .var(someUserId).to('OwnerId');
mapToLead.apply(new Contact(LastName = 'Doe'));
// Lead { LastName: 'Doe', OwnerId: '005000000000000AAA' }
```


##### `public virtual ChainableMapSObjectFunction to(SObjectField field)`

Maps the value provided by the function to the specified `field` on the SObject.

###### Parameters

|Param|Description|
|---|---|
|`field`|the `SObjectField` on the destination SObject where the value will be mapped|

###### Returns

|Type|Description|
|---|---|
|`ChainableMapSObjectFunction`|the `ChainableMapSObjectFunction`|

###### Example
```apex
IFunction mapToLead = new SObjectFunctionProvider().mapTo(supplier)
    .val(Contact.LastName).to(Lead.LastName)
    .var(someUserId).to(Lead.OwnerId);
mapToLead.apply(new Contact(LastName = 'Doe'));
// Lead { LastName: 'Doe', OwnerId: '005000000000000AAA' }
```


---

---
