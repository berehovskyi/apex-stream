/**
 * @author O. Berehovskyi
 * @see SObjectSequence
 */
@IsTest(IsParallel = true)
private class SObjectSequenceTest {

    private static List<Account> accounts = IterTestUtils.generateAccounts1();

    /**
     * @see SObjectSequence.of
     * @see SObjectSequence.ofNullable
     * @see SObjectSequence.empty
     * @see SObjectSequence.iterator
     * @see SObjectSequence.stream
     */
    @IsTest
    static void of() {
        // Given
        accounts.add(0, null);
        accounts.add(null);
        List<SObject> input = accounts.deepClone();
        List<Contact> input1;
        Set<SObject> input2;
        ISObjectIterable accSeq = SObjectSequence.of(input);
        ISObjectIterable accSeq1 = SObjectSequence.of(new Set<SObject>(input));
        ISObjectIterable accSeq2 = SObjectSequence.ofNullable(input);
        ISObjectIterable accSeq3 = SObjectSequence.ofNullable(new Set<SObject>(input));
        ISObjectIterable accSeq4 = SObjectSequence.ofNullable(input1);
        ISObjectIterable accSeq5 = SObjectSequence.ofNullable(input2);
        ISObjectIterable accStream = ((SObjectSequence) SObjectSequence.of(input)).stream();
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = accSeq2.toList();
        List<Account> actual3 = accSeq3.toList();
        List<Account> actual4 = accSeq4.toList();
        List<Account> actual5 = accSeq5.toList();
        // Then
        List<Account> expected = new List<SObject>(new Set<SObject>(input));
        List<Account> expected1 = new List<SObject>();
        Validate.assertEquals(input, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(input, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(true, accSeq.iterator().hasNext());
        Validate.assertEquals(true, accSeq1.iterator().hasNext());
        Validate.assertEquals(true, accSeq2.iterator().hasNext());
        Validate.assertEquals(true, accSeq3.iterator().hasNext());
        Validate.assertEquals(false, accSeq4.iterator().hasNext());
        Validate.assertEquals(false, accSeq5.iterator().hasNext());
        Validate.assertEquals(accounts, input, Label.InputMutatedErrorMessage);
        Validate.assert(!((SObjectStream) accStream).isOperated);
    }

    /**
     * @see SObjectSequence.concat
     */
    @IsTest
    private static void concat() {
        // Given
        Account acc = new Account(Name = 'Test Acc');
        Account acc1 = new Account(Name = 'Test Acc1');
        Account acc2 = new Account(Name = 'Test Acc2');
        Account acc3 = new Account(Name = 'Test Acc3');
        Account acc4 = new Account(Name = 'Test Acc4');
        Account acc5 = new Account(Name = 'Test Acc5');
        Account acc6 = new Account(Name = 'Test Acc6');
        List<Account> input = new List<Account>{ acc, acc1, acc2 };
        List<Account> input1 = new List<Account>{ acc3, acc4, acc5 };
        List<Account> input2 = new List<Account>{ acc6 };
        ISObjectIterable accSeq = SObjectSequence.of(input);
        ISObjectIterable accSeq1 = SObjectSequence.of(input1);
        ISObjectIterable accSeq2 = SObjectSequence.of(input2);
        // When
        List<Account> actual = SObjectSequence.concat(accSeq, accSeq1).toList();
        List<Account> actual1 = SObjectSequence.concat(new List<ISObjectIterable>{ accSeq, accSeq1, accSeq2 }).toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5 };
        List<Account> expected1 = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5, acc6 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
    }

    /**
     * @see SObjectSequence.zip
     */
    @IsTest
    private static void zip() {
        // Given
        Account oldAcc = new Account(Name = 'Test Acc', NumberOfEmployees = 100);
        Account oldAcc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 200);
        Account oldAcc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 300);
        Account oldAcc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account newAcc = new Account(Name = 'Test Acc', NumberOfEmployees = 100);
        Account newAcc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 150);
        Account newAcc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 350);
        Account newAcc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        List<Account> oldList = new List<Account>{ oldAcc, oldAcc1, oldAcc2, oldAcc3 };
        List<Account> newList = new List<Account>{ newAcc, newAcc1, newAcc2, newAcc3 };
        ISObjectBinaryOperator maxNumber = SObjectBinaryOperator.maxBy(SObjectComparator.comparing(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        ISObjectIterable oldAccsSteam = SObjectSequence.of(oldList);
        ISObjectIterable newAccsSteam = SObjectSequence.of(newList);
        ISObjectBiPredicate numOfEmployeesIsChanged = SObjectBiPredicate.areNotEqual(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES);
        ISObjectBinaryOperator getNewAcc = SObjectBinaryOperator.right();
        ISObjectIterable accSeq = SObjectSequence.zip(oldAccsSteam, newAccsSteam, maxNumber);
        ISObjectIterable accSeq1 = SObjectSequence.zip(oldAccsSteam, newAccsSteam, numOfEmployeesIsChanged, getNewAcc);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        // Then
        List<Account> expected = new List<Account>{ oldAcc, oldAcc1, newAcc2, oldAcc3 };
        List<Account> expected1 = new List<Account>{ newAcc1, newAcc2 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
    }

    /**
     * @see SObjectSequence.append
     * @see SObjectSequence.prepend
     */
    @IsTest
    private static void appendPrepend() {
        // Given
        Account acc = new Account(Name = 'Test Acc');
        Account acc1 = new Account(Name = 'Test Acc1');
        Account acc2 = new Account(Name = 'Test Acc2');
        Account acc3 = new Account(Name = 'Test Acc3');
        Account acc4 = new Account(Name = 'Test Acc4');
        Account acc5 = new Account(Name = 'Test Acc5');
        List<Account> input = new List<Account>{ acc, acc1, acc2 };
        List<Account> input1 = new List<Account>{ acc3, acc4, acc5 };
        ISObjectIterable accSeq = SObjectSequence.of(input);
        ISObjectIterable accSeq1 = SObjectSequence.of(input1);
        ISObjectIterable accSeq2 = accSeq.append(accSeq1);
        ISObjectIterable accSeq3 = accSeq.prepend(accSeq1);
        // When
        List<Account> actual = accSeq2.toList();
        List<Account> actual1 = accSeq3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5 };
        List<Account> expected1 = new List<Account>{ acc3, acc4, acc5, acc, acc1, acc2 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
    }

    /**
     * @see SObjectSequence.filter
     */
    @IsTest
    private static void filter() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 100);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 200);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 200);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc, acc1, acc2, acc3, acc4 };
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        Integer value = 200;
        ISObjectPredicate isFieldEqual = SObjectPredicate.isEqual(fieldName, value);
        ISObjectPredicate isFieldEqual1 = SObjectPredicate.isEqual(field, value);
        ISObjectIterable accSeq = SObjectSequence.of(input).filter(fieldName, value);
        ISObjectIterable accSeq1 = SObjectSequence.of(input).filter(field, value);
        ISObjectIterable accSeq2 = SObjectSequence.of(input).filter(isFieldEqual);
        ISObjectIterable accSeq3 = SObjectSequence.of(input).filter(isFieldEqual1);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = accSeq2.toList();
        List<Account> actual3 = accSeq3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc1, acc2 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
    }

    /**
     * @see SObjectSequence.take
     */
    @IsTest
    private static void take() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 200);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 200);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc, acc1, acc2, acc3, acc4 };
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        Integer value = 200;
        ISObjectPredicate isFieldEqual = SObjectPredicate.isEqual(fieldName, value);
        ISObjectPredicate isFieldEqual1 = SObjectPredicate.isEqual(field, value);
        ISObjectIterable accSeq = SObjectSequence.of(input).take(fieldName, value);
        ISObjectIterable accSeq1 = SObjectSequence.of(input).take(field, value);
        ISObjectIterable accSeq2 = SObjectSequence.of(input).take(isFieldEqual);
        ISObjectIterable accSeq3 = SObjectSequence.of(input).take(isFieldEqual1);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = accSeq2.toList();
        List<Account> actual3 = accSeq3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
    }

    /**
     * @see SObjectSequence.drop
     */
    @IsTest
    private static void drop() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 200);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 200);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc, acc1, acc2, acc3, acc4 };
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        Integer value = 200;
        ISObjectPredicate isFieldEqual = SObjectPredicate.isEqual(fieldName, value);
        ISObjectPredicate isFieldEqual1 = SObjectPredicate.isEqual(field, value);
        ISObjectIterable accSeq = SObjectSequence.of(input).drop(fieldName, value);
        ISObjectIterable accSeq1 = SObjectSequence.of(input).drop(field, value);
        ISObjectIterable accSeq2 = SObjectSequence.of(input).drop(isFieldEqual);
        ISObjectIterable accSeq3 = SObjectSequence.of(input).drop(isFieldEqual1);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = accSeq2.toList();
        List<Account> actual3 = accSeq3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc3, acc4 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
    }

    /**
     * @see SObjectIterable.withoutNulls
     */
    @IsTest
    private static void withoutNulls() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 200);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 200);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc, acc1, acc2, null, acc3, acc4, acc1, null };
        List<Account> clone = input.deepClone();
        // When
        List<Account> actual = SObjectSequence.of(clone).withoutNulls().toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc1 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectSequence.mapTo
    */
    @IsTest
    private static void mapTo() {
        // Given
        Account acc = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Acc1', NumberOfEmployees = 200);
        Account acc2 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Acc2', NumberOfEmployees = 200);
        Account acc3 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Test Acc4');
        Account acc5 = new Account(Id = IterTestUtils.generateId(Account.SObjectType), Name = 'Parent Acc4');
        acc.putSObject('Parent', acc5);
        acc1.putSObject('Parent', acc5);
        acc2.putSObject('Parent', acc5);
        acc3.putSObject('Parent', acc5);
        acc4.putSObject('Parent', acc5);
        List<Account> input = new List<Account>{ acc, acc1, acc2, acc3, acc4 };
        List<Account> clone = input.deepClone(true);
        String fieldName = IterTestUtils.CONSTS.DESCRIPTION;
        SObjectField field = IterTestUtils.CONSTS.Contact.Description;
        String fieldName1 = IterTestUtils.CONSTS.PARENT;
        SObjectField field1 = IterTestUtils.CONSTS.Account.ParentId;
        String value = 'Value';
        ISObjectFunction getConstFunction = SObjectFunction.constant(value);
        ISObjectFunction getIdByRightFunction = SObjectFunction.get(IterTestUtils.CONSTS.ID);
        ISObjectFunction getAccountIdByRightFunction = SObjectFunction.get(Account.Id);
        ISObjectFunction getAccNameByRightFunction = SObjectFunction.get(IterTestUtils.CONSTS.Account.Name);
        SObjectBiConsumer setIdByFunctionBiConsumer = SObjectBiConsumer.set(IterTestUtils.CONSTS.ACCOUNT_ID, getIdByRightFunction);
        SObjectBiConsumer setDescriptionByFunctionBiConsumer = SObjectBiConsumer.set(field, getAccNameByRightFunction);
        ISObjectBiConsumer biConsumer = setIdByFunctionBiConsumer.andThen(setDescriptionByFunctionBiConsumer);
        ISObjectBinaryOperator binaryOperator = SObjectBinaryOperator.forBiConsumer(biConsumer);
        SObjectUnaryOperator createNewContactOperator = SObjectUnaryOperator.newSObject(Contact.SObjectType, binaryOperator);
        SObjectUnaryOperator setDepartmentByConstFunction = SObjectUnaryOperator.set(IterTestUtils.CONSTS.Contact.Department, getConstFunction);
        ISObjectUnaryOperator operator = createNewContactOperator.andThen(setDepartmentByConstFunction);
        ISObjectUnaryOperator createNewContactFromAccount = SObjectUnaryOperator.newSObject(
                Contact.SObjectType, IterTestUtils.CONSTS.Contact.AccountId, getAccountIdByRightFunction
        );

        ISObjectIterable conSeq = SObjectSequence.of(clone).mapTo(createNewContactFromAccount);
        ISObjectIterable conSeq1 = SObjectSequence.of(clone).mapTo(field1);
        ISObjectIterable conSeq2 = SObjectSequence.of(clone).mapTo(fieldName1);
        ISObjectIterable conSeq3 = SObjectSequence.of(clone).mapTo(operator);
        // When
        List<Contact> actual = conSeq.toList();
        List<Account> actual1 = conSeq1.toList();
        List<Account> actual2 = conSeq2.toList();
        List<Contact> actual3 = conSeq3.toList();
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Validate.assertEquals(input[i].Id, actual[i].AccountId);
            Validate.assertEquals(acc5, actual1[i]);
            Validate.assertEquals(acc5, actual2[i]);
            Validate.assertEquals(input[i].Id, actual3[i].AccountId);
            Validate.assertEquals(input[i].Name, actual3[i].Description);
            Validate.assertEquals(value, actual3[i].Department);
        }
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectSequence.mapToInt
    */
    @IsTest
    private static void mapToInt() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 200);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 200);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc, acc1, acc2, acc3, acc4 };
        List<Account> clone = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectToIntFunction getNumOfEmployeesAsInt = SObjectToIntFunction.get(field);
        IIntIterable intSeq = SObjectSequence.of(clone).mapToInt(getNumOfEmployeesAsInt);
        IIntIterable intSeq1 = SObjectSequence.of(clone).mapToInt(fieldName);
        IIntIterable intSeq2 = SObjectSequence.of(clone).mapToInt(field);
        // When
        List<Integer> actual = intSeq.toList();
        List<Integer> actual1 = intSeq1.toList();
        List<Integer> actual2 = intSeq2.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 200, 200, 200, 400, null };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectSequence.mapToLong
    */
    @IsTest
    private static void mapToLong() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 200);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 200);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc, acc1, acc2, acc3, acc4 };
        List<Account> clone = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectToLongFunction getNumOfEmployeesAsLong = SObjectToLongFunction.get(field);
        ILongIterable longSeq = SObjectSequence.of(clone).mapToLong(getNumOfEmployeesAsLong);
        ILongIterable longSeq1 = SObjectSequence.of(clone).mapToLong(fieldName);
        ILongIterable longSeq2 = SObjectSequence.of(clone).mapToLong(field);
        // When
        List<Long> actual = longSeq.toList();
        List<Long> actual1 = longSeq1.toList();
        List<Long> actual2 = longSeq2.toList();
        // Then
        List<Long> expected = new List<Long>{ 200L, 200L, 200L, 400L, null };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectSequence.mapToDouble
    */
    @IsTest
    private static void mapToDouble() {
        // Given
        Account acc = new Account(Name = 'Test Acc', AnnualRevenue = 20000.0);
        Account acc1 = new Account(Name = 'Test Acc1', AnnualRevenue = 10000.5);
        Account acc2 = new Account(Name = 'Test Acc2', AnnualRevenue = 40000.4);
        Account acc3 = new Account(Name = 'Test Acc3', AnnualRevenue = 2581.9);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc, acc1, acc2, acc3, acc4 };
        List<Account> clone = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Account.AnnualRevenue;
        String fieldName = IterTestUtils.CONSTS.ANNUAL_REVENUE;
        ISObjectToDoubleFunction getNumOfEmployeesAsDouble = SObjectToDoubleFunction.get(field);
        IDoubleIterable doubleSeq = SObjectSequence.of(clone).mapToDouble(getNumOfEmployeesAsDouble);
        IDoubleIterable doubleSeq1 = SObjectSequence.of(clone).mapToDouble(fieldName);
        IDoubleIterable doubleSeq2 = SObjectSequence.of(clone).mapToDouble(field);
        // When
        List<Double> actual = doubleSeq.toList();
        List<Double> actual1 = doubleSeq1.toList();
        List<Double> actual2 = doubleSeq2.toList();
        // Then
        List<Double> expected = new List<Double>{ 20000.0, 10000.5, 40000.4, 2581.9, null };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectSequence.mapToObject
    */
    @IsTest
    private static void mapToObject() {
        // Given
        Date d = Date.newInstance(1990, 1, 1);
        Date d1 = Date.newInstance(1991, 2, 2);
        Date d2 = Date.newInstance(1992, 3, 3);
        Date d3 = Date.newInstance(1993, 4, 4);
        Contact con = new Contact(LastName = 'Test Con', Birthdate = d);
        Contact con1 = new Contact(LastName = 'Test Con1', Birthdate = d1);
        Contact con2 = new Contact(LastName = 'Test Con2', Birthdate = d2);
        Contact con3 = new Contact(LastName = 'Test Con3', Birthdate = d3);
        Contact con4 = new Contact(LastName = 'Test Con4');
        List<Contact> input = new List<Contact>{ con, con1, con2, con3, con4 };
        List<Contact> clone = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Contact.Birthdate;
        String fieldName = IterTestUtils.CONSTS.BIRTHDATE;
        ISObjectFunction getBirthday = SObjectFunction.get(field);
        IObjectIterable objSeq = SObjectSequence.of(clone).mapToObject(getBirthday);
        IObjectIterable objSeq1 = SObjectSequence.of(clone).mapToObject(fieldName);
        IObjectIterable objSeq2 = SObjectSequence.of(clone).mapToObject(field);
        // When
        List<Date> actual = (List<Date>) objSeq.toList(List<Date>.class);
        List<Date> actual1 = (List<Date>) objSeq1.toList(List<Date>.class);
        List<Date> actual2 = (List<Date>) objSeq2.toList(List<Date>.class);
        // Then
        List<Date> expected = new List<Date>{ d, d1, d2, d3, null };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see SObjectSequence.forEach
     */
    @IsTest
    private static void forEach() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 200);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 200);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc, acc1, acc2, acc3, acc4 };
        List<Account> clone = input.deepClone();
        List<Account> clone1 = input.deepClone();
        List<Account> clone2 = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Account.Name;
        String fieldName = IterTestUtils.CONSTS.NAME;
        String value = 'New Name';
        ISObjectConsumer setNewName = SObjectConsumer.set(fieldName, value);
        ISObjectIterable accSeq = SObjectSequence.of(clone).forEach(setNewName);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone1).forEach(fieldName, value);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone2).forEach(field, value);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = accSeq2.toList();
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Validate.assertEquals(value, actual[i].Name);
            Validate.assertEquals(value, actual1[i].Name);
            Validate.assertEquals(value, actual2[i].Name);
        }
        Validate.assertNotEquals(input, clone, Label.InputNotMutatedErrorMessage);
        Validate.assertNotEquals(input, clone1, Label.InputNotMutatedErrorMessage);
        Validate.assertNotEquals(input, clone2, Label.InputNotMutatedErrorMessage);
    }

    /**
     * @see SObjectSequence.distinct
     */
    @IsTest
    private static void distinct() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 200);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 200);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc, acc1, acc, acc2, acc3, null, acc4, acc2, null };
        List<Account> clone = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectFunction getNumOfEmployees = SObjectFunction.get(field);
        ISObjectIterable accSeq = SObjectSequence.of(clone).distinct();
        ISObjectIterable accSeq1 = SObjectSequence.of(clone).withoutNulls().distinct(getNumOfEmployees);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone).withoutNulls().distinct(fieldName);
        ISObjectIterable accSeq3 = SObjectSequence.of(clone).withoutNulls().distinct(field);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = accSeq2.toList();
        List<Account> actual3 = accSeq3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, null, acc4 };
        List<Account> expected1 = new List<Account>{ acc, acc3, acc4 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see SObjectSequence.sort
     */
    @IsTest
    private static void sort() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Account> clone = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectComparator fieldComparator = SObjectComparator.comparing(field);
        ISObjectIterable accSeq = SObjectSequence.of(clone).sort();
        ISObjectIterable accSeq1 = SObjectSequence.of(clone).sort(SortOrder.ASCENDING);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone).sort(fieldComparator);
        ISObjectIterable accSeq3 = SObjectSequence.of(clone).sort(fieldName);
        ISObjectIterable accSeq4 = SObjectSequence.of(clone).sort(field);
        ISObjectIterable accSeq5 = SObjectSequence.of(clone).sort(fieldName, SortOrder.DESCENDING);
        ISObjectIterable accSeq6 = SObjectSequence.of(clone).sort(field, SortOrder.DESCENDING);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = accSeq2.toList();
        List<Account> actual3 = accSeq3.toList();
        List<Account> actual4 = accSeq4.toList();
        List<Account> actual5 = accSeq5.toList();
        List<Account> actual6 = accSeq6.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc2, acc3, acc4 };
        List<Account> expected1 = new List<Account>{ acc4, acc2, acc2, acc1, acc, acc3 };
        List<Account> expected2 = new List<Account>{ acc3, acc, acc1, acc2, acc2, acc4 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see SObjectSequence.lim
     */
    @IsTest
    private static void lim() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Account> clone = input.deepClone();
        ISObjectIterable accSeq = SObjectSequence.of(clone).lim(25);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone).lim(3);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone).lim(0);
        ISObjectIterable accSeq3 = SObjectStream.of(clone);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = accSeq2.toList();
        Exception exc1;
        try {
            accSeq3.lim(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Account> expected = new List<Account>{ acc1, acc, acc2 };
        List<Account> expected1 = new List<Account>();
        Validate.assertEquals(input, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals('System.IllegalArgumentException', exc1.getTypeName());
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see SObjectSequence.skip
     */
    @IsTest
    private static void skip() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Account> clone = input.deepClone();
        ISObjectIterable accSeq = SObjectSequence.of(clone).skip(5);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone).skip(0);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone).skip(25);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = accSeq2.toList();
        Exception exc1;
        try {
            SObjectSequence.of(clone).skip(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Account> expected = new List<Account>{ acc2 };
        List<Account> expected1 = new List<Account>();
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(input, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals('System.IllegalArgumentException', exc1.getTypeName());
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see SObjectSequence.reduce
     */
    @IsTest
    private static void reduce() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        Account seed = new Account(Name = 'Identity', NumberOfEmployees = 0);
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Account> clone = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        ISObjectComparator fieldComparator = SObjectComparator.comparing(field);
        ISObjectBinaryOperator maxBy = SObjectBinaryOperator.maxBy(fieldComparator);
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone);
        // When
        SObject actual = accSeq.reduce(seed, maxBy);
        SObject actual1 = accSeq1.reduce(maxBy).get();
        // Then
        Validate.assertEquals(acc3, actual);
        Validate.assertEquals(acc3, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectSequence.collect
    */
    @IsTest
    private static void collect() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Account> clone = input.deepClone();
        ISObjectCollector toSetCollector = SObjectCollector.toSet();
        ISupplier sObjectSetSupplier = Supplier.of(Set<SObject>.class);
        IObjectSObjectConsumer biConsumer = SetSObjectConsumer.addToSObjectSet(SObjectUnaryOperator.identity());
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone);
        // When
        Set<SObject> actual = (Set<SObject>) accSeq.collect(toSetCollector);
        Set<SObject> actual1 = (Set<SObject>) accSeq1.collect(sObjectSetSupplier, biConsumer);
        // Then
        Set<SObject> expected = new Set<SObject>{ acc1, acc, acc2, acc3, acc4 };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectSequence.find
    */
    @IsTest
    private static void find() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Account> clone = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        Integer value = 0;
        SObjectPredicate isFieldEqualPredicate = SObjectPredicate.isEqual(field, 0);
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone);
        // When
        Account actual = (Account) accSeq.find(isFieldEqualPredicate).get();
        Account actual1 = (Account) accSeq1.find(field, value).get();
        Account actual2 = (Account) accSeq2.find(fieldName, value).get();
        // Then
        Validate.assertEquals(acc2, actual);
        Validate.assertEquals(acc2, actual1);
        Validate.assertEquals(acc2, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectSequence.every
    */
    @IsTest
    private static void every() {
        // Given
        Contact acc = new Contact(LastName = 'Test Acc', Department = 'Finance', DoNotCall = false);
        Contact acc1 = new Contact(LastName = 'Test Acc1', Department = 'Finance', DoNotCall = false);
        Contact acc2 = new Contact(LastName = 'Test Acc2', Department = 'Finance');
        Contact acc3 = new Contact(LastName = 'Test Acc3', Department = 'Finance', DoNotCall = true);
        Contact acc4 = new Contact(LastName = 'Test Acc4');
        List<Contact> input = new List<Contact>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Contact> clone = input.deepClone();
        String value = 'T';
        Boolean value1 = false;
        String value2 = 'Finance';
        ISObjectPredicate isLastNameStartsWith = SObjectPredicate.compose(SObjectFunction.get(IterTestUtils.CONSTS.Contact.LastName), StringPredicate.startsWith(value));
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone);
        // When
        Boolean isEveryConNameStartsWithT = accSeq.every(isLastNameStartsWith);
        Boolean isEveryConDoNotCall = accSeq1.every(IterTestUtils.CONSTS.Contact.DoNotCall, value1);
        Boolean isEveryConFinanceDepartment = accSeq2.every(IterTestUtils.CONSTS.DEPARTMENT, value2);
        // Then
        Validate.assertEquals(true, isEveryConNameStartsWithT);
        Validate.assertEquals(false, isEveryConDoNotCall);
        Validate.assertEquals(false, isEveryConFinanceDepartment);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectSequence.some
    */
    @IsTest
    private static void some() {
        // Given
        Contact acc = new Contact(LastName = 'Test Acc', Department = 'Finance', DoNotCall = false);
        Contact acc1 = new Contact(LastName = 'Test Acc1', Department = 'Finance', DoNotCall = false);
        Contact acc2 = new Contact(LastName = 'Test Acc2', Department = 'Finance');
        Contact acc3 = new Contact(LastName = 'Test Acc3', Department = 'Finance', DoNotCall = true);
        Contact acc4 = new Contact(LastName = 'Test Acc4');
        List<Contact> input = new List<Contact>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Contact> clone = input.deepClone();
        String value = 'A';
        Boolean value1 = true;
        String value2 = 'HR';
        ISObjectPredicate isLastNameStartsWith = SObjectPredicate.compose(SObjectFunction.get(IterTestUtils.CONSTS.Contact.LastName), StringPredicate.startsWith(value));
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone);
        // When
        Boolean isSomeConNameStartsWithA = accSeq.some(isLastNameStartsWith);
        Boolean isSomeConDoNotCall = accSeq1.some(IterTestUtils.CONSTS.Contact.DoNotCall, value1);
        Boolean isSomeConHR = accSeq2.some(IterTestUtils.CONSTS.DEPARTMENT, value2);
        // Then
        Validate.assertEquals(false, isSomeConNameStartsWithA);
        Validate.assertEquals(true, isSomeConDoNotCall);
        Validate.assertEquals(false, isSomeConHR);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectIterable.max
    */
    @IsTest
    private static void max() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Account> clone = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectComparator fieldComparator = SObjectComparator.comparing(field);
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone);
        // When
        Account actual = (Account) accSeq.max(fieldComparator).get();
        Account actual1 = (Account) accSeq1.max(fieldName).get();
        Account actual2 = (Account) accSeq2.max(field).get();
        // Then
        Validate.assertEquals(acc3, actual);
        Validate.assertEquals(acc3, actual1);
        Validate.assertEquals(acc3, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectIterable.min
    */
    @IsTest
    private static void min() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Account> clone = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectComparator fieldComparator = SObjectComparator.comparing(field);
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone);
        // When
        Account actual = (Account) accSeq.min(fieldComparator).get();
        Account actual1 = (Account) accSeq1.min(fieldName).get();
        Account actual2 = (Account) accSeq2.min(field).get();
        // Then
        Validate.assertEquals(acc4, actual);
        Validate.assertEquals(acc4, actual1);
        Validate.assertEquals(acc4, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectIterable.sum
    */
    @IsTest
    private static void sum() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Account> clone = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectToDoubleFunction getAsDouble = SObjectToDoubleFunction.get(fieldName);
        ISObjectPredicate hasFieldValue = SObjectPredicate.has(field);
        ISObjectIterable accSeq = SObjectSequence.of(clone).filter(hasFieldValue);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone).filter(hasFieldValue);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone).filter(hasFieldValue);
        // When
        Double actual = (Double) accSeq.sum(getAsDouble);
        Double actual1 = (Double) accSeq1.sum(fieldName);
        Double actual2 = (Double) accSeq2.sum(field);
        // Then
        Integer expected = 700;
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectIterable.avg
    */
    @IsTest
    private static void avg() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Account> clone = input.deepClone();
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectToDoubleFunction getAsDouble = SObjectToDoubleFunction.get(fieldName);
        ISObjectPredicate hasFieldValue = SObjectPredicate.has(field);
        ISObjectIterable accSeq = SObjectSequence.of(clone).filter(hasFieldValue);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone).filter(hasFieldValue);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone).filter(hasFieldValue);
        // When
        Double actual = (Double) accSeq.avg(getAsDouble).get();
        Double actual1 = (Double) accSeq1.avg(fieldName).get();
        Double actual2 = (Double) accSeq2.avg(field).get();
        // Then
        Double expected = 700 / 5;
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectSequence.count
    */
    @IsTest
    private static void count() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, null, acc3, acc4, acc2, null };
        List<Account> clone = input.deepClone();
        ISObjectIterable accSeq = SObjectSequence.of(input);
        ISObjectIterable accSeq1 = SObjectSequence.of(new List<SObject>());
        ISObjectIterable accSeq2 = SObjectSequence.empty();
        // When
        Integer actual = accSeq.count();
        Integer actual1 = accSeq1.count();
        Integer actual2 = accSeq2.count();
        // Then
        Validate.assertEquals(input.size(), actual);
        Validate.assertEquals(0, actual1);
        Validate.assertEquals(0, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectSequence.isEmpty
    */
    @IsTest
    private static void isEmpty() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, null, acc3, acc4, acc2, null };
        List<Account> clone = input.deepClone();
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(new List<SObject>());
        ISObjectIterable accSeq2 = SObjectSequence.empty();
        // When
        Boolean actual = accSeq.isEmpty();
        Boolean actual1 = accSeq1.isEmpty();
        Boolean actual2 = accSeq2.isEmpty();
        // Then
        Validate.assertEquals(input.isEmpty(), actual);
        Validate.assert(actual1);
        Validate.assert(actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
    * @see SObjectSequence.toList
    */
    @IsTest
    private static void toList() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, null, acc3, acc4, acc2, null };
        List<Account> clone = input.deepClone();
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone).withoutNulls();
        ISObjectIterable accSeq2 = SObjectSequence.of(clone).withoutNulls();
        ISObjectIterable accSeq3 = SObjectSequence.of(clone).withoutNulls();
        // When
        List<Account> actual = accSeq.toList();
        List<Integer> actual1 = (List<Integer>) accSeq1.toList(SObjectFunction.get('NumberOfEmployees'), List<Integer>.class);
        List<Integer> actual2 = (List<Integer>) accSeq2.toList('NumberOfEmployees', List<Integer>.class);
        List<Integer> actual3 = (List<Integer>) accSeq3.toList(Account.NumberOfEmployees, List<Integer>.class);
        // Then
        List<Integer> expected = (List<Integer>) SObjectSequence.of(clone)
                .withoutNulls()
                .collect(SObjectCollector.toList(Account.NumberOfEmployees).cast(List<Integer>.class));
        Validate.assertEquals(input, actual);
        Validate.assertEquals(expected, actual1);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see SObjectSequence.toSet
     * @see SObjectSequence.toIdSet
     * @see SObjectSequence.toStringSet
     */
    @IsTest
    private static void toSet() {
        // Given
        ISupplier idGenerator = IdSupplier.of(Account.SObjectType);
        Account acc = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, null, acc3, acc4, acc2, null };
        List<Account> clone = input.deepClone(true);
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone).withoutNulls();
        ISObjectIterable accSeq2 = SObjectSequence.of(clone).withoutNulls();
        ISObjectIterable accSeq3 = SObjectSequence.of(clone).withoutNulls();
        ISObjectIterable accSeq4 = SObjectSequence.of(clone).withoutNulls();
        ISObjectIterable accSeq5 = SObjectSequence.of(clone).withoutNulls();
        ISObjectIterable accSeq6 = SObjectSequence.of(clone).withoutNulls();
        ISObjectIterable accSeq7 = SObjectSequence.of(clone).withoutNulls();
        // When
        Set<SObject> actual = accSeq.toSet();
        Set<Id> actual1 = accSeq1.toIdSet();
        Set<Id> actual2 = accSeq2.toIdSet(SObjectFunction.get('Id'));
        Set<Id> actual3 = accSeq3.toIdSet('Id');
        Set<Id> actual4 = accSeq4.toIdSet(Account.Id);
        Set<String> actual5 = accSeq5.toStringSet(SObjectFunction.get('Name'));
        Set<String> actual6 = accSeq6.toStringSet('Name');
        Set<String> actual7 = accSeq7.toStringSet(Account.Name);
        // Then
        Set<SObject> expected = new Set<SObject>{ acc1, acc, acc2, null, acc3, acc4 };
        Set<Id> expected1 = (Set<Id>) SObjectSequence.of(clone)
                .withoutNulls()
                .collect(SObjectCollector.toIdSet(Account.Id));
        Set<String> expected2 = (Set<String>) SObjectSequence.of(clone)
                .withoutNulls()
                .collect(SObjectCollector.toStringSet(Account.Name));
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
        Validate.assertEquals(expected2, actual7);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see SObjectSequence.toMap
     * @see SObjectSequence.toByIdMap
     * @see SObjectSequence.toByStringMap
     */
    @IsTest
    private static void toMap() {
        // Given
        ISupplier idGenerator = IdSupplier.of(Account.SObjectType);
        Account acc = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4 };
        List<Account> clone = input.deepClone(true);
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone);
        ISObjectIterable accSeq3 = SObjectSequence.of(clone);
        ISObjectIterable accSeq4 = SObjectSequence.of(clone);
        ISObjectIterable accSeq5 = SObjectSequence.of(clone);
        ISObjectIterable accSeq6 = SObjectSequence.of(clone);
        // When
        Map<Id, SObject> actual = accSeq.toMap();
        Map<Id, Account> actual1 = (Map<Id, Account>) accSeq1.toByIdMap(SObjectFunction.get('Id'), Map<Id, Account>.class);
        Map<Id, Account> actual2 = (Map<Id, Account>) accSeq2.toByIdMap('Id', Map<Id, Account>.class);
        Map<Id, Account> actual3 = (Map<Id, Account>) accSeq3.toByIdMap(Account.Id, Map<Id, Account>.class);
        Map<String, Account> actual4 = (Map<String, Account>) accSeq4.toByStringMap(SObjectFunction.get('Name'), Map<String, Account>.class);
        Map<String, Account> actual5 = (Map<String, Account>) accSeq5.toByStringMap('Name', Map<String, Account>.class);
        Map<String, Account> actual6 = (Map<String, Account>) accSeq6.toByStringMap(Account.Name, Map<String, Account>.class);
        // Then
        Map<Id, Account> expected = new Map<Id, Account>(input);
        Map<Id, Account> expected1 = (Map<Id, Account>) SObjectSequence.of(clone)
                .collect(SObjectCollector.toByIdMap(Account.Id).cast(Map<Id, Account>.class));
        Map<String, Account> expected2 = (Map<String, Account>) SObjectSequence.of(clone)
                .collect(SObjectCollector.toByStringMap(Account.Name).cast(Map<String, Account>.class));
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals(expected1, actual3);
        Validate.assertEquals(expected2, actual4);
        Validate.assertEquals(expected2, actual5);
        Validate.assertEquals(expected2, actual6);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see SObjectSequence.groupById
     * @see SObjectSequence.groupByString
     */
    @IsTest
    private static void group() {
        // Given
        ISupplier idGenerator = IdSupplier.of(Account.SObjectType);
        Id parentId1 = (Id) idGenerator.get();
        Id parentId2 = (Id) idGenerator.get();
        Account acc = new Account(ParentId = parentId1, Name = 'Test Acc', NumberOfEmployees = 200, Rating = 'Hot');
        Account acc1 = new Account(ParentId = parentId2, Name = 'Test Acc1', NumberOfEmployees = 100, Rating = 'Warm');
        Account acc2 = new Account(ParentId = parentId1, Name = 'Test Acc2', NumberOfEmployees = 0, Rating = 'Warm');
        Account acc3 = new Account(ParentId = parentId2, Name = 'Test Acc3', NumberOfEmployees = 400, Rating = 'Hot');
        Account acc4 = new Account(ParentId = parentId1, Name = 'Test Acc4', Rating = 'Warm');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4 };
        List<Account> clone = input.deepClone(true);
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone);
        ISObjectIterable accSeq3 = SObjectSequence.of(clone);
        ISObjectIterable accSeq4 = SObjectSequence.of(clone);
        ISObjectIterable accSeq5 = SObjectSequence.of(clone);
        // When
        Map<Id, List<Account>> actual = accSeq.groupById(SObjectFunction.get('ParentId'));
        Map<Id, List<Account>> actual2 = accSeq1.groupById('ParentId');
        Map<Id, List<Account>> actual3 = accSeq2.groupById(Account.ParentId);
        Map<String, List<Account>> actual4 = accSeq3.groupByString(SObjectFunction.get('Rating'));
        Map<String, List<Account>> actual5 = accSeq4.groupByString('Rating');
        Map<String, List<Account>> actual6 = accSeq5.groupByString(Account.Rating);
        // Then
        Map<Id, List<Account>> expected = (Map<Id, List<Account>>) SObjectStream.of(clone)
                .collect(SObjectCollector.groupingById(Account.ParentId).cast(Map<Id, List<Account>>.class));
        Map<String, List<Account>> expected1 = (Map<String, List<Account>>) SObjectStream.of(clone)
                .collect(SObjectCollector.groupingByString(Account.Rating).cast(Map<String, List<Account>>.class));
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected, actual2);
        Validate.assertEquals(expected, actual3);
        Validate.assertEquals(expected1, actual4);
        Validate.assertEquals(expected1, actual5);
        Validate.assertEquals(expected1, actual6);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

    /**
     * @see SObjectSequence.partition
     */
    @IsTest
    private static void partition() {
        // Given
        ISupplier idGenerator = IdSupplier.of(Account.SObjectType);
        Account acc = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4 };
        List<Account> clone = input.deepClone(true);
        ISObjectPredicate predicate = SObjectPredicate.isGreater(Account.NumberOfEmployees, 150);
        ISObjectIterable accSeq = SObjectSequence.of(clone);
        ISObjectIterable accSeq1 = SObjectSequence.of(clone);
        ISObjectIterable accSeq2 = SObjectSequence.of(clone);
        // When
        Map<Boolean, List<Account>> actual = accSeq.partition(predicate);
        Map<Boolean, List<Account>> actual1 = accSeq1.partition('NumberOfEmployees', 100);
        Map<Boolean, List<Account>> actual2 = accSeq2.partition(Account.NumberOfEmployees, 100);
        // Then
        Map<Boolean, List<Account>> expected = (Map<Boolean, List<Account>>) SObjectSequence.of(clone)
                .collect(SObjectCollector.partitioningBy(predicate).cast(Map<Boolean, List<Account>>.class));
        Map<Boolean, List<Account>> expected1 = new Map<Boolean, List<Account>>{
                true => new List<Account>{ acc1 },
                false => new List<Account>{ acc, acc2, acc3, acc4 }
        };
        Validate.assertEquals(expected, actual);
        Validate.assertEquals(expected1, actual1);
        Validate.assertEquals(expected1, actual2);
        Validate.assertEquals(input, clone, Label.InputMutatedErrorMessage);
    }

}
