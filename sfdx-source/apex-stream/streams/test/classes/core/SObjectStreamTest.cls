/**
 * @see SObjectStream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectStreamTest {

    /**
     * @see SObjectStream.of
     * @see SObjectStream.ofNullable
     * @see SObjectStream.empty
     * @see SObjectStream.iterator
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
        SObjectEnumerable accStm = SObjectStream.of(input);
        ISObjectEnumerable accStm1 = SObjectStream.of(new Set<SObject>(input));
        SObjectEnumerable accStm2 = SObjectStream.ofNullable(input);
        SObjectEnumerable accStm3 = SObjectStream.ofNullable(new Set<SObject>(input));
        ISObjectEnumerable accStm4 = SObjectStream.ofNullable(input1);
        ISObjectEnumerable accStm5 = SObjectStream.ofNullable((Iterable<Account>) input2);
        ISObjectEnumerable accStm6 = SObjectStream.of(input.iterator());
        // When
        List<Account> actual = accStm.toList();
        List<Account> actual1 = (List<Account>) accStm1.toList();
        List<Account> actual2 = accStm2.toList();
        List<Account> actual3 = accStm3.toList();
        List<Account> actual4 = (List<Account>) accStm4.toList();
        List<Account> actual5 = (List<Account>) accStm5.toList();
        List<Account> actual6 = (List<Account>) accStm6.toList();
        // Then
        List<Account> expected = new List<SObject>(new Set<SObject>(input));
        List<Account> expected1 = new List<SObject>();
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(input, actual6);
        Assert.areEqual(accounts, input, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
        Assert.isTrue(((SObjectStream) accStm4).isOperated);
        Assert.isTrue(((SObjectStream) accStm5).isOperated);
        Assert.isTrue(((SObjectStream) accStm6).isOperated);
    }
    
    /**
     * @see SObjectStream.generate
     */
    @IsTest
    private static void generate() {
        // Given
        ISupplier accSupplier = new AsTestCommons.TestAccountSupplier();
        ISupplier accSupplier1 = new AsTestCommons.TestAccountSupplier();
        Integer lim = 10;
        SObjectEnumerable stm = SObjectStream.generate(accSupplier).lim(lim);
        ISObjectEnumerable stm1 = SObjectStream.generate(accSupplier1).lim(lim);
        // When
        List<Account> actual = stm.toList();
        List<Account> actual1 = (List<Account>) stm1.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(lim, actual1.size());
        for (Integer i = 0, size = actual.size(); i < size; i++) {
            Assert.areEqual('Test' + i, actual[i].Name);
            Assert.areEqual(100 * i, actual[i].NumberOfEmployees);
            Assert.areEqual('Test' + i, actual1[i].Name);
            Assert.areEqual(100 * i, actual1[i].NumberOfEmployees);
        }
        Assert.isTrue(((SObjectStream) stm).isOperated);
        Assert.isTrue(((SObjectStream) stm1).isOperated);
    }

    /**
     * @see SObjectStream.iterate
     */
    @IsTest
    private static void iterate() {
        // Given
        Integer numOfEmployees = 0;
        Integer numOfEmployees1 = 0;
        String name = 'Test';
        String name1 = 'Test';
        Integer lim = 10;
        Account seed = new Account(Name = name, NumberOfEmployees = numOfEmployees);
        Account seed1 = new Account(Name = name1, NumberOfEmployees = numOfEmployees1);
        IPredicate pred = new AsTestCommons.IsLessPredicate(BaseSObjectFunctions.get('NumberOfEmployees'), Function.constant(3600))
            .orElse(new AfTestCommons.IsEqualPredicate(BaseSObjectFunctions.get('NumberOfEmployees'), Function.constant(3600)));
        IOperator accIterator = new AsTestCommons.TestAccountOperator();
        IOperator accIterator1 = new AsTestCommons.TestAccountOperator();
        SObjectEnumerable stm = SObjectStream.iterate(seed, accIterator).lim(lim);
        ISObjectEnumerable stm1 = SObjectStream.iterate(seed1, pred, accIterator1);
        // When
        List<Account> actual = stm.toList();
        List<Account> actual1 = (List<Account>) stm1.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        Assert.areEqual(lim, actual1.size());
        for (Integer i = 0, size = actual.size(); i < size; i++) {
            if (i == 0) {
                Assert.areEqual(name, actual[i].Name);
                Assert.areEqual(numOfEmployees, actual[i].NumberOfEmployees);
                Assert.areEqual(name1, actual1[i].Name);
                Assert.areEqual(numOfEmployees1, actual1[i].NumberOfEmployees);
            } else {
                Assert.areEqual(name = name + (i - 1), actual[i].Name);
                Assert.areEqual(numOfEmployees = numOfEmployees + 100 * (i - 1), actual[i].NumberOfEmployees);
                Assert.areEqual(name1 = name1 + (i - 1), actual1[i].Name);
                Assert.areEqual(numOfEmployees1 = numOfEmployees1 + 100 * (i - 1), actual1[i].NumberOfEmployees);
            }
        }
        Assert.isTrue(((SObjectStream) stm).isOperated);
        Assert.isTrue(((SObjectStream) stm1).isOperated);
    }

    /**
     * @see SObjectStream.concat
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
        SObjectEnumerable accStm = SObjectStream.of(input);
        SObjectEnumerable accStm1 = SObjectStream.of(input1);
        ISObjectEnumerable accStm2 = SObjectStream.of(input);
        ISObjectEnumerable accStm3 = SObjectStream.of(input1);
        ISObjectEnumerable accStm4 = SObjectStream.of(input2);
        // When
        List<Account> actual = SObjectStream.concat(accStm, accStm1).toList();
        List<Account> actual1 = SObjectStream.concat(new List<ISObjectEnumerable>{ accStm2, accStm3, accStm4 }).toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5 };
        List<Account> expected1 = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5, acc6 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
        Assert.isTrue(((SObjectStream) accStm4).isOperated);
    }

    /**
     * @see SObjectStream.zip
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
        SObjectEnumerable oldAccsSteam = SObjectStream.of(oldList);
        ISObjectEnumerable oldAccsSteam1 = SObjectStream.of(oldList);
        SObjectEnumerable newAccsSteam = SObjectStream.of(newList);
        ISObjectEnumerable newAccsSteam1 = SObjectStream.of(newList);
        IBiPredicate numOfEmployeesIsChanged = new AsTestCommons.ComparisonBiPredicate(BaseSObjectFunctions.get(AsTestConsts.NUMBER_OF_EMPLOYEES), BaseSObjectFunctions.get(AsTestConsts.NUMBER_OF_EMPLOYEES), 0).negate();
        IBiOperator getNewAcc = BiOperator.right();
        SObjectEnumerable accStm = SObjectStream.zip(oldAccsSteam, newAccsSteam, maxNumber);
        ISObjectEnumerable accStm1 = SObjectStream.zip(oldAccsSteam1, newAccsSteam1, numOfEmployeesIsChanged, getNewAcc);
        // When
        List<Account> actual = accStm.toList();
        List<Account> actual1 = (List<Account>) accStm1.toList();
        // Then
        List<Account> expected = new List<Account>{ oldAcc, oldAcc1, newAcc2, oldAcc3 };
        List<Account> expected1 = new List<Account>{ newAcc1, newAcc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
    }

    /**
     * @see SObjectStream.append
     * @see SObjectStream.prepend
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
        SObjectEnumerable accStm = SObjectStream.of(input);
        SObjectEnumerable accStm1 = SObjectStream.of(input);
        ISObjectEnumerable accStm2 = SObjectStream.of(input1);
        ISObjectEnumerable accStm3 = SObjectStream.of(input1);
        SObjectEnumerable accStm4 = accStm.append(accStm2);
        ISObjectEnumerable accStm5 = accStm1.prepend(accStm3);
        // When
        List<Account> actual = accStm4.toList();
        List<Account> actual1 = (List<Account>) accStm5.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5 };
        List<Account> expected1 = new List<Account>{ acc3, acc4, acc5, acc, acc1, acc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
        Assert.isTrue(((SObjectStream) accStm4).isOperated);
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
        SObjectEnumerable stm = SObjectStream.of(input).union((Iterable<SObject>) input1);
        SObjectEnumerable stm1 = SObjectStream.of(input).union(SObjectStream.of(input1));
        SObjectEnumerable stm2 = SObjectStream.of(input).union((Iterable<Account>) input1, getName);
        ISObjectEnumerable stm3 = SObjectStream.of(input).union((Iterable<Account>) input1, fieldName);
        ISObjectEnumerable stm4 = SObjectStream.of(input).union((Iterable<SObject>) input1, field);
        // When
        List<Account> actual = stm.toList();
        List<Account> actual1 = stm1.toList();
        List<Account> actual2 = stm2.toList();
        List<Account> actual3 = (List<Account>) stm3.toList();
        List<Account> actual4 = (List<Account>) stm4.toList();
        // Then
        List<Account> expected = new List<Account>{ acc5, acc3, acc9, acc7, acc8, acc6, acc4, acc1, acc, acc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Assert.isTrue(((SObjectStream) stm).isOperated);
        Assert.isTrue(((SObjectStream) stm1).isOperated);
        Assert.isTrue(((SObjectStream) stm2).isOperated);
        Assert.isTrue(((SObjectStream) stm3).isOperated);
        Assert.isTrue(((SObjectStream) stm4).isOperated);
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
        SObjectEnumerable stm = SObjectStream.of(input).intersect((Iterable<Object>) input1);
        SObjectEnumerable stm1 = SObjectStream.of(input).intersect(SObjectStream.of(input1));
        SObjectEnumerable stm2 = SObjectStream.of(input).intersect((Iterable<Account>) input1, getName);
        ISObjectEnumerable stm3 = SObjectStream.of(input).intersect((Iterable<Account>) input1, fieldName);
        ISObjectEnumerable stm4 = SObjectStream.of(input).intersect((Iterable<SObject>) input1, field);
        // When
        List<Account> actual = stm.toList();
        List<Account> actual1 = stm1.toList();
        List<Account> actual2 = stm2.toList();
        List<Account> actual3 = (List<Account>) stm3.toList();
        List<Account> actual4 = (List<Account>) stm4.toList();
        // Then
        List<Account> expected = new List<Account>{ acc3, acc9 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Assert.isTrue(((SObjectStream) stm).isOperated);
        Assert.isTrue(((SObjectStream) stm1).isOperated);
        Assert.isTrue(((SObjectStream) stm2).isOperated);
        Assert.isTrue(((SObjectStream) stm3).isOperated);
        Assert.isTrue(((SObjectStream) stm4).isOperated);
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
        SObjectEnumerable stm = SObjectStream.of(input).except((Iterable<Object>) input1);
        SObjectEnumerable stm1 = SObjectStream.of(input).except(SObjectStream.of(input1));
        SObjectEnumerable stm2 = SObjectStream.of(input).except((Iterable<Account>) input1, getName);
        ISObjectEnumerable stm3 = SObjectStream.of(input).except((Iterable<Account>) input1, fieldName);
        ISObjectEnumerable stm4 = SObjectStream.of(input).except((Iterable<SObject>) input1, field);
        // When
        List<Account> actual = stm.toList();
        List<Account> actual1 = stm1.toList();
        List<Account> actual2 = stm2.toList();
        List<Account> actual3 = (List<Account>) stm3.toList();
        List<Account> actual4 = (List<Account>) stm4.toList();
        // Then
        List<Account> expected = new List<Account>{ acc5, acc7 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Assert.isTrue(((SObjectStream) stm).isOperated);
        Assert.isTrue(((SObjectStream) stm1).isOperated);
        Assert.isTrue(((SObjectStream) stm2).isOperated);
        Assert.isTrue(((SObjectStream) stm3).isOperated);
        Assert.isTrue(((SObjectStream) stm4).isOperated);
    }

    /**
     * @see SObjectStream.filter
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
        SObjectEnumerable accStm = SObjectStream.of(input).filter(fieldName, value);
        SObjectEnumerable accStm1 = SObjectStream.of(input).filter(field, value);
        ISObjectEnumerable accStm2 = SObjectStream.of(input).filter(isFieldEqual);
        ISObjectEnumerable accStm3 = SObjectStream.of(input).filter(isFieldEqual1);
        // When
        List<Account> actual = accStm.toList();
        List<Account> actual1 = accStm1.toList();
        List<Account> actual2 = (List<Account>) accStm2.toList();
        List<Account> actual3 = (List<Account>) accStm3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc1, acc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
    }

    /**
     * @see SObjectStream.take
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
        SObjectEnumerable accStm = SObjectStream.of(input).take(fieldName, value);
        SObjectEnumerable accStm1 = SObjectStream.of(input).take(field, value);
        ISObjectEnumerable accStm2 = SObjectStream.of(input).take(isFieldEqual);
        ISObjectEnumerable accStm3 = SObjectStream.of(input).take(isFieldEqual1);
        // When
        List<Account> actual = accStm.toList();
        List<Account> actual1 = accStm1.toList();
        List<Account> actual2 = (List<Account>) accStm2.toList();
        List<Account> actual3 = (List<Account>) accStm3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
    }

    /**
     * @see SObjectStream.drop
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
        SObjectEnumerable accStm = SObjectStream.of(input).drop(fieldName, value);
        SObjectEnumerable accStm1 = SObjectStream.of(input).drop(field, value);
        ISObjectEnumerable accStm2 = SObjectStream.of(input).drop(isFieldEqual);
        ISObjectEnumerable accStm3 = SObjectStream.of(input).drop(isFieldEqual1);
        // When
        List<Account> actual = accStm.toList();
        List<Account> actual1 = accStm1.toList();
        List<Account> actual2 = (List<Account>) accStm2.toList();
        List<Account> actual3 = (List<Account>) accStm3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc3, acc4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
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
        SObjectEnumerable stm = SObjectStream.of(clone).withoutNulls();
        ISObjectEnumerable stm1 = SObjectStream.of(clone).withoutNulls();
        // When
        List<Account> actual = stm.toList();
        List<Account> actual1 = (List<Account>) stm1.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc1 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) stm).isOperated);
        Assert.isTrue(((SObjectStream) stm1).isOperated);
    }

    /**
     * @see SObjectStream.mapTo
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

        SObjectEnumerable conStm = SObjectStream.of(clone).mapTo(createNewContactFromAccount);
        SObjectEnumerable conStm1 = SObjectStream.of(clone).mapTo(field1);
        ISObjectEnumerable conStm2 = SObjectStream.of(clone).mapTo(fieldName1);
        ISObjectEnumerable conStm3 = SObjectStream.of(clone).mapTo(op);
        // When
        List<Contact> actual = conStm.toList();
        List<Account> actual1 = conStm1.toList();
        List<Account> actual2 = (List<Account>) conStm2.toList();
        List<Contact> actual3 = (List<Contact>) conStm3.toList();
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
        Assert.isTrue(((SObjectStream) conStm).isOperated);
        Assert.isTrue(((SObjectStream) conStm1).isOperated);
        Assert.isTrue(((SObjectStream) conStm2).isOperated);
        Assert.isTrue(((SObjectStream) conStm3).isOperated);
    }

    /**
     * @see SObjectStream.mapToInt
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
        IntEnumerable intStm = SObjectStream.of(clone).mapToInt(getNumOfEmployeesAsInt);
        IntEnumerable intStm1 = SObjectStream.of(clone).mapToInt(fieldName);
        IIntEnumerable intStm2 = SObjectStream.of(clone).mapToInt(field);
        // When
        List<Integer> actual = intStm.toList();
        List<Integer> actual1 = intStm1.toList();
        List<Integer> actual2 = (List<Integer>) intStm2.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 200, 200, 200, 400, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) intStm).isOperated);
        Assert.isTrue(((IntStream) intStm1).isOperated);
        Assert.isTrue(((IntStream) intStm2).isOperated);
    }

    /**
     * @see SObjectStream.mapToLong
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
        LongEnumerable longStm = SObjectStream.of(clone).mapToLong(getNumOfEmployeesAsLong);
        LongEnumerable longStm1 = SObjectStream.of(clone).mapToLong(fieldName);
        ILongEnumerable longStm2 = SObjectStream.of(clone).mapToLong(field);
        // When
        List<Long> actual = longStm.toList();
        List<Long> actual1 = longStm1.toList();
        List<Long> actual2 = (List<Long>) longStm2.toList();
        // Then
        List<Long> expected = new List<Long>{ 200L, 200L, 200L, 400L, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) longStm).isOperated);
        Assert.isTrue(((LongStream) longStm1).isOperated);
        Assert.isTrue(((LongStream) longStm2).isOperated);
    }

    /**
     * @see SObjectStream.mapToDouble
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
        DoubleEnumerable doubleStm = SObjectStream.of(clone).mapToDouble(getNumOfEmployeesAsDouble);
        DoubleEnumerable doubleStm1 = SObjectStream.of(clone).mapToDouble(fieldName);
        IDoubleEnumerable doubleStm2 = SObjectStream.of(clone).mapToDouble(field);
        // When
        List<Double> actual = doubleStm.toList();
        List<Double> actual1 = doubleStm1.toList();
        List<Double> actual2 = (List<Double>) doubleStm2.toList();
        // Then
        List<Double> expected = new List<Double>{ 20000.0, 10000.5, 40000.4, 2581.9, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) doubleStm).isOperated);
        Assert.isTrue(((DoubleStream) doubleStm1).isOperated);
        Assert.isTrue(((DoubleStream) doubleStm2).isOperated);
    }

    /**
     * @see SObjectStream.mapToObject
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
        IObjectEnumerable objStm = SObjectStream.of(clone).mapToObject(getBirthday);
        IObjectEnumerable objStm1 = SObjectStream.of(clone).mapToObject(fieldName);
        ObjectEnumerable objStm2 = SObjectStream.of(clone).mapToObject(field);
        // When
        List<Date> actual = (List<Date>) objStm.toList(Date.class);
        List<Date> actual1 = (List<Date>) objStm1.toList(Date.class);
        List<Date> actual2 = (List<Date>) objStm2.toList(Date.class);
        // Then
        List<Date> expected = new List<Date>{ d, d1, d2, d3, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) objStm).isOperated);
        Assert.isTrue(((ObjectStream) objStm1).isOperated);
        Assert.isTrue(((ObjectStream) objStm2).isOperated);
    }

    /**
     * @see SObjectStream.flatMapTo
     */
    @IsTest
    private static void flatMapTo() {
        // Given
        List<Account> input = AsTestData.generateAccounts();
        List<Account> clone = AsTestCommons.deepClone(input);
        SObjectField field = AsTestConsts.Contact.AccountId;
        String fieldName = AsTestConsts.CONTACTS;
        IFunction getContacts = BaseSObjectFunctions.getSObjects(field);
        SObjectEnumerable conStm = SObjectStream.of(clone).flatMapTo(getContacts);
        SObjectEnumerable conStm1 = SObjectStream.of(clone).flatMapTo(fieldName);
        ISObjectEnumerable conStm2 = SObjectStream.of(clone).flatMapTo(field);
        // When
        List<Contact> actual = conStm.toList();
        List<Contact> actual1 = conStm1.toList();
        List<Contact> actual2 = (List<Contact>) conStm2.toList();
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
        Assert.isTrue(((SObjectStream) conStm).isOperated);
        Assert.isTrue(((SObjectStream) conStm1).isOperated);
        Assert.isTrue(((SObjectStream) conStm2).isOperated);
    }

    /**
     * @see SObjectStream.flatMapToInt
     */
    @IsTest
    private static void flatMapToInt() {
        // Given
        List<Account> input = AsTestData.generateAccounts();
        List<Account> clone = AsTestCommons.deepClone(input);
        String relationshipFieldName = AsTestConsts.CONTACTS;
        String fieldName = AsTestConsts.LAST_NAME;
        IFunction getFieldsLength = new AsTestCommons.GetFieldsLength(relationshipFieldName, fieldName);
        IntEnumerable intStm = SObjectStream.of(clone).flatMapToInt(getFieldsLength);
        IIntEnumerable intStm1 = SObjectStream.of(clone).flatMapToInt(getFieldsLength);
        // When
        List<Integer> actual = intStm.toList();
        List<Integer> actual1 = (List<Integer>) intStm1.toList();
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
        Assert.isTrue(((IntStream) intStm).isOperated);
        Assert.isTrue(((IntStream) intStm1).isOperated);
    }

    /**
     * @see SObjectStream.flatMapToLong
     */
    @IsTest
    private static void flatMapToLong() {
        // Given
        List<Account> input = AsTestData.generateAccounts();
        List<Account> clone = AsTestCommons.deepClone(input);
        String relationshipFieldName = AsTestConsts.CONTACTS;
        String fieldName = AsTestConsts.LAST_NAME;
        IFunction getFieldsLength = new AsTestCommons.GetFieldsLength(relationshipFieldName, fieldName);
        LongEnumerable longStm = SObjectStream.of(clone).flatMapToLong(getFieldsLength);
        ILongEnumerable longStm1 = SObjectStream.of(clone).flatMapToLong(getFieldsLength);
        // When
        List<Long> actual = longStm.toList();
        List<Long> actual1 = (List<Long>) longStm1.toList();
        // Then
        List<Long> expected = new List<Long>();
        for (Account acc : input) {
            List<SObject> children = acc.getSObjects(relationshipFieldName);
            if (children != null) {
                List<Long> result = new List<Long>();
                for (SObject child : children) {
                    result.add(((String) child.get(fieldName)).length());
                }
                expected.addAll(result);
            }
        }
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) longStm).isOperated);
        Assert.isTrue(((LongStream) longStm1).isOperated);
    }

    /**
     * @see SObjectStream.flatMapToDouble
     */
    @IsTest
    private static void flatMapToDouble() {
        // Given
        List<Account> input = AsTestData.generateAccounts();
        List<Account> clone = AsTestCommons.deepClone(input);
        String fieldName1 = AsTestConsts.BILLING_LATITUDE;
        String fieldName2 = AsTestConsts.BILLING_LONGITUDE;
        IFunction getCoordinates = new AsTestCommons.GetDoublePair(fieldName1, fieldName2);
        DoubleEnumerable doubleStm = SObjectStream.of(clone).flatMapToDouble(getCoordinates);
        IDoubleEnumerable doubleStm1 = SObjectStream.of(clone).flatMapToDouble(getCoordinates);
        // When
        List<Double> actual = doubleStm.toList();
        List<Double> actual1 = (List<Double>) doubleStm1.toList();
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
        Assert.isTrue(((DoubleStream) doubleStm).isOperated);
        Assert.isTrue(((DoubleStream) doubleStm1).isOperated);
    }

    /**
     * @see SObjectStream.flatMapToObject
     */
    @IsTest
    private static void flatMapToObject() {
        // Given
        List<Account> input = AsTestData.generateAccounts();
        List<Account> clone = AsTestCommons.deepClone(input);
        String fieldName1 = AsTestConsts.NAME;
        String fieldName2 = AsTestConsts.TYPE;
        IFunction getCoordinates = new AsTestCommons.GetPair(fieldName1, fieldName2);
        ObjectEnumerable objStm = SObjectStream.of(clone).flatMapToObject(getCoordinates);
        IObjectEnumerable objStm1 = SObjectStream.of(clone).flatMapToObject(getCoordinates);
        // When
        List<Object> actual = objStm.toList();
        List<Object> actual1 = objStm1.toList();
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
        Assert.isTrue(((ObjectStream) objStm).isOperated);
        Assert.isTrue(((ObjectStream) objStm1).isOperated);
    }

    /**
     * @see SObjectStream.forEach
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
        SObjectEnumerable accStm = SObjectStream.of(clone).forEach(setNewName);
        SObjectEnumerable accStm1 = SObjectStream.of(clone1).forEach(fieldName, value);
        ISObjectEnumerable accStm2 = SObjectStream.of(clone2).forEach(field, value);
        // When
        List<Account> actual = accStm.toList();
        List<Account> actual1 = accStm1.toList();
        List<Account> actual2 = (List<Account>) accStm2.toList();
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Assert.areEqual(value, actual[i].Name);
            Assert.areEqual(value, actual1[i].Name);
            Assert.areEqual(value, actual2[i].Name);
        }
        Assert.areNotEqual(input, clone, Label.AS_ErrorMessage_InputNotMutated);
        Assert.areNotEqual(input, clone1, Label.AS_ErrorMessage_InputNotMutated);
        Assert.areNotEqual(input, clone2, Label.AS_ErrorMessage_InputNotMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
    }

    /**
     * @see SObjectStream.distinct
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
        SObjectEnumerable accStm = SObjectStream.of(clone).distinct();
        SObjectEnumerable accStm1 = SObjectStream.of(clone).withoutNulls().distinct(getNumOfEmployees);
        ISObjectEnumerable accStm2 = SObjectStream.of(clone).withoutNulls().distinct(fieldName);
        ISObjectEnumerable accStm3 = SObjectStream.of(clone).withoutNulls().distinct(field);
        // When
        List<Account> actual = accStm.toList();
        List<Account> actual1 = accStm1.toList();
        List<Account> actual2 = (List<Account>) accStm2.toList();
        List<Account> actual3 = (List<Account>) accStm3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, null, acc4 };
        List<Account> expected1 = new List<Account>{ acc, acc3, acc4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
    }

    /**
     * @see SObjectStream.sort
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
        SObjectEnumerable accStm = SObjectStream.of(clone).sort();
        SObjectEnumerable accStm1 = SObjectStream.of(clone).sort(SortOrder.ASCENDING);
        SObjectEnumerable accStm2 = SObjectStream.of(clone).sort(fieldComparer);
        SObjectEnumerable accStm3 = SObjectStream.of(clone).sort(fieldName);
        ISObjectEnumerable accStm4 = SObjectStream.of(clone).sort(field);
        ISObjectEnumerable accStm5 = SObjectStream.of(clone).sort(fieldName, SortOrder.DESCENDING);
        ISObjectEnumerable accStm6 = SObjectStream.of(clone).sort(field, SortOrder.DESCENDING);
        // When
        List<Account> actual = accStm.toList();
        List<Account> actual1 = accStm1.toList();
        List<Account> actual2 = accStm2.toList();
        List<Account> actual3 = accStm3.toList();
        List<Account> actual4 = (List<Account>) accStm4.toList();
        List<Account> actual5 = (List<Account>) accStm5.toList();
        List<Account> actual6 = (List<Account>) accStm6.toList();
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
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
        Assert.isTrue(((SObjectStream) accStm4).isOperated);
        Assert.isTrue(((SObjectStream) accStm5).isOperated);
        Assert.isTrue(((SObjectStream) accStm6).isOperated);
    }

    /**
     * @see SObjectStream.lim
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
        SObjectEnumerable accStm = SObjectStream.of(clone).lim(25);
        SObjectEnumerable accStm1 = SObjectStream.of(clone).lim(3);
        ISObjectEnumerable accStm2 = SObjectStream.of(clone).lim(0);
        ISObjectEnumerable accStm3 = SObjectStream.of(clone);
        // When
        List<Account> actual = accStm.toList();
        List<Account> actual1 = accStm1.toList();
        List<Account> actual2 = (List<Account>) accStm2.toList();
        Exception exc1;
        try {
            accStm3.lim(-2);
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
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
    }

    /**
     * @see SObjectStream.skip
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
        SObjectEnumerable accStm = SObjectStream.of(clone).skip(5);
        SObjectEnumerable accStm1 = SObjectStream.of(clone).skip(0);
        ISObjectEnumerable accStm2 = SObjectStream.of(clone).skip(25);
        // When
        List<Account> actual = accStm.toList();
        List<Account> actual1 = accStm1.toList();
        List<Account> actual2 = (List<Account>) accStm2.toList();
        Exception exc1;
        try {
            SObjectStream.of(clone).skip(-2);
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
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
    }

    /**
     * @see SObjectStream.reduce
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
        SObjectEnumerable accStm = SObjectStream.of(clone);
        ISObjectEnumerable accStm1 = SObjectStream.of(clone);
        SObjectEnumerable accStm2 = SObjectStream.of(clone);
        ISObjectEnumerable accStm3 = SObjectStream.of(clone);
        // When
        SObject actual = accStm.reduce(seed, maxBy);
        SObject actual1 = (SObject) accStm1.reduce(seed, maxBy);
        SObject actual2 = (SObject) accStm2.reduce(maxBy).get();
        SObject actual3 = (SObject) accStm3.reduce(maxBy).get();
        // Then
        Assert.areEqual(acc3, actual);
        Assert.areEqual(acc3, actual1);
        Assert.areEqual(acc3, actual2);
        Assert.areEqual(acc3, actual3);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectStream.collect
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
        ISObjectEnumerable accStm = SObjectStream.of(clone);
        SObjectEnumerable accStm1 = SObjectStream.of(clone);
        // When
        Set<SObject> actual = (Set<SObject>) accStm.collect(toSetCollector);
        Set<SObject> actual1 = (Set<SObject>) accStm1.collect(Collector.of(sObjectSetSupplier, biConsumer));
        // Then
        Set<SObject> expected = new Set<SObject>{ acc1, acc, acc2, acc3, acc4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
    }

    /**
     * @see SObjectStream.find
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
        ISObjectEnumerable accStm = SObjectStream.of(clone);
        ISObjectEnumerable accStm1 = SObjectStream.of(clone);
        SObjectEnumerable accStm2 = SObjectStream.of(clone);
        ISObjectEnumerable accStm3 = SObjectStream.of(clone);
        // When
        Account actual = (Account) accStm.find(isFieldEqualPredicate).get();
        Account actual1 = (Account) accStm1.find(field, value).get();
        Account actual2 = (Account) accStm2.find(fieldName, value).get();
        Boolean actual3 = accStm3.find(fieldName, value1).isEmpty();
        // Then
        Assert.areEqual(acc2, actual);
        Assert.areEqual(acc2, actual1);
        Assert.areEqual(acc2, actual2);
        Assert.isTrue(actual3);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
    }

    /**
     * @see SObjectStream.every
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
        ISObjectEnumerable accStm = SObjectStream.of(clone);
        ISObjectEnumerable accStm1 = SObjectStream.of(clone);
        SObjectEnumerable accStm2 = SObjectStream.of(clone);
        // When
        Boolean isEveryConNameStartsWithT = accStm.every(isLastNameStartsWith);
        Boolean isEveryConDoNotCall = accStm1.every(AsTestConsts.Contact.DoNotCall, value1);
        Boolean isEveryConFinanceDepartment = accStm2.every(AsTestConsts.DEPARTMENT, value2);
        // Then
        Assert.areEqual(true, isEveryConNameStartsWithT);
        Assert.areEqual(false, isEveryConDoNotCall);
        Assert.areEqual(false, isEveryConFinanceDepartment);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
    }

    /**
     * @see SObjectStream.some
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
        ISObjectEnumerable accStm = SObjectStream.of(clone);
        ISObjectEnumerable accStm1 = SObjectStream.of(clone);
        SObjectEnumerable accStm2 = SObjectStream.of(clone);
        // When
        Boolean isSomeConNameStartsWithA = accStm.some(isLastNameStartsWith);
        Boolean isSomeConDoNotCall = accStm1.some(AsTestConsts.Contact.DoNotCall, value1);
        Boolean isSomeConHR = accStm2.some(AsTestConsts.DEPARTMENT, value2);
        // Then
        Assert.areEqual(false, isSomeConNameStartsWithA);
        Assert.areEqual(true, isSomeConDoNotCall);
        Assert.areEqual(false, isSomeConHR);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
    }

    /**
     * @see SObjectStream.none
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
        ISObjectEnumerable accStm = SObjectStream.of(clone);
        ISObjectEnumerable accStm1 = SObjectStream.of(clone);
        SObjectEnumerable accStm2 = SObjectStream.of(clone);
        // When
        Boolean isSomeConNameStartsWithA = accStm.none(isLastNameStartsWith);
        Boolean isSomeConDoNotCall = accStm1.none(AsTestConsts.Contact.DoNotCall, value1);
        Boolean isSomeConHR = accStm2.none(AsTestConsts.DEPARTMENT, value2);
        // Then
        Assert.areEqual(true, isSomeConNameStartsWithA);
        Assert.areEqual(false, isSomeConDoNotCall);
        Assert.areEqual(true, isSomeConHR);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
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
        ISObjectEnumerable accStm = SObjectStream.of(clone);
        ISObjectEnumerable accStm1 = SObjectStream.of(clone);
        SObjectEnumerable accStm2 = SObjectStream.of(clone);
        // When
        Account actual = (Account) accStm.max(fieldComparer).get();
        Account actual1 = (Account) accStm1.max(fieldName).get();
        Account actual2 = (Account) accStm2.max(field).get();
        // Then
        Assert.areEqual(acc3, actual);
        Assert.areEqual(acc3, actual1);
        Assert.areEqual(acc3, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
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
        ISObjectEnumerable accStm = SObjectStream.of(clone);
        ISObjectEnumerable accStm1 = SObjectStream.of(clone);
        SObjectEnumerable accStm2 = SObjectStream.of(clone);
        // When
        Account actual = (Account) accStm.min(fieldComparer).get();
        Account actual1 = (Account) accStm1.min(fieldName).get();
        Account actual2 = (Account) accStm2.min(field).get();
        // Then
        Assert.areEqual(acc4, actual);
        Assert.areEqual(acc4, actual1);
        Assert.areEqual(acc4, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
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
        SObjectEnumerable accStm = SObjectStream.of(clone).filter(hasFieldValue);
        SObjectEnumerable accStm1 = SObjectStream.of(clone).filter(hasFieldValue);
        ISObjectEnumerable accStm2 = SObjectStream.of(clone).filter(hasFieldValue);
        // When
        Double actual = (Double) accStm.sum(getAsDouble);
        Double actual1 = (Double) accStm1.sum(fieldName);
        Double actual2 = (Double) accStm2.sum(field);
        // Then
        Integer expected = 700;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
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
        SObjectEnumerable accStm = SObjectStream.of(clone).filter(hasFieldValue);
        SObjectEnumerable accStm1 = SObjectStream.of(clone).filter(hasFieldValue);
        ISObjectEnumerable accStm2 = SObjectStream.of(clone).filter(hasFieldValue);
        // When
        Double actual = (Double) accStm.avg(getAsDouble).get();
        Double actual1 = (Double) accStm1.avg(fieldName).get();
        Double actual2 = (Double) accStm2.avg(field).get();
        // Then
        Double expected = 700 / 5;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
    }

    /**
     * @see SObjectStream.count
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
        SObjectEnumerable accStm = SObjectStream.of(input);
        SObjectEnumerable accStm1 = SObjectStream.of(new List<SObject>());
        ISObjectEnumerable accStm2 = SObjectStream.empty();
        // When
        Integer actual = accStm.count();
        Integer actual1 = accStm1.count();
        Integer actual2 = accStm2.count();
        // Then
        Assert.areEqual(input.size(), actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
    }

    /**
     * @see SObjectStream.isEmpty
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
        SObjectEnumerable accStm = SObjectStream.of(clone);
        SObjectEnumerable accStm1 = SObjectStream.of(new List<SObject>());
        ISObjectEnumerable accStm2 = SObjectStream.empty();
        // When
        Boolean actual = accStm.isEmpty();
        Boolean actual1 = accStm1.isEmpty();
        Boolean actual2 = accStm2.isEmpty();
        // Then
        Assert.areEqual(input.isEmpty(), actual);
        Assert.isTrue(actual1);
        Assert.isTrue(actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
    }

    /**
     * @see SObjectStream.toList
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
        SObjectEnumerable accStm = SObjectStream.of(clone);
        SObjectEnumerable accStm1 = SObjectStream.of(clone).withoutNulls();
        SObjectEnumerable accStm2 = SObjectStream.of(clone).withoutNulls();
        SObjectEnumerable accStm3 = SObjectStream.of(clone).withoutNulls();
        ISObjectEnumerable accStm4 = SObjectStream.of(clone).withoutNulls();
        ISObjectEnumerable accStm5 = SObjectStream.of(clone).withoutNulls();
        ISObjectEnumerable accStm6 = SObjectStream.of(clone).withoutNulls();
        // When
        List<Account> actual = accStm.toList();
        List<Integer> actual1 = (List<Integer>) accStm1.toList(BaseSObjectFunctions.get('NumberOfEmployees'), Integer.class);
        List<Integer> actual2 = (List<Integer>) accStm2.toList('NumberOfEmployees', Integer.class);
        List<Integer> actual3 = (List<Integer>) accStm3.toList(Account.NumberOfEmployees, Integer.class);
        List<Object> actual4 = accStm4.toList(BaseSObjectFunctions.get('NumberOfEmployees'));
        List<Object> actual5 = accStm5.toList('NumberOfEmployees');
        List<Object> actual6 = accStm6.toList(Account.NumberOfEmployees);
        // Then
        List<Integer> expected = (List<Integer>) SObjectStream.of(clone)
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
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
        Assert.isTrue(((SObjectStream) accStm4).isOperated);
        Assert.isTrue(((SObjectStream) accStm5).isOperated);
        Assert.isTrue(((SObjectStream) accStm6).isOperated);
    }

    /**
     * @see SObjectStream.toSet
     * @see SObjectStream.toIdSet
     * @see SObjectStream.toStringSet
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
        SObjectEnumerable accStm = SObjectStream.of(clone);
        SObjectEnumerable accStm1 = SObjectStream.of(clone).withoutNulls();
        SObjectEnumerable accStm2 = SObjectStream.of(clone).withoutNulls();
        SObjectEnumerable accStm3 = SObjectStream.of(clone).withoutNulls();
        SObjectEnumerable accStm4 = SObjectStream.of(clone).withoutNulls();
        SObjectEnumerable accStm5 = SObjectStream.of(clone).withoutNulls();
        ISObjectEnumerable accStm6 = SObjectStream.of(clone).withoutNulls();
        ISObjectEnumerable accStm7 = SObjectStream.of(clone).withoutNulls();
        ISObjectEnumerable accStm8 = SObjectStream.of(clone).withoutNulls();
        ISObjectEnumerable accStm9 = SObjectStream.of(clone).withoutNulls();
        ISObjectEnumerable accStm10 = SObjectStream.of(clone).withoutNulls();
        // When
        Set<SObject> actual = accStm.toSet();
        Set<Id> actual1 = accStm1.toIdSet();
        Set<Id> actual2 = accStm2.toIdSet(BaseSObjectFunctions.get('Id'));
        Set<Id> actual3 = accStm3.toIdSet('Id');
        Set<Id> actual4 = accStm4.toIdSet(Account.Id);
        Set<String> actual5 = accStm5.toStringSet(BaseSObjectFunctions.get('Name'));
        Set<String> actual6 = accStm6.toStringSet('Name');
        Set<String> actual7 = accStm7.toStringSet(Account.Name);
        Set<Object> actual8 = (Set<Object>) accStm8.toSet(BaseSObjectFunctions.get('Name'));
        Set<Object> actual9 = (Set<Object>) accStm9.toSet('Name');
        Set<Object> actual10 = (Set<Object>) accStm10.toSet(Account.Name);
        // Then
        Set<SObject> expected = new Set<SObject>{ acc1, acc, acc2, null, acc3, acc4 };
        Set<Id> expected1 = (Set<Id>) SObjectStream.of(clone)
            .withoutNulls()
            .collect(Collector.of(Supplier.of(Set<Id>.class), new AsTestCommons.AddToIdSet(BaseSObjectFunctions.get(Account.Id))));
        Set<String> expected2 = (Set<String>) SObjectStream.of(clone)
            .withoutNulls()
            .collect(Collector.of(Supplier.of(Set<String>.class), new AsTestCommons.AddToStringSet(BaseSObjectFunctions.get(Account.Name))));
        Set<Object> expected3 = (Set<Object>) SObjectStream.of(clone)
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
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
        Assert.isTrue(((SObjectStream) accStm4).isOperated);
        Assert.isTrue(((SObjectStream) accStm5).isOperated);
        Assert.isTrue(((SObjectStream) accStm6).isOperated);
        Assert.isTrue(((SObjectStream) accStm7).isOperated);
        Assert.isTrue(((SObjectStream) accStm8).isOperated);
        Assert.isTrue(((SObjectStream) accStm9).isOperated);
        Assert.isTrue(((SObjectStream) accStm10).isOperated);
    }

    /**
     * @see SObjectStream.toMap
     * @see SObjectStream.toByIdMap
     * @see SObjectStream.toByStringMap
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
        SObjectEnumerable accStm = SObjectStream.of(clone);
        SObjectEnumerable accStm1 = SObjectStream.of(clone);
        SObjectEnumerable accStm2 = SObjectStream.of(clone);
        SObjectEnumerable accStm3 = SObjectStream.of(clone);
        ISObjectEnumerable accStm4 = SObjectStream.of(clone);
        ISObjectEnumerable accStm5 = SObjectStream.of(clone);
        ISObjectEnumerable accStm6 = SObjectStream.of(clone);
        // When
        Map<Id, SObject> actual = accStm.toMap();
        Map<Id, Account> actual1 = (Map<Id, Account>) accStm1.toByIdMap(BaseSObjectFunctions.get('Id'), Account.class);
        Map<Id, Account> actual2 = (Map<Id, Account>) accStm2.toByIdMap('Id', Account.class);
        Map<Id, Account> actual3 = (Map<Id, Account>) accStm3.toByIdMap(Account.Id, Account.class);
        Map<String, Account> actual4 = (Map<String, Account>) accStm4.toByStringMap(BaseSObjectFunctions.get('Name'), Account.class);
        Map<String, Account> actual5 = (Map<String, Account>) accStm5.toByStringMap('Name', Account.class);
        Map<String, Account> actual6 = (Map<String, Account>) accStm6.toByStringMap(Account.Name, Account.class);
        // Then
        Map<Id, Account> expected = new Map<Id, Account>(input);
        Map<Id, Account> expected1 = (Map<Id, Account>) SObjectStream.of(clone)
            .collect(
                Collector.of(
                    Supplier.of(Map<Id, Account>.class),
                    new AsTestCommons.PutToObjectByIdMap(BaseSObjectFunctions.get(Account.Id), Function.identity(), null)
                ).cast(Map<Id, Account>.class)
            );
        Map<String, Account> expected2 = (Map<String, Account>) SObjectStream.of(clone)
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
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
        Assert.isTrue(((SObjectStream) accStm4).isOperated);
        Assert.isTrue(((SObjectStream) accStm5).isOperated);
        Assert.isTrue(((SObjectStream) accStm6).isOperated);
    }

    /**
     * @see SObjectStream.groupById
     * @see SObjectStream.groupByString
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
        SObjectEnumerable accStm = SObjectStream.of(clone);
        ISObjectEnumerable accStm1 = SObjectStream.of(clone);
        SObjectEnumerable accStm2 = SObjectStream.of(clone);
        ISObjectEnumerable accStm3 = SObjectStream.of(clone);
        SObjectEnumerable accStm4 = SObjectStream.of(clone);
        ISObjectEnumerable accStm5 = SObjectStream.of(clone);
        // When
        Map<Id, List<Account>> actual = accStm.groupById(BaseSObjectFunctions.get('ParentId'));
        Map<Id, List<Account>> actual2 = accStm1.groupById('ParentId');
        Map<Id, List<Account>> actual3 = accStm2.groupById(Account.ParentId);
        Map<String, List<Account>> actual4 = accStm3.groupByString(BaseSObjectFunctions.get('Rating'));
        Map<String, List<Account>> actual5 = accStm4.groupByString('Rating');
        Map<String, List<Account>> actual6 = accStm5.groupByString(Account.Rating);
        // Then
        Map<Id, List<Account>> expected = (Map<Id, List<Account>>) SObjectStream.of(clone)
            .collect(
                Collector.of(
                    Supplier.of(Map<Id, List<Account>>.class),
                    new AsTestCommons.PutToObjectsByIdMap(BaseCollectors.toList(), BaseSObjectFunctions.get(Account.ParentId)),
                    new AsTestCommons.GroupByIdFinisher(null)
                ).cast(Map<Id, List<Account>>.class)
            );
        Map<String, List<Account>> expected1 = (Map<String, List<Account>>) SObjectStream.of(clone)
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
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
        Assert.isTrue(((SObjectStream) accStm3).isOperated);
        Assert.isTrue(((SObjectStream) accStm4).isOperated);
        Assert.isTrue(((SObjectStream) accStm5).isOperated);
    }

    /**
     * @see SObjectStream.partition
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
        SObjectEnumerable accStm = SObjectStream.of(clone);
        SObjectEnumerable accStm1 = SObjectStream.of(clone);
        ISObjectEnumerable accStm2 = SObjectStream.of(clone);
        // When
        Map<Boolean, List<Account>> actual = accStm.partition(predicate);
        Map<Boolean, List<Account>> actual1 = accStm1.partition('NumberOfEmployees', 100);
        Map<Boolean, List<Account>> actual2 = accStm2.partition(Account.NumberOfEmployees, 100);
        // Then
        Map<Boolean, List<Account>> expected = (Map<Boolean, List<Account>>) SObjectStream.of(clone)
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
        Assert.isTrue(((SObjectStream) accStm).isOperated);
        Assert.isTrue(((SObjectStream) accStm1).isOperated);
        Assert.isTrue(((SObjectStream) accStm2).isOperated);
    }

}
