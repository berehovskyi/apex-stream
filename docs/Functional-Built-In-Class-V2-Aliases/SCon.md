# SCon

`APIVERSION: 61`

`STATUS: ACTIVE`

An alias for [SObjectConsumerProvider](/docs/Functional-Built-In-Classes-V2/SObjectConsumerProvider.md).


**Inheritance**

[SObjectConsumerProvider](/docs/Functional-Built-In-Classes-V2/SObjectConsumerProvider.md)
 > 
SCon


**Group** Functional Built-In Class V2 Aliases

## Methods
### `public virtual AddErrorMessageConsumer addError(String message)`

*Inherited*


Returns an `AddErrorMessageConsumer` that adds an error message to a field of a SObject.

#### Parameters

|Param|Description|
|---|---|
|`message`|the error message to add|

#### Returns

|Type|Description|
|---|---|
|`AddErrorMessageConsumer`|the `AddErrorMessageConsumer`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `message` is null|


**See** [SObject.addError](SObject.addError)

#### Example
```apex
IConsumer addErrorConsumer = new SObjectConsumerProvider()
    .addError('Invalid Account');
addErrorConsumer.accept(new Account());
IConsumer addErrorToNameConsumer = new SObjectConsumerProvider()
    .addError('Invalid Name')
    .to(Account.Name);
addErrorToNameConsumer.accept(new Account());
```


### `public virtual AddErrorExceptionConsumer addError(Exception exc)`

*Inherited*


Returns an `AddErrorExceptionConsumer` that adds an error to the input SObject with an exception.

#### Parameters

|Param|Description|
|---|---|
|`exc`|the exception to attach|

#### Returns

|Type|Description|
|---|---|
|`AddErrorExceptionConsumer`|the `AddErrorExceptionConsumer`|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `exc` is null|


**See** [SObject.addError](SObject.addError)

#### Example
```apex
IConsumer addExceptionErrorConsumer = new SObjectConsumerProvider()
    .addError(new IllegalArgumentException('Invalid Field'));
addExceptionErrorConsumer.accept(new Account());
```


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
|`SetByName`|the `SetByName` builder to set the field value|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|


**See** [SObject.put](SObject.put)

#### Example
```apex
IConsumer setNameConsumer = new SObjectConsumerProvider()
    .set('Name')
    .var('Jane Doe');
setNameConsumer.accept(new Account()); // { Name: 'Jane Doe' }
// safe navigation
IConsumer setRevenueFromParentConsumer = new SObjectConsumerProvider()
    .set('AnnualRevenue')
    .val('Parent?.AnnualRevenue');
setRevenueFromParentConsumer.accept(new Account(Parent = new Account(AnnualRevenue = 5000)));
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
|`SetByField`|the `SetByField` builder to set the field value|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** [SObject.put](SObject.put)

#### Example
```apex
IConsumer setNameConsumer = new SObjectConsumerProvider()
    .set(Account.Name)
    .var('Jane Doe');
setNameConsumer.accept(new Account()); // { Name: 'Jane Doe' }
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
|`SetSObjectByName`|the `SetSObjectByName` builder to set the field value|

#### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|


**See** [SObject.putSObject](SObject.putSObject)

#### Example
```apex
IConsumer setParentConsumer = new SObjectConsumerProvider()
    .setSObject('Parent')
    .var(new Account(Name = 'Parent Account'));
setParentConsumer.accept(new Account()); // { Parent: { Name: 'Parent Account' } }
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
|`SetSObjectByField`|the `SetSObjectByField` builder to set the field value|

#### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|


**See** [SObject.putSObject](SObject.putSObject)

#### Example
```apex
IConsumer setParentConsumer = new SObjectConsumerProvider()
    .setSObject(Account.ParentId)
    .var(new Account(Name = 'Parent Account'));
setParentConsumer.accept(new Account()); // { Parent: { Name: 'Parent Account' } }
```


---
