/**
 * @see SObjectSequence
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings(
    'PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage, PMD.CognitiveComplexity, PMD.CyclomaticComplexity, PMD.NcssTypeCount'
)
private class SObjectSequenceTest {

    /**
     * @see SObjectSequence.of
     * @see SObjectSequence.ofNullable
     * @see SObjectSequence.empty
     * @see SObjectSequence.iterator
     */
    @IsTest
    static void of() {
        // Given
        List<Account> accounts = AsTestData.generateAccounts1();
        accounts.add(0, null);
        accounts.add(null);
        List<SObject> input = accounts.deepClone();
        List<Contact> input1;
        Set<SObject> input2;
        SObjectEnumerable accSeq = SObjectSequence.of(input);
        ISObjectEnumerable accSeq1 = SObjectSequence.of(new Set<SObject>(input));
        SObjectEnumerable accSeq2 = SObjectSequence.ofNullable(input);
        SObjectEnumerable accSeq3 = SObjectSequence.ofNullable(new Set<SObject>(input));
        ISObjectEnumerable accSeq4 = SObjectSequence.ofNullable(input1);
        ISObjectEnumerable accSeq5 = SObjectSequence.ofNullable(input2);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = (List<Account>) accSeq1.toList();
        List<Account> actual2 = accSeq2.toList();
        List<Account> actual3 = accSeq3.toList();
        List<Account> actual4 = (List<Account>) accSeq4.toList();
        List<Account> actual5 = (List<Account>) accSeq5.toList();
        // Then
        List<Account> expected = new List<SObject>(new Set<SObject>(input));
        List<Account> expected1 = new List<SObject>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(true, accSeq.iterator().hasNext());
        Assert.areEqual(true, accSeq1.iterator().hasNext());
        Assert.areEqual(true, accSeq2.iterator().hasNext());
        Assert.areEqual(true, accSeq3.iterator().hasNext());
        Assert.areEqual(false, accSeq4.iterator().hasNext());
        Assert.areEqual(false, accSeq5.iterator().hasNext());
        Assert.areEqual(accounts, input, Label.AS_ErrorMessage_InputMutated);
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
        SObjectEnumerable accSeq = SObjectSequence.of(input);
        SObjectEnumerable accSeq1 = SObjectSequence.of(input1);
        ISObjectEnumerable accSeq2 = SObjectSequence.of(input2);
        // When
        List<Account> actual = SObjectSequence.concat(accSeq, accSeq1).toList();
        List<Account> actual1 = SObjectSequence.concat(new List<ISObjectEnumerable>{ accSeq, accSeq1, accSeq2 }).toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5 };
        List<Account> expected1 = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5, acc6 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
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
        IBiOperator maxNumber = BiOperator.maxBy(Comparer.comparing(BaseSObjectFunctions.get(AsTestConsts.NUMBER_OF_EMPLOYEES)));
        ISObjectEnumerable oldAccsSteam = SObjectSequence.of(oldList);
        ISObjectEnumerable newAccsSteam = SObjectSequence.of(newList);
        IBiPredicate numOfEmployeesIsChanged = new AsTestCommons.ComparisonBiPredicate(BaseSObjectFunctions.get(AsTestConsts.NUMBER_OF_EMPLOYEES), BaseSObjectFunctions.get(AsTestConsts.NUMBER_OF_EMPLOYEES), 0).negate();
        IBiOperator getNewAcc = BiOperator.right();
        SObjectEnumerable accSeq = SObjectSequence.zip(oldAccsSteam, newAccsSteam, maxNumber);
        ISObjectEnumerable accSeq1 = SObjectSequence.zip(oldAccsSteam, newAccsSteam, numOfEmployeesIsChanged, getNewAcc);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = (List<Account>) accSeq1.toList();
        // Then
        List<Account> expected = new List<Account>{ oldAcc, oldAcc1, newAcc2, oldAcc3 };
        List<Account> expected1 = new List<Account>{ newAcc1, newAcc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
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
        SObjectEnumerable accSeq = SObjectSequence.of(input);
        ISObjectEnumerable accSeq1 = SObjectSequence.of(input1);
        SObjectEnumerable accSeq2 = accSeq.append(accSeq1);
        ISObjectEnumerable accSeq3 = accSeq.prepend(accSeq1);
        // When
        List<Account> actual = accSeq2.toList();
        List<Account> actual1 = (List<Account>) accSeq3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5 };
        List<Account> expected1 = new List<Account>{ acc3, acc4, acc5, acc, acc1, acc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
    }

    /**
     * @see SObjectEnumerable.union
     */
    @IsTest
    private static void union() {
        // Given
        Account acc = new Account(Name = 'Test Acc');
        Account acc1 = new Account(Name = 'Test Acc1');
        Account acc2 = new Account(Name = 'Test Acc2');
        Account acc3 = new Account(Name = 'Test Acc3');
        Account acc4 = new Account(Name = 'Test Acc4');
        Account acc5 = new Account(Name = 'Test Acc5');
        Account acc6 = new Account(Name = 'Test Acc6');
        Account acc7 = new Account(Name = 'Test Acc7');
        Account acc8 = new Account(Name = 'Test Acc8');
        Account acc9 = new Account(Name = 'Test Acc9');
        List<Account> input = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
        List<Account> input1 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc, acc2 };
        IFunction getName = BaseSObjectFunctions.get(AsTestConsts.NAME);
        String fieldName = AsTestConsts.NAME;
        SObjectField field = AsTestConsts.Account.Name;
        SObjectEnumerable seq = SObjectSequence.of(input).union((Iterable<SObject>) input1);
        SObjectEnumerable seq1 = SObjectSequence.of(input).union(SObjectSequence.of(input1));
        SObjectEnumerable seq2 = SObjectSequence.of(input).union((Iterable<Account>) input1, getName);
        ISObjectEnumerable seq3 = SObjectSequence.of(input).union((Iterable<Account>) input1, fieldName);
        ISObjectEnumerable seq4 = SObjectSequence.of(input).union((Iterable<SObject>) input1, field);
        // When
        List<Account> actual = seq.toList();
        List<Account> actual1 = seq1.toList();
        List<Account> actual2 = seq2.toList();
        List<Account> actual3 = (List<Account>) seq3.toList();
        List<Account> actual4 = (List<Account>) seq4.toList();
        // Then
        List<Account> expected = new List<Account>{ acc5, acc3, acc9, acc7, acc8, acc6, acc4, acc1, acc, acc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
    }

    /**
     * @see SObjectEnumerable.intersect
     */
    @IsTest
    private static void intersect() {
        // Given
        Account acc = new Account(Name = 'Test Acc');
        Account acc1 = new Account(Name = 'Test Acc1');
        Account acc2 = new Account(Name = 'Test Acc2');
        Account acc3 = new Account(Name = 'Test Acc3');
        Account acc4 = new Account(Name = 'Test Acc4');
        Account acc5 = new Account(Name = 'Test Acc5');
        Account acc6 = new Account(Name = 'Test Acc6');
        Account acc7 = new Account(Name = 'Test Acc7');
        Account acc8 = new Account(Name = 'Test Acc8');
        Account acc9 = new Account(Name = 'Test Acc9');
        List<Account> input = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
        List<Account> input1 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc, acc2 };
        IFunction getName = BaseSObjectFunctions.get(AsTestConsts.NAME);
        String fieldName = AsTestConsts.NAME;
        SObjectField field = AsTestConsts.Account.Name;
        SObjectEnumerable seq = SObjectSequence.of(input).intersect((Iterable<Object>) input1);
        SObjectEnumerable seq1 = SObjectSequence.of(input).intersect(SObjectSequence.of(input1));
        SObjectEnumerable seq2 = SObjectSequence.of(input).intersect((Iterable<Account>) input1, getName);
        ISObjectEnumerable seq3 = SObjectSequence.of(input).intersect((Iterable<Account>) input1, fieldName);
        ISObjectEnumerable seq4 = SObjectSequence.of(input).intersect((Iterable<SObject>) input1, field);
        // When
        List<Account> actual = seq.toList();
        List<Account> actual1 = seq1.toList();
        List<Account> actual2 = seq2.toList();
        List<Account> actual3 = (List<Account>) seq3.toList();
        List<Account> actual4 = (List<Account>) seq4.toList();
        // Then
        List<Account> expected = new List<Account>{ acc3, acc9 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
    }

    /**
     * @see SObjectEnumerable.except
     */
    @IsTest
    private static void except() {
        // Given
        Account acc = new Account(Name = 'Test Acc');
        Account acc1 = new Account(Name = 'Test Acc1');
        Account acc2 = new Account(Name = 'Test Acc2');
        Account acc3 = new Account(Name = 'Test Acc3');
        Account acc4 = new Account(Name = 'Test Acc4');
        Account acc5 = new Account(Name = 'Test Acc5');
        Account acc6 = new Account(Name = 'Test Acc6');
        Account acc7 = new Account(Name = 'Test Acc7');
        Account acc8 = new Account(Name = 'Test Acc8');
        Account acc9 = new Account(Name = 'Test Acc9');
        List<Account> input = new List<Account>{ acc5, acc3, acc9, acc7, acc5, acc9, acc3, acc7 };
        List<Account> input1 = new List<Account>{ acc8, acc3, acc6, acc4, acc4, acc9, acc1, acc, acc2 };
        IFunction getName = BaseSObjectFunctions.get(AsTestConsts.NAME);
        String fieldName = AsTestConsts.NAME;
        SObjectField field = AsTestConsts.Account.Name;
        SObjectEnumerable seq = SObjectSequence.of(input).except((Iterable<Object>) input1);
        SObjectEnumerable seq1 = SObjectSequence.of(input).except(SObjectSequence.of(input1));
        SObjectEnumerable seq2 = SObjectSequence.of(input).except((Iterable<Account>) input1, getName);
        ISObjectEnumerable seq3 = SObjectSequence.of(input).except((Iterable<Account>) input1, fieldName);
        ISObjectEnumerable seq4 = SObjectSequence.of(input).except((Iterable<SObject>) input1, field);
        // When
        List<Account> actual = seq.toList();
        List<Account> actual1 = seq1.toList();
        List<Account> actual2 = seq2.toList();
        List<Account> actual3 = (List<Account>) seq3.toList();
        List<Account> actual4 = (List<Account>) seq4.toList();
        // Then
        List<Account> expected = new List<Account>{ acc5, acc7 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
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
        String fieldName = AsTestConsts.NUMBER_OF_EMPLOYEES;
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        Integer value = 200;
        IPredicate isFieldEqual = BaseSObjectPredicates.isEqual(fieldName, value);
        IPredicate isFieldEqual1 = BaseSObjectPredicates.isEqual(field, value);
        SObjectEnumerable accSeq = SObjectSequence.of(input).filter(fieldName, value);
        SObjectEnumerable accSeq1 = SObjectSequence.of(input).filter(field, value);
        ISObjectEnumerable accSeq2 = SObjectSequence.of(input).filter(isFieldEqual);
        ISObjectEnumerable accSeq3 = SObjectSequence.of(input).filter(isFieldEqual1);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = (List<Account>) accSeq2.toList();
        List<Account> actual3 = (List<Account>) accSeq3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc1, acc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
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
        String fieldName = AsTestConsts.NUMBER_OF_EMPLOYEES;
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        Integer value = 200;
        IPredicate isFieldEqual = BaseSObjectPredicates.isEqual(fieldName, value);
        IPredicate isFieldEqual1 = BaseSObjectPredicates.isEqual(field, value);
        SObjectEnumerable accSeq = SObjectSequence.of(input).take(fieldName, value);
        SObjectEnumerable accSeq1 = SObjectSequence.of(input).take(field, value);
        ISObjectEnumerable accSeq2 = SObjectSequence.of(input).take(isFieldEqual);
        ISObjectEnumerable accSeq3 = SObjectSequence.of(input).take(isFieldEqual1);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = (List<Account>) accSeq2.toList();
        List<Account> actual3 = (List<Account>) accSeq3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
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
        String fieldName = AsTestConsts.NUMBER_OF_EMPLOYEES;
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        Integer value = 200;
        IPredicate isFieldEqual = BaseSObjectPredicates.isEqual(fieldName, value);
        IPredicate isFieldEqual1 = BaseSObjectPredicates.isEqual(field, value);
        SObjectEnumerable accSeq = SObjectSequence.of(input).drop(fieldName, value);
        SObjectEnumerable accSeq1 = SObjectSequence.of(input).drop(field, value);
        ISObjectEnumerable accSeq2 = SObjectSequence.of(input).drop(isFieldEqual);
        ISObjectEnumerable accSeq3 = SObjectSequence.of(input).drop(isFieldEqual1);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = (List<Account>) accSeq2.toList();
        List<Account> actual3 = (List<Account>) accSeq3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc3, acc4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
    }

    /**
     * @see SObjectEnumerable.withoutNulls
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectEnumerable seq = SObjectSequence.of(clone).withoutNulls();
        ISObjectEnumerable seq1 = SObjectSequence.of(clone).withoutNulls();
        // When
        List<Account> actual = seq.toList();
        List<Account> actual1 = (List<Account>) seq1.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc1 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectSequence.mapTo
     */
    @IsTest
    private static void mapTo() {
        // Given
        Account acc = new Account(Id = AsTestData.generateId(Account.SObjectType), Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Id = AsTestData.generateId(Account.SObjectType), Name = 'Test Acc1', NumberOfEmployees = 200);
        Account acc2 = new Account(Id = AsTestData.generateId(Account.SObjectType), Name = 'Test Acc2', NumberOfEmployees = 200);
        Account acc3 = new Account(Id = AsTestData.generateId(Account.SObjectType), Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Id = AsTestData.generateId(Account.SObjectType), Name = 'Test Acc4');
        Account acc5 = new Account(Id = AsTestData.generateId(Account.SObjectType), Name = 'Parent Acc4');
        acc.putSObject('Parent', acc5);
        acc1.putSObject('Parent', acc5);
        acc2.putSObject('Parent', acc5);
        acc3.putSObject('Parent', acc5);
        acc4.putSObject('Parent', acc5);
        List<Account> input = new List<Account>{ acc, acc1, acc2, acc3, acc4 };
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Contact.Description;
        String fieldName1 = AsTestConsts.PARENT;
        SObjectField field1 = AsTestConsts.Account.ParentId;
        String value = 'Value';
        IFunction getConstFunction = Function.constant(value);
        IFunction getIdByRightFunction = BaseSObjectFunctions.get(AsTestConsts.ID);
        IFunction getAccountIdByRightFunction = BaseSObjectFunctions.get(Account.Id);
        IFunction getAccNameByRightFunction = BaseSObjectFunctions.get(AsTestConsts.Account.Name);
        BiConsumer setIdByFunctionBiConsumer = new AsTestCommons.SetBiConsumer(AsTestConsts.ACCOUNT_ID, getIdByRightFunction);
        BiConsumer setDescriptionByFunctionBiConsumer = new AsTestCommons.SetBiConsumer(field, getAccNameByRightFunction);
        IBiConsumer biCons = setIdByFunctionBiConsumer.andThen(setDescriptionByFunctionBiConsumer);
        IBiOperator biOp = BiOperator.combine(biCons);
        Operator createNewContactOperator = Operator.combine(Operator.compose(new AsTestCommons.SObjectSupplier(Contact.SObjectType)), biOp);
        Operator setDepartmentByConstFunction = Operator.compose(BaseSObjectConsumers.set(AsTestConsts.Contact.Department, getConstFunction));
        IOperator op = createNewContactOperator.andThen(setDepartmentByConstFunction);
        IOperator createNewContactFromAccount = Operator.combine(
            Operator.compose(new AsTestCommons.SObjectSupplier(Contact.SObjectType)),
            BiOperator.combine(new AsTestCommons.SetBiConsumer(AsTestConsts.ACCOUNT_ID, getAccountIdByRightFunction))
        );

        SObjectEnumerable conSeq = SObjectSequence.of(clone).mapTo(createNewContactFromAccount);
        SObjectEnumerable conSeq1 = SObjectSequence.of(clone).mapTo(field1);
        ISObjectEnumerable conSeq2 = SObjectSequence.of(clone).mapTo(fieldName1);
        ISObjectEnumerable conSeq3 = SObjectSequence.of(clone).mapTo(op);
        // When
        List<Contact> actual = conSeq.toList();
        List<Account> actual1 = conSeq1.toList();
        List<Account> actual2 = (List<Account>) conSeq2.toList();
        List<Contact> actual3 = (List<Contact>) conSeq3.toList();
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Assert.areEqual(input[i].Id, actual[i].AccountId);
            Assert.areEqual(acc5, actual1[i]);
            Assert.areEqual(acc5, actual2[i]);
            Assert.areEqual(input[i].Id, actual3[i].AccountId);
            Assert.areEqual(input[i].Name, actual3[i].Description);
            Assert.areEqual(value, actual3[i].Department);
        }
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        String fieldName = AsTestConsts.NUMBER_OF_EMPLOYEES;
        IFunction getNumOfEmployeesAsInt = BaseSObjectFunctions.get(field);
        IntEnumerable intSeq = SObjectSequence.of(clone).mapToInt(getNumOfEmployeesAsInt);
        IntEnumerable intSeq1 = SObjectSequence.of(clone).mapToInt(fieldName);
        IIntEnumerable intSeq2 = SObjectSequence.of(clone).mapToInt(field);
        // When
        List<Integer> actual = intSeq.toList();
        List<Integer> actual1 = intSeq1.toList();
        List<Integer> actual2 = (List<Integer>) intSeq2.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 200, 200, 200, 400, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        String fieldName = AsTestConsts.NUMBER_OF_EMPLOYEES;
        IFunction getNumOfEmployeesAsLong = BaseSObjectFunctions.get(field);
        LongEnumerable longSeq = SObjectSequence.of(clone).mapToLong(getNumOfEmployeesAsLong);
        LongEnumerable longSeq1 = SObjectSequence.of(clone).mapToLong(fieldName);
        ILongEnumerable longSeq2 = SObjectSequence.of(clone).mapToLong(field);
        // When
        List<Long> actual = longSeq.toList();
        List<Long> actual1 = longSeq1.toList();
        List<Long> actual2 = (List<Long>) longSeq2.toList();
        // Then
        List<Long> expected = new List<Long>{ 200L, 200L, 200L, 400L, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Account.AnnualRevenue;
        String fieldName = AsTestConsts.ANNUAL_REVENUE;
        IFunction getNumOfEmployeesAsDouble = BaseSObjectFunctions.get(field);
        DoubleEnumerable doubleSeq = SObjectSequence.of(clone).mapToDouble(getNumOfEmployeesAsDouble);
        DoubleEnumerable doubleSeq1 = SObjectSequence.of(clone).mapToDouble(fieldName);
        IDoubleEnumerable doubleSeq2 = SObjectSequence.of(clone).mapToDouble(field);
        // When
        List<Double> actual = doubleSeq.toList();
        List<Double> actual1 = doubleSeq1.toList();
        List<Double> actual2 = (List<Double>) doubleSeq2.toList();
        // Then
        List<Double> expected = new List<Double>{ 20000.0, 10000.5, 40000.4, 2581.9, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Contact> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Contact.Birthdate;
        String fieldName = AsTestConsts.BIRTHDATE;
        IFunction getBirthday = BaseSObjectFunctions.get(field);
        IObjectEnumerable objSeq = SObjectSequence.of(clone).mapToObject(getBirthday);
        IObjectEnumerable objSeq1 = SObjectSequence.of(clone).mapToObject(fieldName);
        ObjectEnumerable objSeq2 = SObjectSequence.of(clone).mapToObject(field);
        // When
        List<Date> actual = (List<Date>) objSeq.toList(Date.class);
        List<Date> actual1 = (List<Date>) objSeq1.toList(Date.class);
        List<Date> actual2 = (List<Date>) objSeq2.toList(Date.class);
        // Then
        List<Date> expected = new List<Date>{ d, d1, d2, d3, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectSequence.flatMapTo
     */
    @IsTest
    private static void flatMapTo() {
        // Given
        List<Account> input = AsTestData.generateAccounts();
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Contact.AccountId;
        String fieldName = AsTestConsts.CONTACTS;
        IFunction getContacts = BaseSObjectFunctions.getSObjects(field);
        SObjectEnumerable conSeq = SObjectSequence.of(clone).flatMapTo(getContacts);
        SObjectEnumerable conSeq1 = SObjectSequence.of(clone).flatMapTo(fieldName);
        ISObjectEnumerable conSeq2 = SObjectSequence.of(clone).flatMapTo(field);
        // When
        List<Contact> actual = conSeq.toList();
        List<Contact> actual1 = conSeq1.toList();
        List<Contact> actual2 = (List<Contact>) conSeq2.toList();
        // Then
        List<SObject> expected = new List<SObject>();
        for (Account acc : input) {
            List<SObject> children = acc.getSObjects(fieldName);
            if (children != null) {
                expected.addAll(children);
            }
        }
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectSequence.flatMapToInt
     */
    @IsTest
    private static void flatMapToInt() {
        // Given
        List<Account> input = AsTestData.generateAccounts();
        List<Account> clone = AsTestCommons.deepClone(input);
        String relationshipFieldName = AsTestConsts.CONTACTS;
        String fieldName = AsTestConsts.LAST_NAME;
        IFunction getFieldsLength = new AsTestCommons.GetFieldsLength(relationshipFieldName, fieldName);
        IntEnumerable intSeq = SObjectSequence.of(clone).flatMapToInt(getFieldsLength);
        IIntEnumerable intSeq1 = SObjectSequence.of(clone).flatMapToInt(getFieldsLength);
        // When
        List<Integer> actual = intSeq.toList();
        List<Integer> actual1 = (List<Integer>) intSeq1.toList();
        // Then
        List<Integer> expected = new List<Integer>();
        for (Account acc : input) {
            List<SObject> children = acc.getSObjects(relationshipFieldName);
            if (children != null) {
                List<Integer> result = new List<Integer>();
                for (SObject child : children) {
                    result.add(((String) child.get(fieldName)).length());
                }
                expected.addAll(result);
            }
        }
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectSequence.flatMapToLong
     */
    @IsTest
    private static void flatMapToLong() {
        // Given
        List<Account> input = AsTestData.generateAccounts();
        List<Account> clone = AsTestCommons.deepClone(input);
        String relationshipFieldName = AsTestConsts.CONTACTS;
        String fieldName = AsTestConsts.LAST_NAME;
        IFunction getFieldsLength = new AsTestCommons.GetFieldsLength(relationshipFieldName, fieldName);
        LongEnumerable longSeq = SObjectSequence.of(clone).flatMapToLong(getFieldsLength);
        ILongEnumerable longSeq1 = SObjectSequence.of(clone).flatMapToLong(getFieldsLength);
        // When
        List<Long> actual = longSeq.toList();
        List<Long> actual1 = (List<Long>) longSeq1.toList();
        // Then
        List<Long> expected = new List<Integer>();
        for (Account acc : input) {
            List<SObject> children = acc.getSObjects(relationshipFieldName);
            if (children != null) {
                List<Long> result = new List<Integer>();
                for (SObject child : children) {
                    result.add(((String) child.get(fieldName)).length());
                }
                expected.addAll(result);
            }
        }
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectSequence.flatMapToDouble
     */
    @IsTest
    private static void flatMapToDouble() {
        // Given
        List<Account> input = AsTestData.generateAccounts();
        List<Account> clone = AsTestCommons.deepClone(input);
        String fieldName1 = AsTestConsts.BILLING_LATITUDE;
        String fieldName2 = AsTestConsts.BILLING_LONGITUDE;
        IFunction getCoordinates = new AsTestCommons.GetDoublePair(fieldName1, fieldName2);
        DoubleEnumerable doubleSeq = SObjectSequence.of(clone).flatMapToDouble(getCoordinates);
        IDoubleEnumerable doubleSeq1 = SObjectSequence.of(clone).flatMapToDouble(getCoordinates);
        // When
        List<Double> actual = doubleSeq.toList();
        List<Double> actual1 = (List<Double>) doubleSeq1.toList();
        // Then
        List<Double> expected = new List<Double>();
        for (Account acc : input) {
            Double value1 = (Double) acc.get(fieldName1);
            Double value2 = (Double) acc.get(fieldName2);
            expected.add(value1);
            expected.add(value2);
        }
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectSequence.flatMapToObject
     */
    @IsTest
    private static void flatMapToObject() {
        // Given
        List<Account> input = AsTestData.generateAccounts();
        List<Account> clone = AsTestCommons.deepClone(input);
        String fieldName1 = AsTestConsts.NAME;
        String fieldName2 = AsTestConsts.TYPE;
        IFunction getCoordinates = new AsTestCommons.GetPair(fieldName1, fieldName2);
        ObjectEnumerable objSeq = SObjectSequence.of(clone).flatMapToObject(getCoordinates);
        IObjectEnumerable objSeq1 = SObjectSequence.of(clone).flatMapToObject(getCoordinates);
        // When
        List<Object> actual = objSeq.toList();
        List<Object> actual1 = objSeq1.toList();
        // Then
        List<Object> expected = new List<Object>();
        for (Account acc : input) {
            Object value1 = acc.get(fieldName1);
            Object value2 = acc.get(fieldName2);
            expected.add(value1);
            expected.add(value2);
        }
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        List<Account> clone1 = AsTestCommons.deepClone(input);
        List<Account> clone2 = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Account.Name;
        String fieldName = AsTestConsts.NAME;
        String value = 'New Name';
        IConsumer setNewName = BaseSObjectConsumers.set(fieldName, value);
        SObjectEnumerable accSeq = SObjectSequence.of(clone).forEach(setNewName);
        SObjectEnumerable accSeq1 = SObjectSequence.of(clone1).forEach(fieldName, value);
        ISObjectEnumerable accSeq2 = SObjectSequence.of(clone2).forEach(field, value);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = (List<Account>) accSeq2.toList();
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Assert.areEqual(value, actual[i].Name);
            Assert.areEqual(value, actual1[i].Name);
            Assert.areEqual(value, actual2[i].Name);
        }
        Assert.areNotEqual(input, clone, Label.AS_ErrorMessage_InputNotMutated);
        Assert.areNotEqual(input, clone1, Label.AS_ErrorMessage_InputNotMutated);
        Assert.areNotEqual(input, clone2, Label.AS_ErrorMessage_InputNotMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        String fieldName = AsTestConsts.NUMBER_OF_EMPLOYEES;
        IFunction getNumOfEmployees = BaseSObjectFunctions.get(field);
        SObjectEnumerable accSeq = SObjectSequence.of(clone).distinct();
        SObjectEnumerable accSeq1 = SObjectSequence.of(clone).withoutNulls().distinct(getNumOfEmployees);
        ISObjectEnumerable accSeq2 = SObjectSequence.of(clone).withoutNulls().distinct(fieldName);
        ISObjectEnumerable accSeq3 = SObjectSequence.of(clone).withoutNulls().distinct(field);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = (List<Account>) accSeq2.toList();
        List<Account> actual3 = (List<Account>) accSeq3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, null, acc4 };
        List<Account> expected1 = new List<Account>{ acc, acc3, acc4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        String fieldName = AsTestConsts.NUMBER_OF_EMPLOYEES;
        IComparer fieldComparer = Comparer.comparing(BaseSObjectFunctions.get(field));
        SObjectEnumerable accSeq = SObjectSequence.of(clone).sort();
        SObjectEnumerable accSeq1 = SObjectSequence.of(clone).sort(SortOrder.ASCENDING);
        SObjectEnumerable accSeq2 = SObjectSequence.of(clone).sort(fieldComparer);
        SObjectEnumerable accSeq3 = SObjectSequence.of(clone).sort(fieldName);
        ISObjectEnumerable accSeq4 = SObjectSequence.of(clone).sort(field);
        ISObjectEnumerable accSeq5 = SObjectSequence.of(clone).sort(fieldName, SortOrder.DESCENDING);
        ISObjectEnumerable accSeq6 = SObjectSequence.of(clone).sort(field, SortOrder.DESCENDING);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = accSeq2.toList();
        List<Account> actual3 = accSeq3.toList();
        List<Account> actual4 = (List<Account>) accSeq4.toList();
        List<Account> actual5 = (List<Account>) accSeq5.toList();
        List<Account> actual6 = (List<Account>) accSeq6.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc2, acc3, acc4 };
        List<Account> expected1 = new List<Account>{ acc4, acc2, acc2, acc1, acc, acc3 };
        List<Account> expected2 = new List<Account>{ acc3, acc, acc1, acc2, acc2, acc4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectEnumerable accSeq = SObjectSequence.of(clone).lim(25);
        SObjectEnumerable accSeq1 = SObjectSequence.of(clone).lim(3);
        ISObjectEnumerable accSeq2 = SObjectSequence.of(clone).lim(0);
        ISObjectEnumerable accSeq3 = SObjectSequence.of(clone);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = (List<Account>) accSeq2.toList();
        Exception exc1;
        try {
            accSeq3.lim(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Account> expected = new List<Account>{ acc1, acc, acc2 };
        List<Account> expected1 = new List<Account>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectEnumerable accSeq = SObjectSequence.of(clone).skip(5);
        SObjectEnumerable accSeq1 = SObjectSequence.of(clone).skip(0);
        ISObjectEnumerable accSeq2 = SObjectSequence.of(clone).skip(25);
        // When
        List<Account> actual = accSeq.toList();
        List<Account> actual1 = accSeq1.toList();
        List<Account> actual2 = (List<Account>) accSeq2.toList();
        Exception exc1;
        try {
            SObjectSequence.of(clone).skip(-2);
        } catch (IllegalArgumentException exc) {
            exc1 = exc;
        }
        // Then
        List<Account> expected = new List<Account>{ acc2 };
        List<Account> expected1 = new List<Account>();
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(IllegalArgumentException.class.getName(), exc1.getTypeName());
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        IComparer fieldComparer = Comparer.comparing(BaseSObjectFunctions.get(field));
        IBiOperator maxBy = BiOperator.maxBy(fieldComparer);
        SObjectEnumerable accSeq = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq1 = SObjectSequence.of(clone);
        SObjectEnumerable accSeq2 = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq3 = SObjectSequence.of(clone);
        // When
        SObject actual = accSeq.reduce(seed, maxBy);
        SObject actual1 = (SObject) accSeq1.reduce(seed, maxBy);
        SObject actual2 = (SObject) accSeq2.reduce(maxBy).get();
        SObject actual3 = (SObject) accSeq3.reduce(maxBy).get();
        // Then
        Assert.areEqual(acc3, actual);
        Assert.areEqual(acc3, actual1);
        Assert.areEqual(acc3, actual2);
        Assert.areEqual(acc3, actual3);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        ICollector toSetCollector = Collector.of(Supplier.of(Set<SObject>.class), new AsTestCommons.AddToSObjectSet());
        ISupplier sObjectSetSupplier = Supplier.of(Set<SObject>.class);
        IBiConsumer biConsumer = new AsTestCommons.AddToSObjectSet(Function.identity());
        ISObjectEnumerable accSeq = SObjectSequence.of(clone);
        SObjectEnumerable accSeq1 = SObjectSequence.of(clone);
        // When
        Set<SObject> actual = (Set<SObject>) accSeq.collect(toSetCollector);
        Set<SObject> actual1 = (Set<SObject>) accSeq1.collect(Collector.of(sObjectSetSupplier, biConsumer));
        // Then
        Set<SObject> expected = new Set<SObject>{ acc1, acc, acc2, acc3, acc4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        String fieldName = AsTestConsts.NUMBER_OF_EMPLOYEES;
        Integer value = 0;
        Integer value1 = 500;
        IPredicate isFieldEqualPredicate = BaseSObjectPredicates.isEqual(field, 0);
        ISObjectEnumerable accSeq = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq1 = SObjectSequence.of(clone);
        SObjectEnumerable accSeq2 = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq3 = SObjectSequence.of(clone);
        // When
        Account actual = (Account) accSeq.find(isFieldEqualPredicate).get();
        Account actual1 = (Account) accSeq1.find(field, value).get();
        Account actual2 = (Account) accSeq2.find(fieldName, value).get();
        Boolean actual3 = accSeq3.find(fieldName, value1).isEmpty();
        // Then
        Assert.areEqual(acc2, actual);
        Assert.areEqual(acc2, actual1);
        Assert.areEqual(acc2, actual2);
        Assert.isTrue(actual3);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Contact> clone = AsTestCommons.deepClone(input);
        String value = 'T';
        Boolean value1 = false;
        String value2 = 'Finance';
        IPredicate isLastNameStartsWith = Predicate.compose(BaseSObjectFunctions.get(AsTestConsts.Contact.LastName), new AsTestCommons.StartsWithPredicate(value));
        ISObjectEnumerable accSeq = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq1 = SObjectSequence.of(clone);
        SObjectEnumerable accSeq2 = SObjectSequence.of(clone);
        // When
        Boolean isEveryConNameStartsWithT = accSeq.every(isLastNameStartsWith);
        Boolean isEveryConDoNotCall = accSeq1.every(AsTestConsts.Contact.DoNotCall, value1);
        Boolean isEveryConFinanceDepartment = accSeq2.every(AsTestConsts.DEPARTMENT, value2);
        // Then
        Assert.areEqual(true, isEveryConNameStartsWithT);
        Assert.areEqual(false, isEveryConDoNotCall);
        Assert.areEqual(false, isEveryConFinanceDepartment);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Contact> clone = AsTestCommons.deepClone(input);
        String value = 'A';
        Boolean value1 = true;
        String value2 = 'HR';
        IPredicate isLastNameStartsWith = Predicate.compose(BaseSObjectFunctions.get(AsTestConsts.Contact.LastName), new AsTestCommons.StartsWithPredicate(value));
        ISObjectEnumerable accSeq = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq1 = SObjectSequence.of(clone);
        SObjectEnumerable accSeq2 = SObjectSequence.of(clone);
        // When
        Boolean isSomeConNameStartsWithA = accSeq.some(isLastNameStartsWith);
        Boolean isSomeConDoNotCall = accSeq1.some(AsTestConsts.Contact.DoNotCall, value1);
        Boolean isSomeConHR = accSeq2.some(AsTestConsts.DEPARTMENT, value2);
        // Then
        Assert.areEqual(false, isSomeConNameStartsWithA);
        Assert.areEqual(true, isSomeConDoNotCall);
        Assert.areEqual(false, isSomeConHR);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectEnumerable.none
     */
    @IsTest
    private static void none() {
        // Given
        Contact acc = new Contact(LastName = 'Test Acc', Department = 'Finance', DoNotCall = false);
        Contact acc1 = new Contact(LastName = 'Test Acc1', Department = 'Finance', DoNotCall = false);
        Contact acc2 = new Contact(LastName = 'Test Acc2', Department = 'Finance');
        Contact acc3 = new Contact(LastName = 'Test Acc3', Department = 'Finance', DoNotCall = true);
        Contact acc4 = new Contact(LastName = 'Test Acc4');
        List<Contact> input = new List<Contact>{ acc1, acc, acc2, acc3, acc4, acc2 };
        List<Contact> clone = AsTestCommons.deepClone(input);
        String value = 'A';
        Boolean value1 = true;
        String value2 = 'HR';
        IPredicate isLastNameStartsWith = Predicate.compose(BaseSObjectFunctions.get(AsTestConsts.Contact.LastName), new AsTestCommons.StartsWithPredicate(value));
        ISObjectEnumerable accSeq = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq1 = SObjectSequence.of(clone);
        SObjectEnumerable accSeq2 = SObjectSequence.of(clone);
        // When
        Boolean isSomeConNameStartsWithA = accSeq.none(isLastNameStartsWith);
        Boolean isSomeConDoNotCall = accSeq1.none(AsTestConsts.Contact.DoNotCall, value1);
        Boolean isSomeConHR = accSeq2.none(AsTestConsts.DEPARTMENT, value2);
        // Then
        Assert.areEqual(true, isSomeConNameStartsWithA);
        Assert.areEqual(false, isSomeConDoNotCall);
        Assert.areEqual(true, isSomeConHR);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectEnumerable.max
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        String fieldName = AsTestConsts.NUMBER_OF_EMPLOYEES;
        IComparer fieldComparer = Comparer.comparing(BaseSObjectFunctions.get(field));
        ISObjectEnumerable accSeq = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq1 = SObjectSequence.of(clone);
        SObjectEnumerable accSeq2 = SObjectSequence.of(clone);
        // When
        Account actual = (Account) accSeq.max(fieldComparer).get();
        Account actual1 = (Account) accSeq1.max(fieldName).get();
        Account actual2 = (Account) accSeq2.max(field).get();
        // Then
        Assert.areEqual(acc3, actual);
        Assert.areEqual(acc3, actual1);
        Assert.areEqual(acc3, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectEnumerable.min
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        String fieldName = AsTestConsts.NUMBER_OF_EMPLOYEES;
        IComparer fieldComparer = Comparer.comparing(BaseSObjectFunctions.get(field));
        ISObjectEnumerable accSeq = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq1 = SObjectSequence.of(clone);
        SObjectEnumerable accSeq2 = SObjectSequence.of(clone);
        // When
        Account actual = (Account) accSeq.min(fieldComparer).get();
        Account actual1 = (Account) accSeq1.min(fieldName).get();
        Account actual2 = (Account) accSeq2.min(field).get();
        // Then
        Assert.areEqual(acc4, actual);
        Assert.areEqual(acc4, actual1);
        Assert.areEqual(acc4, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectEnumerable.sum
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        String fieldName = AsTestConsts.NUMBER_OF_EMPLOYEES;
        IFunction getAsDouble = BaseSObjectFunctions.get(fieldName);
        IPredicate hasFieldValue = BasePredicates.isEqual(BaseSObjectFunctions.get(field), Function.constant(null)).negate();
        SObjectEnumerable accSeq = SObjectSequence.of(clone).filter(hasFieldValue);
        SObjectEnumerable accSeq1 = SObjectSequence.of(clone).filter(hasFieldValue);
        ISObjectEnumerable accSeq2 = SObjectSequence.of(clone).filter(hasFieldValue);
        // When
        Double actual = (Double) accSeq.sum(getAsDouble);
        Double actual1 = (Double) accSeq1.sum(fieldName);
        Double actual2 = (Double) accSeq2.sum(field);
        // Then
        Integer expected = 700;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectEnumerable.avg
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Account.NumberOfEmployees;
        String fieldName = AsTestConsts.NUMBER_OF_EMPLOYEES;
        IFunction getAsDouble = BaseSObjectFunctions.get(fieldName);
        IPredicate hasFieldValue = BasePredicates.isEqual(getAsDouble, Function.constant(null)).negate();
        SObjectEnumerable accSeq = SObjectSequence.of(clone).filter(hasFieldValue);
        SObjectEnumerable accSeq1 = SObjectSequence.of(clone).filter(hasFieldValue);
        ISObjectEnumerable accSeq2 = SObjectSequence.of(clone).filter(hasFieldValue);
        // When
        Double actual = (Double) accSeq.avg(getAsDouble).get();
        Double actual1 = (Double) accSeq1.avg(fieldName).get();
        Double actual2 = (Double) accSeq2.avg(field).get();
        // Then
        Double expected = 700 / 5;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectEnumerable accSeq = SObjectSequence.of(input);
        SObjectEnumerable accSeq1 = SObjectSequence.of(new List<SObject>());
        ISObjectEnumerable accSeq2 = SObjectSequence.empty();
        // When
        Integer actual = accSeq.count();
        Integer actual1 = accSeq1.count();
        Integer actual2 = accSeq2.count();
        // Then
        Assert.areEqual(input.size(), actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectEnumerable accSeq = SObjectSequence.of(clone);
        SObjectEnumerable accSeq1 = SObjectSequence.of(new List<SObject>());
        ISObjectEnumerable accSeq2 = SObjectSequence.empty();
        // When
        Boolean actual = accSeq.isEmpty();
        Boolean actual1 = accSeq1.isEmpty();
        Boolean actual2 = accSeq2.isEmpty();
        // Then
        Assert.areEqual(input.isEmpty(), actual);
        Assert.isTrue(actual1);
        Assert.isTrue(actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
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
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectEnumerable accSeq = SObjectSequence.of(clone);
        SObjectEnumerable accSeq1 = SObjectSequence.of(clone).withoutNulls();
        SObjectEnumerable accSeq2 = SObjectSequence.of(clone).withoutNulls();
        SObjectEnumerable accSeq3 = SObjectSequence.of(clone).withoutNulls();
        ISObjectEnumerable accSeq4 = SObjectSequence.of(clone).withoutNulls();
        ISObjectEnumerable accSeq5 = SObjectSequence.of(clone).withoutNulls();
        ISObjectEnumerable accSeq6 = SObjectSequence.of(clone).withoutNulls();
        // When
        List<Account> actual = accSeq.toList();
        List<Integer> actual1 = (List<Integer>) accSeq1.toList(BaseSObjectFunctions.get('NumberOfEmployees'), Integer.class);
        List<Integer> actual2 = (List<Integer>) accSeq2.toList('NumberOfEmployees', Integer.class);
        List<Integer> actual3 = (List<Integer>) accSeq3.toList(Account.NumberOfEmployees, Integer.class);
        List<Object> actual4 = accSeq4.toList(BaseSObjectFunctions.get('NumberOfEmployees'));
        List<Object> actual5 = accSeq5.toList('NumberOfEmployees');
        List<Object> actual6 = accSeq6.toList(Account.NumberOfEmployees);
        // Then
        List<Integer> expected = (List<Integer>) SObjectSequence.of(clone)
            .withoutNulls()
            .collect(BaseCollectors.toList(BaseSObjectFunctions.get(Account.NumberOfEmployees)).cast(List<Integer>.class));
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Assert.areEqual(expected, actual5);
        Assert.areEqual(expected, actual6);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectSequence.toSet
     * @see SObjectSequence.toIdSet
     * @see SObjectSequence.toStringSet
     */
    @IsTest
    private static void toSet() {
        // Given
        ISupplier idGenerator = new AsTestCommons.IdSupplier(Account.SObjectType);
        Account acc = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, null, acc3, acc4, acc2, null };
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectEnumerable accSeq = SObjectSequence.of(clone);
        SObjectEnumerable accSeq1 = SObjectSequence.of(clone).withoutNulls();
        SObjectEnumerable accSeq2 = SObjectSequence.of(clone).withoutNulls();
        SObjectEnumerable accSeq3 = SObjectSequence.of(clone).withoutNulls();
        SObjectEnumerable accSeq4 = SObjectSequence.of(clone).withoutNulls();
        SObjectEnumerable accSeq5 = SObjectSequence.of(clone).withoutNulls();
        ISObjectEnumerable accSeq6 = SObjectSequence.of(clone).withoutNulls();
        ISObjectEnumerable accSeq7 = SObjectSequence.of(clone).withoutNulls();
        ISObjectEnumerable accSeq8 = SObjectSequence.of(clone).withoutNulls();
        ISObjectEnumerable accSeq9 = SObjectSequence.of(clone).withoutNulls();
        ISObjectEnumerable accSeq10 = SObjectSequence.of(clone).withoutNulls();
        // When
        Set<SObject> actual = accSeq.toSet();
        Set<Id> actual1 = accSeq1.toIdSet();
        Set<Id> actual2 = accSeq2.toIdSet(BaseSObjectFunctions.get('Id'));
        Set<Id> actual3 = accSeq3.toIdSet('Id');
        Set<Id> actual4 = accSeq4.toIdSet(Account.Id);
        Set<String> actual5 = accSeq5.toStringSet(BaseSObjectFunctions.get('Name'));
        Set<String> actual6 = accSeq6.toStringSet('Name');
        Set<String> actual7 = accSeq7.toStringSet(Account.Name);
        Set<Object> actual8 = (Set<Object>) accSeq8.toSet(BaseSObjectFunctions.get('Name'));
        Set<Object> actual9 = (Set<Object>) accSeq9.toSet('Name');
        Set<Object> actual10 = (Set<Object>) accSeq10.toSet(Account.Name);
        // Then
        Set<SObject> expected = new Set<SObject>{ acc1, acc, acc2, null, acc3, acc4 };
        Set<Id> expected1 = (Set<Id>) SObjectSequence.of(clone)
            .withoutNulls()
            .collect(Collector.of(Supplier.of(Set<Id>.class), new AsTestCommons.AddToIdSet(BaseSObjectFunctions.get(Account.Id))));
        Set<String> expected2 = (Set<String>) SObjectSequence.of(clone)
            .withoutNulls()
            .collect(Collector.of(Supplier.of(Set<String>.class), new AsTestCommons.AddToStringSet(BaseSObjectFunctions.get(Account.Name))));
        Set<Object> expected3 = (Set<Object>) SObjectSequence.of(clone)
            .withoutNulls()
            .collect(Collector.of(Supplier.of(Set<Object>.class), new AsTestCommons.AddToSet(BaseSObjectFunctions.get(Account.Name))));
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(expected2, actual7);
        Assert.areEqual(expected3, actual8);
        Assert.areEqual(expected3, actual9);
        Assert.areEqual(expected3, actual10);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectSequence.toMap
     * @see SObjectSequence.toByIdMap
     * @see SObjectSequence.toByStringMap
     */
    @IsTest
    private static void toMap() {
        // Given
        ISupplier idGenerator = new AsTestCommons.IdSupplier(Account.SObjectType);
        Account acc = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4 };
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectEnumerable accSeq = SObjectSequence.of(clone);
        SObjectEnumerable accSeq1 = SObjectSequence.of(clone);
        SObjectEnumerable accSeq2 = SObjectSequence.of(clone);
        SObjectEnumerable accSeq3 = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq4 = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq5 = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq6 = SObjectSequence.of(clone);
        // When
        Map<Id, SObject> actual = accSeq.toMap();
        Map<Id, Account> actual1 = (Map<Id, Account>) accSeq1.toByIdMap(BaseSObjectFunctions.get('Id'), Account.class);
        Map<Id, Account> actual2 = (Map<Id, Account>) accSeq2.toByIdMap('Id', Account.class);
        Map<Id, Account> actual3 = (Map<Id, Account>) accSeq3.toByIdMap(Account.Id, Account.class);
        Map<String, Account> actual4 = (Map<String, Account>) accSeq4.toByStringMap(BaseSObjectFunctions.get('Name'), Account.class);
        Map<String, Account> actual5 = (Map<String, Account>) accSeq5.toByStringMap('Name', Account.class);
        Map<String, Account> actual6 = (Map<String, Account>) accSeq6.toByStringMap(Account.Name, Account.class);
        // Then
        Map<Id, Account> expected = new Map<Id, Account>(input);
        Map<Id, Account> expected1 = (Map<Id, Account>) SObjectSequence.of(clone)
            .collect(
                Collector.of(
                    Supplier.of(Map<Id, Account>.class),
                    new AsTestCommons.PutToObjectByIdMap(BaseSObjectFunctions.get(Account.Id), Function.identity(), null)
                ).cast(Map<Id, Account>.class)
            );
        Map<String, Account> expected2 = (Map<String, Account>) SObjectSequence.of(clone)
            .collect(
                Collector.of(
                    Supplier.of(Map<String, Account>.class),
                    new AsTestCommons.PutToObjectByStringMap(BaseSObjectFunctions.get(Account.Name), Function.identity(), null)
                ).cast(Map<String, Account>.class)
            );
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectSequence.groupById
     * @see SObjectSequence.groupByString
     */
    @IsTest
    private static void group() {
        // Given
        ISupplier idGenerator = new AsTestCommons.IdSupplier(Account.SObjectType);
        Id parentId1 = (Id) idGenerator.get();
        Id parentId2 = (Id) idGenerator.get();
        Account acc = new Account(ParentId = parentId1, Name = 'Test Acc', NumberOfEmployees = 200, Rating = 'Hot');
        Account acc1 = new Account(ParentId = parentId2, Name = 'Test Acc1', NumberOfEmployees = 100, Rating = 'Warm');
        Account acc2 = new Account(ParentId = parentId1, Name = 'Test Acc2', NumberOfEmployees = 0, Rating = 'Warm');
        Account acc3 = new Account(ParentId = parentId2, Name = 'Test Acc3', NumberOfEmployees = 400, Rating = 'Hot');
        Account acc4 = new Account(ParentId = parentId1, Name = 'Test Acc4', Rating = 'Warm');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4 };
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectEnumerable accSeq = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq1 = SObjectSequence.of(clone);
        SObjectEnumerable accSeq2 = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq3 = SObjectSequence.of(clone);
        SObjectEnumerable accSeq4 = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq5 = SObjectSequence.of(clone);
        // When
        Map<Id, List<Account>> actual = accSeq.groupById(BaseSObjectFunctions.get('ParentId'));
        Map<Id, List<Account>> actual2 = accSeq1.groupById('ParentId');
        Map<Id, List<Account>> actual3 = accSeq2.groupById(Account.ParentId);
        Map<String, List<Account>> actual4 = accSeq3.groupByString(BaseSObjectFunctions.get('Rating'));
        Map<String, List<Account>> actual5 = accSeq4.groupByString('Rating');
        Map<String, List<Account>> actual6 = accSeq5.groupByString(Account.Rating);
        // Then
        Map<Id, List<Account>> expected = (Map<Id, List<Account>>) SObjectSequence.of(clone)
            .collect(
                Collector.of(
                    Supplier.of(Map<Id, List<Account>>.class),
                    new AsTestCommons.PutToObjectsByIdMap(BaseCollectors.toList(), BaseSObjectFunctions.get(Account.ParentId)),
                    new AsTestCommons.GroupByIdFinisher(null)
                ).cast(Map<Id, List<Account>>.class)
            );
        Map<String, List<Account>> expected1 = (Map<String, List<Account>>) SObjectSequence.of(clone)
            .collect(
                Collector.of(
                    Supplier.of(Map<String, List<Account>>.class),
                    new AsTestCommons.PutToObjectsByStringMap(BaseCollectors.toList(), BaseSObjectFunctions.get(Account.Rating)),
                    new AsTestCommons.GroupByStringFinisher(null)
                ).cast(Map<String, List<Account>>.class)
            );
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectSequence.partition
     */
    @IsTest
    private static void partition() {
        // Given
        ISupplier idGenerator = new AsTestCommons.IdSupplier(Account.SObjectType);
        Account acc = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4 };
        List<Account> clone = AsTestCommons.deepClone(input);
        IPredicate predicate = BasePredicates.isCompared(BaseSObjectFunctions.get(Account.NumberOfEmployees), Function.constant(150), Comparer.defaultOrder(), 1);
        SObjectEnumerable accSeq = SObjectSequence.of(clone);
        SObjectEnumerable accSeq1 = SObjectSequence.of(clone);
        ISObjectEnumerable accSeq2 = SObjectSequence.of(clone);
        // When
        Map<Boolean, List<Account>> actual = accSeq.partition(predicate);
        Map<Boolean, List<Account>> actual1 = accSeq1.partition('NumberOfEmployees', 100);
        Map<Boolean, List<Account>> actual2 = accSeq2.partition(Account.NumberOfEmployees, 100);
        // Then
        Map<Boolean, List<Account>> expected = (Map<Boolean, List<Account>>) SObjectSequence.of(clone)
            .collect(
                Collector.of(
                    Supplier.of(Map<Boolean, Object>.class),
                    new AsTestCommons.PutToObjectsByBoolMap(BaseCollectors.toList(), Function.compose(predicate)),
                    null
                ).cast(Map<Boolean, List<Account>>.class)
            );
        Map<Boolean, List<Account>> expected1 = new Map<Boolean, List<Account>>{
            true => new List<Account>{ acc1 },
            false => new List<Account>{ acc, acc2, acc3, acc4 }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

}
