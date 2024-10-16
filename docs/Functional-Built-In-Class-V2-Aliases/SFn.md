# SFn

`APIVERSION: 61`

`STATUS: ACTIVE`

An alias for [SObjectFunctionProvider](/docs/Functional-Built-In-Classes-V2/SObjectFunctionProvider.md).


**Inheritance**

[SObjectFunctionProvider](/docs/Functional-Built-In-Classes-V2/SObjectFunctionProvider.md)
 > 
SFn


**Group** Functional Built-In Class V2 Aliases

## Methods
### `public virtual Function get(String fieldName)`

*Inherited*


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

*Inherited*


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

*Inherited*


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

*Inherited*


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

*Inherited*


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

*Inherited*


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

*Inherited*


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

*Inherited*


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

*Inherited*


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

*Inherited*


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

*Inherited*


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
