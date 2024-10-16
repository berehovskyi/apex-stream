# virtual SObjectOperatorProvider

`APIVERSION: 61`

`STATUS: ACTIVE`

Provides a fluent interface for building operators that operate on SObjects, allowing you
to set fields, and perform other operations on SObjects.


**Group** Functional Built-In Classes V2

## Methods
### `public virtual SetByName set(String fieldName)`

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
## Classes
### SetByField

Sets a field value for a specific field on the SObject.
You can use this instance to assign a value to a field using either a constant or a function, or another field.


**Inheritance**

SetByField

#### Methods
##### `public virtual override Operator val(IFunction mapper)`

Sets the field value by applying the provided function.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function used to map the value to the field|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator` that accepts the value to the field and returns the mutated argument|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
IOperator setFieldWithFunctionOperator = new SObjectOperatorProvider()
    .set(Account.Name)
    .val(Function.constant('Jane Doe'));
setFieldWithFunctionOperator.apply(new Account()); // { Name: 'Jane Doe' }
```


---

### SetByName

Sets a field value for a specific field name on the SObject.
You can use this instance to assign a value to a field using either a constant or a function, or another field.


**Inheritance**

SetByName

#### Methods
##### `public virtual override Operator val(IFunction mapper)`

Sets the field value by applying the provided function.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function used to map the value to the field|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator` that accepts the value to the field and returns the mutated argument|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
IOperator setFieldWithFunctionOperator = new SObjectOperatorProvider()
    .set('Name')
    .val(Function.constant('Jane Doe'));
setFieldWithFunctionOperator.apply(new Account()); // { Name: 'Jane Doe' }
```


---

### SetSObjectByField

Sets a SObject for a specific reference field on the SObject.
You can use this instance to assign a value using either a constant or a function, or another field.


**Inheritance**

SetSObjectByField

#### Methods
##### `public virtual override Operator val(IFunction mapper)`

Sets the SObject value by applying the provided function to the specified field.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function used to map the SObject value to the field|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator` that applies the SObject value to the target field and returns the mutated argument|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
IOperator setParentAccountOperator = new SObjectOperatorProvider()
    .setSObject(Account.ParentId)
    .val(Function.constant(new Account(Name = 'Parent Account')));
setParentAccountOperator.apply(new Account()); // { Parent: { Name: 'Parent Account' } }
```


---

### SetSObjectByName

Sets a SObject for a specific field name on the SObject.
You can use this instance to assign a value using either a constant or a function, or another field.


**Inheritance**

SetSObjectByName

#### Methods
##### `public virtual override Operator val(IFunction mapper)`

Sets the SObject value by applying the provided operator to the specified field name.

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the operator used to map the SObject value to the field|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator` that applies the SObject value to the target field and returns the mutated argument|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
IOperator setParentAccountOperator = new SObjectOperatorProvider()
    .setSObject('Parent')
    .val(Function.constant(new Account(Name = 'Parent Account')));
setParentAccountOperator.apply(new Account()); // { Parent: { Name: 'Parent Account' } }
```


---

### SetSObjects

Sets related SObjects for a specific field name on the SObject.
You can use this instance to assign a value using either a constant or a function, or another field.

#### Methods
##### `public virtual Operator val(IFunction mapper)`

Sets related SObjects value by applying the provided function to the specified field. <p><strong>Note: </strong></p> <p>This operator uses serialization / deserialization to set related children SObjects.</p>

###### Parameters

|Param|Description|
|---|---|
|`mapper`|the function used to map the `Iterable<SObject>` value to the field|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator` that applies the value to the target field and returns the mutated argument|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `mapper` is null|

###### Example
```apex
IOperator setContactsOperator = new SObjectOperatorProvider()
    .setSObjects('Contacts')
    .val(Function.constant(
        new List<Contact>{ new Contact(FirstName = 'John'), new Contact(FirstName = 'Jane') })
    ));
setContactsOperator.apply(new Account());
// Account { Contacts: [{ FirstName: 'John' }, { FirstName: 'Jane' }] }
```


##### `public virtual Operator val(String fieldName)`

Fetches a list of related SObject records from the provided field name and sets them to the target field defined in the previous step. Cross-reference fields and safe navigation are supported.

###### Parameters

|Param|Description|
|---|---|
|`fieldName`|the name of the field to fetch the related SObject records from|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator` that applies the value to the target field and returns the mutated argument|

###### Throws

|Exception|Description|
|---|---|
|`IllegalArgumentException`|if `fieldName` is blank|
|`NullPointerException`|if `fieldName` is null|

###### Example
```apex
IOperator setContactsOperator = new SObjectOperatorProvider()
    .setSObjects('Contacts')
    .val('Contacts__r');
setContactsOperator.apply(new Account(
    Contacts__r = new List<Contact>{ new Contact(FirstName = 'John'), new Contact(FirstName = 'Jane') }
));
// Account {
    Contacts: [{ FirstName: 'John' }, { FirstName: 'Jane' }],
    Contacts__r: [{ FirstName: 'John' }, { FirstName: 'Jane' }]
}
```


##### `public virtual Operator val(SObjectField field)`

Fetches a list of related SObject records from the provided field and sets them to the target field defined in the previous step.

###### Parameters

|Param|Description|
|---|---|
|`field`|the name of the field to fetch the related SObject records from|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator` that applies the value to the target field and returns the mutated argument|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `field` is null|

###### Example
```apex
IOperator setContactsOperator = new SObjectOperatorProvider()
    .setSObjects('Contacts')
    .val(Contact.Account__c);
setContactsOperator.apply(new Account(
    Contacts__r = new List<Contact>{ new Contact(FirstName = 'John'), new Contact(FirstName = 'Jane') }
));
// Account {
    Contacts: [{ FirstName: 'John' }, { FirstName: 'Jane' }],
    Contacts__r: [{ FirstName: 'John' }, { FirstName: 'Jane' }]
}
```


##### `public virtual Operator var(Iterable<SObject> value)`

Sets the provided constant iterable to the target field defined in the previous step.

###### Parameters

|Param|Description|
|---|---|
|`value`|the iterable of SObject values to set|

###### Returns

|Type|Description|
|---|---|
|`Operator`|the `Operator` that applies the value to the target field and returns the mutated argument|

###### Throws

|Exception|Description|
|---|---|
|`NullPointerException`|if `value` is null|

###### Example
```apex
IOperator setContactsOperator = new SObjectOperatorProvider()
    .setSObjects('Contacts')
    .var(new List<Contact>{ new Contact(FirstName = 'John'), new Contact(FirstName = 'Jane') });
setContactsOperator.apply(new Account());
// Account { Contacts: [{ FirstName: 'John' }, { FirstName: 'Jane' }] }
```


---

---
