# virtual SObjectConsumerProvider

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides a fluent interface for building consumers that operate on SObjects, allowing you
to set fields, add errors, and perform other operations on SObjects.


**Group** Functional Built-In Classes V2

## Methods
### `public virtual AddErrorMessageConsumer addError(String message)`

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
## Classes
### AddErrorExceptionConsumer

A consumer that adds an exception as an error to an `SObject`.


**Inheritance**

[Consumer](/docs/Functional-Abstract-Classes/Consumer.md)
 > 
AddErrorExceptionConsumer

#### Methods
##### `public virtual override void accept(Object o)`
##### `public virtual AddErrorExceptionConsumer escape(Boolean escape)`

Sets whether the error message should be escaped when attached to the `SObject`.

###### Parameters

|Param|Description|
|---|---|
|`escape`|whether to escape the error message (true by default)|

###### Returns

|Type|Description|
|---|---|
|`AddErrorExceptionConsumer`|the `AddErrorExceptionConsumer` builder for chaining|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `escape` is null|

###### Example
```apex
IConsumer addExceptionError = new SObjectConsumerProvider()
    .addError(new IllegalArgumentException('<p>Invalid value</p>'))
    .escape(false);
addExceptionError.accept(new Account()); // Adds unescaped 'Invalid value' error to the Account.
```


---

### AddErrorMessageConsumer

A consumer that adds an error message to an SObject.
The consumer can target a specific field or the entire SObject, and the message can be escaped or unescaped.


**Inheritance**

[Consumer](/docs/Functional-Abstract-Classes/Consumer.md)
 > 
AddErrorMessageConsumer

#### Methods
##### `public virtual override void accept(Object o)`
##### `public virtual AddErrorMessageConsumer escape(Boolean escape)`

Specifies whether to escape the error message.

###### Parameters

|Param|Description|
|---|---|
|`escape`|whether to escape the message|

###### Returns

|Type|Description|
|---|---|
|`AddErrorMessageConsumer`|the `AddErrorMessageConsumer` builder for chaining|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `escape` is null|

###### Example
```apex
IConsumer addErrorConsumer = new SObjectConsumerProvider()
    .addError('<p>Invalid Name</p>')
    .escape(false)
    .to('Name');
addErrorConsumer.accept(new Account());
```


##### `public virtual Consumer to(String fieldName)`

Returns a `Consumer` that adds the error message to the specified field on the SObject.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the name of the field to add the error message to|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`SObjectException`|if provided invalid `fieldName`|

###### Example
```apex
IConsumer addErrorConsumer = new SObjectConsumerProvider()
    .addError('Invalid Field')
    .to('Name');
addErrorConsumer.accept(new Account());
```


##### `public virtual Consumer to(SObjectField field)`

Returns a `Consumer` that adds the error message to the specified field on the SObject.

###### Parameters

|Param|Description|
|---|---|
|`field`|the SObjectField to add the error message to|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer`|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
IConsumer addErrorConsumer = new SObjectConsumerProvider()
    .addError('Invalid Field')
    .to(Account.Name);
addErrorConsumer.accept(new Account());
```


---

### SetByField

Sets a field value for a specific field on the SObject.
You can use this instance to assign a value to a field using either a constant or a function, or another field.


**Inheritance**

SetByField

#### Methods
##### `public virtual override Consumer val(IFunction mapper)`

Sets the field value by applying the provided function.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function used to map the value to the field|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer` that accepts the value to the field|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
IConsumer setFieldWithFunctionConsumer = new SObjectConsumerProvider()
    .set(Account.Name)
    .val(Function.constant('Jane Doe'));
setFieldWithFunctionConsumer.accept(new Account()); // { Name: 'Jane Doe' }
```


---

### SetByName

Sets a field value for a specific field name on the SObject.
You can use this instance to assign a value to a field using either a constant or a function, or another field.


**Inheritance**

SetByName

#### Methods
##### `public virtual override Consumer val(IFunction mapper)`

Sets the field value by applying the provided function.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function used to map the value to the field|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer` that accepts the value to the field|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
IConsumer setFieldWithFunctionConsumer = new SObjectConsumerProvider()
    .set('Name')
    .val(Function.constant('Jane Doe'));
setFieldWithFunctionConsumer.accept(new Account()); // { Name: 'Jane Doe' }
```


---

### SetFieldValueBase
#### Methods
##### `public virtual Consumer val(String fieldName)`

Fetches a value from the provided field name and sets it to the target field defined in the previous step. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the name of the field to fetch the value from|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer` that applies the fetched value to the target field|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|
|`SObjectException`|if the provided `fieldName` is invalid|

###### Example
```apex
IConsumer setNameFromParentConsumer = new SObjectConsumerProvider()
    .set('Name') // or .set(Account.Name)
    .val('Parent.Name');
setNameFromParentConsumer.accept(new Account(Parent = new Account(Name = 'ParentName')));
// { Name: 'ParentName', Parent: { Name: 'ParentName' } }
```


##### `public virtual Consumer val(SObjectField field)`

Fetches a value from the provided `SObjectField` and sets it to the target field defined in the previous step.

###### Parameters

|Param|Description|
|---|---|
|`field`|the SObjectField to fetch the value from|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer` that applies the fetched value to the target field|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
IConsumer setNameFromDepartmentAccountConsumer = new SObjectConsumerProvider()
    .set('Name') // or .set(Account.Name)
    .val(Account.Department);
setNameFromDepartmentAccountConsumer.accept(new Account(Department = 'HR'));
// { Name: 'HR', Department: 'HR' }
```


##### `public virtual Consumer var(Object value)`

Sets the provided constant value to the target field defined in the previous step.

###### Parameters

|Param|Description|
|---|---|
|`value`|the constant value to set|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer` that applies the constant value to the target field|

###### Example
```apex
IConsumer setJohnDoeNameConsumer = new SObjectConsumerProvider()
    .set('Name') // or .set(Account.Name)
    .var('John Doe');
setJohnDoeNameConsumer.accept(new Account()); // { Name: 'John Doe' }
```


---

### SetSObjectByField

Sets a `SObject` for a specific reference field on the SObject.
You can use this instance to assign a value using either a constant or a function, or another field.


**Inheritance**

SetSObjectByField

#### Methods
##### `public virtual override Consumer val(IFunction mapper)`

Sets the `SObject` value by applying the provided function to the specified field.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function used to map the `SObject` value to the field|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer` that applies the `SObject` value to the target field|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
IConsumer setParentAccountConsumer = new SObjectConsumerProvider()
    .setSObject(Account.ParentId)
    .val(Function.constant(new Account(Name = 'Parent Account')));
setParentAccountConsumer.accept(new Account()); // { Parent: { Name: 'Parent Account' } }
```


---

### SetSObjectByName

Sets a `SObject` for a specific field name on the SObject.
You can use this instance to assign a value using either a constant or a function, or another field.


**Inheritance**

SetSObjectByName

#### Methods
##### `public virtual override Consumer val(IFunction mapper)`

Sets the `SObject` value by applying the provided function to the specified field name.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function used to map the `SObject` value to the field|

###### Returns

|Type|Description|
|---|---|
|`Consumer`|the `Consumer` that applies the `SObject` value to the target field|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
IConsumer setParentAccountConsumer = new SObjectConsumerProvider()
    .setSObject('Parent')
    .val(Function.constant(new Account(Name = 'Parent Account')));
setParentAccountConsumer.accept(new Account()); // { Parent: { Name: 'Parent Account' } }
```


---

---
