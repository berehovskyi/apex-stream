/**
 * @description Provides a fluent interface for building collectors that collect elements into various
 * data structures like lists, sets and maps.
 * The `CollectorProvider` allows specifying the type of values to be collected and offers
 * methods to create collectors for different data structures.
 *
 * @group Functional Built-In Classes V2
 *
 * @example
 * List<Account> accounts = new List<Account>{
 *     new Account(Name = 'John Doe', AnnualRevenue = 1000000, Industry = 'Technology', BillingCity = 'Los Angeles'),
 *     new Account(Name = 'Jane Smith', AnnualRevenue = 2000000, Industry = 'Finance', BillingCity = 'New York'),
 *     new Account(Name = 'Judy Roe', AnnualRevenue = 3000000, Industry = 'Healthcare', BillingCity = 'Los Angeles'),
 *     new Account(Name = 'Jack Amber', AnnualRevenue = 4000000, Industry = 'Healthcare', BillingCity = 'New York'),
 *     new Account(Name = 'Jill Black', AnnualRevenue = 5000000, Industry = 'Technology', BillingCity = 'Los Angeles')
 * };
 * CollectorProvider builder = new CollectorProvider(Account.class);
 * // Accumulate names into a List
 * ICollector nameToListCollector = builder
 *     .toList()
 *     .of(String.class)
 *     .val(Account.Name);
 * List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
 *     .collect(nameToListCollector); // ['John Doe', 'Jane Smith', 'Judy Roe', 'Jack Amber', 'Jill Black']
 * // Concatenate names into a String, separated by commas
 * ICollector concatNamesCollector = builder
 *     .joining()
 *     .del(', ')
 *     .val(Account.Name);
 * String joinedNames = (String) [SObjectEnumerable].of(accounts)
 *     .collect(concatNamesCollector); // 'John Doe, Jane Smith, Judy Roe, Jack Amber, Jill Black'
 * // Compute sum of annual revenue
 * ICollector revenueSumCollector = builder
 *     .summingDouble()
 *     .val(Account.AnnualRevenue);
 * Double revenueSum = (Double) [SObjectEnumerable].of(accounts)
 *     .collect(revenueSumCollector); // 15000000.0
 * // Group accounts by industry
 * ICollector groupByIndustryCollector = builder
 *     .groupingByString()
 *     .key(Account.Industry);
 * Map<String, List<Account>> accountsByIndustry = (Map<String, List<Account>>) [SObjectEnumerable].of(accounts)
 *     .collect(groupByIndustryCollector);
 * // {
 * //    'Technology': [
 * //        { Name: 'John Doe', AnnualRevenue: 1000000, Industry: 'Technology', BillingCity: 'Los Angeles' },
 * //        { Name: 'Jill Black', AnnualRevenue: 5000000, Industry: 'Technology', BillingCity: 'Los Angeles' }
 * //    ],
 * //    'Finance': [
 * //        { Name: 'Jane Smith', AnnualRevenue: 2000000, Industry: 'Finance', BillingCity: 'New York' }
 * //    ],
 * //    'Healthcare': [
 * //        { Name: 'Judy Roe', AnnualRevenue: 3000000, Industry: 'Healthcare', BillingCity: 'Los Angeles' },
 * //        { Name: 'Jack Amber', AnnualRevenue: 4000000, Industry: 'Healthcare', BillingCity: 'New York' }
 * //    ]
 * // }
 * // Map sum of annual revenue by city
 * ICollector revenueByCityCollector = builder
 *     .groupingByString()
 *     .key(Account.BillingCity)
 *     .val(builder.summingDouble().val(Account.AnnualRevenue));
 * Map<String, Object> revenueByCity = (Map<String, Object>) [SObjectEnumerable].of(accounts)
 *     .collect(revenueByCityCollector);
 * // {
 * //    'Los Angeles': 9000000.0,
 * //    'New York': 6000000.0
 * // }
 * // Map names by industry and by city
 * ICollector namesByIndustryAndCityCollector = builder
 *     .groupingByString()
 *     .key(Account.Industry)
 *     .val(builder
 *         .groupingByString()
 *         .key(Account.BillingCity)
 *         .val(builder
 *             .toStringSet()
 *             .val(Account.Name)
 *         )
 *     ).cast(Map<String, Map<String, Set<String>>>.class);
 * Map<String, Map<String, Set<String>>> namesByIndustryAndCity = (Map<String, Map<String, Set<String>>>)
 *     [SObjectEnumerable].of(accounts).collect(namesByIndustryAndCityCollector);
 * // {
 * //    'Technology': {
 * //        'Los Angeles': { 'John Doe', 'Jill Black' }
 * //    },
 * //    'Finance': {
 * //        'New York': { 'Jane Smith' }
 * //    },
 * //    'Healthcare': {
 * //        'Los Angeles': { 'Judy Roe' },
 * //        'New York': { 'Jack Amber' }
 * //    }
 * // }
 */
@SuppressWarnings('PMD.CyclomaticComplexity, PMD.ExcessiveClassLength, PMD.ExcessivePublicCount, PMD.NcssTypeCount')
public virtual inherited sharing class CollectorProvider {
    protected final Type valueType;

    /**
     * @description Initializes a new instance of the `CollectorProvider` class with the specified value type.
     *
     * @param valueType the type of values to be collected
     *
     * @throws NullPointerException if `valueType` is null
     */
    public CollectorProvider(final Type valueType) {
        Validate.notNull(valueType);
        this.valueType = valueType;
    }

    /**
     * @description Returns a `ListValueMappingCollector` that collects elements into a list.
     *
     * @return the `ListValueMappingCollector` to collect elements into a list
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'John Doe'),
     *     new Account(Name = 'Jane Smith')
     * };
     * ICollector nameCollector = new CollectorProvider(Account.class)
     *     .toList()
     *     .of(String.class)
     *     .val(Account.Name);
     * List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
     *     .collect(nameCollector); // ['John Doe', 'Jane Smith']
     */
    public virtual ListValueMappingCollector toList() {
        return toList(valueType, new AddToListBiConsumer());
    }

    /**
     * @description Returns a `SetValueMappingCollector` that collects Boolean values into a set.
     *
     * @return the `SetValueMappingCollector` to collect Boolean values into a set
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(DoNotCall = true),
     *     new Contact(DoNotCall = false)
     * };
     * ICollector doNotCallCollector = new CollectorProvider(Contact.class)
     *     .toBoolSet()
     *     .val(Contact.DoNotCall);
     * Set<Boolean> doNotCallSet = (Set<Boolean>) [SObjectEnumerable].of(contacts)
     *     .collect(doNotCallCollector); // { true, false }
     */
    public virtual SetValueMappingCollector toBoolSet() {
        return toSet(Boolean.class, new AddToBoolSet());
    }

    /**
     * @description Returns a `SetValueMappingCollector` that collects Id values into a set.
     *
     * @return the `SetValueMappingCollector` to collect Id values into a set
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(Id = '003000000000000AAA'),
     *     new Contact(Id = '003000000000001AAA')
     * };
     * ICollector idCollector = new CollectorProvider(Contact.class)
     *     .toIdSet()
     *     .val(Contact.Id);
     * Set<Id> ids = (Set<Id>) [SObjectEnumerable].of(contacts)
     *     .collect(idCollector); // { '003000000000000AAA', '003000000000001AAA' }
     */
    public virtual SetValueMappingCollector toIdSet() {
        return toSet(Id.class, new AddToIdSet());
    }

    /**
     * @description Returns a `SetValueMappingCollector` that collects String values into a set.
     *
     * @return the `SetValueMappingCollector` to collect String values into a set
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(LastName = 'Doe'),
     *     new Contact(LastName = 'Smith')
     * };
     * ICollector lastNameCollector = new CollectorProvider(Contact.class)
     *     .toStringSet()
     *     .val(Contact.LastName);
     * Set<String> lastNames = (Set<String>) [SObjectEnumerable].of(contacts)
     *     .collect(lastNameCollector); // { 'Doe', 'Smith' }
     */
    public virtual SetValueMappingCollector toStringSet() {
        return toSet(String.class, new AddToStringSet());
    }

    /**
     * @description Returns a `SetValueMappingCollector` that collects Blob values into a set.
     *
     * @return the `SetValueMappingCollector` to collect Blob values into a set
     *
     * @example
     * List<Attachment> attachments = new List<Attachment>{
     *     new Attachment(Body = Blob.valueOf('File1')),
     *     new Attachment(Body = Blob.valueOf('File2'))
     * };
     * ICollector bodyCollector = new CollectorProvider(Attachment.class)
     *     .toBlobSet()
     *     .val(Attachment.Body);
     * Set<Blob> bodies = (Set<Blob>) [SObjectEnumerable].of(attachments)
     *     .collect(bodyCollector); // { Blob.valueOf('File1'), Blob.valueOf('File2') }
     */
    public virtual SetValueMappingCollector toBlobSet() {
        return toSet(Blob.class, new AddToBlobSet());
    }

    /**
     * @description Returns a `SetValueMappingCollector` that collects Date values into a set.
     *
     * @return the `SetValueMappingCollector` to collect Date values into a set
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(Birthdate = Date.newInstance(1990, 1, 1)),
     *     new Contact(Birthdate = Date.newInstance(1985, 5, 15))
     * };
     * ICollector birthdateCollector = new CollectorProvider(Contact.class)
     *     .toDateSet()
     *     .val(Contact.Birthdate);
     * Set<Date> birthdates = (Set<Date>) [SObjectEnumerable].of(contacts)
     *     .collect(birthdateCollector); // { 1990-01-01, 1985-05-15 }
     */
    public virtual SetValueMappingCollector toDateSet() {
        return toSet(Date.class, new AddToDateSet());
    }

    /**
     * @description Returns a `SetValueMappingCollector` that collects Datetime values into a set.
     *
     * @return the `SetValueMappingCollector` to collect Datetime values into a set
     *
     * @example
     * List<Event> events = new List<Event>{
     *     new Event(ActivityDateTime = Datetime.now()),
     *     new Event(ActivityDateTime = Datetime.now().addDays(1))
     * };
     * ICollector activityTimeCollector = new CollectorProvider(Event.class)
     *     .toDatetimeSet()
     *     .val(Event.ActivityDateTime);
     * Set<Datetime> activityTimes = (Set<Datetime>) [SObjectEnumerable].of(events)
     *     .collect(activityTimeCollector);
     */
    public virtual SetValueMappingCollector toDatetimeSet() {
        return toSet(Datetime.class, new AddToDatetimeSet());
    }

    /**
     * @description Returns a `SetValueMappingCollector` that collects Time values into a set.
     *
     * @return the `SetValueMappingCollector` to collect Time values into a set
     *
     * @example
     * List<ContactPointEmail> slots = new List<ContactPointEmail>{
     *     new ContactPointEmail(StartTime = Time.newInstance(9, 0, 0, 0)),
     *     new ContactPointEmail(StartTime = Time.newInstance(10, 0, 0, 0))
     * };
     * ICollector startTimeCollector = new CollectorProvider(ContactPointEmail.class)
     *     .toTimeSet()
     *     .val(ContactPointEmail.StartTime);
     * Set<Time> startTimes = (Set<Time>) [SObjectEnumerable].of(slots)
     *     .collect(startTimeCollector); // { 09:00:00.000Z, 10:00:00.000Z }
     */
    public virtual SetValueMappingCollector toTimeSet() {
        return toSet(Time.class, new AddToTimeSet());
    }

    /**
     * @description Returns a `SetValueMappingCollector` that collects Integer values into a set.
     *
     * @return the `SetValueMappingCollector` to collect Integer values into a set
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(NumberOfEmployees = 100),
     *     new Account(NumberOfEmployees = 200)
     * };
     * ICollector employeeCountCollector = new CollectorProvider(Account.class)
     *     .toIntSet()
     *     .val(Account.NumberOfEmployees);
     * Set<Integer> employeeCounts = (Set<Integer>) [SObjectEnumerable].of(accounts)
     *     .collect(employeeCountCollector); // { 100, 200 }
     */
    public virtual SetValueMappingCollector toIntSet() {
        return toSet(Integer.class, new AddToIntSet());
    }

    /**
     * @description Returns a `SetValueMappingCollector` that collects Long values into a set.
     *
     * @return the `SetValueMappingCollector` to collect Long values into a set
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(NumberOfEmployees = 100L),
     *     new Account(NumberOfEmployees = 200L)
     * };
     * ICollector employeeCountCollector = new CollectorProvider(Account.class)
     *     .toLongSet()
     *     .val(Account.NumberOfEmployees);
     * Set<Long> employeeCounts = (Set<Long>) [SObjectEnumerable].of(accounts)
     *     .collect(employeeCountCollector); // { 100, 200 }
     */
    public virtual SetValueMappingCollector toLongSet() {
        return toSet(Long.class, new AddToLongSet());
    }

    /**
     * @description Returns a `SetValueMappingCollector` that collects Double values into a set.
     *
     * @return the `SetValueMappingCollector` to collect Double values into a set
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(AnnualRevenue = 500000.0),
     *     new Account(AnnualRevenue = 1000000.0)
     * };
     * ICollector revenueCollector = new CollectorProvider(Double.class)
     *     .toDoubleSet()
     *     .val(Account.AnnualRevenue);
     * Set<Double> revenues = (Set<Double>) [SObjectEnumerable].of(accounts)
     *     .collect(revenueCollector); // { 500000.0, 1000000.0 }
     */
    public virtual SetValueMappingCollector toDoubleSet() {
        return toSet(Double.class, new AddToDoubleSet());
    }

    /**
     * @description Returns a `SetValueMappingCollector` that collects SObject values into a set.
     *
     * @return the `SetValueMappingCollector` to collect SObject values into a set
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'Account A'),
     *     new Account(Name = 'Account B')
     * };
     * ICollector accountCollector = new CollectorProvider(SObject.class)
     *     .toSObjectSet();
     * Set<SObject> accountSet = (Set<SObject>) [SObjectEnumerable].of(accounts)
     *     .collect(accountCollector);
     */
    public virtual SetValueMappingCollector toSObjectSet() {
        return toSet(SObject.class, new AddToSObjectSet());
    }

    /**
     * @description Returns a `SetValueMappingCollector` that collects Object values into a set.
     * <p>The result set <strong>cannot</strong> be cast to a specific type.</p>
     * <p>To get a result container of a specific type use `to<T>Set()` collectors
     * such as {@link CollectorProvider.toIdSet}, {@link CollectorProvider.toStringSet}, etc.</p>
     *
     * @return the `SetValueMappingCollector` to collect Object values into a set
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(Industry = 'Technology'),
     *     new Account(Industry = 'Finance')
     * };
     * ICollector industryCollector = new CollectorProvider(Object.class)
     *     .toObjectSet()
     *     .val(Account.Industry);
     * Set<Object> industries = (Set<Object>) [SObjectEnumerable].of(accounts)
     *     .collect(industryCollector); // { 'Technology', 'Finance' }
     */
    public virtual SetValueMappingCollector toObjectSet() {
        return toSet(Object.class, new AddToObjectSet());
    }

    /**
     * @description Returns a `MapKeyMapping` that collects elements into a map with Boolean keys.
     *
     * @return the `MapKeyMapping` to collect elements into a map with Boolean keys
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(DoNotCall = true, LastName = 'Doe'),
     *     new Contact(DoNotCall = false, LastName = 'Smith')
     * };
     * ICollector contactByDoNotCallCollector = new CollectorProvider(Contact.class)
     *     .toByBoolMap()
     *     .key(Contact.DoNotCall);
     * Map<Boolean, Contact> contactByDoNotCall = (Map<Boolean, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(contactByDoNotCallCollector);
     * // {
     * //   true => { DoNotCall: true, LastName: 'Doe' },
     * //   false => { DoNotCall: false, LastName: 'Smith' }
     * // }
     * ICollector lastNameByDoNotCallCollector = new CollectorProvider(Contact.class)
     *     .toByBoolMap()
     *     .of(String.class)
     *     .key(Contact.DoNotCall)
     *     .val(Contact.LastName);
     * Map<Boolean, String> lastNameByDoNotCall = (Map<Boolean, String>) [SObjectEnumerable].of(contacts)
     *     .collect(lastNameByDoNotCallCollector); // { true => 'Doe', false => 'Smith' }
     */
    public virtual MapKeyMapping toByBoolMap() {
        return toMap(Boolean.class, new PutToObjectByBoolMap());
    }

    /**
     * @description Returns a `MapKeyMapping` that collects elements into a map with Id keys.
     *
     * @return the `MapKeyMapping` to collect elements into a map with Id keys
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(AccountId = '001000000000001AAA', LastName = 'Doe'),
     *     new Contact(AccountId = '001000000000002AAA', LastName = 'Smith')
     * };
     * ICollector contactByAccountIdCollector = new CollectorProvider(Contact.class)
     *     .toByIdMap()
     *     .key(Contact.AccountId);
     * Map<Id, Contact> contactByAccountId = (Map<Id, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(contactByAccountIdCollector);
     * // {
     * //   '001000000000001AAA' => { AccountId: '001000000000001AAA', LastName: 'Doe' },
     * //   '001000000000002AAA' => { AccountId: '001000000000002AAA', LastName: 'Smith' }
     * // }
     * ICollector lastNameByAccountIdCollector = new CollectorProvider(Contact.class)
     *     .toByIdMap()
     *     .of(String.class)
     *     .key(Contact.AccountId)
     *     .val(Contact.LastName);
     * Map<Id, String> lastNameByAccountId = (Map<Id, String>) [SObjectEnumerable].of(contacts)
     *     .collect(lastNameByAccountIdCollector); // { '001000000000001AAA' => 'Doe', '001000000000002AAA' => 'Smith' }
     */
    public virtual MapKeyMapping toByIdMap() {
        return toMap(Id.class, new PutToObjectByIdMap());
    }

    /**
     * @description Returns a `MapKeyMapping` that collects elements into a map with String keys.
     *
     * @return the `MapKeyMapping` to collect elements into a map with String keys
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(Email = 'john@example.com', LastName = 'Doe'),
     *     new Contact(Email = 'jane@example.com', LastName = 'Smith')
     * };
     * ICollector contactByEmailCollector = new CollectorProvider(Contact.class)
     *     .toByStringMap()
     *     .key(Contact.Email);
     * Map<String, Contact> contactByEmail = (Map<String, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(contactByEmailCollector);
     * // {
     * //   'john@example.com' => { Email: 'john@example.com', LastName: 'Doe' },
     * //   'jane@example.com' => { Email: 'jane@example.com', LastName: 'Smith' }
     * // }
     * ICollector lastNameByEmailCollector = new CollectorProvider(Contact.class)
     *     .toByStringMap()
     *     .of(String.class)
     *     .key(Contact.Email)
     *     .val(Contact.LastName);
     * Map<String, String> lastNameByEmail = (Map<String, String>) [SObjectEnumerable].of(contacts)
     *     .collect(lastNameByEmailCollector); // { 'john@example.com' => 'Doe', 'jane@example.com' => 'Smith' }
     */
    public virtual MapKeyMapping toByStringMap() {
        return toMap(String.class, new PutToObjectByStringMap());
    }

    /**
     * @description Returns a `MapKeyMapping` that collects elements into a map with Blob keys.
     *
     * @return the `MapKeyMapping` to collect elements into a map with Blob keys
     *
     * @example
     * List<Attachment> attachments = new List<Attachment>{
     *     new Attachment(Body = Blob.valueOf('File1'), Name = 'Attachment1'),
     *     new Attachment(Body = Blob.valueOf('File2'), Name = 'Attachment2')
     * };
     * ICollector attachmentByBodyCollector = new CollectorProvider(Attachment.class)
     *     .toByBlobMap()
     *     .key(Attachment.Body);
     * Map<Blob, Attachment> attachmentByBody = (Map<Blob, Attachment>) [SObjectEnumerable].of(attachments)
     *     .collect(attachmentByBodyCollector);
     * // {
     * //   Blob.valueOf('File1') => { Body: Blob.valueOf('File1'), Name: 'Attachment1' },
     * //   Blob.valueOf('File2') => { Body: Blob.valueOf('File2'), Name: 'Attachment2' }
     * // }
     * ICollector nameByBodyCollector = new CollectorProvider(Attachment.class)
     *     .toByBlobMap()
     *     .of(String.class)
     *     .key(Attachment.Body)
     *     .val(Attachment.Name);
     * Map<Blob, String> nameByBody = (Map<Blob, String>) [SObjectEnumerable].of(attachments)
     *     .collect(nameByBodyCollector);
     * // { Blob.valueOf('File1') => 'Attachment1', Blob.valueOf('File2') => 'Attachment2' }
     */
    public virtual MapKeyMapping toByBlobMap() {
        return toMap(Blob.class, new PutToObjectByBlobMap());
    }

    /**
     * @description Returns a `MapKeyMapping` that collects elements into a map with Date keys.
     *
     * @return the `MapKeyMapping` to collect elements into a map with Date keys
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(Birthdate = Date.newInstance(1990, 1, 1), LastName = 'Doe'),
     *     new Contact(Birthdate = Date.newInstance(1985, 5, 15), LastName = 'Smith')
     * };
     * ICollector contactByBirthdateCollector = new CollectorProvider(Contact.class)
     *     .toByDateMap()
     *     .key(Contact.Birthdate);
     * Map<Date, Contact> contactByBirthdate = (Map<Date, Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(contactByBirthdateCollector);
     * // {
     * //   (1990, 1, 1) => { Birthdate: 1990-01-01, LastName: 'Doe' },
     * //   (1985, 5, 15) => { Birthdate: 1985-05-15, LastName: 'Smith' }
     * // }
     * ICollector lastNameByBirthdateCollector = new CollectorProvider(Contact.class)
     *     .toByDateMap()
     *     .of(String.class)
     *     .key(Contact.Birthdate)
     *     .val(Contact.LastName);
     * Map<Date, String> lastNameByBirthdate = (Map<Date, String>) [SObjectEnumerable].of(contacts)
     *     .collect(lastNameByBirthdateCollector);
     * // { (1990, 1, 1) => 'Doe', (1985, 5, 15) => 'Smith' }
     */
    public virtual MapKeyMapping toByDateMap() {
        return toMap(Date.class, new PutToObjectByDateMap());
    }

    /**
     * @description Returns a `MapKeyMapping` that collects elements into a map with Datetime keys.
     *
     * @return the `MapKeyMapping` to collect elements into a map with Datetime keys
     *
     * @example
     * List<Event> events = new List<Event>{
     *     new Event(ActivityDateTime = Datetime.now(), Description = 'Meeting'),
     *     new Event(ActivityDateTime = Datetime.now().addHours(1), Description = 'Call')
     * };
     * ICollector eventByActivityTimeCollector = new CollectorProvider(Event.class)
     *     .toByDatetimeMap()
     *     .key(Event.ActivityDateTime);
     * Map<Datetime, Event> eventByActivityTime = (Map<Datetime, Event>) [SObjectEnumerable].of(events)
     *     .collect(eventByActivityTimeCollector);
     * ICollector descriptionByActivityTimeCollector = new CollectorProvider(Event.class)
     *     .toByDatetimeMap()
     *     .of(String.class)
     *     .key(Event.ActivityDateTime)
     *     .val(Event.Description);
     * Map<Datetime, String> descriptionByActivityTime = (Map<Datetime, String>) [SObjectEnumerable].of(events)
     *     .collect(descriptionByActivityTimeCollector);
     */
    public virtual MapKeyMapping toByDatetimeMap() {
        return toMap(Datetime.class, new PutToObjectByDatetimeMap());
    }

    /**
     * @description Returns a `MapKeyMapping` that collects elements into a map with Time keys.
     *
     * @return the `MapKeyMapping` to collect elements into a map with Time keys
     *
     * @example
     * List<ContactPointEmail> slots = new List<ContactPointEmail>{
     *     new ContactPointEmail(StartTime = Time.newInstance(9, 0, 0, 0), EndTime = Time.newInstance(10, 0, 0, 0)),
     *     new ContactPointEmail(StartTime = Time.newInstance(11, 0, 0, 0), EndTime = Time.newInstance(12, 0, 0, 0))
     * };
     * ICollector slotByStartTimeCollector = new CollectorProvider(ContactPointEmail.class)
     *     .toByTimeMap()
     *     .key(ContactPointEmail.StartTime);
     * Map<Time, ContactPointEmail> slotByStartTime = (Map<Time, ContactPointEmail>) [SObjectEnumerable].of(slots)
     *     .collect(slotByStartTimeCollector);
     * ICollector endTimeByStartTimeCollector = new CollectorProvider(ContactPointEmail.class)
     *     .toByTimeMap()
     *     .of(Time.class)
     *     .key(ContactPointEmail.StartTime)
     *     .val(ContactPointEmail.EndTime);
     * Map<Time, Time> endTimeByStartTime = (Map<Time, Time>) [SObjectEnumerable].of(slots)
     *     .collect(endTimeByStartTimeCollector);
     */
    public virtual MapKeyMapping toByTimeMap() {
        return toMap(Time.class, new PutToObjectByTimeMap());
    }

    /**
     * @description Returns a `MapKeyMapping` that collects elements into a map with Integer keys.
     *
     * @return the `MapKeyMapping` to collect elements into a map with Integer keys
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(NumberOfEmployees = 100, Name = 'Company A'),
     *     new Account(NumberOfEmployees = 200, Name = 'Company B')
     * };
     * ICollector accountByEmployeesCollector = new CollectorProvider(Account.class)
     *     .toByIntMap()
     *     .key(Account.NumberOfEmployees);
     * Map<Integer, Account> accountByEmployees = (Map<Integer, Account>) [SObjectEnumerable].of(accounts)
     *     .collect(accountByEmployeesCollector);
     * // {
     * //    100 => { NumberOfEmployees: 100, Name: 'Company A' },
     * //    200 => { NumberOfEmployees: 200, Name: 'Company B' }
     * // }
     * ICollector nameByEmployeesCollector = new CollectorProvider(Account.class)
     *     .toByIntMap()
     *     .of(String.class)
     *     .key(Account.NumberOfEmployees)
     *     .val(Account.Name);
     * Map<Integer, String> nameByEmployees = (Map<Integer, String>) [SObjectEnumerable].of(accounts)
     *     .collect(nameByEmployeesCollector); // { 100 => 'Company A', 200 => 'Company B' }
     */
    public virtual MapKeyMapping toByIntMap() {
        return toMap(Integer.class, new PutToObjectByIntMap());
    }

    /**
     * @description Returns a `MapKeyMapping` that collects elements into a map with Long keys.
     *
     * @return the `MapKeyMapping` to collect elements into a map with Long keys
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(NumberOfEmployees = 100L, Name = 'Company A'),
     *     new Account(NumberOfEmployees = 200L, Name = 'Company B')
     * };
     * ICollector accountByEmployeesCollector = new CollectorProvider(Account.class)
     *     .toByLongMap()
     *     .key(Account.NumberOfEmployees);
     * Map<Long, Account> accountByEmployees = (Map<Long, Account>) [SObjectEnumerable].of(accounts)
     *     .collect(accountByEmployeesCollector);
     * // {
     * //    100 => { NumberOfEmployees: 100, Name: 'Company A' },
     * //    200 => { NumberOfEmployees: 200, Name: 'Company B' }
     * // }
     * ICollector nameByEmployeesCollector = new CollectorProvider(Account.class)
     *     .toByLongMap()
     *     .of(String.class)
     *     .key(Account.NumberOfEmployees)
     *     .val(Account.Name);
     * Map<Long, String> nameByEmployees = (Map<Long, String>) [SObjectEnumerable].of(accounts)
     *     .collect(nameByEmployeesCollector); // { 100 => 'Company A', 200 => 'Company B' }
     */
    public virtual MapKeyMapping toByLongMap() {
        return toMap(Long.class, new PutToObjectByLongMap());
    }

    /**
     * @description Returns a `MapKeyMapping` that collects elements into a map with Double keys.
     *
     * @return the `MapKeyMapping` to collect elements into a map with Double keys
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(AnnualRevenue = 500000.0, Name = 'Company A'),
     *     new Account(AnnualRevenue = 1000000.0, Name = 'Company B')
     * };
     * ICollector accountByRevenueCollector = new CollectorProvider(Account.class)
     *     .toByDoubleMap()
     *     .key(Account.AnnualRevenue);
     * Map<Double, Account> accountByRevenue = (Map<Double, Account>) [SObjectEnumerable].of(accounts)
     *     .collect(accountByRevenueCollector);
     * // {
     * //    500000.0 => { AnnualRevenue: 500000.0, Name: 'Company A' },
     * //    1000000.0 => { AnnualRevenue: 1000000.0, Name: 'Company B' }
     * // }
     * ICollector nameByRevenueCollector = new CollectorProvider(Account.class)
     *     .toByDoubleMap()
     *     .of(String.class)
     *     .key(Account.AnnualRevenue)
     *     .val(Account.Name);
     * Map<Double, String> nameByRevenue = (Map<Double, String>) [SObjectEnumerable].of(accounts)
     *     .collect(nameByRevenueCollector); // { 500000.0 => 'Company A', 1000000.0 => 'Company B' }
     */
    public virtual MapKeyMapping toByDoubleMap() {
        return toMap(Double.class, new PutToObjectByDoubleMap());
    }

    /**
     * @description Returns a `MapKeyMapping` that collects elements into a map with Object keys.
     * <p>The result map cannot be cast to a specific key type.</p>
     *
     * @return the `MapKeyMapping` to collect elements into a map with Object keys
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(Industry = 'Technology', Name = 'Company A'),
     *     new Account(Industry = 'Finance', Name = 'Company B')
     * };
     * ICollector accountByIndustryCollector = new CollectorProvider(Account.class)
     *     .toByObjectMap()
     *     .key(Account.Industry);
     * Map<Object, Account> accountByIndustry = (Map<Object, Account>) [SObjectEnumerable].of(accounts)
     *     .collect(accountByIndustryCollector);
     * // {
     * //    'Technology' => { Industry: 'Technology', Name: 'Company A' },
     * //    'Finance' => { Industry: 'Finance', Name: 'Company B' }
     * // }
     * ICollector nameByIndustryCollector = new CollectorProvider(Account.class)
     *     .toByObjectMap()
     *     .of(String.class)
     *     .key(Account.Industry)
     *     .val(Account.Name);
     * Map<Object, String> nameByIndustry = (Map<Object, String>) [SObjectEnumerable].of(accounts)
     *     .collect(nameByIndustryCollector); // { 'Technology' => 'Company A', 'Finance' => 'Company B' }
     */
    public virtual MapKeyMapping toByObjectMap() {
        return toMap(Object.class, new PutToObjectByObjectMap());
    }

    /**
     * @description Returns a `GroupKeyMapping` that groups elements into a map with Boolean keys.
     *
     * @return the `GroupKeyMapping` to group elements into a map with Boolean keys
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(DoNotCall = true, LastName = 'Doe'),
     *     new Contact(DoNotCall = false, LastName = 'Smith')
     * };
     * ICollector contactsByDoNotCallCollector = new CollectorProvider(Contact.class)
     *     .groupingByBool()
     *     .key(Contact.DoNotCall);
     * Map<Boolean, List<Contact>> contactsByDoNotCall = (Map<Boolean, List<Contact>>) [SObjectEnumerable].of(contacts)
     *     .collect(contactsByDoNotCallCollector);
     * // {
     * //   true => [{ DoNotCall: true, LastName: 'Doe' }],
     * //   false => [{ DoNotCall: false, LastName: 'Smith' }]
     * // }
     * ICollector lastNamesByDoNotCallCollector = new CollectorProvider(Contact.class)
     *     .groupingByBool()
     *     .of(List<String>.class)
     *     .key(Contact.DoNotCall)
     *     .val(Contact.LastName);
     * Map<Boolean, List<String>> lastNamesByDoNotCall = (Map<Boolean, List<String>>) [SObjectEnumerable].of(contacts)
     *     .collect(lastNamesByDoNotCallCollector); // { true => ['Doe'], false => ['Smith'] }
     */
    public virtual GroupKeyMapping groupingByBool() {
        return groupingBy(Boolean.class, new PutToObjectsByBoolMap(), new GroupByBoolFinisher());
    }

    /**
     * @description Returns a `GroupKeyMapping` that groups elements into a map with Id keys.
     *
     * @return the `GroupKeyMapping` to group elements into a map with Id keys
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(AccountId = '001000000000001AAA', LastName = 'Doe'),
     *     new Contact(AccountId = '001000000000002AAA', LastName = 'Smith')
     * };
     * ICollector contactsByAccountIdCollector = new CollectorProvider(Contact.class)
     *     .groupingById()
     *     .key(Contact.AccountId);
     * Map<Id, List<Contact>> contactsByAccountId = (Map<Id, List<Contact>>) [SObjectEnumerable].of(contacts)
     *     .collect(contactsByAccountIdCollector);
     * // {
     * //   '001000000000001AAA' => [{ AccountId: '001000000000001AAA', LastName: 'Doe' }],
     * //   '001000000000002AAA' => [{ AccountId: '001000000000002AAA', LastName: 'Smith' }]
     * // }
     * ICollector lastNamesByAccountIdCollector = new CollectorProvider(Contact.class)
     *     .groupingById()
     *     .of(List<String>.class)
     *     .key(Contact.AccountId)
     *     .val(Contact.LastName);
     * Map<Id, List<String>> lastNamesByAccountId = (Map<Id, List<String>>) [SObjectEnumerable].of(contacts)
     *     .collect(lastNamesByAccountIdCollector);
     * // { '001000000000001AAA' => ['Doe'], '001000000000002AAA' => ['Smith'] }
     */
    public virtual GroupKeyMapping groupingById() {
        return groupingBy(Id.class, new PutToObjectsByIdMap(), new GroupByIdFinisher());
    }

    /**
     * @description Returns a `GroupKeyMapping` that groups elements into a map with String keys.
     *
     * @return the `GroupKeyMapping` to group elements into a map with String keys
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(Email = 'john@example.com', LastName = 'Doe'),
     *     new Contact(Email = 'jane@example.com', LastName = 'Smith')
     * };
     * ICollector contactsByEmailCollector = new CollectorProvider(Contact.class)
     *     .groupingByString()
     *     .key(Contact.Email);
     * Map<String, List<Contact>> contactsByEmail = (Map<String, List<Contact>>) [SObjectEnumerable].of(contacts)
     *     .collect(contactsByEmailCollector);
     * // {
     * //   'john@example.com' => [{ Email: 'john@example.com', LastName: 'Doe' }],
     * //   'jane@example.com' => [{ Email: 'jane@example.com', LastName: 'Smith' }]
     * // }
     * ICollector lastNamesByEmailCollector = new CollectorProvider(Contact.class)
     *     .groupingByString()
     *     .of(List<String>.class)
     *     .key(Contact.Email)
     *     .val(Contact.LastName);
     * Map<String, List<String>> lastNamesByEmail = (Map<String, List<String>>) [SObjectEnumerable].of(contacts)
     *     .collect(lastNamesByEmailCollector); // { 'john@example.com' => ['Doe'], 'jane@example.com' => ['Smith'] }
     */
    public virtual GroupKeyMapping groupingByString() {
        return groupingBy(String.class, new PutToObjectsByStringMap(), new GroupByStringFinisher());
    }

    /**
     * @description Returns a `GroupKeyMapping` that groups elements into a map with Blob keys.
     *
     * @return the `GroupKeyMapping` to group elements into a map with Blob keys
     *
     * @example
     * List<Attachment> attachments = new List<Attachment>{
     *     new Attachment(Body = Blob.valueOf('File1'), Name = 'Attachment1'),
     *     new Attachment(Body = Blob.valueOf('File2'), Name = 'Attachment2')
     * };
     * ICollector attachmentsByBodyCollector = new CollectorProvider(Attachment.class)
     *     .groupingByBlob()
     *     .key(Attachment.Body);
     * Map<Blob, List<Attachment>> attachmentsByBody = (Map<Blob, List<Attachment>>) [SObjectEnumerable].of(attachments)
     *     .collect(attachmentsByBodyCollector);
     * // {
     * //   Blob.valueOf('File1') => [{ Body: Blob.valueOf('File1'), Name: 'Attachment1' }],
     * //   Blob.valueOf('File2') => [{ Body: Blob.valueOf('File2'), Name: 'Attachment2' }]
     * // }
     * ICollector namesByBodyCollector = new CollectorProvider(Attachment.class)
     *     .groupingByBlob()
     *     .of(List<String>.class)
     *     .key(Attachment.Body)
     *     .val(Attachment.Name);
     * Map<Blob, List<String>> namesByBody = (Map<Blob, List<String>>) [SObjectEnumerable].of(attachments)
     *     .collect(namesByBodyCollector);
     * // { Blob.valueOf('File1') => ['Attachment1'], Blob.valueOf('File2') => ['Attachment2'] }
     */
    public virtual GroupKeyMapping groupingByBlob() {
        return groupingBy(Blob.class, new PutToObjectsByBlobMap(), new GroupByBlobFinisher());
    }

    /**
     * @description Returns a `GroupKeyMapping` that groups elements into a map with Date keys.
     *
     * @return the `GroupKeyMapping` to group elements into a map with Date keys
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(Birthdate = Date.newInstance(1990, 1, 1), LastName = 'Doe'),
     *     new Contact(Birthdate = Date.newInstance(1985, 5, 15), LastName = 'Smith')
     * };
     * ICollector contactsByBirthdateCollector = new CollectorProvider(Contact.class)
     *     .groupingByDate()
     *     .key(Contact.Birthdate);
     * Map<Date, List<Contact>> contactsByBirthdate = (Map<Date, List<Contact>>) [SObjectEnumerable].of(contacts)
     *     .collect(contactsByBirthdateCollector);
     * // {
     * //   (1990, 1, 1) => [{ Birthdate: 1990-01-01, LastName: 'Doe' }],
     * //   (1985, 5, 15) => [{ Birthdate: 1985-05-15, LastName: 'Smith' }]
     * // }
     * ICollector lastNamesByBirthdateCollector = new CollectorProvider(Contact.class)
     *     .groupingByDate()
     *     .of(List<String>.class)
     *     .key(Contact.Birthdate)
     *     .val(Contact.LastName);
     * Map<Date, List<String>> lastNamesByBirthdate = (Map<Date, List<String>>) [SObjectEnumerable].of(contacts)
     *     .collect(lastNamesByBirthdateCollector); // { (1990, 1, 1) => ['Doe'], (1985, 5, 15) => ['Smith'] }
     */
    public virtual GroupKeyMapping groupingByDate() {
        return groupingBy(Date.class, new PutToObjectsByDateMap(), new GroupByDateFinisher());
    }

    /**
     * @description Returns a `GroupKeyMapping` that groups elements into a map with Datetime keys.
     *
     * @return the `GroupKeyMapping` to group elements into a map with Datetime keys
     *
     * @example
     * List<Event> events = new List<Event>{
     *     new Event(ActivityDateTime = Datetime.now(), Description = 'Meeting'),
     *     new Event(ActivityDateTime = Datetime.now().addHours(1), Description = 'Call')
     * };
     * ICollector eventsByActivityTimeCollector = new CollectorProvider(Event.class)
     *     .groupingByDatetime()
     *     .key(Event.ActivityDateTime);
     * Map<Datetime, List<Event>> eventsByActivityTime = (Map<Datetime, List<Event>>) [SObjectEnumerable].of(events)
     *     .collect(eventsByActivityTimeCollector);
     * // {
     * //   Datetime.now() => [{ ActivityDateTime: Datetime.now(), Description: 'Meeting' }],
     * //   Datetime.now().addHours(1) => [{ ActivityDateTime: Datetime.now().addHours(1), Description: 'Call' }]
     * // }
     * ICollector descriptionsByActivityTimeCollector = new CollectorProvider(Event.class)
     *     .groupingByDatetime()
     *     .of(List<String>.class)
     *     .key(Event.ActivityDateTime)
     *     .val(Event.Description);
     * Map<Datetime, List<String>> descriptionsByActivityTime = (Map<Datetime, List<String>>)
     *     [SObjectEnumerable].of(events).collect(descriptionsByActivityTimeCollector);
     * // { Datetime.now() => ['Meeting'], Datetime.now().addHours(1) => ['Call'] }
     */
    public virtual GroupKeyMapping groupingByDatetime() {
        return groupingBy(Datetime.class, new PutToObjectsByDatetimeMap(), new GroupByDatetimeFinisher());
    }

    /**
     * @description Returns a `GroupKeyMapping` that groups elements into a map with Time keys.
     *
     * @return the `GroupKeyMapping` to group elements into a map with Time keys
     *
     * @example
     * List<ContactPointEmail> slots = new List<ContactPointEmail>{
     *     new ContactPointEmail(StartTime = Time.newInstance(9, 0, 0, 0), EndTime = Time.newInstance(10, 0, 0, 0)),
     *     new ContactPointEmail(StartTime = Time.newInstance(11, 0, 0, 0), EndTime = Time.newInstance(12, 0, 0, 0))
     * };
     * ICollector slotsByStartTimeCollector = new CollectorProvider(ContactPointEmail.class)
     *     .groupingByTime()
     *     .key(ContactPointEmail.StartTime);
     * Map<Time, List<ContactPointEmail>> slotsByStartTime = (Map<Time, List<ContactPointEmail>>)
     *     [SObjectEnumerable].of(slots).collect(slotsByStartTimeCollector);
     * // {
     * //   09:00:00.000Z => [{ StartTime: Time.newInstance(9, 0, 0, 0), EndTime: Time.newInstance(10, 0, 0, 0) }],
     * //   11:00:00.000Z => [{ StartTime: Time.newInstance(11, 0, 0, 0), EndTime: Time.newInstance(12, 0, 0, 0) }]
     * // }
     * ICollector endTimesByStartTimeCollector = new CollectorProvider(ContactPointEmail.class)
     *     .groupingByTime()
     *     .of(List<String>.class)
     *     .key(ContactPointEmail.StartTime)
     *     .val(ContactPointEmail.EndTime);
     * Map<Time, List<Time>> endTimesByStartTime = (Map<Time, List<Time>>) [SObjectEnumerable].of(slots)
     *     .collect(endTimesByStartTimeCollector);
     * // { 09:00:00.000Z => [10:00:00.000Z], 11:00:00.000Z => [12:00:00.000Z] }
     */
    public virtual GroupKeyMapping groupingByTime() {
        return groupingBy(Time.class, new PutToObjectsByTimeMap(), new GroupByTimeFinisher());
    }

    /**
     * @description Returns a `GroupKeyMapping` that groups elements into a map with Integer keys.
     *
     * @return the `GroupKeyMapping` to group elements into a map with Integer keys
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(NumberOfEmployees = 100, Name = 'Company A'),
     *     new Account(NumberOfEmployees = 200, Name = 'Company B')
     * };
     * ICollector accountsByEmployeesCollector = new CollectorProvider(Account.class)
     *     .groupingByInt()
     *     .key(Account.NumberOfEmployees);
     * Map<Integer, List<Account>> accountsByEmployees = (Map<Integer, List<Account>>) [SObjectEnumerable].of(accounts)
     *     .collect(accountsByEmployeesCollector);
     * // {
     * //    100 => [{ NumberOfEmployees: 100, Name: 'Company A' }],
     * //    200 => [{ NumberOfEmployees: 200, Name: 'Company B' }]
     * // }
     * ICollector namesByEmployeesCollector = new CollectorProvider(Account.class)
     *     .groupingByInt()
     *     .of(List<String>.class)
     *     .key(Account.NumberOfEmployees)
     *     .val(Account.Name);
     * Map<Integer, List<String>> namesByEmployees = (Map<Integer, List<String>>) [SObjectEnumerable].of(accounts)
     *     .collect(namesByEmployeesCollector); // { 100 => ['Company A'], 200 => ['Company B'] }
     */
    public virtual GroupKeyMapping groupingByInt() {
        return groupingBy(Integer.class, new PutToObjectsByIntMap(), new GroupByIntFinisher());
    }

    /**
     * @description Returns a `GroupKeyMapping` that groups elements into a map with Long keys.
     *
     * @return the `GroupKeyMapping` to group elements into a map with Long keys
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(NumberOfEmployees = 100L, Name = 'Company A'),
     *     new Account(NumberOfEmployees = 200L, Name = 'Company B')
     * };
     * ICollector accountsByEmployeesCollector = new CollectorProvider(Account.class)
     *     .groupingByLong()
     *     .key(Account.NumberOfEmployees);
     * Map<Long, List<Account>> accountsByEmployees = (Map<Long, List<Account>>) [SObjectEnumerable].of(accounts)
     *     .collect(accountsByEmployeesCollector);
     * // {
     * //    100L => [{ NumberOfEmployees: 100L, Name: 'Company A' }],
     * //    200L => [{ NumberOfEmployees: 200L, Name: 'Company B' }]
     * // }
     * ICollector namesByEmployeesCollector = new CollectorProvider(Account.class)
     *     .groupingByLong()
     *     .of(List<String>.class)
     *     .key(Account.NumberOfEmployees)
     *     .val(Account.Name);
     * Map<Long, List<String>> namesByEmployees = (Map<Long, List<String>>) [SObjectEnumerable].of(accounts)
     *     .collect(namesByEmployeesCollector); // { 100L => ['Company A'], 200L => ['Company B'] }
     */
    public virtual GroupKeyMapping groupingByLong() {
        return groupingBy(Long.class, new PutToObjectsByLongMap(), new GroupByLongFinisher());
    }

    /**
     * @description Returns a `GroupKeyMapping` that groups elements into a map with Double keys.
     *
     * @return the `GroupKeyMapping` to group elements into a map with Double keys
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(AnnualRevenue = 500000.0, Name = 'Company A'),
     *     new Account(AnnualRevenue = 1000000.0, Name = 'Company B')
     * };
     * ICollector accountsByRevenueCollector = new CollectorProvider(Account.class)
     *     .groupingByDouble()
     *     .key(Account.AnnualRevenue);
     * Map<Double, List<Account>> accountsByRevenue = (Map<Double, List<Account>>) [SObjectEnumerable].of(accounts)
     *     .collect(accountsByRevenueCollector);
     * // {
     * //    500000.0 => [{ AnnualRevenue: 500000.0, Name: 'Company A' }],
     * //    1000000.0 => [{ AnnualRevenue: 1000000.0, Name: 'Company B' }]
     * // }
     * ICollector namesByRevenueCollector = new CollectorProvider(Account.class)
     *     .groupingByDouble()
     *     .of(List<String>.class)
     *     .key(Account.AnnualRevenue)
     *     .val(Account.Name);
     * Map<Double, List<String>> namesByRevenue = (Map<Double, List<String>>) [SObjectEnumerable].of(accounts)
     *     .collect(namesByRevenueCollector); // { 500000.0 => ['Company A'], 1000000.0 => ['Company B'] }
     */
    public virtual GroupKeyMapping groupingByDouble() {
        return groupingBy(Double.class, new PutToObjectsByDoubleMap(), new GroupByDoubleFinisher());
    }

    /**
     * @description Returns a `GroupKeyMapping` that groups elements into a map with Object keys.
     *
     * @return the `GroupKeyMapping` to group elements into a map with Object keys
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(Industry = 'Technology', Name = 'Company A'),
     *     new Account(Industry = 'Finance', Name = 'Company B')
     * };
     * ICollector accountsByIndustryCollector = new CollectorProvider(Account.class)
     *     .groupingByObject()
     *     .key(Account.Industry);
     * Map<Object, List<Account>> accountsByIndustry = (Map<Object, List<Account>>) [SObjectEnumerable].of(accounts)
     *     .collect(accountsByIndustryCollector);
     * // {
     * //    'Technology' => [{ Industry: 'Technology', Name: 'Company A' }],
     * //    'Finance' => [{ Industry: 'Finance', Name: 'Company B' }]
     * // }
     * ICollector namesByIndustryCollector = new CollectorProvider(Account.class)
     *     .groupingByObject()
     *     .of(List<String>.class)
     *     .key(Account.Industry)
     *     .val(Account.Name);
     * Map<Object, List<String>> namesByIndustry = (Map<Object, List<String>>) [SObjectEnumerable].of(accounts)
     *     .collect(namesByIndustryCollector); // { 'Technology' => ['Company A'], 'Finance' => ['Company B'] }
     */
    public virtual GroupKeyMapping groupingByObject() {
        return groupingBy(Object.class, new PutToObjectsByObjectMap(), new GroupByObjectFinisher());
    }

    /**
     * @description Creates a partition mapping based on a boolean condition (predicate).
     *
     * @return the `PartitionKeyMapping` instance for chaining
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(DoNotCall = true, LastName = 'Doe'),
     *     new Contact(DoNotCall = false, LastName = 'Smith')
     * };
     * ICollector partitionByDoNotCallCollector = new CollectorProvider(Contact.class)
     *     .partitioningBy()
     *     .key(Contact.DoNotCall);
     * Map<Boolean, List<Contact>> partitionedContacts = (Map<Boolean, List<Contact>>) [SObjectEnumerable].of(contacts)
     *     .collect(partitionByDoNotCallCollector);
     * // {
     * //   true => [{ DoNotCall: true, LastName: 'Doe' }],
     * //   false => [{ DoNotCall: false, LastName: 'Smith' }]
     * // }
     */
    public virtual PartitionKeyMapping partitioningBy() {
        return new PartitionKeyMapping(valueType);
    }

    /**
     * @description Creates a join value mapping that joins elements into a single string
     * with customizable delimiter, prefix, and suffix.
     *
     * @return the `JoinMapping` instance for chaining
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(LastName = 'Doe'),
     *     new Contact(LastName = 'Smith')
     * };
     * ICollector joinedNamesCollector = new CollectorProvider(Contact.class)
     *     .joining()
     *     .del(', ')
     *     .val(Contact.LastName);
     * String joinedNames = (String) [SObjectEnumerable].of(contacts)
     *     .collect(joinedNamesCollector); // 'Doe, Smith'
     */
    public virtual JoinMapping joining() {
        return new JoinMapping();
    }

    /**
     * @description Inits the configuration that calculates the average of `Integer` values.
     *
     * @return the `AverageIntMapping` instance for chaining
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(NumberOfEmployees = 100),
     *     new Account(NumberOfEmployees = 200)
     * };
     * ICollector avgEmployeesCollector = new CollectorProvider(Account.class)
     *     .averagingInt()
     *     .val(Account.NumberOfEmployees);
     * Double avgEmployees = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(avgEmployeesCollector); // 150.0
     */
    public virtual AverageIntMapping averagingInt() {
        return new AverageIntMapping();
    }

    /**
     * @description Inits the configuration that sums up `Integer` values.
     * If no elements are present, the result is null.
     *
     * @return the `SumIntMapping` instance for chaining
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(NumberOfEmployees = 100),
     *     new Account(NumberOfEmployees = 200)
     * };
     * ICollector sumEmployeesCollector = new CollectorProvider(Account.class)
     *     .summingInt()
     *     .val(Account.NumberOfEmployees);
     * Integer totalEmployees = (Integer) [SObjectEnumerable].of(accounts)
     *     .collect(sumEmployeesCollector); // 300
     */
    public virtual SumIntMapping summingInt() {
        return new SumIntMapping();
    }

    /**
     * @description Inits the configuration that counts the number of elements.
     * Internally, it uses the `summingInt()` collector with a constant value of 1 for each element.
     * If no elements are present, the result is 0.
     *
     * @return the `Collector` instance for counting elements
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(LastName = 'Doe'),
     *     new Contact(LastName = 'Smith')
     * };
     * Long count = (Long) [SObjectEnumerable].of(contacts)
     *     .collect(new CollectorProvider(Contact.class).counting()); // 2
     */
    public virtual Collector counting() {
        return summingInt().val(Function.constant(1));
    }

    /**
     * @description Inits the configuration that calculates the average of `Long` values.
     * If no elements are present, the result is null.
     *
     * @return the `AverageLongMapping` instance for chaining
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(AnnualRevenue = 500000L),
     *     new Account(AnnualRevenue = 1500000L)
     * };
     * ICollector avgRevenueCollector = new CollectorProvider(Account.class)
     *     .averagingLong()
     *     .val(Account.AnnualRevenue);
     * Double avgRevenue = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(avgRevenueCollector); // 1000000.0
     */
    public virtual AverageLongMapping averagingLong() {
        return new AverageLongMapping();
    }

    /**
     * @description Inits the configuration that sums up `Long` values.
     * If no elements are present, the result is null.
     *
     * @return the `SumLongMapping` instance for chaining
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(AnnualRevenue = 500000L),
     *     new Account(AnnualRevenue = 1500000L)
     * };
     * ICollector sumRevenueCollector = new CollectorProvider(Account.class)
     *     .summingLong()
     *     .val(Account.AnnualRevenue);
     * Long totalRevenue = (Long) [SObjectEnumerable].of(accounts)
     *     .collect(sumRevenueCollector); // 2000000L
     */
    public virtual SumLongMapping summingLong() {
        return new SumLongMapping();
    }

    /**
     * @description Inits the configuration that calculates the average of `Double` values.
     * Uses `Kahan Summation` with compensation algorithm.
     * If no elements are present, the result is null.
     *
     * @return the `AverageDoubleMapping` instance for chaining
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(AnnualRevenue = 500000.0),
     *     new Account(AnnualRevenue = 1000000.0)
     * };
     * ICollector avgRevenueCollector = new CollectorProvider(Account.class)
     *     .averagingDouble()
     *     .val(Account.AnnualRevenue);
     * Double avgRevenue = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(avgRevenueCollector); // 750000.0
     */
    public virtual AverageDoubleMapping averagingDouble() {
        return new AverageDoubleMapping();
    }

    /**
     * @description Inits the configuration that sums up `Double` values.
     * Uses `Kahan Summation` with compensation algorithm.
     * If no elements are present, the result is null.
     *
     * @return the `SumDoubleMapping` instance for chaining
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(AnnualRevenue = 500000.0),
     *     new Account(AnnualRevenue = 1000000.0)
     * };
     * ICollector sumRevenueCollector = new CollectorProvider(Account.class)
     *     .summingDouble()
     *     .val(Account.AnnualRevenue);
     * Double totalRevenue = (Double) [SObjectEnumerable].of(accounts)
     *     .collect(sumRevenueCollector); // 1500000.0
     */
    public virtual SumDoubleMapping summingDouble() {
        return new SumDoubleMapping();
    }

    /**
     * @description Inits the configuration for filtering elements based on a specified condition.
     * Allows applying a predicate to filter elements and collect the result into a list or other structures.
     *
     * @return the `Filtering` instance for chaining
     *
     * @example
     * List<Contact> contacts = new List<Contact>{
     *     new Contact(DoNotCall = true, LastName = 'Doe'),
     *     new Contact(DoNotCall = false, LastName = 'Smith')
     * };
     * ICollector doNotCallContactsCollector = new CollectorProvider(Contact.class)
     *     .filtering()
     *     .when(Contact.DoNotCall, true);
     * List<Contact> doNotCallContacts = (List<Contact>) [SObjectEnumerable].of(contacts)
     *     .collect(doNotCallContactsCollector);
     * // [{ DoNotCall: true, LastName: 'Doe' }]
     */
    public virtual Filtering filtering() {
        return new Filtering(valueType);
    }

    /**
     * @description Inits the configuration for mapping elements using a specified function.
     * Allows applying a function to transform elements and collect the result into a list or other structures.
     *
     * @return the `Mapping` instance for chaining
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'Account A'),
     *     new Account(Name = 'Account B')
     * };
     * ICollector namesCollector = new CollectorProvider(Account.class)
     *     .mapping()
     *     .val('Name');
     * List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
     *     .collect(namesCollector); // ['Account A', 'Account B']
     */
    public virtual Mapping mapping() {
        return new Mapping();
    }

    /**
     * @description Inits the configuration for flat-mapping elements using a specified function.
     * Allows applying a function that maps elements to collections and flattening the result into a single collection.
     *
     * @return the `FlatMapping` instance for chaining
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(
     *         Name = 'Account A',
     *         Contacts = new List<Contact>{ new Contact(LastName = 'Smith') }
     *     ),
     *     new Account(
     *         Name = 'Account B',
     *         Contacts = new List<Contact>{ new Contact(LastName = 'Doe'), new Contact(LastName = 'Johnson') }
     *     )
     * };
     * ICollector contactsCollector = new CollectorProvider(Account.class)
     *     .flatMapping()
     *     .val('Contacts');
     * List<Contact> allContacts = (List<Contact>) [SObjectEnumerable].of(accounts)
     *     .collect(contactsCollector);
     * // [{ LastName: 'Smith' }, { LastName: 'Doe' }, { LastName: 'Johnson' }]
     */
    public virtual FlatMapping flatMapping() {
        return new FlatMapping();
    }

    /**
     * @description Creates a `Folding` instance with a specified identity value.
     * Allows applying folding operations (such as reducing or accumulating values) with an initial identity value.
     *
     * @param identity the initial value to start the fold/reduce operation
     *
     * @return the `Folding` instance for chaining
     *
     * @example
     * public class SumDoubleFieldReducer extends BiOperator {
     *     private final String fieldName;
     *     public SumDoubleFieldReducer(String fieldName) { this.fieldName = fieldName; }
     *     public override Object apply(Object seed, Object o) {
     *         ((SObject) seed).put(
     *             fieldName,
     *             (Double) ((SObject) seed).get(fieldName) + (Double) ((SObject) o).get(fieldName)
     *         );
     *         return seed;
     *     }
     * }
     * List<Account> accounts = new List<Account>{
     *     new Account(AnnualRevenue = 500000.0),
     *     new Account(AnnualRevenue = 1000000.0)
     * };
     * Account seed = new Account(Name = 'Account A', AnnualRevenue = 0);
     * ICollector sumCollector = new CollectorProvider(Account.class)
     *     .folding(seed)
     *     .acc(new SumDoubleFieldReducer('AnnualRevenue'));
     * Account sum = (Account) [SObjectEnumerable].of(accounts)
     *     .collect(sumCollector); // { Name: 'Account A', AnnualRevenue: 1500000.0 }
     */
    public virtual Folding folding(final Object identity) {
        return new Folding(identity);
    }

    /**
     * @description Creates a `Reducing` instance that allows applying a reduce operation
     * with a custom accumulator.
     * Unlike `Folding`, uses the first element of the iterator as the initial accumulator value.
     * Unlike `Folding`, the result collector returns `Optional`.
     *
     * @return the `Reducing` instance for chaining
     *
     * @example
     * public class SumDoubleFieldReducer extends BiOperator {
     *     private final String fieldName;
     *     public SumDoubleFieldReducer(String fieldName) { this.fieldName = fieldName; }
     *     public override Object apply(Object seed, Object o) {
     *         ((SObject) seed).put(
     *             fieldName,
     *             (Double) ((SObject) seed).get(fieldName) + (Double) ((SObject) o).get(fieldName)
     *         );
     *         return seed;
     *     }
     * }
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'Account A', AnnualRevenue = 500000.0),
     *     new Account(Name = 'Account B', AnnualRevenue = 1000000.0)
     * };
     * ICollector sumCollector = new CollectorProvider(Account.class)
     *     .reducing()
     *     .acc(new SumDoubleFieldReducer('AnnualRevenue'));
     * IOptional sum = (IOptional) [SObjectEnumerable].of(accounts)
     *     .collect(sumCollector);
     * sum.get(); // { Name: 'Account A', AnnualRevenue: 1500000.0 }
     */
    public virtual Reducing reducing() {
        return new Reducing();
    }

    /**
     * @description Creates a `Maximizing` instance that applies a maximizing operation
     * on elements based on a comparer.
     *
     * @return the `Maximizing` instance for chaining
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'Account A', AnnualRevenue = 500000.0),
     *     new Account(Name = 'Account B', AnnualRevenue = 1000000.0)
     * };
     * ICollector maxRevenueCollector = new CollectorProvider(Account.class)
     *     .maximizing()
     *     .val(Account.AnnualRevenue);
     * IOptional max = (IOptional) [SObjectEnumerable].of(accounts)
     *     .collect(maxRevenueCollector);
     * max.get(); // { Name: 'Account B', AnnualRevenue: 1000000.0 }
     */
    public virtual Maximizing maximizing() {
        return new Maximizing();
    }

    /**
     * @description Creates a `Minimizing` instance that applies a minimizing operation
     * on elements based on a comparer.
     *
     * @return the `Minimizing` instance for chaining
     *
     * @example
     * List<Account> accounts = new List<Account>{
     *     new Account(Name = 'Account A', AnnualRevenue = 500000.0),
     *     new Account(Name = 'Account B', AnnualRevenue = 1000000.0)
     * };
     * ICollector minRevenueCollector = new CollectorProvider(Account.class)
     *     .minimizing()
     *     .val(Account.AnnualRevenue);
     * IOptional min = (IOptional) [SObjectEnumerable].of(accounts)
     *     .collect(minRevenueCollector);
     * min.get(); // { Name: 'Account A', AnnualRevenue: 500000.0 }
     */
    public virtual Minimizing minimizing() {
        return new Minimizing();
    }

    private static ListValueMappingCollector toList(Type valueType, IBiConsumer accumulator) {
        return new ListValueMappingCollector(listType(valueType), accumulator);
    }

    private static SetValueMappingCollector toSet(Type valueType, IBiConsumer accumulator) {
        return new SetValueMappingCollector(setType(valueType), accumulator);
    }

    private MapKeyMapping toMap(Type keyType, PutToMapBiConsumer accumulator) {
        return new MapKeyMapping(keyType, valueType, accumulator);
    }

    private GroupKeyMapping groupingBy(Type keyType, PutToDownstreamMap accumulator, GroupFinisher finisher) {
        return new GroupKeyMapping(keyType, valueType, accumulator, finisher);
    }

    private static Type setType(final Type valueType) {
        return Type.forName('Set<' + valueType + '>');
    }

    private static Type listType(final Type valueType) {
        return Type.forName('List<' + valueType + '>');
    }

    private static Type mapType(final Type keyType, final Type valueType) {
        return Type.forName('Map<' + keyType + ', ' + valueType + '>');
    }

    private static Type groupType(final Type keyType, final Type valueType) {
        return Type.forName('Map<' + keyType + ', List<' + valueType + '>>');
    }

    @SuppressWarnings('PMD.ExcessiveParameterList')
    private static Object mergeValue(
        final IBiOperator merger,
        final Object key,
        final Object oldValue,
        final Object newValue
    ) {
        Validate.state(
            merger != null,
            Label.AFB_ErrorMessage_DuplicateKey,
            new List<Object>{ key, oldValue, newValue }
        );
        return merger.apply(oldValue, newValue);
    }

    private static Double kahanSum(final List<Double> intermediateSum, final Double d) {
        final Double tmp = d - intermediateSum[1];
        final Double sum = intermediateSum[0];
        final Double e = sum + tmp;
        intermediateSum[1] = (e - sum) - tmp;
        intermediateSum[0] = e;
        return d;
    }

    /**
     * @description Provides methods to map values using a function to a downstream collector.
     */
    public virtual class Mapping {
        /**
         * @description Specifies a function to map values for collection.
         *
         * @param mapper the function to map SObjects to values
         *
         * @return the `BaseMappingCollector` to map and collect the values
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'Account A'),
         *     new Account(Name = 'Account B')
         * };
         * ICollector namesCollector = new CollectorProvider(Account.class)
         *     .mapping()
         *     .val(new SObjectFunctionProvider().get(Account.Name));
         * List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
         *     .collect(namesCollector); // ['Account A', 'Account B']
         */
        public virtual BaseMappingCollector val(final IFunction mapper) {
            return new MappingCollector(mapper, new CollectorProvider(Object.class).toList());
        }

        /**
         * @description Collects the elements itself without applying any mapping function.
         *
         * @return the `BaseMappingCollector` to collect the elements directly
         *
         * @example
         * Set<Account> accounts = new Set<Account>{
         *     new Account(Name = 'Account A'),
         *     new Account(Name = 'Account B')
         * };
         * ICollector collector = new CollectorProvider(Account.class)
         *     .mapping()
         *     .val();
         * List<Account> result = (List<Account>) [SObjectEnumerable].of(accounts)
         *     .collect(collector);
         * // [{ Name: 'Account A' }, { Name: 'Account B' }]]
         */
        public virtual BaseMappingCollector val() {
            return val(Function.identity());
        }

        /**
         * @description Specifies a field name to map SObject field values for collection.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the name of the SObject field to map
         *
         * @return the `BaseMappingCollector` to map and collect the field values
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(FirstName = 'John', LastName = 'Doe'),
         *     new Contact(FirstName = 'Jane', LastName = 'Smith')
         * };
         * ICollector lastNameCollector = new CollectorProvider(Contact.class)
         *     .mapping()
         *     .val('LastName');
         * List<String> lastNames = (List<String>) [SObjectEnumerable].of(contacts)
         *     .collect(lastNameCollector); // ['Doe', 'Smith']
         */
        public virtual BaseMappingCollector val(final String fieldName) {
            return val(new SObjectFunctionProvider().get(fieldName));
        }

        /**
         * @description Specifies an SObjectField to map SObject field values for collection.
         *
         * @param field the SObjectField to map
         *
         * @return the `BaseMappingCollector` to map and collect the field values
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(Email = 'john.doe@example.com'),
         *     new Contact(Email = 'jane.smith@example.com')
         * };
         * ICollector emailCollector = new CollectorProvider(Contact.class)
         *     .mapping()
         *     .val(Contact.Email);
         * List<String> emails = (List<String>) [SObjectEnumerable].of(contacts)
         *     .collect(emailCollector); // ['john.doe@example.com', 'jane.smith@example.com']
         */
        public virtual BaseMappingCollector val(final SObjectField field) {
            return val(new SObjectFunctionProvider().get(field));
        }
    }

    /**
     * @description Base class for collectors that map elements using a provided function and collect
     * the results using a downstream collector.
     * Provides methods to manage the mapping and accumulation process.
     */
    public abstract class BaseMappingCollector extends Collector {
        protected final Object mapper;
        protected final ICollector downstream;
        protected BaseMappingCollector(Object mapper, ICollector downstream) {
            this.mapper = mapper;
            this.downstream = downstream;
        }

        /**
        * @description Provides a supplier that supplies a new result container.
        *
        * @return a supplier function that provides a result container
        */
        public virtual override ISupplier supplier() {
            return downstream.supplier();
        }

        /**
         * @description Provides an accumulator that adds an element to the result container.
         *
         * @return a bi-consumer function that adds an element to the result container
         */
        public virtual override IBiConsumer accumulator() {
            return accumulator(mapper, downstream.accumulator());
        }

        /**
         * @description Provides a finisher function that performs the final transformation on the result container.
         *
         * @return a function that performs the final transformation
         */
        public virtual override IFunction finisher() {
            return downstream.finisher();
        }

        /**
         * @description Applies a downstream collector to collect the mapped values.
         *
         * @param downstream the downstream collector
         *
         * @return a new `Collector` that maps values into the downstream collector
         *
         * @throws NullPointerException if `downstream` is null
         */
        public virtual Collector to(final ICollector downstream) {
            return Collector.of(
                downstream.supplier(),
                accumulator(mapper, downstream.accumulator()),
                downstream.finisher()
            );
        }

        protected abstract IBiConsumer accumulator(Object mapper, IBiConsumer accumulator);
    }

    /**
    * @description Collector that maps elements using a specified function and
    * collects the results using a downstream collector.
    */
    public virtual class MappingCollector extends BaseMappingCollector {
        protected MappingCollector(IFunction mapper, ICollector downstream) { super(mapper, downstream); }

        protected virtual override IBiConsumer accumulator(Object mapper, IBiConsumer accumulator) {
            return new MappingBiConsumer((IFunction) mapper, accumulator);
        }
    }

    /**
     * @description Abstract base class for configurations that map SObject fields to values.
     * Provides methods to specify the field or function to extract values from SObjects.
     */
    public abstract class BaseSObjectValueMapping {
        /**
         * @description Specifies the function to map an SObject to the desired value.
         *
         * @param mapper the function to map an SObject to a value
         *
         * @return the `Collector` with the specified mapping
         *
         * @throws NullPointerException if `field` is null
         */
        public abstract Collector val(final IFunction mapper);

        /**
         * @description Specifies the field name to extract values from SObjects.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the field name to extract
         *
         * @return the `Collector` with the specified field mapping
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         */
        public virtual Collector val(final String fieldName) {
            return val(new SObjectFunctionProvider().get(fieldName));
        }

        /**
         * @description Specifies the `field` to extract values from SObjects.
         *
         * @param field the `SObjectField` to extract
         *
         * @return the `Collector` with the specified field mapping
         *
         * @throws NullPointerException if `field` is null
         */
        public virtual Collector val(final SObjectField field) {
            return val(new SObjectFunctionProvider().get(field));
        }
    }

    /**
     * @description Abstract base class for collectors that map SObject fields to values.
     * Provides methods to specify the field or function to extract values from SObjects.
     */
    public abstract class BaseSObjectValueMappingCollector extends Collector {
        /**
         * @description Specifies the function to map an SObject to the desired value.
         *
         * @param mapper the function to map an SObject to a value
         *
         * @return the `Collector` with the specified mapping
         *
         * @throws NullPointerException if `field` is null
         */
        public abstract Collector val(final IFunction mapper);

        /**
         * @description Specifies the field name to extract values from SObjects.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the field name to extract
         *
         * @return the `Collector` with the specified field mapping
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         */
        public virtual Collector val(final String fieldName) {
            return val(new SObjectFunctionProvider().get(fieldName));
        }

        /**
         * @description Specifies the `field` to extract values from SObjects.
         *
         * @param field the `SObjectField` to extract
         *
         * @return the `Collector` with the specified field mapping
         *
         * @throws NullPointerException if `field` is null
         */
        public virtual Collector val(final SObjectField field) {
            return val(new SObjectFunctionProvider().get(field));
        }
    }

    /**
     * @description Abstract base class for collectors that map SObject fields to values.
     * Provides methods to specify the field, function or self-reference to extract values from SObjects.
     */
    public abstract class SObjectValueMappingCollector extends BaseSObjectValueMappingCollector {
        /**
         * @description Collects the SObject instances themselves.
         *
         * @return the `Collector` that collects the SObject instances
         */
        public virtual Collector val() {
            return val(Function.identity());
        }
    }

    /**
     * @description Abstract base class for collectors that map values using a provided function or field.
     */
    public abstract class ValueMappingCollector extends SObjectValueMappingCollector {
        protected final IBiConsumer accumulator;
        protected Type valueType;
        protected Boolean isDefaultSupplier = true;
        protected ISupplier sup;
        protected ValueMappingCollector(Type t, IBiConsumer accumulator) {
            sup = Supplier.of(t);
            this.accumulator = accumulator;
        }

        /**
         * @description Provides the supplier that creates the result container.
         *
         * @return the supplier for the collector
         */
        public virtual override ISupplier supplier() {
            return sup;
        }

        /**
         * @description Provides the accumulator function that adds values to the result container.
         *
         * @return the accumulator function for the collector
         */
        public virtual override IBiConsumer accumulator() {
            return accumulator;
        }

        /**
         * @description Provides the finisher function that performs the final transformation.
         *
         * @return null
         */
        public virtual override IFunction finisher() {
            return null;
        }

        /**
         * @description Specifies a custom supplier for the collector.
         *
         * @param supplier the supplier to use for creating the result container
         *
         * @return the `ValueMappingCollector` instance for chaining
         *
         * @throws NullPointerException if `supplier` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'John Doe'),
         *     new Account(Name = 'Jane Smith')
         * };
         * ICollector nameCollector = new CollectorProvider(Account.class)
         *     .toList()
         *     .of(Supplier.of(List<String>.class))
         *     .val(Account.Name);
         * List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
         *     .collect(nameCollector); // ['John Doe', 'Jane Smith']
         */
        public virtual ValueMappingCollector of(final ISupplier supplier) {
            sup = supplier;
            isDefaultSupplier = false;
            return this;
        }

        /**
         * @description Collects the mapped values using the provided function.
         *
         * @param mapper the function to map SObject to the value
         *
         * @return the `Collector` that collects the mapped values
         *
         * @throws NullPointerException if `supplier` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'John Doe'),
         *     new Account(Name = 'Jane Smith')
         * };
         * ICollector nameToListCollector = new CollectorProvider(Account.class)
         *     .toList()
         *     .of(String.class)
         *     .val(new SObjectFunctionProvider().get(Account.Name));
         * List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
         *     .collect(nameToListCollector); // ['John Doe', 'Jane Smith']
         */
        public virtual override Collector val(final IFunction mapper) {
            return new Mapping().val(mapper).to(Collector.of(sup, accumulator));
        }
    }

    /**
     * @description Collector that collects mapped values into a set.
     */
    public virtual class SetValueMappingCollector extends ValueMappingCollector {
        protected SetValueMappingCollector(Type t, IBiConsumer accumulator) {
            super(t, accumulator);
        }
    }

    /**
     * @description Collector that collects mapped values into a list.
     */
    public virtual class ListValueMappingCollector extends ValueMappingCollector {
        protected ListValueMappingCollector(Type t, IBiConsumer accumulator) {
            super(t, accumulator);
        }

        /**
         * @description Specifies the value type of the list elements.
         *
         * @param valueType the type of the list elements
         *
         * @return the `ValueMappingCollector` instance for chaining
         *
         * @throws NullPointerException if `supplier` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'John Doe'),
         *     new Account(Name = 'Jane Smith')
         * };
         * ICollector nameToListCollector = new CollectorProvider(Account.class)
         *     .toList()
         *     .of(String.class)
         *     .val(Account.Name);
         * List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
         *     .collect(nameToListCollector); // ['John Doe', 'Jane Smith']
         */
        public virtual ValueMappingCollector of(final Type valueType) {
            this.valueType = valueType;
            return of(Supplier.of(listType(valueType)));
        }

        /**
         * @description Collects the mapped values using the provided function.
         *
         * @param mapper the function to map SObject to the value
         *
         * @return the `Collector` that collects the mapped values
         *
         * @throws NullPointerException if `supplier` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'John Doe'),
         *     new Account(Name = 'Jane Smith')
         * };
         * ICollector nameToListCollector = new CollectorProvider(Account.class)
         *     .toList()
         *     .of(String.class)
         *     .val(new SObjectFunctionProvider().get(Account.Name));
         * List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
         *     .collect(nameToListCollector); // ['John Doe', 'Jane Smith']
         */
        public virtual override Collector val(final IFunction mapper) {
            overrideSupplierIfDefault();
            return super.val(mapper);
        }

        /**
         * @description Specifies the field name to extract values from SObjects.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the field name to extract
         *
         * @return the `Collector` with the specified field mapping
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'John Doe', Parent = new Account(Name = 'Judy Roe')),
         *     new Account(Name = 'Jane Smith')
         * };
         * ICollector nameToListCollector = new CollectorProvider(Account.class)
         *     .toList()
         *     .of(String.class)
         *     .val('Name');
         * List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
         *     .collect(nameToListCollector); // ['John Doe', 'Jane Smith']
         *
         * ICollector parentNameToListCollector = new CollectorProvider(Account.class)
         *     .toList()
         *     .of(String.class)
         *     .val('Parent?.Name');
         * List<String> parentNames = (List<String>) [SObjectEnumerable].of(accounts)
         *     .collect(parentNameToListCollector); // ['Judy Roe', null]
         */
        public virtual override Collector val(final String fieldName) {
            overrideSupplierIfDefault();
            return super.val(fieldName);
        }

        /**
         * @description Collects the values from the specified field name.
         *
         * @param field the field name to extract values from
         *
         * @return the `Collector` that collects the field values
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'John Doe'),
         *     new Account(Name = 'Jane Smith')
         * };
         * ICollector nameToListCollector = new CollectorProvider(Account.class)
         *     .toList()
         *     .of(String.class)
         *     .val(Account.Name);
         * List<String> names = (List<String>) [SObjectEnumerable].of(accounts)
         *     .collect(nameToListCollector); // ['John Doe', 'Jane Smith']
         */
        public virtual override Collector val(final SObjectField field) {
            overrideSupplierIfDefault();
            return super.val(field);
        }

        protected void overrideSupplierIfDefault() {
            if (isDefaultSupplier) { sup = Supplier.of(listType(valueType ?? Object.class)); }
        }
    }

    /**
     * @description Provides methods to specify the key mapping for collecting elements into a map.
     * Allows setting custom suppliers, mergers, and key/value mapping functions.
     */
    public virtual class MapKeyMapping {
        protected final PutToMapBiConsumer accumulator;
        protected final Type keyType;
        protected ISupplier sup;
        protected IBiOperator merger;
        protected MapKeyMapping(Type keyType, Type valueType, PutToMapBiConsumer accumulator) {
            this.keyType = keyType;
            this.sup = Supplier.of(mapType(keyType, valueType));
            this.accumulator = accumulator;
        }

        /**
         * @description Specifies a custom supplier for the map collector.
         *
         * @param supplier the supplier to create the result map
         *
         * @return the `MapKeyMapping` instance for chaining
         *
         * @throws NullPointerException if `supplier` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(Email = 'john@example.com', LastName = 'Doe'),
         *     new Contact(Email = 'jane@example.com', LastName = 'Smith')
         * };
         * ICollector lastNameByEmailCollector = new CollectorProvider(Contact.class)
         *     .toByStringMap()
         *     .of(Supplier.of(Map<String, String>.class))
         *     .key(Contact.Email);
         *     .val(Contact.LastName);
         * // result map cannot be cast directly to Map<String, String>
         * Map<String, Object> lastNameByEmail = (Map<String, Object>) [SObjectEnumerable].of(contacts)
         *     .collect(lastNameByEmailCollector); // { 'john@example.com' => 'Doe', 'jane@example.com' => 'Smith' }
         * // unless cast is applied
         * Map<String, String> lastNameByEmail2 = (Map<String, String>) [SObjectEnumerable].of(contacts)
         *     .collect(lastNameByEmailCollector.cast(Map<String, String>.class));
         */
        public virtual MapKeyMapping of(final ISupplier supplier) {
            this.sup = supplier;
            return this;
        }

        /**
         * @description Specifies the value type for the map and setting a default supplier.
         *
         * @param valueType the type of the map values
         *
         * @return the `MapKeyMapping` instance for chaining
         *
         * @throws NullPointerException if `valueType` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Industry = 'Technology', Name = 'Company A'),
         *     new Account(Industry = 'Finance', Name = 'Company B')
         * };
         * ICollector nameByIndustryCollector = new CollectorProvider(Account.class)
         *     .toByStringMap()
         *     .of(String.class)
         *     .key(Account.Industry)
         *     .val(Account.Name);
         * Map<String, String> nameByIndustry = (Map<String, String>) [SObjectEnumerable].of(accounts)
         *     .collect(nameByIndustryCollector); // { 'Technology' => 'Company A', 'Finance' => 'Company B' }
         */
        public virtual MapKeyMapping of(final Type valueType) {
            return of(Supplier.of(mapType(keyType, valueType)));
        }

        /**
         * @description Specifies a merge function to resolve duplicate keys.
         *
         * @param merger the merge function to combine values for duplicate keys
         *
         * @return the `MapKeyMapping` instance for chaining
         *
         * @throws NullPointerException if `merger` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Industry = 'Technology', Name = 'Company A'),
         *     new Account(Industry = 'Technology', Name = 'Company B')
         * };
         * IBiOperator mergeFunction = BiOperator.right();
         * ICollector nameByIndustryCollector = new CollectorProvider(Account.class)
         *     .toByStringMap()
         *     .of(String.class)
         *     .merger(mergeFunction) // overrides existing value instead of throwing an exception
         *     .key(Account.Industry)
         *     .val(Account.Name);
         * Map<String, String> nameByIndustry = (Map<String, String>) [SObjectEnumerable].of(accounts)
         *     .collect(nameByIndustryCollector); // { 'Technology' => 'Company B' }
         */
        public virtual MapKeyMapping merger(final IBiOperator merger) {
            this.merger = merger;
            return this;
        }

        /**
         * @description Specifies the function to map SObject to the map key.
         *
         * @param keyMapper the function to map SObject to the map key
         *
         * @return the `MapValueMappingCollector` for further configuration
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Industry = 'Technology', Name = 'Company A'),
         *     new Account(Industry = 'Finance', Name = 'Company B')
         * };
         * IFunction industryMapper = new SObjectFunctionProvider().get(Account.Industry);
         * ICollector nameByIndustryCollector = new CollectorProvider(Account.class)
         *     .toByStringMap()
         *     .key(industryMapper)
         *     .val(Account.Name);
         * Map<String, String> nameByIndustry = (Map<String, String>) [SObjectEnumerable].of(accounts)
         *     .collect(nameByIndustryCollector); // { 'Technology' => 'Company A', 'Finance' => 'Company B' }
         */
        public virtual MapValueMappingCollector key(final IFunction keyMapper) {
            return new MapValueMappingCollector(sup, keyMapper, accumulator, merger);
        }

        /**
         * @description Uses the SObject instances themselves as the map keys.
         * Beware that the SObject instances should not be modified because hash codes may change.
         *
         * @return the `MapValueMappingCollector` for further configuration
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Industry = 'Technology', Name = 'Company A'),
         *     new Account(Industry = 'Finance', Name = 'Company B')
         * };
         * ICollector nameByAccountCollector = new CollectorProvider(Account.class)
         *     .toByObjectMap()
         *     .of(String.class)
         *     .key()
         *     .val(Account.Name);
         * Map<Object, String> nameByAccount = (Map<Object, String>) [SObjectEnumerable].of(accounts)
         *     .collect(nameByAccountCollector);
         * // Expected result:
         * // {
         * //   Account(Name='TechCorp', Industry='Technology') => 'TechCorp',
         * //   Account(Name='FinanceCorp', Industry='Finance') => 'FinanceCorp'
         * // }
         */
        public virtual MapValueMappingCollector key() {
            return key(Function.identity());
        }

        /**
         * @description Specifies the field name to extract the map key from SObjects.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the field name to use as the map key
         *
         * @return the `MapValueMappingCollector` for further configuration
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Industry = 'Technology', Name = 'Company A'),
         *     new Account(Industry = 'Finance', Name = 'Company B')
         * };
         * ICollector nameByIndustryCollector = new CollectorProvider(Account.class)
         *     .toByStringMap()
         *     .of(String.class)
         *     .key('Industry')
         *     .val(Account.Name);
         * Map<String, String> nameByIndustry = (Map<String, String>) [SObjectEnumerable].of(accounts)
         *     .collect(nameByIndustryCollector); // { 'Technology' => 'Company A', 'Finance' => 'Company B' }
         */
        public virtual MapValueMappingCollector key(final String fieldName) {
            return key(new SObjectFunctionProvider().get(fieldName));
        }

        /**
         * @description Specifies the `field` to extract the map key from SObjects.
         *
         * @param field the `SObjectField` to use as the map key
         *
         * @return the `MapValueMappingCollector` for further configuration
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Industry = 'Technology', Name = 'Company A'),
         *     new Account(Industry = 'Finance', Name = 'Company B')
         * };
         * ICollector nameByIndustryCollector = new CollectorProvider(Account.class)
         *     .toByStringMap()
         *     .of(String.class)
         *     .key(Account.Industry)
         *     .val(Account.Name);
         * Map<String, String> nameByIndustry = (Map<String, String>) [SObjectEnumerable].of(accounts)
         *     .collect(nameByIndustryCollector); // { 'Technology' => 'Company A', 'Finance' => 'Company B' }
         */
        public virtual MapValueMappingCollector key(final SObjectField field) {
            return key(new SObjectFunctionProvider().get(field));
        }
    }

    /**
     * @description Collector that maps SObjects to key-value pairs for a map.
     * Allows specifying the value mapping function.
     * This collector throws IllegalStateException if mapped keys contain duplicates and no merger is specified.
     */
    public virtual class MapValueMappingCollector extends SObjectValueMappingCollector {
        protected final ISupplier sup;
        protected final IFunction keyMapper;
        protected final PutToMapBiConsumer accumulator;
        protected final IBiOperator merger;
        @SuppressWarnings('PMD.ExcessiveParameterList')
        protected MapValueMappingCollector(ISupplier sup, IFunction key, PutToMapBiConsumer acc, IBiOperator merger) {
            this.sup = sup;
            keyMapper = key;
            accumulator = acc;
            this.merger = merger;
        }

        /**
         * @description Provides the supplier that creates the result map.
         *
         * @return the supplier for the collector
         */
        public virtual override ISupplier supplier() {
            return sup;
        }

        /**
         * @description Provides the accumulator function that adds key-value pairs to the result map.
         *
         * @return the accumulator function for the collector
         */
        public virtual override IBiConsumer accumulator() {
            return accumulator.key(keyMapper).val(Function.identity()).merger(merger);
        }

        /**
         * @description Provides the finisher function that performs the final transformation.
         * Returns null as no finishing transformation is needed.
         *
         * @return null
         */
        public virtual override IFunction finisher() {
            return null;
        }

        /**
         * @description Specifies the function to map SObject to the map value.
         *
         * @param valueMapper the function to map SObject to the map value
         *
         * @return the `Collector` that collects the mapped key-value pairs
         *
         * @throws NullPointerException if `valueMapper` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(Email = 'john@example.com', LastName = 'Doe'),
         *     new Contact(Email = 'jane@example.com', LastName = 'Smith')
         * };
         * IFunction lastNameMapper = new SObjectFunctionProvider().get(Contact.LastName);
         * ICollector lastNameByEmailCollector = new CollectorProvider(Contact.class)
         *     .toByStringMap()
         *     .of(String.class)
         *     .key(Contact.Email)
         *     .val(lastNameMapper);
         * Map<String, String> lastNameByEmail = (Map<String, String>) [SObjectEnumerable].of(contacts)
         *     .collect(lastNameByEmailCollector); // { 'john@example.com' => 'Doe', 'jane@example.com' => 'Smith' }
         */
        public virtual override Collector val(final IFunction valueMapper) {
            return Collector.of(sup, accumulator.key(keyMapper).val(valueMapper).merger(merger));
        }
    }

    /**
     * @description Provides methods to specify the key mapping for grouping elements into a map.
     * Allows setting custom suppliers, key mapping functions, and custom downstream collectors.
     */
    public virtual class GroupKeyMapping {
        protected final Type keyType;
        protected final PutToDownstreamMap accumulator;
        protected final ListValueMappingCollector downstream;
        protected final GroupFinisher finisher;
        protected Type valueType;
        protected Boolean isDefaultSupplier = true;
        protected ISupplier sup;
        @SuppressWarnings('PMD.ExcessiveParameterList')
        protected GroupKeyMapping(Type keyType, Type valueType, PutToDownstreamMap acc, GroupFinisher finisher) {
            this.keyType = keyType;
            sup = Supplier.of(groupType(keyType, valueType));
            downstream = new CollectorProvider(valueType).toList();
            accumulator = acc;
            this.finisher = finisher;
        }

        /**
         * @description Specifies a custom supplier for the group map collector.
         *
         * @param supplier the supplier to create the result map
         *
         * @return the `GroupKeyMapping` instance for chaining
         *
         * @throws NullPointerException if `supplier` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(DoNotCall = true, LastName = 'Doe'),
         *     new Contact(DoNotCall = false, LastName = 'Smith')
         * };
         * ICollector lastNamesByEmailCollector = new CollectorProvider(Contact.class)
         *     .groupingByString()
         *     .of(Supplier.of(List<String>.class))
         *     .key(Contact.Email)
         *     .val(Contact.Name);
         * Map<String, List<String>> lastNamesByEmail = (Map<String, List<String>>) [SObjectEnumerable].of(contacts)
         *     .collect(lastNamesByEmailCollector);
         * // { 'john@example.com' => ['Doe'], 'jane@example.com' => ['Smith'] }
         */
        public virtual GroupKeyMapping of(final ISupplier supplier) {
            sup = supplier;
            isDefaultSupplier = false;
            return this;
        }

        /**
         * @description Specifies the value type for the map and setting a default supplier.
         *
         * @param valueType the type of the map values
         *
         * @return the `GroupKeyMapping` instance for chaining
         *
         * @throws NullPointerException if `valueType` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(DoNotCall = true, LastName = 'Doe'),
         *     new Contact(DoNotCall = false, LastName = 'Smith')
         * };
         * ICollector lastNamesByEmailCollector = new CollectorProvider(Contact.class)
         *     .groupingByString()
         *     .of(List<String>.class)
         *     .key(Contact.Email)
         *     .val(Contact.Name);
         * Map<String, List<String>> lastNamesByEmail = (Map<String, List<String>>) [SObjectEnumerable].of(contacts)
         *     .collect(lastNamesByEmailCollector);
         * // { 'john@example.com' => ['Doe'], 'jane@example.com' => ['Smith'] }
         * CollectorProvider builder = new CollectorProvider(Contact.class);
         * ICollector lastNamesSetByEmailCollector = builder
         *     .groupingByString()
         *     .of(Set<String>.class)
         *     .key(Contact.Email)
         *     .val(builder.toStringSet().val(Contact.Name));
         * Map<String, Set<String>> lastNamesSetByEmail = (Map<String, Set<String>>) [SObjectEnumerable].of(contacts)
         *     .collect(lastNamesSetByEmailCollector);
         * // { 'john@example.com' => { 'Doe' }, 'jane@example.com' => { 'Smith' } }
         */
        public virtual GroupKeyMapping of(final Type valueType) {
            this.valueType = valueType;
            return of(Supplier.of(mapType(keyType, valueType)));
        }

        /**
         * @description Specifies the function to map SObject to the group key.
         *
         * @param keyMapper the function to map SObject to the group key
         *
         * @return the `GroupMapValueMappingCollector` for further configuration
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(DoNotCall = true, LastName = 'Doe'),
         *     new Contact(DoNotCall = false, LastName = 'Smith')
         * };
         * IFunction doNotCallMapper = new SObjectFunctionProvider().get(Contact.DoNotCall);
         * ICollector lastNamesByDoNotCallCollector = new CollectorProvider(Contact.class)
         *     .groupingByBool()
         *     .of(List<String>.class)
         *     .key(doNotCallMapper)
         *     .val(Contact.LastName);
         * Map<Boolean, List<String>> lastNamesByDoNotCall = (Map<Boolean, List<String>>)
         *     [SObjectEnumerable].of(contacts).collect(lastNamesByDoNotCallCollector);
         * // { true => ['Doe'], false => ['Smith'] }
         */
        public virtual GroupMapValueMappingCollector key(final IFunction keyMapper) {
            return new GroupMapValueMappingCollector(
                sup, isDefaultSupplier, keyType, this.valueType, keyMapper, accumulator, downstream, finisher
            );
        }

        /**
         * @description Uses the SObject instances themselves as the group keys.
         * Beware that the SObject instances should not be modified because hash codes may change.
         *
         * @return the `GroupMapValueMappingCollector` for further configuration
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'Account A'),
         *     new Account(Name = 'Account B')
         * };
         * ICollector namesByAccountCollector = new CollectorProvider(Account.class)
         *     .groupingByObject()
         *     .of(List<String>.class)
         *     .key()
         *     .val(Account.Name);
         * Map<Object, List<String>> namesByAccount = (Map<Object, List<String>>) [SObjectEnumerable].of(accounts)
         *     .collect(namesByAccountCollector);
         * // {
         * //   Account(Name='Account A') => ['Account A'],
         * //   Account(Name='Account B') => ['Account B']
         * // }
         */
        public virtual GroupMapValueMappingCollector key() {
            return key(Function.identity());
        }

        /**
         * @description Specifies the field name to extract the group key from SObjects.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the field name to use as the group key
         *
         * @return the `GroupMapValueMappingCollector` for further configuration
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'Account A', Industry = 'Tech'),
         *     new Account(Name = 'Account B', Industry = 'Finance')
         * };
         * ICollector accountsByIndustryCollector = new CollectorProvider(Account.class)
         *     .groupingByString()
         *     .key('Industry');
         * Map<String, List<Account>> accountsByIndustry = (Map<String, List<Account>>) [SObjectEnumerable].of(accounts)
         *     .collect(accountsByIndustryCollector);
         * // {
         * //   'Tech' => [{ Name: 'Account A', Industry: 'Tech' }],
         * //   'Finance' => [{ Name: 'Account B', Industry: 'Finance' }]
         * // }
         * ICollector namesByIndustryCollector = new CollectorProvider(Account.class)
         *     .groupingByString()
         *     .of(List<String>.class)
         *     .key('Industry')
         *     .val(Account.Name);
         * Map<String, List<String>> nameByIndustry = (Map<String, List<String>>) [SObjectEnumerable].of(accounts)
         *     .collect(namesByIndustryCollector);
         * // {
         * //   'Tech' => ['Account A'],
         * //   'Finance' => ['Account B']
         * // }
         */
        public virtual GroupMapValueMappingCollector key(final String fieldName) {
            return key(new SObjectFunctionProvider().get(fieldName));
        }

        /**
         * @description Specifies the `field` to extract the group key from SObjects.
         *
         * @param field the `SObjectField` to use as the group key
         *
         * @return the `GroupMapValueMappingCollector` for further configuration
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'Account A', Industry = 'Tech'),
         *     new Account(Name = 'Account B', Industry = 'Finance')
         * };
         * ICollector accountsByIndustryCollector = new CollectorProvider(Account.class)
         *     .groupingByString()
         *     .key(Account.Industry);
         * Map<String, List<Account>> accountsByIndustry = (Map<String, List<Account>>) [SObjectEnumerable].of(accounts)
         *     .collect(accountsByIndustryCollector);
         * // {
         * //   'Tech' => [{ Name: 'Account A', Industry: 'Tech' }],
         * //   'Finance' => [{ Name: 'Account B', Industry: 'Finance' }]
         * // }
         * ICollector namesByIndustryCollector = new CollectorProvider(Account.class)
         *     .groupingByString()
         *     .of(List<String>.class)
         *     .key(Account.Industry)
         *     .val(Account.Name);
         * Map<String, List<String>> namesByIndustry = (Map<String, List<String>>) [SObjectEnumerable].of(accounts)
         *     .collect(namesByIndustryCollector);
         * // {
         * //   'Tech' => ['Account A'],
         * //   'Finance' => ['Account B']
         * // }
         */
        public virtual GroupMapValueMappingCollector key(final SObjectField field) {
            return key(new SObjectFunctionProvider().get(field));
        }
    }

    /**
     * @description Collector that maps SObjects to key-value pairs for grouping elements.
     * Allows specifying the key and value mapping functions and custom downstream collectors.
     */
    public virtual class GroupMapValueMappingCollector extends Collector {
        protected final Type keyType;
        protected final Type valueType;
        protected final IFunction keyMapper;
        protected final PutToDownstreamMap accumulator;
        protected final GroupFinisher finisher;
        protected final ListValueMappingCollector downstream;
        protected Boolean isDefaultSupplier;
        protected ISupplier sup;
        @SuppressWarnings('PMD.ExcessiveParameterList')
        protected GroupMapValueMappingCollector(
            ISupplier supplier,
            Boolean isDefaultSupplier,
            Type keyType,
            Type valueType,
            IFunction keyMapper,
            PutToDownstreamMap accumulator,
            ListValueMappingCollector downstream,
            GroupFinisher finisher
        ) {
            this.sup = supplier;
            this.isDefaultSupplier = isDefaultSupplier;
            this.keyType = keyType;
            this.valueType = valueType;
            this.keyMapper = keyMapper;
            this.accumulator = accumulator;
            this.downstream = downstream;
            this.finisher = finisher;
        }

        /**
         * @description Provides the supplier that creates the result map.
         *
         * @return the supplier for the collector
         */
        public virtual override ISupplier supplier() {
            return sup;
        }

        /**
         * @description Provides the accumulator function that adds key-value pairs to the result map.
         *
         * @return the accumulator function for the collector
         */
        public virtual override IBiConsumer accumulator() {
            return accumulator.key(keyMapper).val(downstream);
        }

        /**
         * @description Provides the finisher function that performs the final transformation.
         * Returns null as no finishing transformation is needed.
         *
         * @return null
         */
        public virtual override IFunction finisher() {
            return finisher.val(null);
        }

        /**
         * @description Specifies a custom downstream collector for values.
         *
         * @param downstream the downstream collector for values
         *
         * @return the `Collector` instance that collects grouped values with custom downstream
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'Account A', Industry = 'Tech'),
         *     new Account(Name = 'Account B', Industry = 'Finance')
         * };
         * CollectorProvider builder = new CollectorProvider(Account.class);
         * ICollector namesByIndustryCollector = builder
         *     .groupingByString()
         *     .of(Set<String>.class)
         *     .key('Industry')
         *     .val(builder.toStringSet().val(Account.Name));
         * Map<String, Set<String>> nameByIndustry = (Map<String, Set<String>>) [SObjectEnumerable].of(accounts)
         *     .collect(namesByIndustryCollector);
         * // {
         * //   'Tech' => { 'Account A' },
         * //   'Finance' => { 'Account B' }
         * // }
         */
        public virtual Collector val(final ICollector downstream) {
            overrideSupplierIfDefault();
            return Collector.of(sup, accumulator.key(keyMapper).val(downstream), finisher.val(downstream.finisher()));
        }

        /**
         * @description Collects self values without any additional mapping.
         * Uses the default downstream collector specified during the initialization.
         *
         * @return the `Collector` instance that collects grouped values using the default downstream
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(Email = 'john@example.com', LastName = 'Doe'),
         *     new Contact(Email = 'jane@example.com', LastName = 'Smith')
         * };
         * ICollector contactsByEmailCollector = new CollectorProvider(Contact.class)
         *     .groupingByString()
         *     .key(Contact.Email)
         *     .val(); // explicit val invocation is optional
         * Map<String, List<Contact>> contactsByEmail = (Map<String, List<Contact>>) [SObjectEnumerable].of(contacts)
         *     .collect(contactsByEmailCollector);
         * // {
         * //   'john@example.com' => [{ Email: 'john@example.com', LastName: 'Doe' }],
         * //   'jane@example.com' => [{ Email: 'jane@example.com', LastName: 'Smith' }]
         * // }
         */
        public virtual Collector val() {
            return this;
        }

        /**
         * @description Specifies the field name to extract values from SObjects.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the field name to extract values from
         *
         * @return the `Collector` with the specified field mapping
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'Account A', Industry = 'Tech'),
         *     new Account(Name = 'Account B', Industry = 'Finance')
         * };
         * ICollector namesByIndustryCollector = new CollectorProvider(Account.class)
         *     .groupingByString()
         *     .of(List<String>.class)
         *     .key('Industry')
         *     .val('Name');
         * Map<String, List<String>> namesByIndustry = (Map<String, List<String>>) [SObjectEnumerable].of(accounts)
         *     .collect(namesByIndustryCollector);
         * // {
         * //   'Tech' => ['Account A'],
         * //   'Finance' => ['Account B']
         * // }
         */
        public virtual Collector val(final String fieldName) {
            return val(
                valueType == null ? downstream.val(fieldName) : downstream.of(Supplier.of(valueType)).val(fieldName)
            );
        }

        /**
         * @description Specifies the `field` to extract values from SObjects.
         *
         * @param field the `SObjectField` to extract values from
         *
         * @return the `Collector` with the specified field mapping
         *
         * @throws NullPointerException if `fieldName` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'Account A', Industry = 'Tech'),
         *     new Account(Name = 'Account B', Industry = 'Finance')
         * };
         * ICollector namesByIndustryCollector = new CollectorProvider(Account.class)
         *     .groupingByString()
         *     .of(List<String>.class)
         *     .key(Account.Industry)
         *     .val(Account.Name);
         * Map<String, List<String>> namesByIndustry = (Map<String, List<String>>) [SObjectEnumerable].of(accounts)
         *     .collect(namesByIndustryCollector);
         * // {
         * //   'Tech' => ['Account A'],
         * //   'Finance' => ['Account B']
         * // }
         */
        public virtual Collector val(final SObjectField field) {
            return val(valueType == null ? downstream.val(field) : downstream.of(Supplier.of(valueType)).val(field));
        }

        private void overrideSupplierIfDefault() {
            if (isDefaultSupplier) { sup = Supplier.of(mapType(keyType, valueType ?? Object.class)); }
        }
    }

    /**
     * @description Provides methods to specify the key mapping for partitioning elements based on a boolean condition.
     */
    public virtual class PartitionKeyMapping {
        protected final ListValueMappingCollector downstream;
        protected final PutToDownstreamMap accumulator = new PutToObjectsByBoolMap();
        protected Boolean isDefaultSup = true;
        protected Type valueType;
        protected ISupplier sup;
        protected PartitionKeyMapping(Type valueType) {
            sup = Supplier.of(groupType(Boolean.class, valueType));
            downstream = new CollectorProvider(valueType).toList();
        }

        /**
         * @description Specifies a custom supplier for the partition map collector.
         *
         * @param supplier the supplier to create the result map
         *
         * @return the `PartitionKeyMapping` instance for chaining
         *
         * @throws NullPointerException if `supplier` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(DoNotCall = true, LastName = 'Doe'),
         *     new Contact(DoNotCall = false, LastName = 'Smith')
         * };
         * ICollector partitionByDoNotCallCollector = new CollectorProvider(Contact.class)
         *     .partitioningBy()
         *     .of(Supplier.of(Map<Boolean, List<Contact>>.class))
         *     .key(Contact.DoNotCall);
         * Map<Boolean, List<Contact>> partitionedContacts = (Map<Boolean, List<Contact>>)
         *     [SObjectEnumerable].of(contacts).collect(partitionByDoNotCallCollector);
         * // {
         * //   true => [{ DoNotCall: true, LastName: 'Doe' }],
         * //   false => [{ DoNotCall: false, LastName: 'Smith' }]
         * // }
         */
        public virtual PartitionKeyMapping of(final ISupplier supplier) {
            sup = supplier;
            isDefaultSup = false;
            return this;
        }

        /**
         * @description Specifies the value type for the partition and sets a default supplier.
         *
         * @param valueType the type of the partition values
         *
         * @return the `PartitionKeyMapping` instance for chaining
         *
         * @throws NullPointerException if `valueType` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(DoNotCall = true, LastName = 'Doe'),
         *     new Contact(DoNotCall = false, LastName = 'Smith')
         * };
         * ICollector partitionByDoNotCallCollector = new CollectorProvider(Contact.class)
         *     .partitioningBy()
         *     .of(List<Contact>.class)
         *     .key(Contact.DoNotCall);
         * Map<Boolean, List<Contact>> partitionedContacts = (Map<Boolean, List<Contact>>)
         *     [SObjectEnumerable].of(contacts).collect(partitionByDoNotCallCollector);
         * // {
         * //   true => [{ DoNotCall: true, LastName: 'Doe' }],
         * //   false => [{ DoNotCall: false, LastName: 'Smith' }]
         * // }
         */
        public virtual PartitionKeyMapping of(final Type valueType) {
            this.valueType = valueType;
            return of(Supplier.of(mapType(Boolean.class, valueType)));
        }

        /**
         * @description Specifies the predicate for partitioning elements into two groups:
         * those that match the predicate and those that don't.
         *
         * @param predicate the predicate to partition elements by
         *
         * @return the `PartitionValueMappingCollector` for further configuration
         *
         * @throws NullPointerException if `predicate` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Industry = 'Tech', Name = 'Account A'),
         *     new Account(Industry = 'Finance', Name = 'Account B')
         * };
         * IPredicate techIndustryPredicate = new SObjectDefaultComparerPredicateProvider()
         *     .is(Account.Industry)
         *     .eq()
         *     .var('Tech');
         * ICollector partitionCollector = new CollectorProvider(Account.class)
         *     .partitioningBy()
         *     .key(techIndustryPredicate);
         * Map<Boolean, List<Account>> partitionedAccounts = (Map<Boolean, List<Account>>)
         *     [SObjectEnumerable].of(accounts).collect(partitionCollector);
         * // {
         * //   true => [{ Industry: 'Tech', Name: 'Account A' }],
         * //   false => [{ Industry: 'Finance', Name: 'Account B' }]
         * // }
         */
        public virtual PartitionValueMappingCollector key(final IPredicate predicate) {
            return new PartitionValueMappingCollector(isDefaultSup, valueType, sup, predicate, accumulator, downstream);
        }

        /**
         * @description Specifies the field and value for partitioning elements into two groups:
         * those that match the field-value pair and those that don't.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the field name to partition by
         * @param value the value to match against for partitioning
         *
         * @return the `PartitionValueMappingCollector` for further configuration
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Industry = 'Tech', Name = 'Account A'),
         *     new Account(Industry = 'Finance', Name = 'Account B')
         * };
         * ICollector partitionByIndustryEqTechCollector = new CollectorProvider(Account.class)
         *     .partitioningBy()
         *     .key('Industry', 'Tech');
         * Map<Boolean, List<Account>> partitionedAccounts = (Map<Boolean, List<Account>>)
         *     [SObjectEnumerable].of(accounts).collect(partitionByIndustryEqTechCollector);
         * // {
         * //   true => [{ Industry: 'Tech', Name: 'Account A' }],
         * //   false => [{ Industry: 'Finance', Name: 'Account B' }]
         * // }
         */
        public virtual PartitionValueMappingCollector key(final String fieldName, final Object value) {
            return key(new SObjectDefaultComparerPredicateProvider().is(fieldName).eq().var(value));
        }

        /**
         * @description Specifies the field and value for partitioning elements into two groups:
         * those that match the field-value pair and those that don't.
         *
         * @param field the `SObjectField` to partition by
         * @param value the value to match against for partitioning
         *
         * @return the `PartitionValueMappingCollector` for further configuration
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Industry = 'Tech', Name = 'Account A'),
         *     new Account(Industry = 'Finance', Name = 'Account B')
         * };
         * ICollector partitionByIndustryEqTechCollector = new CollectorProvider(Account.class)
         *     .partitioningBy()
         *     .key(Account.Industry, 'Tech');
         * Map<Boolean, List<Account>> partitionedAccounts = (Map<Boolean, List<Account>>)
         *     [SObjectEnumerable].of(accounts).collect(partitionByIndustryEqTechCollector);
         * // {
         * //   true => [{ Industry: 'Tech', Name: 'Account A' }],
         * //   false => [{ Industry: 'Finance', Name: 'Account B' }]
         * // }
         */
        public virtual PartitionValueMappingCollector key(final SObjectField field, final Object value) {
            return key(new SObjectDefaultComparerPredicateProvider().is(field).eq().var(value));
        }

        /**
         * @description Specifies the field name to partition elements into two groups:
         * those that match the field and those that don't. The default value to match is `true`.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the field name to partition by
         *
         * @return the `PartitionValueMappingCollector` for further configuration
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(DoNotCall = true, LastName = 'Doe'),
         *     new Contact(DoNotCall = false, LastName = 'Smith')
         * };
         * ICollector partitionByDoNotCallCollector = new CollectorProvider(Contact.class)
         *     .partitioningBy()
         *     .key('DoNotCall');
         * Map<Boolean, List<Contact>> partitionedContacts = (Map<Boolean, List<Contact>>)
         *     [SObjectEnumerable].of(contacts).collect(partitionByDoNotCallCollector);
         * // {
         * //   true => [{ DoNotCall: true, LastName: 'Doe' }],
         * //   false => [{ DoNotCall: false, LastName: 'Smith' }]
         * // }
         */
        public virtual PartitionValueMappingCollector key(final String fieldName) {
            return key(fieldName, true);
        }

        /**
         * @description Specifies the `SObjectField` to partition elements into two groups:
         * those that match the field and those that don't. The default value to match is `true`.
         *
         * @param field the `SObjectField` to partition by
         *
         * @return the `PartitionValueMappingCollector` for further configuration
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(DoNotCall = true, LastName = 'Doe'),
         *     new Contact(DoNotCall = false, LastName = 'Smith')
         * };
         * ICollector partitionByDoNotCallCollector = new CollectorProvider(Contact.class)
         *     .partitioningBy()
         *     .key(Contact.DoNotCall);
         * Map<Boolean, List<Contact>> partitionedContacts = (Map<Boolean, List<Contact>>)
         *     [SObjectEnumerable].of(contacts).collect(partitionByDoNotCallCollector);
         * // {
         * //   true => [{ DoNotCall: true, LastName: 'Doe' }],
         * //   false => [{ DoNotCall: false, LastName: 'Smith' }]
         * // }
         */
        public virtual PartitionValueMappingCollector key(final SObjectField field) {
            return key(field, true);
        }
    }

    /**
     * @description Collector that partitions SObjects into two groups based on a boolean predicate.
     */
    public virtual class PartitionValueMappingCollector extends GroupMapValueMappingCollector {
        @SuppressWarnings('PMD.ExcessiveParameterList')
        protected PartitionValueMappingCollector(
            Boolean isDefaultSupplier,
            Type valueType,
            ISupplier supplier,
            IPredicate predicate,
            PutToDownstreamMap accumulator,
            ListValueMappingCollector downstream
        ) {
            super(
                supplier,
                isDefaultSupplier,
                Boolean.class,
                valueType,
                Function.compose(predicate),
                accumulator,
                downstream,
                null
            );
        }

        /**
         * @description Provides the finisher function that applies the final transformation after partitioning.
         *
         * @return the finisher function for the partition collector
         */
        public virtual override IFunction finisher() {
            return downstream.finisher();
        }

        /**
         * @description Specifies a custom downstream collector for partitioned values.
         *
         * @param downstream the downstream collector for values
         *
         * @return the `Collector` instance for collecting partitioned values with custom downstream
         *
         * @throws NullPointerException if `downstream` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Industry = 'Tech', Name = 'Account A'),
         *     new Account(Industry = 'Finance', Name = 'Account B')
         * };
         * CollectorProvider builder = new CollectorProvider(Account.class);
         * ICollector partitionByIndustryCollector = builder
         *     .partitioningBy()
         *     .of(Set<String>.class)
         *     .key('Industry', 'Tech')
         *     .val(builder.toStringSet().val(Account.Name));
         * Map<Boolean, Set<String>> partitionedNames = (Map<Boolean, Set<String>>) [SObjectEnumerable].of(accounts)
         *     .collect(partitionByIndustryCollector);
         * // {
         * //   true => { 'Account A' },
         * //   false => { 'Account B' }
         * // }
         */
        public virtual override Collector val(final ICollector downstream) {
            overrideSupplierIfDefault();
            return Collector.of(sup, accumulator.key(keyMapper).val(downstream), downstream.finisher());
        }
    }

    /**
     * @description Provides methods to configure the delimiter, prefix, and suffix
     * for joining elements into a single string.
     * Allows setting custom mapping functions and field extractors to create joined strings.
     */
    public virtual class JoinMapping extends BaseSObjectValueMapping {
        protected String delimiter = '';
        protected String prefix = '';
        protected String suffix = '';

        /**
         * @description Specifies the delimiter to use between joined elements.
         *
         * @param delimiter the string to insert between joined elements
         *
         * @return the `JoinMapping` instance for chaining
         *
         * @throws NullPointerException if `delimiter` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(LastName = 'Doe'),
         *     new Contact(LastName = 'Smith')
         * };
         * ICollector joinedNamesCollector = new CollectorProvider(Contact.class)
         *     .joining()
         *     .del(', ')
         *     .val(Contact.LastName);
         * String joinedNames = (String) [SObjectEnumerable].of(contacts)
         *     .collect(joinedNamesCollector);
         * // 'Doe, Smith'
         */
        public virtual JoinMapping del(final String delimiter) {
            this.delimiter = delimiter;
            return this;
        }

        /**
         * @description Specifies the prefix to prepend to the joined string.
         *
         * @param prefix the string to prepend to the joined result
         *
         * @return the `JoinMapping` instance for chaining
         *
         * @throws NullPointerException if `prefix` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(LastName = 'Doe'),
         *     new Contact(LastName = 'Smith')
         * };
         * ICollector joinedNamesCollector = new CollectorProvider(Contact.class)
         *     .joining()
         *     .del(', ')
         *     .pre('Names: ')
         *     .val(Contact.LastName);
         * String joinedNames = (String) [SObjectEnumerable].of(contacts)
         *     .collect(joinedNamesCollector);
         * // 'Names: Doe, Smith'
         */
        public virtual JoinMapping pre(final String prefix) {
            this.prefix = prefix;
            return this;
        }

        /**
         * @description Specifies the suffix to append to the joined string.
         *
         * @param suffix the string to append to the joined result
         *
         * @return the `JoinMapping` instance for chaining
         *
         * @throws NullPointerException if `suffix` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(LastName = 'Doe'),
         *     new Contact(LastName = 'Smith')
         * };
         * ICollector joinedNamesCollector = new CollectorProvider(Contact.class)
         *     .joining()
         *     .del(', ')
         *     .suf('.')
         *     .val(Contact.LastName);
         * String joinedNames = (String) [SObjectEnumerable].of(contacts)
         *     .collect(joinedNamesCollector);
         * // 'Doe, Smith.'
         */
        public virtual JoinMapping suf(final String suffix) {
            this.suffix = suffix;
            return this;
        }

        /**
         * @description Specifies the function to map each SObject to a string value to join.
         *
         * @param mapper the function to map SObject to a string value
         *
         * @return the `Collector` that collects the joined string
         *
         * @throws NullPointerException if `mapper` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(LastName = 'Doe'),
         *     new Contact(LastName = 'Smith')
         * };
         * ICollector joinedNamesCollector = new CollectorProvider(Contact.class)
         *     .joining()
         *     .val(Contact.LastName);
         * String joinedNames = (String) [SObjectEnumerable].of(contacts)
         *     .collect(joinedNamesCollector);
         * // 'DoeSmith'
         */
        public virtual override Collector val(final IFunction mapper) {
            return new Mapping().val(mapper).to(Collector.of(
                new JoiningStringSupplier(),
                new JoiningStringBiConsumer(delimiter, prefix),
                new AppendFinisher(suffix)
            ));
        }
    }

    private abstract class NumericMapping extends BaseSObjectValueMapping {
        private final ISupplier sup;
        private final IBiConsumer accumulator;
        private final IFunction finisher;
        protected NumericMapping(ISupplier sup, IBiConsumer accumulator, IFunction finisher) {
            this.sup = sup;
            this.accumulator = accumulator;
            this.finisher = finisher;
        }

        /**
         * @description Specifies the function to map an SObject to the numeric value.
         *
         * @param mapper the function to map the SObject to the numeric value
         *
         * @return the `Collector` for collecting numeric values
         *
         * @throws IllegalArgumentException if `mapper` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(NumberOfEmployees = 100),
         *     new Account(NumberOfEmployees = 200)
         * };
         * ICollector sumEmployeesCollector = new CollectorProvider(Account.class)
         *     .summingInt()
         *     .val(new SObjectFunctionProvider().get(Account.NumberOfEmployees));
         * Integer totalEmployees = (Integer) [SObjectEnumerable].of(accounts)
         *     .collect(sumEmployeesCollector); // 300
         */
        public override Collector val(final IFunction mapper) {
            return new Mapping().val(mapper).to(Collector.of(sup, accumulator, finisher));
        }
    }

    /**
     * @description Inits the configuration that calculates the average of `Integer` values.
     */
    public virtual class AverageIntMapping extends NumericMapping {
        public AverageIntMapping() {
            super(new AveragingIntSupplier(), new AveragingIntBiConsumer(), new AveragingIntFinisher());
        }
    }

    /**
     * @description Inits the configuration that sums up `Integer` values.
     */
    public virtual class SumIntMapping extends NumericMapping {
        public SumIntMapping() {
            super(new AveragingIntSupplier(), new AveragingIntBiConsumer(), new SummingFinisher());
        }
    }

    /**
     * @description Inits the configuration that calculates the average of `Long` values.
     */
    public virtual class AverageLongMapping extends NumericMapping {
        public AverageLongMapping() {
            super(new AveragingLongSupplier(), new AveragingLongBiConsumer(), new AveragingLongFinisher());
        }
    }

    /**
     * @description Inits the configuration that sums up `Long` values.
     */
    public virtual class SumLongMapping extends NumericMapping {
        public SumLongMapping() {
            super(new AveragingLongSupplier(), new AveragingLongBiConsumer(), new SummingFinisher());
        }
    }

    /**
     * @description Inits the configuration that calculates the average of `Double` values.
     */
    public virtual class AverageDoubleMapping extends NumericMapping {
        public AverageDoubleMapping() {
            super(new AveragingDoubleSupplier(), new AveragingDoubleBiConsumer(), new AveragingDoubleFinisher());
        }
    }

    /**
     * @description Creates a collector that sums up `Double` values.
     */
    public virtual class SumDoubleMapping extends NumericMapping {
        public SumDoubleMapping() {
            super(new AveragingDoubleSupplier(), new AveragingDoubleBiConsumer(), new SummingDoubleFinisher());
        }
    }

    /**
     * @description Provides methods for defining filtering rules and collecting elements based on those rules.
     * Allows filtering elements using predicates and collecting them into lists or other structures.
     */
    public virtual class Filtering {
        protected final Type valueType;
        protected Filtering(Type valueType) { this.valueType = valueType; }

        /**
         * @description Specifies a custom predicate to filter the elements.
         *
         * @param predicate the predicate to filter the elements
         *
         * @return the `FilterMappingCollector` instance for chaining
         *
         * @throws IllegalArgumentException if `predicate` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(DoNotCall = true, LastName = 'Doe'),
         *     new Contact(DoNotCall = false, LastName = 'Smith')
         * };
         * ICollector doNotCallContactsCollector = new CollectorProvider(Contact.class)
         *     .filtering()
         *     .when(new SObjectDefaultComparerPredicateProvider().is(Contact.DoNotCall).eq().var(true));
         * List<Contact> doNotCallContacts = (List<Contact>) [SObjectEnumerable].of(contacts)
         *     .collect(doNotCallContactsCollector);
         * // [{ DoNotCall: true, LastName: 'Doe' }]
         */
        public virtual FilterMappingCollector when(final IPredicate predicate) {
            return new FilterMappingCollector(predicate, new CollectorProvider(valueType).toList());
        }

        /**
         * @description Filters the elements based on the field name and value.
         * The field is compared with the specified value, and only matching elements are collected.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the field name to compare
         * @param value the value to compare against
         *
         * @return the `FilterMappingCollector` instance for chaining
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(DoNotCall = true, LastName = 'Doe'),
         *     new Contact(DoNotCall = false, LastName = 'Smith')
         * };
         * ICollector doNotCallContactsCollector = new CollectorProvider(Contact.class)
         *     .filtering()
         *     .when('DoNotCall', true);
         * List<Contact> doNotCallContacts = (List<Contact>) [SObjectEnumerable].of(contacts)
         *     .collect(doNotCallContactsCollector);
         * // [{ DoNotCall: true, LastName: 'Doe' }]
         */
        public virtual FilterMappingCollector when(final String fieldName, final Object value) {
            return when(new SObjectDefaultComparerPredicateProvider().is(fieldName).eq().var(value));
        }

        /**
         * @description Filters the elements based on the `SObjectField` and value.
         * The field is compared with the specified value, and only matching elements are collected.
         *
         * @param field the `SObjectField` to compare
         * @param value the value to compare against
         *
         * @return the `FilterMappingCollector` instance for chaining
         *
         * @throws IllegalArgumentException if `field` is null
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(DoNotCall = true, LastName = 'Doe'),
         *     new Contact(DoNotCall = false, LastName = 'Smith')
         * };
         * ICollector doNotCallContactsCollector = new CollectorProvider(Contact.class)
         *     .filtering()
         *     .when(Contact.DoNotCall, true);
         * List<Contact> doNotCallContacts = (List<Contact>) [SObjectEnumerable].of(contacts)
         *     .collect(doNotCallContactsCollector);
         * // [{ DoNotCall: true, LastName: 'Doe' }]
         */
        public virtual FilterMappingCollector when(final SObjectField field, final Object value) {
            return when(new SObjectDefaultComparerPredicateProvider().is(field).eq().var(value));
        }
    }

    /**
     * @description Collector that filters elements based on a predicate and collects the result.
     * It delegates to a downstream collector after applying the filter condition.
     */
    public virtual class FilterMappingCollector extends BaseMappingCollector {
        protected FilterMappingCollector(IPredicate predicate, ICollector downstream) { super(predicate, downstream); }

        protected virtual override IBiConsumer accumulator(Object predicate, IBiConsumer accumulator) {
            return new FilteringBiConsumer((IPredicate) predicate, accumulator);
        }

        /**
         * @description Collects filtered elements without providing a custom downstream collector.
         * This uses the default downstream collector specified in the `Filtering` class.
         *
         * @return the `Collector` instance that applies the filtering predicate and collects the elements
         *
         * @example
         * List<Contact> contacts = new List<Contact>{
         *     new Contact(DoNotCall = true, LastName = 'Doe'),
         *     new Contact(DoNotCall = false, LastName = 'Smith')
         * };
         * ICollector doNotCallContactsCollector = new CollectorProvider(Contact.class)
         *     .filtering()
         *     .when(Contact.DoNotCall, true)
         *     .val(); // explicit val invocation is optional
         * List<Contact> doNotCallContacts = (List<Contact>) [SObjectEnumerable].of(contacts)
         *     .collect(doNotCallContactsCollector);
         * // [{ DoNotCall: true, LastName: 'Doe' }]
         */
        public virtual Collector val() {
            return this;
        }
    }

    /**
     * @description Provides methods to flat-map elements using a function to a downstream collector.
     * Allows applying a function that maps elements to collections and flattening the result into a single collection.
     */
    public virtual class FlatMapping {
        /**
         * @description Specifies a function that maps elements to collections for flat-mapping and collection.
         *
         * @param mapper the function to map elements to collections
         *
         * @return the `FlatMappingCollector` to flat-map and collect the values
         *
         * @throws NullPointerException if `mapper` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Contacts = new List<Contact>{
         *         new Contact(LastName = 'Doe'),
         *         new Contact(LastName = 'Smith')
         *     }),
         *     new Account(Contacts = new List<Contact>{
         *         new Contact(LastName = 'Alex'),
         *         new Contact(LastName = 'Miller')
         *     })
         * };
         * ICollector contactsCollector = new CollectorProvider(Account.class)
         *     .flatMapping()
         *     .val(new SObjectFunctionProvider().getSObjects('Contacts'));
         * List<Contact> allContacts = (List<Contact>) [SObjectEnumerable].of(accounts)
         *     .collect(contactsCollector);
         * // [{ LastName: 'Doe'), { LastName: 'Smith' }, { LastName: 'Alex' }, { LastName: 'Miller' }]
         */
        public virtual FlatMappingCollector val(final IFunction mapper) {
            return new FlatMappingCollector(mapper, new CollectorProvider(Object.class).toList());
        }

        /**
         * @description Specifies a field name that maps to a collection of SObjects for flat-mapping and collection.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the name of the SObject relationship field to map
         *
         * @return the `FlatMappingCollector` to flat-map and collect the values
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Contacts = new List<Contact>{
         *         new Contact(LastName = 'Doe'),
         *         new Contact(LastName = 'Smith')
         *     }),
         *     new Account(Contacts = new List<Contact>{
         *         new Contact(LastName = 'Alex'),
         *         new Contact(LastName = 'Miller')
         *     })
         * };
         * ICollector contactsCollector = new CollectorProvider(Account.class)
         *     .flatMapping()
         *     .val('Contacts');
         * List<Contact> allContacts = (List<Contact>) [SObjectEnumerable].of(accounts)
         *     .collect(contactsCollector);
         * // [{ LastName: 'Doe'), { LastName: 'Smith' }, { LastName: 'Alex' }, { LastName: 'Miller' }]
         */
        public virtual Collector val(final String fieldName) {
            return val(new SObjectFunctionProvider().getSObjects(fieldName));
        }

        /**
         * @description Specifies an SObjectField that maps to a collection of SObjects for flat-mapping and collection.
         *
         * @param field the SObjectField representing the relationship to map
         *
         * @return the `FlatMappingCollector` to flat-map and collect the values
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Contacts = new List<Contact>{
         *         new Contact(LastName = 'Doe'),
         *         new Contact(LastName = 'Smith')
         *     }),
         *     new Account(Contacts = new List<Contact>{
         *         new Contact(LastName = 'Alex'),
         *         new Contact(LastName = 'Miller')
         *     })
         * };
         * ICollector contactsCollector = new CollectorProvider(Account.class)
         *     .flatMapping()
         *     .val(Contact.AccountId);
         * List<Contact> allContacts = (List<Contact>) [SObjectEnumerable].of(accounts)
         *     .collect(contactsCollector);
         * // [{ LastName: 'Doe'), { LastName: 'Smith' }, { LastName: 'Alex' }, { LastName: 'Miller' }]
         */
        public virtual Collector val(final SObjectField field) {
            return val(new SObjectFunctionProvider().getSObjects(field));
        }
    }

    /**
     * @description Collector that flat-maps elements using a specified function and
     * collects the results using a downstream collector.
     */
    public virtual class FlatMappingCollector extends BaseMappingCollector {
        protected FlatMappingCollector(IFunction mapper, ICollector downstream) { super(mapper, downstream); }

        protected virtual override IBiConsumer accumulator(Object mapper, IBiConsumer accumulator) {
            return new FlatMappingBiConsumer((IFunction) mapper, accumulator);
        }
    }

    /**
     * @description Provides methods for configuring and applying folding operations with a specified identity value.
     * Allows specifying a mapping function or an accumulator to apply during the fold.
     */
    public virtual class Folding {
        protected final Object identity;
        protected Folding(final Object identity) { this.identity = identity; }

        /**
         * @description Specifies a mapping function to apply to each element before the fold operation.
         *
         * @param mapper the function to map elements before applying the fold
         *
         * @return the `FoldingMapping` instance for chaining
         *
         * @example
         * public class SumBiOperator extends BiOperator {
         *     public override Object apply(Object accumulator, Object value) {
         *         return (Double) accumulator + (Double) value;
         *     }
         * }
         * List<Account> accounts = new List<Account>{
         *     new Account(AnnualRevenue = 500000.0),
         *     new Account(AnnualRevenue = 1000000.0)
         * };
         * Double seed = 0;
         * ICollector sumCollector = new CollectorProvider(Account.class)
         *     .folding(seed)
         *     .val(new SObjectFunctionProvider().get(Account.AnnualRevenue))
         *     .acc(new SumBiOperator());
         * Double sum = (Double) [SObjectEnumerable].of(contacts)
         *     .collect(sumCollector); // 1500000.0
         */
        public virtual FoldingMapping val(final IFunction mapper) {
            return new FoldingMapping(identity, mapper);
        }

        /**
         * @description Specifies a field name to map values from the elements during the fold operation.
         * Cross-reference fields and safe navigation are supported.
         *
         * @param fieldName the field name to extract values from the elements
         *
         * @return the `FoldingMapping` instance for chaining
         *
         * @throws IllegalArgumentException if `fieldName` is blank
         * @throws NullPointerException if `fieldName` is null
         *
         * @example
         * public class SumBiOperator extends BiOperator {
         *     public override Object apply(Object accumulator, Object value) {
         *         return (Double) accumulator + (Double) value;
         *     }
         * }
         * List<Account> accounts = new List<Account>{
         *     new Account(AnnualRevenue = 500000.0),
         *     new Account(AnnualRevenue = 1000000.0)
         * };
         * Double seed = 0;
         * ICollector sumCollector = new CollectorProvider(Account.class)
         *     .folding(seed)
         *     .val('AnnualRevenue')
         *     .acc(new SumBiOperator());
         * Double sum = (Double) [SObjectEnumerable].of(contacts)
         *     .collect(sumCollector); // 1500000.0
         */
        public virtual FoldingMapping val(final String fieldName) {
            return val(new SObjectFunctionProvider().get(fieldName));
        }

        /**
         * @description Specifies an SObjectField to map values from the elements during the fold operation.
         *
         * @param field the `SObjectField` to extract values from the elements
         *
         * @return the `FoldingMapping` instance for chaining
         *
         * @throws NullPointerException if `field` is null
         *
         * @example
         * public class SumBiOperator extends BiOperator {
         *     public override Object apply(Object accumulator, Object value) {
         *         return (Double) accumulator + (Double) value;
         *     }
         * }
         * List<Account> accounts = new List<Account>{
         *     new Account(AnnualRevenue = 500000.0),
         *     new Account(AnnualRevenue = 1000000.0)
         * };
         * Double seed = 0;
         * ICollector sumCollector = new CollectorProvider(Account.class)
         *     .folding(seed)
         *     .val(Account.AnnualRevenue)
         *     .acc(new SumBiOperator());
         * Double sum = (Double) [SObjectEnumerable].of(contacts)
         *     .collect(sumCollector); // 1500000.0
         */
        public virtual FoldingMapping val(final SObjectField field) {
            return val(new SObjectFunctionProvider().get(field));
        }

        /**
         * @description Specifies an accumulator function to apply to each element during the fold operation.
         *
         * @param accumulator the bi-operator function used to accumulate values
         *
         * @return the `Collector` that performs the folding operation with the specified accumulator
         *
         * @example
         * public class SumDoubleFieldReducer extends BiOperator {
         *     private final String fieldName;
         *     public SumDoubleFieldReducer(String fieldName) { this.fieldName = fieldName; }
         *     public override Object apply(Object seed, Object o) {
         *         ((SObject) seed).put(
         *             fieldName,
         *             (Double) ((SObject) seed).get(fieldName) + (Double) ((SObject) o).get(fieldName)
         *         );
         *         return seed;
         *     }
         * }
         * List<Account> accounts = new List<Account>{
         *     new Account(AnnualRevenue = 500000.0),
         *     new Account(AnnualRevenue = 1000000.0)
         * };
         * Account seed = new Account(Name = 'Account A', AnnualRevenue = 0);
         * ICollector sumCollector = new CollectorProvider(Account.class)
         *     .folding(seed)
         *     .acc(new SumDoubleFieldReducer('AnnualRevenue'));
         * Account sum = (Account) [SObjectEnumerable].of(accounts)
         *     .collect(sumCollector); // { Name: 'Account A', AnnualRevenue: 1500000.0 }
         */
        public virtual Collector acc(final IBiOperator accumulator) {
            return new FoldingMapping(identity, Function.identity()).acc(accumulator);
        }
    }

    /**
     * @description Provides methods to configure folding operations with a mapping function and an identity value.
     * Allows applying an accumulator function to fold values after mapping them from the elements.
     */
    public virtual class FoldingMapping {
        protected final Object identity;
        protected final IFunction mapper;
        protected FoldingMapping(final Object identity, final IFunction mapper) {
            this.identity = identity;
            this.mapper = mapper;
        }

        /**
         * @description Specifies an accumulator function to apply to each element during the folding operation.
         *
         * @param accumulator the bi-operator function used to accumulate mapped values
         *
         * @return a `Collector` that performs the folding operation with the specified accumulator
         *
         * @throws NullPointerException if `accumulator` is null
         *
         * @example
         * public class SumBiOperator extends BiOperator {
         *     public override Object apply(Object accumulator, Object value) {
         *         return (Double) accumulator + (Double) value;
         *     }
         * }
         * List<Account> accounts = new List<Account>{
         *     new Account(AnnualRevenue = 500000.0),
         *     new Account(AnnualRevenue = 1000000.0)
         * };
         * Double seed = 0;
         * ICollector sumCollector = new CollectorProvider(Account.class)
         *     .folding(seed)
         *     .val(Account.AnnualRevenue)
         *     .acc(new SumBiOperator());
         * Double sum = (Double) [SObjectEnumerable].of(contacts)
         *     .collect(sumCollector); // 1500000.0
         */
        public virtual Collector acc(final IBiOperator accumulator) {
            return Collector.of(
                new BoxSupplier(identity),
                new FoldingBiConsumer(accumulator, mapper),
                new GetElement(0)
            );
        }
    }

    /**
     * @description Provides methods for configuring reduce operations using a custom accumulator.
     */
    public virtual class Reducing {
        /**
         * @description Specifies an accumulator function to apply during the reduce operation.
         *
         * @param accumulator the bi-operator function used to accumulate values
         *
         * @return a `Collector` that applies the reduce operation with the specified accumulator
         *
         * @throws NullPointerException if `accumulator` is null
         *
         * @example
         * public class SumDoubleFieldReducer extends BiOperator {
         *     private final String fieldName;
         *     public SumDoubleFieldReducer(String fieldName) { this.fieldName = fieldName; }
         *     public override Object apply(Object seed, Object o) {
         *         ((SObject) seed).put(
         *             fieldName,
         *             (Double) ((SObject) seed).get(fieldName) + (Double) ((SObject) o).get(fieldName)
         *         );
         *         return seed;
         *     }
         * }
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'Account A', AnnualRevenue = 500000.0),
         *     new Account(Name = 'Account B', AnnualRevenue = 1000000.0)
         * };
         * ICollector sumCollector = new CollectorProvider(Account.class)
         *     .reducing()
         *     .acc(new SumDoubleFieldReducer('AnnualRevenue'));
         * IOptional sum = (IOptional) [SObjectEnumerable].of(accounts)
         *     .collect(sumCollector);
         * sum.get(); // { Name: 'Account A', AnnualRevenue: 1500000.0 }
         */
        public virtual Collector acc(final IBiOperator accumulator) {
            return Collector.of(
                Supplier.of(List<Object>.class),
                new ReducingBiConsumer(accumulator),
                new ReducingFinisher()
            );
        }
    }

    private abstract class Optimizing extends BaseSObjectValueMapping {
        protected abstract IBiOperator op(final IComparer comparer);

        /**
         * @description Specifies a comparer to use for the optimization operation.
         *
         * @param comparer the comparer used to compare elements
         *
         * @return a `Collector` that performs the optimization operation with the specified comparer
         *
         * @throws NullPointerException if `comparer` is null
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'Account A', AnnualRevenue = 500000.0),
         *     new Account(Name = 'Account B', AnnualRevenue = 1000000.0)
         * };
         * ICollector maxRevenueCollector = new CollectorProvider(Account.class)
         *     .maximizing()
         *     .val(Comparer.comparing(new SObjectFunctionProvider().get(Account.AnnualRevenue)));
         * IOptional max = (IOptional) [SObjectEnumerable].of(accounts)
         *     .collect(maxRevenueCollector);
         * max.get(); // { Name: 'Account B', AnnualRevenue: 1000000.0 }
         */
        public virtual Collector val(final IComparer comparer) {
            return new Reducing().acc(op(comparer));
        }

        /**
         * @description Specifies a mapping function to apply to each element before the optimization operation.
         *
         * @param mapper the function to map elements before applying the optimization
         *
         * @return a `Collector` that performs the optimization operation with the specified mapping function
         *
         * @example
         * List<Account> accounts = new List<Account>{
         *     new Account(Name = 'Account A', AnnualRevenue = 500000.0),
         *     new Account(Name = 'Account B', AnnualRevenue = 1000000.0)
         * };
         * ICollector maxRevenueCollector = new CollectorProvider(Account.class)
         *     .maximizing()
         *     .val(new SObjectFunctionProvider().get(Account.AnnualRevenue));
         * IOptional max = (IOptional) [SObjectEnumerable].of(accounts)
         *     .collect(maxRevenueCollector);
         * max.get(); // { Name: 'Account B', AnnualRevenue: 1000000.0 }
         */
        public virtual override Collector val(final IFunction mapper) {
            return val(Comparer.comparing(mapper));
        }
    }

    /**
     * @description Provides methods for performing maximizing operations on elements
     * using a comparer.
     */
    public virtual class Maximizing extends Optimizing {
        protected virtual override IBiOperator op(final IComparer comparer) {
            return BiOperator.maxBy(comparer);
        }
    }

    /**
     * @description Provides methods for performing minimizing operations on elements
     * using a comparer.
     */
    public virtual class Minimizing extends Optimizing {
        protected virtual override IBiOperator op(final IComparer comparer) {
            return BiOperator.minBy(comparer);
        }
    }

    private class AddToListBiConsumer extends BiConsumer {
        public override void accept(Object container, Object o) { ((List<Object>) container).add(o); }
    }

    private class AddToBoolSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Boolean>) container).add((Boolean) o); }
    }

    private class AddToIdSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Id>) container).add((Id) o); }
    }

    private class AddToStringSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<String>) container).add((String) o); }
    }

    private class AddToBlobSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Blob>) container).add((Blob) o); }
    }

    private class AddToDateSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Date>) container).add((Date) o); }
    }

    private class AddToDatetimeSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Datetime>) container).add((Datetime) o); }
    }

    private class AddToTimeSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Time>) container).add((Time) o); }
    }

    private class AddToIntSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Integer>) container).add((Integer) o); }
    }

    private class AddToLongSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Long>) container).add((Long) o); }
    }

    private class AddToDoubleSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Double>) container).add((Double) o); }
    }

    private class AddToSObjectSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<SObject>) container).add((SObject) o); }
    }

    private class AddToObjectSet extends BiConsumer {
        public override void accept(Object container, Object o) { ((Set<Object>) container).add(o); }
    }

    private abstract class PutToMapBiConsumer extends BiConsumer {
        protected IFunction keyMapper;
        protected IFunction valueMapper;
        protected IBiOperator merger;
        private PutToMapBiConsumer key(final IFunction keyMapper) {
            Validate.notNull(keyMapper);
            this.keyMapper = keyMapper;
            return this;
        }
        private PutToMapBiConsumer val(final IFunction valueMapper) {
            Validate.notNull(valueMapper);
            this.valueMapper = valueMapper;
            return this;
        }
        private PutToMapBiConsumer merger(final IBiOperator merger) {
            this.merger = merger;
            return this;
        }
    }

    private abstract class PutToDownstreamMap extends BiConsumer {
        protected IFunction classifier;
        private PutToDownstreamMap key(final IFunction classifier) {
            Validate.notNull(classifier);
            this.classifier = classifier;
            return this;
        }
        private PutToDownstreamMap val(final ICollector downstream) {
            Validate.notNull(downstream);
            this.downstream = downstream;
            return this;
        }
    }

    private class PutToObjectByBoolMap extends PutToMapBiConsumer {
        public override void accept(Object container, Object o) {
            final Map<Boolean, Object> m = ((Map<Boolean, Object>) container);
            final Boolean key = (Boolean) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByIdMap extends PutToMapBiConsumer {
        public override void accept(Object container, Object o) {
            final Map<Id, Object> m = ((Map<Id, Object>) container);
            final Id key = (Id) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByStringMap extends PutToMapBiConsumer {
        public override void accept(Object container, Object o) {
            final Map<String, Object> m = ((Map<String, Object>) container);
            final String key = (String) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByBlobMap extends PutToMapBiConsumer {
        public override void accept(Object container, Object o) {
            final Map<Blob, Object> m = ((Map<Blob, Object>) container);
            final Blob key = (Blob) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByDateMap extends PutToMapBiConsumer {
        public override void accept(Object container, Object o) {
            final Map<Date, Object> m = ((Map<Date, Object>) container);
            final Date key = (Date) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByDatetimeMap extends PutToMapBiConsumer {
        public override void accept(Object container, Object o) {
            final Map<Datetime, Object> m = ((Map<Datetime, Object>) container);
            final Datetime key = (Datetime) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByTimeMap extends PutToMapBiConsumer {
        public override void accept(Object container, Object o) {
            final Map<Time, Object> m = ((Map<Time, Object>) container);
            final Time key = (Time) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByIntMap extends PutToMapBiConsumer {
        public override void accept(Object container, Object o) {
            final Map<Integer, Object> m = ((Map<Integer, Object>) container);
            final Integer key = (Integer) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByLongMap extends PutToMapBiConsumer {
        public override void accept(Object container, Object o) {
            final Map<Long, Object> m = ((Map<Long, Object>) container);
            final Long key = (Long) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByDoubleMap extends PutToMapBiConsumer {
        public override void accept(Object container, Object o) {
            final Map<Double, Object> m = ((Map<Double, Object>) container);
            final Double key = (Double) keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectByObjectMap extends PutToMapBiConsumer {
        public override void accept(Object container, Object o) {
            final Map<Object, Object> m = ((Map<Object, Object>) container);
            final Object key = keyMapper.apply(o);
            Object newValue = valueMapper.apply(o);
            if (m.containsKey(key)) { newValue = mergeValue(merger, key, m.get(key), newValue); }
            m.put(key, newValue);
        }
    }

    private class PutToObjectsByBoolMap extends PutToDownstreamMap {
        public override void accept(Object container, Object o) {
            final Map<Boolean, Object> m = (Map<Boolean, Object>) container;
            final Boolean key = (Boolean) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByIdMap extends PutToDownstreamMap {
        public override void accept(Object container, Object o) {
            final Map<Id, Object> m = (Map<Id, Object>) container;
            final Id key = (Id) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByStringMap extends PutToDownstreamMap {
        public override void accept(Object container, Object o) {
            final Map<String, Object> m = (Map<String, Object>) container;
            final String key = (String) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByBlobMap extends PutToDownstreamMap {
        public override void accept(Object container, Object o) {
            final Map<Blob, Object> m = (Map<Blob, Object>) container;
            final Blob key = (Blob) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByDateMap extends PutToDownstreamMap {
        public override void accept(Object container, Object o) {
            final Map<Date, Object> m = (Map<Date, Object>) container;
            final Date key = (Date) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByDatetimeMap extends PutToDownstreamMap {
        public override void accept(Object container, Object o) {
            final Map<Datetime, Object> m = (Map<Datetime, Object>) container;
            final Datetime key = (Datetime) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByTimeMap extends PutToDownstreamMap {
        public override void accept(Object container, Object o) {
            final Map<Time, Object> m = (Map<Time, Object>) container;
            final Time key = (Time) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByIntMap extends PutToDownstreamMap {
        public override void accept(Object container, Object o) {
            final Map<Integer, Object> m = (Map<Integer, Object>) container;
            final Integer key = (Integer) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByLongMap extends PutToDownstreamMap {
        public override void accept(Object container, Object o) {
            final Map<Long, Object> m = (Map<Long, Object>) container;
            final Long key = (Long) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByDoubleMap extends PutToDownstreamMap {
        public override void accept(Object container, Object o) {
            final Map<Double, Object> m = (Map<Double, Object>) container;
            final Double key = (Double) classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private class PutToObjectsByObjectMap extends PutToDownstreamMap {
        public override void accept(Object container, Object o) {
            final Map<Object, Object> m = (Map<Object, Object>) container;
            final Object key = classifier.apply(o);
            if (!m.containsKey(key)) { m.put(key, downstream.supplier().get()); }
            downstream.accumulator().accept(m.get(key), o);
        }
    }

    private abstract class GroupFinisher extends Function {
        protected IFunction finisher;
        private GroupFinisher val(final IFunction finisher) {
            this.finisher = finisher;
            return this;
        }
    }

    private class GroupByBoolFinisher extends GroupFinisher {
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Boolean, Object> m = ((Map<Boolean, Object>) o);
            for (Boolean k : m.keySet()) { m.put(k, finisher.apply(m.get(k))); }
            return m;
        }
    }

    private class GroupByIdFinisher extends GroupFinisher {
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Id, Object> m = ((Map<Id, Object>) o);
            for (Id k : m.keySet()) { m.put(k, finisher.apply(m.get(k))); }
            return m;
        }
    }

    private class GroupByStringFinisher extends GroupFinisher {
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<String, Object> m = ((Map<String, Object>) o);
            for (String k : m.keySet()) { m.put(k, finisher.apply(m.get(k))); }
            return m;
        }
    }

    private class GroupByBlobFinisher extends GroupFinisher {
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Blob, Object> m = ((Map<Blob, Object>) o);
            for (Blob k : m.keySet()) { m.put(k, finisher.apply(m.get(k))); }
            return m;
        }
    }

    private class GroupByDateFinisher extends GroupFinisher {
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Date, Object> m = ((Map<Date, Object>) o);
            for (Date k : m.keySet()) { m.put(k, finisher.apply(m.get(k))); }
            return m;
        }
    }

    private class GroupByDatetimeFinisher extends GroupFinisher {
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Datetime, Object> m = ((Map<Datetime, Object>) o);
            for (Datetime k : m.keySet()) { m.put(k, finisher.apply(m.get(k))); }
            return m;
        }
    }

    private class GroupByTimeFinisher extends GroupFinisher {
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Time, Object> m = ((Map<Time, Object>) o);
            for (Time k : m.keySet()) { m.put(k, finisher.apply(m.get(k))); }
            return m;
        }
    }

    private class GroupByIntFinisher extends GroupFinisher {
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Integer, Object> m = ((Map<Integer, Object>) o);
            for (Integer k : m.keySet()) { m.put(k, finisher.apply(m.get(k))); }
            return m;
        }
    }

    private class GroupByLongFinisher extends GroupFinisher {
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Long, Object> m = ((Map<Long, Object>) o);
            for (Long k : m.keySet()) { m.put(k, finisher.apply(m.get(k))); }
            return m;
        }
    }

    private class GroupByDoubleFinisher extends GroupFinisher {
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Double, Object> m = ((Map<Double, Object>) o);
            for (Double k : m.keySet()) { m.put(k, finisher.apply(m.get(k))); }
            return m;
        }
    }

    private class GroupByObjectFinisher extends GroupFinisher {
        public override Object apply(Object o) {
            if (finisher == null) { return o; }
            final Map<Object, Object> m = ((Map<Object, Object>) o);
            for (Object k : m.keySet()) { m.put(k, finisher.apply(m.get(k))); }
            return m;
        }
    }

    private class JoiningStringSupplier extends Supplier {
        public override Object get() { return new List<String>{ '' }; }
    }

    private class AveragingIntSupplier extends Supplier {
        public override Object get() { return new List<Integer>{ 0, 0 }; }
    }

    private class AveragingLongSupplier extends Supplier {
        public override Object get() { return new List<Long>{ 0L, 0L }; }
    }

    private class AveragingDoubleSupplier extends Supplier {
        public override Object get() { return new List<Double>{ 0, 0, 0, 0 }; }
    }

    private class BoxSupplier extends Supplier {
        private final Object identity;
        private BoxSupplier(Object identity) { this.identity = identity; }
        public override Object get() { return new List<Object>{ identity }; }
    }

    private class JoiningStringBiConsumer extends BiConsumer {
        private final String delimiter;
        private final String prefix;
        private JoiningStringBiConsumer(String delimiter, String prefix) {
            Validate.notNull(delimiter);
            Validate.notNull(prefix);
            this.delimiter = delimiter;
            this.prefix = prefix;
        }
        public override void accept(Object container, Object o) {
            final List<String> strings = (List<String>) container;
            strings[0] = strings[0] + (strings[0].length() > 0 ? delimiter : prefix) + (String) o;
        }
    }

    private class AveragingIntBiConsumer extends BiConsumer {
        public override void accept(Object container, Object o) {
            final List<Integer> values = (List<Integer>) container;
            values[0]++;
            values[1] += (Integer) o;
        }
    }

    private class AveragingLongBiConsumer extends BiConsumer {
        public override void accept(Object container, Object o) {
            final List<Long> values = (List<Long>) container;
            values[0]++;
            values[1] += (Long) o;
        }
    }

    private class AveragingDoubleBiConsumer extends BiConsumer {
        public override void accept(Object container, Object o) {
            final List<Double> avgContainer = ((List<Double>) container);
            avgContainer[2]++;
            avgContainer[3] += kahanSum(avgContainer, (Double) o);
        }
    }

    private class AppendFinisher extends Function {
        private final String suffix;
        private AppendFinisher(String suffix) { Validate.notNull(suffix); this.suffix = suffix; }
        public override Object apply(Object o) { return ((List<String>) o)[0] + suffix; }
    }

    private class AveragingIntFinisher extends Function {
        public override Object apply(Object o) {
            final List<Integer> integers = (List<Integer>) o;
            if (integers[0] == 0) { return null; }
            return integers[1] / (Double) integers[0];
        }
    }

    private class SummingFinisher extends Function {
        public override Object apply(Object o) {
            final List<Object> objects = (List<Object>) o;
            if (objects[0] == 0) { return null; }
            return objects[1];
        }
    }

    private class SummingDoubleFinisher extends Function {
        public override Object apply(Object o) {
            final List<Double> doubles = (List<Double>) o;
            if (doubles[2] == 0) { return null; }
            return doubles[0] + doubles[1];
        }
    }

    private class AveragingLongFinisher extends Function {
        public override Object apply(Object o) {
            final List<Long> longs = (List<Long>) o;
            if (longs[0] == 0) { return null; }
            return longs[1] / (Double) longs[0];
        }
    }

    private class AveragingDoubleFinisher extends Function {
        public override Object apply(Object o) {
            final List<Double> doubles = (List<Double>) o;
            if (doubles[2] == 0) { return null; }
            return (doubles[0] + doubles[1]) / doubles[2];
        }
    }

    private class ReducingFinisher extends Function {
        public override Object apply(Object o) {
            return ((List<Object>) o).isEmpty()
                ? Optional.empty()
                : Optional.ofNullable(((List<Object>) o)[0]);
        }
    }

    @TestVisible
    private class GetElement extends Function {
        private final Integer index;
        @TestVisible
        private GetElement(Integer index) {
            Validate.isTrue(index >= 0);
            this.index = index;
        }
        public override Object apply(Object o) {
            final Iterator<Object> iterator = ((Iterable<Object>) o).iterator();
            Integer i = 0;
            while (iterator.hasNext()) {
                final Object current = iterator.next();
                if (i == index) { return current; }
                i++;
            }
            throw new IndexOutOfBoundsException(
                String.format(Label.AF_ErrorMessage_IndexOutOfBounds, new List<Integer>{ index })
            );
        }
    }

    private abstract class ComposedBiConsumer extends BiConsumer {
        protected final IFunction mapper;
        protected final IBiConsumer accumulator;
        protected ComposedBiConsumer(final IFunction mapper, final IBiConsumer accumulator) {
            Validate.notNull(mapper);
            Validate.notNull(accumulator);
            this.mapper = mapper;
            this.accumulator = accumulator;
        }
    }

    private class FilteringBiConsumer extends BiConsumer {
        private final IPredicate predicate;
        private final IBiConsumer accumulator;
        private FilteringBiConsumer(final IPredicate predicate, final IBiConsumer accumulator) {
            this.predicate = predicate;
            this.accumulator = accumulator;
        }
        public override void accept(Object container, Object o) {
            if (predicate.test(o)) { accumulator.accept(container, o); }
        }
    }

    private class FoldingBiConsumer extends BiConsumer {
        private final IBiOperator operator;
        private final IFunction mapper;
        private FoldingBiConsumer(IBiOperator operator, IFunction mapper) {
            Validate.notNull(operator);
            Validate.notNull(mapper);
            this.operator = operator;
            this.mapper = mapper;
        }
        public override void accept(Object container, Object o) {
            final List<Object> accumulator = (List<Object>) container;
            accumulator[0] = operator.apply(accumulator[0], mapper.apply(o));
        }
    }

    private class ReducingBiConsumer extends BiConsumer {
        private final IBiOperator operator;
        private ReducingBiConsumer(IBiOperator operator) {
            Validate.notNull(operator);
            this.operator = operator;
        }
        public override void accept(Object container, Object o) {
            final List<Object> accumulator = (List<Object>) container;
            if (!accumulator.isEmpty()) {
                accumulator[0] = operator.apply(accumulator[0], o);
            } else {
                accumulator.add(o);
            }
        }
    }

    private class MappingBiConsumer extends ComposedBiConsumer {
        private MappingBiConsumer(IFunction mapper, IBiConsumer accumulator) { super(mapper, accumulator); }
        public override void accept(Object container, Object o) { accumulator.accept(container, mapper.apply(o)); }
    }

    private class FlatMappingBiConsumer extends ComposedBiConsumer {
        private FlatMappingBiConsumer(IFunction mapper, IBiConsumer accumulator) { super(mapper, accumulator); }
        public override void accept(Object container, Object o) {
            final Iterable<Object> result = (Iterable<Object>) mapper.apply(o);
            if (result == null) { return; }
            final Iterator<Object> iterator = result.iterator();
            while (iterator.hasNext()) {
                accumulator.accept(container, iterator.next());
            }
        }
    }
}
