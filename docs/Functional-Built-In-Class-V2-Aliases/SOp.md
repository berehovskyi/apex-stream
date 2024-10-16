# SOp

`APIVERSION: 61`

`STATUS: ACTIVE`

An alias for [SObjectOperatorProvider](/docs/Functional-Built-In-Classes-V2/SObjectOperatorProvider.md).


**Inheritance**

[SObjectOperatorProvider](/docs/Functional-Built-In-Classes-V2/SObjectOperatorProvider.md)
 > 
SOp


**Group** Functional Built-In Class V2 Aliases

## Methods
### `public virtual SetByName set(String fieldName)`

*Inherited*


Returns a `SetByName` builder that sets the value for the specified `fieldName` on the SObject. Cross-reference fields and safe navigation are supported.

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set the value for|

#### Returns

|Type|Description|
|---|---|
|`SetByName`|the `SetByName` instance to set the field value|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|


**See** [SObject.put](SObject.put)

#### Example
```apex
IOperator setNameOperator = new SObjectOperatorProvider()
    .set('Name')
    .var('Jane Doe');
setNameOperator.apply(new Account()); // { Name: 'Jane Doe' }
// safe navigation
IOperator setRevenueFromParentOperator = new SObjectOperatorProvider()
    .set('AnnualRevenue')
    .val('Parent?.AnnualRevenue');
setRevenueFromParentOperator.apply(new Account(Parent = new Account(AnnualRevenue = 5000)));
// { AnnualRevenue: 5000, Parent: { AnnualRevenue: 5000 } }
```


### `public virtual SetByField set(SObjectField field)`

*Inherited*


Returns a `SetByField` builder that sets the value for the specified `field` on the SObject.

#### Parameters

|Param|Description|
|---|---|
|`field`|the SObjectField to set the value for|

#### Returns

|Type|Description|
|---|---|
|`SetByField`|the `SetByField` consumer to set the field value|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** [SObject.put](SObject.put)

#### Example
```apex
IOperator setNameOperator = new SObjectOperatorProvider()
    .set(Account.Name)
    .var('Jane Doe');
setNameOperator.apply(new Account()); // { Name: 'Jane Doe' }
```


### `public virtual SetSObjectByName setSObject(String fieldName)`

*Inherited*


Returns a `SetSObjectByName` builder that sets a related SObject using the field name. Cross-reference fields and safe navigation are supported.

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name to set the value for|

#### Returns

|Type|Description|
|---|---|
|`SetSObjectByName`|the `SetSObjectByName` instance to set the field value|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|


**See** [SObject.putSObject](SObject.putSObject)

#### Example
```apex
IOperator setParentOperator = new SObjectOperatorProvider()
    .setSObject('Parent')
    .var(new Account(Name = 'Parent Account'));
setParentOperator.apply(new Account()); // { Parent: { Name: 'Parent Account' } }
```


### `public virtual SetSObjectByField setSObject(SObjectField field)`

*Inherited*


Returns a `SetSObjectByField` builder that sets a related SObject using the specified field.

#### Parameters

|Param|Description|
|---|---|
|`field`|the SObjectField representing the related SObject|

#### Returns

|Type|Description|
|---|---|
|`SetSObjectByField`|the `SetSObjectByField` instance to set the field value|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** [SObject.putSObject](SObject.putSObject)

#### Example
```apex
IOperator setParentOperator = new SObjectOperatorProvider()
    .setSObject(Account.ParentId)
    .var(new Account(Name = 'Parent Account'));
setParentOperator.apply(new Account()); // { Parent: { Name: 'Parent Account' } }
```


### `public virtual SetSObjects setSObjects(String fieldName)`

*Inherited*


Returns a `SetSObjects` builder that sets related SObjects using the specified field. Cross-reference fields and safe navigation are supported. <p><strong>Note: </strong></p> <p>This valueMapper uses serialization / deserialization to set related children SObjects.</p>

#### Parameters

|Param|Description|
|---|---|
|`fieldName`|the field name representing the related SObjects|

#### Returns

|Type|Description|
|---|---|
|`SetSObjects`|the `SetSObjects` instance to set the field value|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

#### Example
```apex
IOperator setContactsOperator = new SObjectOperatorProvider()
    .setSObjects('Contacts')
    .var(new List<Contact>{ new Contact(FirstName = 'John'), new Contact(FirstName = 'Jane') });
setContactsOperator.apply(new Account());
// Account { Contacts: [{ FirstName: 'John' }, { FirstName: 'Jane' }] }
```


### `public virtual SetSObjects setSObjects(SObjectField field)`

*Inherited*


Returns a `SetSObjects` builder that sets related SObjects using the specified field. <p><strong>Note: </strong></p> <p>This valueMapper uses serialization / deserialization to set related children SObjects.</p>

#### Parameters

|Param|Description|
|---|---|
|`field`|the SObjectField representing the related SObjects|

#### Returns

|Type|Description|
|---|---|
|`SetSObjects`|the `SetSObjects` instance to set the field value|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

#### Example
```apex
IOperator setContactsOperator = new SObjectOperatorProvider()
    .setSObjects(Contact.AccountId)
    .var(new List<Contact>{ new Contact(FirstName = 'John'), new Contact(FirstName = 'Jane') });
setContactsOperator.apply(new Account());
// Account { Contacts: [{ FirstName: 'John' }, { FirstName: 'Jane' }] }
```


---
