/**
 * @see SObjectStream
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectStreamTest {

    private static final List<Account> ACCOUNTS = IterTestUtils.generateAccounts1();

    /**
     * @see SObjectStream.of
     * @see SObjectStream.ofNullable
     * @see SObjectStream.empty
     * @see SObjectStream.iterator
     * @see SObjectStream.sequence
     */
    @IsTest
    static void of() {
        // Given
        ACCOUNTS.add(0, null);
        ACCOUNTS.add(null);
        List<SObject> input = ACCOUNTS.deepClone();
        List<Contact> input1;
        Set<SObject> input2;
        ISObjectIterable accStream = SObjectStream.of(input);
        ISObjectIterable accStream1 = SObjectStream.of((Iterable<Account>) new Set<SObject>(input));
        ISObjectIterable accStream2 = SObjectStream.ofNullable(input);
        ISObjectIterable accStream3 = SObjectStream.ofNullable((Iterable<Account>) new Set<SObject>(input));
        ISObjectIterable accStream4 = SObjectStream.ofNullable(input1);
        ISObjectIterable accStream5 = SObjectStream.ofNullable((Iterable<Account>) input2);
        ISObjectIterable accStream6 = SObjectStream.of(input.iterator());
        ISObjectIterable accSeq = ((SObjectStream) SObjectStream.of(input)).sequence();
        // When
        List<Account> actual = accStream.toList();
        List<Account> actual1 = accStream1.toList();
        List<Account> actual2 = accStream2.toList();
        List<Account> actual3 = accStream3.toList();
        List<Account> actual4 = accStream4.toList();
        List<Account> actual5 = accStream5.toList();
        List<Account> actual6 = accStream6.toList();
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
        Assert.areEqual(false, accSeq.isEmpty());
        Assert.areEqual(ACCOUNTS, input, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
        Assert.isTrue(((SObjectStream) accStream4).isOperated);
        Assert.isTrue(((SObjectStream) accStream5).isOperated);
        Assert.isTrue(((SObjectStream) accStream6).isOperated);
    }

    /**
     * @see SObjectStream.generate
     */
    @IsTest
    private static void generate() {
        // Given
        ISObjectSupplier accGenerator = new IterTestUtils.TestAccountGenerator();
        Integer lim = 10;
        ISObjectIterable accStream = SObjectStream.generate(accGenerator).lim(lim);
        // When
        List<Account> actual = accStream.toList();
        // Then
        Assert.areEqual(lim, actual.size());
        for (Integer i = 0, size = actual.size(); i < size; i++) {
            Assert.areEqual('Test' + i, actual[i].Name);
            Assert.areEqual(100 * i, actual[i].NumberOfEmployees);
        }
        Assert.isTrue(((SObjectStream) accStream).isOperated);
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
        ISObjectPredicate predicate = SObjectPredicates.isLessOrEqual('NumberOfEmployees', 3600);
        ISObjectUnaryOperator accIterator = new IterTestUtils.TestAccountIterate();
        ISObjectUnaryOperator accIterator1 = new IterTestUtils.TestAccountIterate();
        ISObjectIterable accStream = SObjectStream.iterate(seed, accIterator).lim(lim);
        ISObjectIterable accStream1 = SObjectStream.iterate(seed1, predicate, accIterator1);
        // When
        List<Account> actual = accStream.toList();
        List<Account> actual1 = accStream1.toList();
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
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
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
        ISObjectIterable accStream = SObjectStream.of(input);
        ISObjectIterable accStream1 = SObjectStream.of(input1);
        ISObjectIterable accStream2 = SObjectStream.of(input);
        ISObjectIterable accStream3 = SObjectStream.of(input1);
        ISObjectIterable accStream4 = SObjectStream.of(input2);
        // When
        List<Account> actual = SObjectStream.concat(accStream, accStream1).toList();
        List<Account> actual1 = SObjectStream.concat(new List<ISObjectIterable>{ accStream2, accStream3, accStream4 }).toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5 };
        List<Account> expected1 = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5, acc6 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
        Assert.isTrue(((SObjectStream) accStream4).isOperated);
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
        ISObjectBinaryOperator maxNumber = SObjectBinaryOperator.maxBy(SObjectComparator.comparing(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES));
        ISObjectIterable oldAccsSteam = SObjectStream.of(oldList);
        ISObjectIterable oldAccsSteam1 = SObjectStream.of(oldList);
        ISObjectIterable newAccsSteam = SObjectStream.of(newList);
        ISObjectIterable newAccsSteam1 = SObjectStream.of(newList);
        ISObjectBiPredicate numOfEmployeesIsChanged = SObjectBiPredicates.areNotEqual(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES);
        ISObjectBinaryOperator getNewAcc = SObjectBinaryOperator.right();
        ISObjectIterable accStream = SObjectStream.zip(oldAccsSteam, newAccsSteam, maxNumber);
        ISObjectIterable accStream1 = SObjectStream.zip(oldAccsSteam1, newAccsSteam1, numOfEmployeesIsChanged, getNewAcc);
        // When
        List<Account> actual = accStream.toList();
        List<Account> actual1 = accStream1.toList();
        // Then
        List<Account> expected = new List<Account>{ oldAcc, oldAcc1, newAcc2, oldAcc3 };
        List<Account> expected1 = new List<Account>{ newAcc1, newAcc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((SObjectStream) oldAccsSteam).isOperated);
        Assert.isTrue(((SObjectStream) oldAccsSteam1).isOperated);
        Assert.isTrue(((SObjectStream) newAccsSteam).isOperated);
        Assert.isTrue(((SObjectStream) newAccsSteam1).isOperated);
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
        ISObjectIterable accStream = SObjectStream.of(input);
        ISObjectIterable accStream1 = SObjectStream.of(input);
        ISObjectIterable accStream2 = SObjectStream.of(input1);
        ISObjectIterable accStream3 = SObjectStream.of(input1);
        ISObjectIterable accStream4 = accStream.append(accStream2);
        ISObjectIterable accStream5 = accStream1.prepend(accStream3);
        // When
        List<Account> actual = accStream4.toList();
        List<Account> actual1 = accStream5.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc5 };
        List<Account> expected1 = new List<Account>{ acc3, acc4, acc5, acc, acc1, acc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
        Assert.isTrue(((SObjectStream) accStream4).isOperated);
        Assert.isTrue(((SObjectStream) accStream5).isOperated);
    }

    /**
     * @see SObjectIterable.union
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
        ISObjectFunction getName = SObjectFunctions.get(IterTestUtils.CONSTS.NAME);
        String fieldName = IterTestUtils.CONSTS.NAME;
        SObjectField field = IterTestUtils.CONSTS.Account.Name;
        ISObjectIterable stream = SObjectStream.of(input).union(input1);
        ISObjectIterable stream1 = SObjectStream.of(input).union(SObjectStream.of(input1));
        ISObjectIterable stream2 = SObjectStream.of(input).union(input1, getName);
        ISObjectIterable stream3 = SObjectStream.of(input).union(input1, fieldName);
        ISObjectIterable stream4 = SObjectStream.of(input).union(input1, field);
        // When
        List<Account> actual = stream.toList();
        List<Account> actual1 = stream1.toList();
        List<Account> actual2 = stream2.toList();
        List<Account> actual3 = stream3.toList();
        List<Account> actual4 = stream4.toList();
        // Then
        List<Account> expected = new List<Account>{ acc5, acc3, acc9, acc7, acc8, acc6, acc4, acc1, acc, acc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Assert.isTrue(((SObjectStream) stream).isOperated);
        Assert.isTrue(((SObjectStream) stream1).isOperated);
        Assert.isTrue(((SObjectStream) stream2).isOperated);
        Assert.isTrue(((SObjectStream) stream3).isOperated);
        Assert.isTrue(((SObjectStream) stream4).isOperated);
    }

    /**
     * @see SObjectIterable.intersect
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
        ISObjectFunction getName = SObjectFunctions.get(IterTestUtils.CONSTS.NAME);
        String fieldName = IterTestUtils.CONSTS.NAME;
        SObjectField field = IterTestUtils.CONSTS.Account.Name;
        ISObjectIterable stream = SObjectStream.of(input).intersect(input1);
        ISObjectIterable stream1 = SObjectStream.of(input).intersect(SObjectStream.of(input1));
        ISObjectIterable stream2 = SObjectStream.of(input).intersect(input1, getName);
        ISObjectIterable stream3 = SObjectStream.of(input).intersect(input1, fieldName);
        ISObjectIterable stream4 = SObjectStream.of(input).intersect(input1, field);
        // When
        List<Account> actual = stream.toList();
        List<Account> actual1 = stream1.toList();
        List<Account> actual2 = stream2.toList();
        List<Account> actual3 = stream3.toList();
        List<Account> actual4 = stream4.toList();
        // Then
        List<Account> expected = new List<Account>{ acc3, acc9 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Assert.isTrue(((SObjectStream) stream).isOperated);
        Assert.isTrue(((SObjectStream) stream1).isOperated);
        Assert.isTrue(((SObjectStream) stream2).isOperated);
        Assert.isTrue(((SObjectStream) stream3).isOperated);
        Assert.isTrue(((SObjectStream) stream4).isOperated);
    }

    /**
     * @see SObjectIterable.except
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
        ISObjectFunction getName = SObjectFunctions.get(IterTestUtils.CONSTS.NAME);
        String fieldName = IterTestUtils.CONSTS.NAME;
        SObjectField field = IterTestUtils.CONSTS.Account.Name;
        ISObjectIterable stream = SObjectStream.of(input).except(input1);
        ISObjectIterable stream1 = SObjectStream.of(input).except(SObjectStream.of(input1));
        ISObjectIterable stream2 = SObjectStream.of(input).except(input1, getName);
        ISObjectIterable stream3 = SObjectStream.of(input).except(input1, fieldName);
        ISObjectIterable stream4 = SObjectStream.of(input).except(input1, field);
        // When
        List<Account> actual = stream.toList();
        List<Account> actual1 = stream1.toList();
        List<Account> actual2 = stream2.toList();
        List<Account> actual3 = stream3.toList();
        List<Account> actual4 = stream4.toList();
        // Then
        List<Account> expected = new List<Account>{ acc5, acc7 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Assert.isTrue(((SObjectStream) stream).isOperated);
        Assert.isTrue(((SObjectStream) stream1).isOperated);
        Assert.isTrue(((SObjectStream) stream2).isOperated);
        Assert.isTrue(((SObjectStream) stream3).isOperated);
        Assert.isTrue(((SObjectStream) stream4).isOperated);
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
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        Integer value = 200;
        ISObjectPredicate isFieldEqual = SObjectPredicates.isEqual(fieldName, value);
        ISObjectPredicate isFieldEqual1 = SObjectPredicates.isEqual(field, value);
        ISObjectIterable accStream = SObjectStream.of(input).filter(fieldName, value);
        ISObjectIterable accStream1 = SObjectStream.of(input).filter(field, value);
        ISObjectIterable accStream2 = SObjectStream.of(input).filter(isFieldEqual);
        ISObjectIterable accStream3 = SObjectStream.of(input).filter(isFieldEqual1);
        // When
        List<Account> actual = accStream.toList();
        List<Account> actual1 = accStream1.toList();
        List<Account> actual2 = accStream2.toList();
        List<Account> actual3 = accStream3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc1, acc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
    }

    /**
     * @see SObjectStream.take
     */
    @IsTest
    private static void take() {
        // Given
        Account acc = new Account(Name = 'Test Acc', NumberOfEmployees = 200, AnnualRevenue = 50000);
        Account acc1 = new Account(Name = 'Test Acc1', NumberOfEmployees = 200);
        Account acc2 = new Account(Name = 'Test Acc2', NumberOfEmployees = 200);
        Account acc3 = new Account(Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc, acc1, acc2, acc3, acc4 };
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        Integer value = 200;
        ISObjectPredicate isFieldEqual = SObjectPredicates.isEqual(fieldName, value);
        SObjectPredicate isFieldEqual1 = SObjectPredicates.isEqual(field, value);
        ISObjectIterable accStream = SObjectStream.of(input).take(fieldName, value);
        ISObjectIterable accStream1 = SObjectStream.of(input).take(field, value);
        ISObjectIterable accStream2 = SObjectStream.of(input).take(isFieldEqual);
        ISObjectIterable accStream3 = SObjectStream.of(input).take(isFieldEqual1);
        ISObjectIterable accStream4 = SObjectStream.of(input).take(isFieldEqual1.andAlso(SObjectPredicates.has(Account.AnnualRevenue)));
        // When
        List<Account> actual = accStream.toList();
        List<Account> actual1 = accStream1.toList();
        List<Account> actual2 = accStream2.toList();
        List<Account> actual3 = accStream3.toList();
        Iterator<Account> iterator = (Iterator<Account>) accStream4.iterator();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(input[0], iterator.next());
        try {
            iterator.next();
        } catch (Exception exc) {
            Assert.areEqual(NoSuchElementException.class.getName(), exc.getTypeName());
        }
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
        Assert.isTrue(((SObjectStream) accStream4).isOperated);
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
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        Integer value = 200;
        ISObjectPredicate isFieldEqual = SObjectPredicates.isEqual(fieldName, value);
        ISObjectPredicate isFieldEqual1 = SObjectPredicates.isEqual(field, value);
        ISObjectIterable accStream = SObjectStream.of(input).drop(fieldName, value);
        ISObjectIterable accStream1 = SObjectStream.of(input).drop(field, value);
        ISObjectIterable accStream2 = SObjectStream.of(input).drop(isFieldEqual);
        ISObjectIterable accStream3 = SObjectStream.of(input).drop(isFieldEqual1);
        // When
        List<Account> actual = accStream.toList();
        List<Account> actual1 = accStream1.toList();
        List<Account> actual2 = accStream2.toList();
        List<Account> actual3 = accStream3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc3, acc4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        // When
        List<Account> actual = SObjectStream.of(clone).withoutNulls().toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, acc4, acc1 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see SObjectStream.mapTo
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
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Contact.Description;
        String fieldName1 = IterTestUtils.CONSTS.PARENT;
        SObjectField field1 = IterTestUtils.CONSTS.Account.ParentId;
        String value = 'Value';
        ISObjectFunction getConstFunction = SObjectFunction.constant(value);
        ISObjectFunction getIdByRightFunction = SObjectFunctions.get(IterTestUtils.CONSTS.ID);
        ISObjectFunction getAccountIdByRightFunction = SObjectFunctions.get(Account.Id);
        ISObjectFunction getAccNameByRightFunction = SObjectFunctions.get(IterTestUtils.CONSTS.Account.Name);
        SObjectBiConsumer setIdByFunctionBiConsumer = SObjectBiConsumers.set(IterTestUtils.CONSTS.ACCOUNT_ID, getIdByRightFunction);
        SObjectBiConsumer setDescriptionByFunctionBiConsumer = SObjectBiConsumers.set(field, getAccNameByRightFunction);
        ISObjectBiConsumer biConsumer = setIdByFunctionBiConsumer.andThen(setDescriptionByFunctionBiConsumer);
        ISObjectBinaryOperator binaryOperator = SObjectBinaryOperator.forBiConsumer(biConsumer);
        SObjectUnaryOperator createNewContactOperator = SObjectUnaryOperators.newSObject(Contact.SObjectType, binaryOperator);
        SObjectUnaryOperator setDepartmentByConstFunction = SObjectUnaryOperators.set(IterTestUtils.CONSTS.Contact.Department, getConstFunction);
        ISObjectUnaryOperator operator = createNewContactOperator.andThen(setDepartmentByConstFunction);
        ISObjectUnaryOperator createNewContactFromAccount = SObjectUnaryOperators.newSObject(
                Contact.SObjectType, IterTestUtils.CONSTS.Contact.AccountId, getAccountIdByRightFunction
        );

        ISObjectIterable conStream = SObjectStream.of(clone).mapTo(createNewContactFromAccount);
        ISObjectIterable conStream1 = SObjectStream.of(clone).mapTo(field1);
        ISObjectIterable conStream2 = SObjectStream.of(clone).mapTo(fieldName1);
        ISObjectIterable conStream3 = SObjectStream.of(clone).mapTo(operator);
        // When
        List<Contact> actual = conStream.toList();
        List<Account> actual1 = conStream1.toList();
        List<Account> actual2 = conStream2.toList();
        List<Contact> actual3 = conStream3.toList();
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
        Assert.isTrue(((SObjectStream) conStream).isOperated);
        Assert.isTrue(((SObjectStream) conStream1).isOperated);
        Assert.isTrue(((SObjectStream) conStream2).isOperated);
        Assert.isTrue(((SObjectStream) conStream3).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectToIntFunction getNumOfEmployeesAsInt = SObjectToIntFunctions.get(field);
        IIntIterable intStream = SObjectStream.of(clone).mapToInt(getNumOfEmployeesAsInt);
        IIntIterable intStream1 = SObjectStream.of(clone).mapToInt(fieldName);
        IIntIterable intStream2 = SObjectStream.of(clone).mapToInt(field);
        // When
        List<Integer> actual = intStream.toList();
        List<Integer> actual1 = intStream1.toList();
        List<Integer> actual2 = intStream2.toList();
        // Then
        List<Integer> expected = new List<Integer>{ 200, 200, 200, 400, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) intStream).isOperated);
        Assert.isTrue(((IntStream) intStream1).isOperated);
        Assert.isTrue(((IntStream) intStream2).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectToLongFunction getNumOfEmployeesAsLong = SObjectToLongFunctions.get(field);
        ILongIterable longStream = SObjectStream.of(clone).mapToLong(getNumOfEmployeesAsLong);
        ILongIterable longStream1 = SObjectStream.of(clone).mapToLong(fieldName);
        ILongIterable longStream2 = SObjectStream.of(clone).mapToLong(field);
        // When
        List<Long> actual = longStream.toList();
        List<Long> actual1 = longStream1.toList();
        List<Long> actual2 = longStream2.toList();
        // Then
        List<Long> expected = new List<Long>{ 200L, 200L, 200L, 400L, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) longStream).isOperated);
        Assert.isTrue(((LongStream) longStream1).isOperated);
        Assert.isTrue(((LongStream) longStream2).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Account.AnnualRevenue;
        String fieldName = IterTestUtils.CONSTS.ANNUAL_REVENUE;
        ISObjectToDoubleFunction getNumOfEmployeesAsDouble = SObjectToDoubleFunctions.get(field);
        IDoubleIterable doubleStream = SObjectStream.of(clone).mapToDouble(getNumOfEmployeesAsDouble);
        IDoubleIterable doubleStream1 = SObjectStream.of(clone).mapToDouble(fieldName);
        IDoubleIterable doubleStream2 = SObjectStream.of(clone).mapToDouble(field);
        // When
        List<Double> actual = doubleStream.toList();
        List<Double> actual1 = doubleStream1.toList();
        List<Double> actual2 = doubleStream2.toList();
        // Then
        List<Double> expected = new List<Double>{ 20000.0, 10000.5, 40000.4, 2581.9, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) doubleStream).isOperated);
        Assert.isTrue(((DoubleStream) doubleStream1).isOperated);
        Assert.isTrue(((DoubleStream) doubleStream2).isOperated);
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
        List<Contact> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Contact.Birthdate;
        String fieldName = IterTestUtils.CONSTS.BIRTHDATE;
        ISObjectFunction getBirthday = SObjectFunctions.get(field);
        IObjectIterable objStream = SObjectStream.of(clone).mapToObject(getBirthday);
        IObjectIterable objStream1 = SObjectStream.of(clone).mapToObject(fieldName);
        IObjectIterable objStream2 = SObjectStream.of(clone).mapToObject(field);
        // When
        List<Date> actual = (List<Date>) objStream.toList(List<Date>.class);
        List<Date> actual1 = (List<Date>) objStream1.toList(List<Date>.class);
        List<Date> actual2 = (List<Date>) objStream2.toList(List<Date>.class);
        // Then
        List<Date> expected = new List<Date>{ d, d1, d2, d3, null };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) objStream).isOperated);
        Assert.isTrue(((ObjectStream) objStream1).isOperated);
        Assert.isTrue(((ObjectStream) objStream2).isOperated);
    }

    /**
     * @see SObjectStream.flatMapTo
     */
    @IsTest
    private static void flatMapTo() {
        // Given
        List<Account> input = IterTestUtils.generateAccounts();
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Contact.AccountId;
        String fieldName = IterTestUtils.CONSTS.CONTACTS;
        ISObjectFunction getContacts = SObjectFunctions.getSObjects(field);
        ISObjectIterable conStream = SObjectStream.of(clone).flatMapTo(getContacts);
        ISObjectIterable conStream1 = SObjectStream.of(clone).flatMapTo(fieldName);
        ISObjectIterable conStream2 = SObjectStream.of(clone).flatMapTo(field);
        // When
        List<Contact> actual = conStream.toList();
        List<Contact> actual1 = conStream1.toList();
        List<Contact> actual2 = conStream2.toList();
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
        Assert.isTrue(((SObjectStream) conStream).isOperated);
        Assert.isTrue(((SObjectStream) conStream1).isOperated);
        Assert.isTrue(((SObjectStream) conStream2).isOperated);
    }

    /**
     * @see SObjectStream.flatMapToInt
     */
    @IsTest
    private static void flatMapToInt() {
        // Given
        List<Account> input = IterTestUtils.generateAccounts();
        List<Account> clone = IterTestUtils.deepClone(input);
        String relationshipFieldName = IterTestUtils.CONSTS.CONTACTS;
        String fieldName = IterTestUtils.CONSTS.LAST_NAME;
        ISObjectFunction getFieldsLength = new IterTestUtils.GetFieldsLength(relationshipFieldName, fieldName);
        IIntIterable intStream = SObjectStream.of(clone).flatMapToInt(getFieldsLength);
        // When
        List<Integer> actual = intStream.toList();
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
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((IntStream) intStream).isOperated);
    }

    /**
     * @see SObjectStream.flatMapToLong
     */
    @IsTest
    private static void flatMapToLong() {
        // Given
        List<Account> input = IterTestUtils.generateAccounts();
        List<Account> clone = IterTestUtils.deepClone(input);
        String relationshipFieldName = IterTestUtils.CONSTS.CONTACTS;
        String fieldName = IterTestUtils.CONSTS.LAST_NAME;
        ISObjectFunction getFieldsLength = new IterTestUtils.GetFieldsLength(relationshipFieldName, fieldName);
        ILongIterable longStream = SObjectStream.of(clone).flatMapToLong(getFieldsLength);
        // When
        List<Long> actual = longStream.toList();
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
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((LongStream) longStream).isOperated);
    }

    /**
     * @see SObjectStream.flatMapToDouble
     */
    @IsTest
    private static void flatMapToDouble() {
        // Given
        List<Account> input = IterTestUtils.generateAccounts();
        List<Account> clone = IterTestUtils.deepClone(input);
        String fieldName1 = IterTestUtils.CONSTS.BILLING_LATITUDE;
        String fieldName2 = IterTestUtils.CONSTS.BILLING_LONGITUDE;
        ISObjectFunction getCoordinates = new IterTestUtils.GetDoublePair(fieldName1, fieldName2);
        IDoubleIterable doubleStream = SObjectStream.of(clone).flatMapToDouble(getCoordinates);
        // When
        List<Double> actual = doubleStream.toList();
        // Then
        List<Double> expected = new List<Double>();
        for (Account acc : input) {
            Double value1 = (Double) acc.get(fieldName1);
            Double value2 = (Double) acc.get(fieldName2);
            expected.add(value1);
            expected.add(value2);
        }
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((DoubleStream) doubleStream).isOperated);
    }

    /**
     * @see SObjectStream.flatMapToObject
     */
    @IsTest
    private static void flatMapToObject() {
        // Given
        List<Account> input = IterTestUtils.generateAccounts();
        List<Account> clone = IterTestUtils.deepClone(input);
        String fieldName1 = IterTestUtils.CONSTS.NAME;
        String fieldName2 = IterTestUtils.CONSTS.TYPE;
        ISObjectFunction getCoordinates = new IterTestUtils.GetPair(fieldName1, fieldName2);
        IObjectIterable objStream = SObjectStream.of(clone).flatMapToObject(getCoordinates);
        // When
        List<Object> actual = objStream.toList();
        // Then
        List<Object> expected = new List<Object>();
        for (Account acc : input) {
            Object value1 = acc.get(fieldName1);
            Object value2 = acc.get(fieldName2);
            expected.add(value1);
            expected.add(value2);
        }
        Assert.areEqual(expected, actual);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((ObjectStream) objStream).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        List<Account> clone1 = IterTestUtils.deepClone(input);
        List<Account> clone2 = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Account.Name;
        String fieldName = IterTestUtils.CONSTS.NAME;
        String value = 'New Name';
        ISObjectConsumer setNewName = SObjectConsumers.set(fieldName, value);
        ISObjectIterable accStream = SObjectStream.of(clone).forEach(setNewName);
        ISObjectIterable accStream1 = SObjectStream.of(clone1).forEach(fieldName, value);
        ISObjectIterable accStream2 = SObjectStream.of(clone2).forEach(field, value);
        // When
        List<Account> actual = accStream.toList();
        List<Account> actual1 = accStream1.toList();
        List<Account> actual2 = accStream2.toList();
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            Assert.areEqual(value, actual[i].Name);
            Assert.areEqual(value, actual1[i].Name);
            Assert.areEqual(value, actual2[i].Name);
        }
        Assert.areNotEqual(input, clone, Label.AS_ErrorMessage_InputNotMutated);
        Assert.areNotEqual(input, clone1, Label.AS_ErrorMessage_InputNotMutated);
        Assert.areNotEqual(input, clone2, Label.AS_ErrorMessage_InputNotMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectFunction getNumOfEmployees = SObjectFunctions.get(field);
        ISObjectIterable accStream = SObjectStream.of(clone).distinct();
        ISObjectIterable accStream1 = SObjectStream.of(clone).withoutNulls().distinct(getNumOfEmployees);
        ISObjectIterable accStream2 = SObjectStream.of(clone).withoutNulls().distinct(fieldName);
        ISObjectIterable accStream3 = SObjectStream.of(clone).withoutNulls().distinct(field);
        // When
        List<Account> actual = accStream.toList();
        List<Account> actual1 = accStream1.toList();
        List<Account> actual2 = accStream2.toList();
        List<Account> actual3 = accStream3.toList();
        // Then
        List<Account> expected = new List<Account>{ acc, acc1, acc2, acc3, null, acc4 };
        List<Account> expected1 = new List<Account>{ acc, acc3, acc4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectComparator fieldComparator = SObjectComparator.comparing(field);
        ISObjectIterable accStream = SObjectStream.of(clone).sort();
        ISObjectIterable accStream1 = SObjectStream.of(clone).sort(SortOrder.ASCENDING);
        ISObjectIterable accStream2 = SObjectStream.of(clone).sort(fieldComparator);
        ISObjectIterable accStream3 = SObjectStream.of(clone).sort(fieldName);
        ISObjectIterable accStream4 = SObjectStream.of(clone).sort(field);
        ISObjectIterable accStream5 = SObjectStream.of(clone).sort(fieldName, SortOrder.DESCENDING);
        ISObjectIterable accStream6 = SObjectStream.of(clone).sort(field, SortOrder.DESCENDING);
        // When
        List<Account> actual = accStream.toList();
        List<Account> actual1 = accStream1.toList();
        List<Account> actual2 = accStream2.toList();
        List<Account> actual3 = accStream3.toList();
        List<Account> actual4 = accStream4.toList();
        List<Account> actual5 = accStream5.toList();
        List<Account> actual6 = accStream6.toList();
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
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
        Assert.isTrue(((SObjectStream) accStream4).isOperated);
        Assert.isTrue(((SObjectStream) accStream4).isOperated);
        Assert.isTrue(((SObjectStream) accStream6).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        ISObjectIterable accStream = SObjectStream.of(clone).lim(25);
        ISObjectIterable accStream1 = SObjectStream.of(clone).lim(3);
        ISObjectIterable accStream2 = SObjectStream.of(clone).lim(0);
        ISObjectIterable accStream3 = SObjectStream.of(clone);
        // When
        List<Account> actual = accStream.toList();
        List<Account> actual1 = accStream1.toList();
        List<Account> actual2 = accStream2.toList();
        Exception exc1;
        try {
            accStream3.lim(-2);
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
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(!((SObjectStream) accStream3).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        ISObjectIterable accStream = SObjectStream.of(clone).skip(5);
        ISObjectIterable accStream1 = SObjectStream.of(clone).skip(0);
        ISObjectIterable accStream2 = SObjectStream.of(clone).skip(25);
        ISObjectIterable accStream3 = SObjectStream.of(clone);
        // When
        List<Account> actual = accStream.toList();
        List<Account> actual1 = accStream1.toList();
        List<Account> actual2 = accStream2.toList();
        Exception exc1;
        try {
            accStream3.skip(-2);
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
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(!((SObjectStream) accStream3).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        ISObjectComparator fieldComparator = SObjectComparator.comparing(field);
        ISObjectBinaryOperator maxBy = SObjectBinaryOperator.maxBy(fieldComparator);
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone);
        // When
        SObject actual = accStream.reduce(seed, maxBy);
        SObject actual1 = accStream1.reduce(maxBy).get();
        // Then
        Assert.areEqual(acc3, actual);
        Assert.areEqual(acc3, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        ISObjectCollector toSetCollector = SObjectCollectors.toSet();
        ISupplier sObjectSetSupplier = Supplier.of(Set<SObject>.class);
        IObjectSObjectConsumer biConsumer = SetSObjectConsumers.addToSObjectSet(SObjectUnaryOperator.identity());
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone);
        // When
        Set<SObject> actual = (Set<SObject>) accStream.collect(toSetCollector);
        Set<SObject> actual1 = (Set<SObject>) accStream1.collect(sObjectSetSupplier, biConsumer);
        // Then
        Set<SObject> expected = new Set<SObject>{ acc1, acc, acc2, acc3, acc4 };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        Integer value = 0;
        Integer value1 = 500;
        SObjectPredicate isFieldEqualPredicate = SObjectPredicates.isEqual(field, 0);
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone);
        ISObjectIterable accStream2 = SObjectStream.of(clone);
        ISObjectIterable accStream3 = SObjectStream.of(clone);
        // When
        Account actual = (Account) accStream.find(isFieldEqualPredicate).get();
        Account actual1 = (Account) accStream1.find(field, value).get();
        Account actual2 = (Account) accStream2.find(fieldName, value).get();
        Boolean actual3 = accStream3.find(fieldName, value1).isEmpty();
        // Then
        Assert.areEqual(acc2, actual);
        Assert.areEqual(acc2, actual1);
        Assert.areEqual(acc2, actual2);
        Assert.isTrue(actual3);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
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
        List<Contact> clone = IterTestUtils.deepClone(input);
        String value = 'T';
        Boolean value1 = false;
        String value2 = 'Finance';
        ISObjectPredicate isLastNameStartsWith = SObjectPredicate.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName), new IterTestUtils.StartsWith(value));
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone);
        ISObjectIterable accStream2 = SObjectStream.of(clone);
        // When
        Boolean isEveryConNameStartsWithT = accStream.every(isLastNameStartsWith);
        Boolean isEveryConDoNotCall = accStream1.every(IterTestUtils.CONSTS.Contact.DoNotCall, value1);
        Boolean isEveryConFinanceDepartment = accStream2.every(IterTestUtils.CONSTS.DEPARTMENT, value2);
        // Then
        Assert.areEqual(true, isEveryConNameStartsWithT);
        Assert.areEqual(false, isEveryConDoNotCall);
        Assert.areEqual(false, isEveryConFinanceDepartment);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
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
        List<Contact> clone = IterTestUtils.deepClone(input);
        String value = 'A';
        Boolean value1 = true;
        String value2 = 'HR';
        ISObjectPredicate isLastNameStartsWith = SObjectPredicate.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName), new IterTestUtils.StartsWith(value));
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone);
        ISObjectIterable accStream2 = SObjectStream.of(clone);
        // When
        Boolean isSomeConNameStartsWithA = accStream.some(isLastNameStartsWith);
        Boolean isSomeConDoNotCall = accStream1.some(IterTestUtils.CONSTS.Contact.DoNotCall, value1);
        Boolean isSomeConHR = accStream2.some(IterTestUtils.CONSTS.DEPARTMENT, value2);
        // Then
        Assert.areEqual(false, isSomeConNameStartsWithA);
        Assert.areEqual(true, isSomeConDoNotCall);
        Assert.areEqual(false, isSomeConHR);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
    }

    /**
     * @see SObjectIterable.none
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
        List<Contact> clone = IterTestUtils.deepClone(input);
        String value = 'A';
        Boolean value1 = true;
        String value2 = 'HR';
        ISObjectPredicate isLastNameStartsWith = SObjectPredicate.compose(SObjectFunctions.get(IterTestUtils.CONSTS.Contact.LastName), new IterTestUtils.StartsWith(value));
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone);
        ISObjectIterable accStream2 = SObjectStream.of(clone);
        // When
        Boolean isSomeConLNameStartsWithA = accStream.none(isLastNameStartsWith);
        Boolean isSomeConDoNotCall = accStream1.none(IterTestUtils.CONSTS.Contact.DoNotCall, value1);
        Boolean isSomeConHR = accStream2.none(IterTestUtils.CONSTS.DEPARTMENT, value2);
        // Then
        Assert.areEqual(true, isSomeConLNameStartsWithA);
        Assert.areEqual(false, isSomeConDoNotCall);
        Assert.areEqual(true, isSomeConHR);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectComparator fieldComparator = SObjectComparator.comparing(field);
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone);
        ISObjectIterable accStream2 = SObjectStream.of(clone);
        // When
        Account actual = (Account) accStream.max(fieldComparator).get();
        Account actual1 = (Account) accStream1.max(fieldName).get();
        Account actual2 = (Account) accStream2.max(field).get();
        // Then
        Assert.areEqual(acc3, actual);
        Assert.areEqual(acc3, actual1);
        Assert.areEqual(acc3, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectComparator fieldComparator = SObjectComparator.comparing(field);
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone);
        ISObjectIterable accStream2 = SObjectStream.of(clone);
        // When
        Account actual = (Account) accStream.min(fieldComparator).get();
        Account actual1 = (Account) accStream1.min(fieldName).get();
        Account actual2 = (Account) accStream2.min(field).get();
        // Then
        Assert.areEqual(acc4, actual);
        Assert.areEqual(acc4, actual1);
        Assert.areEqual(acc4, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectToDoubleFunction getAsDouble = SObjectToDoubleFunctions.get(fieldName);
        ISObjectPredicate hasFieldValue = SObjectPredicates.has(field);
        ISObjectIterable accStream = SObjectStream.of(clone).filter(hasFieldValue);
        ISObjectIterable accStream1 = SObjectStream.of(clone).filter(hasFieldValue);
        ISObjectIterable accStream2 = SObjectStream.of(clone).filter(hasFieldValue);
        // When
        Double actual = (Double) accStream.sum(getAsDouble);
        Double actual1 = (Double) accStream1.sum(fieldName);
        Double actual2 = (Double) accStream2.sum(field);
        // Then
        Integer expected = 700;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        SObjectField field = IterTestUtils.CONSTS.Account.NumberOfEmployees;
        String fieldName = IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES;
        ISObjectToDoubleFunction getAsDouble = SObjectToDoubleFunctions.get(fieldName);
        ISObjectPredicate hasFieldValue = SObjectPredicates.has(field);
        ISObjectIterable accStream = SObjectStream.of(clone).filter(hasFieldValue);
        ISObjectIterable accStream1 = SObjectStream.of(clone).filter(hasFieldValue);
        ISObjectIterable accStream2 = SObjectStream.of(clone).filter(hasFieldValue);
        // When
        Double actual = (Double) accStream.avg(getAsDouble).get();
        Double actual1 = (Double) accStream1.avg(fieldName).get();
        Double actual2 = (Double) accStream2.avg(field).get();
        // Then
        Double expected = 700 / 5;
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        ISObjectIterable accStream = SObjectStream.of(input);
        ISObjectIterable accStream1 = SObjectStream.of(new List<SObject>());
        ISObjectIterable accStream2 = SObjectStream.empty();
        // When
        Integer actual = accStream.count();
        Integer actual1 = accStream1.count();
        Integer actual2 = accStream2.count();
        // Then
        Assert.areEqual(input.size(), actual);
        Assert.areEqual(0, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(new List<SObject>());
        ISObjectIterable accStream2 = SObjectStream.empty();
        // When
        Boolean actual = accStream.isEmpty();
        Boolean actual1 = accStream1.isEmpty();
        Boolean actual2 = accStream2.isEmpty();
        // Then
        Assert.areEqual(input.isEmpty(), actual);
        Assert.isTrue(actual1);
        Assert.isTrue(actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
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
        List<Account> clone = IterTestUtils.deepClone(input);
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream2 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream3 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream4 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream5 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream6 = SObjectStream.of(clone).withoutNulls();
        // When
        List<Account> actual = accStream.toList();
        List<Integer> actual1 = (List<Integer>) accStream1.toList(SObjectFunctions.get('NumberOfEmployees'), List<Integer>.class);
        List<Integer> actual2 = (List<Integer>) accStream2.toList('NumberOfEmployees', List<Integer>.class);
        List<Integer> actual3 = (List<Integer>) accStream3.toList(Account.NumberOfEmployees, List<Integer>.class);
        List<Object> actual4 = accStream4.toList(SObjectFunctions.get('NumberOfEmployees'));
        List<Object> actual5 = accStream5.toList('NumberOfEmployees');
        List<Object> actual6 = accStream6.toList(Account.NumberOfEmployees);
        // Then
        List<Integer> expected = (List<Integer>) SObjectStream.of(clone)
                .withoutNulls()
                .collect(SObjectCollectors.toList(Account.NumberOfEmployees).cast(List<Integer>.class));
        Assert.areEqual(input, actual);
        Assert.areEqual(expected, actual1);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected, actual4);
        Assert.areEqual(expected, actual5);
        Assert.areEqual(expected, actual6);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
        Assert.isTrue(((SObjectStream) accStream4).isOperated);
        Assert.isTrue(((SObjectStream) accStream5).isOperated);
        Assert.isTrue(((SObjectStream) accStream6).isOperated);
    }

    /**
     * @see SObjectStream.toSet
     * @see SObjectStream.toIdSet
     * @see SObjectStream.toStringSet
     */
    @IsTest
    private static void toSet() {
        // Given
        ISupplier idGenerator = IdSuppliers.of(Account.SObjectType);
        Account acc = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, null, acc3, acc4, acc2, null };
        List<Account> clone = IterTestUtils.deepClone(input);
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream2 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream3 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream4 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream5 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream6 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream7 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream8 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream9 = SObjectStream.of(clone).withoutNulls();
        ISObjectIterable accStream10 = SObjectStream.of(clone).withoutNulls();
        // When
        Set<SObject> actual = accStream.toSet();
        Set<Id> actual1 = accStream1.toIdSet();
        Set<Id> actual2 = accStream2.toIdSet(SObjectFunctions.get('Id'));
        Set<Id> actual3 = accStream3.toIdSet('Id');
        Set<Id> actual4 = accStream4.toIdSet(Account.Id);
        Set<String> actual5 = accStream5.toStringSet(SObjectFunctions.get('Name'));
        Set<String> actual6 = accStream6.toStringSet('Name');
        Set<String> actual7 = accStream7.toStringSet(Account.Name);
        Set<Object> actual8 = accStream8.toSet(SObjectFunctions.get('Name'));
        Set<Object> actual9 = accStream9.toSet('Name');
        Set<Object> actual10 = accStream10.toSet(Account.Name);
        // Then
        Set<SObject> expected = new Set<SObject>{ acc1, acc, acc2, null, acc3, acc4 };
        Set<Id> expected1 = (Set<Id>) SObjectStream.of(clone)
                .withoutNulls()
                .collect(SObjectCollectors.toIdSet(Account.Id));
        Set<String> expected2 = (Set<String>) SObjectStream.of(clone)
                .withoutNulls()
                .collect(SObjectCollectors.toStringSet(Account.Name));
        Set<Object> expected3 = (Set<Object>) SObjectStream.of(clone)
                .withoutNulls()
                .collect(SObjectCollectors.toSet(Account.Name));
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
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
        Assert.isTrue(((SObjectStream) accStream4).isOperated);
        Assert.isTrue(((SObjectStream) accStream5).isOperated);
        Assert.isTrue(((SObjectStream) accStream6).isOperated);
        Assert.isTrue(((SObjectStream) accStream7).isOperated);
        Assert.isTrue(((SObjectStream) accStream8).isOperated);
        Assert.isTrue(((SObjectStream) accStream9).isOperated);
        Assert.isTrue(((SObjectStream) accStream10).isOperated);
    }

    /**
     * @see SObjectStream.toMap
     * @see SObjectStream.toByIdMap
     * @see SObjectStream.toByStringMap
     */
    @IsTest
    private static void toMap() {
        // Given
        ISupplier idGenerator = IdSuppliers.of(Account.SObjectType);
        Account acc = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4 };
        List<Account> clone = IterTestUtils.deepClone(input);
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone);
        ISObjectIterable accStream2 = SObjectStream.of(clone);
        ISObjectIterable accStream3 = SObjectStream.of(clone);
        ISObjectIterable accStream4 = SObjectStream.of(clone);
        ISObjectIterable accStream5 = SObjectStream.of(clone);
        ISObjectIterable accStream6 = SObjectStream.of(clone);
        // When
        Map<Id, SObject> actual = accStream.toMap();
        Map<Id, Account> actual1 = (Map<Id, Account>) accStream1.toByIdMap(SObjectFunctions.get('Id'), Map<Id, Account>.class);
        Map<Id, Account> actual2 = (Map<Id, Account>) accStream2.toByIdMap('Id', Map<Id, Account>.class);
        Map<Id, Account> actual3 = (Map<Id, Account>) accStream3.toByIdMap(Account.Id, Map<Id, Account>.class);
        Map<String, Account> actual4 = (Map<String, Account>) accStream4.toByStringMap(SObjectFunctions.get('Name'), Map<String, Account>.class);
        Map<String, Account> actual5 = (Map<String, Account>) accStream5.toByStringMap('Name', Map<String, Account>.class);
        Map<String, Account> actual6 = (Map<String, Account>) accStream6.toByStringMap(Account.Name, Map<String, Account>.class);
        // Then
        Map<Id, Account> expected = new Map<Id, Account>(input);
        Map<Id, Account> expected1 = (Map<Id, Account>) SObjectStream.of(clone)
                .collect(SObjectCollectors.toByIdMap(Account.Id).cast(Map<Id, Account>.class));
        Map<String, Account> expected2 = (Map<String, Account>) SObjectStream.of(clone)
                .collect(SObjectCollectors.toByStringMap(Account.Name).cast(Map<String, Account>.class));
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(expected1, actual3);
        Assert.areEqual(expected2, actual4);
        Assert.areEqual(expected2, actual5);
        Assert.areEqual(expected2, actual6);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
        Assert.isTrue(((SObjectStream) accStream4).isOperated);
        Assert.isTrue(((SObjectStream) accStream5).isOperated);
        Assert.isTrue(((SObjectStream) accStream6).isOperated);
    }

    /**
     * @see SObjectStream.groupById
     * @see SObjectStream.groupByString
     */
    @IsTest
    private static void group() {
        // Given
        ISupplier idGenerator = IdSuppliers.of(Account.SObjectType);
        Id parentId1 = (Id) idGenerator.get();
        Id parentId2 = (Id) idGenerator.get();
        Account acc = new Account(ParentId = parentId1, Name = 'Test Acc', NumberOfEmployees = 200, Rating = 'Hot');
        Account acc1 = new Account(ParentId = parentId2, Name = 'Test Acc1', NumberOfEmployees = 100, Rating = 'Warm');
        Account acc2 = new Account(ParentId = parentId1, Name = 'Test Acc2', NumberOfEmployees = 0, Rating = 'Warm');
        Account acc3 = new Account(ParentId = parentId2, Name = 'Test Acc3', NumberOfEmployees = 400, Rating = 'Hot');
        Account acc4 = new Account(ParentId = parentId1, Name = 'Test Acc4', Rating = 'Warm');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4 };
        List<Account> clone = IterTestUtils.deepClone(input);
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone);
        ISObjectIterable accStream2 = SObjectStream.of(clone);
        ISObjectIterable accStream3 = SObjectStream.of(clone);
        ISObjectIterable accStream4 = SObjectStream.of(clone);
        ISObjectIterable accStream5 = SObjectStream.of(clone);
        // When
        Map<Id, List<Account>> actual = accStream.groupById(SObjectFunctions.get('ParentId'));
        Map<Id, List<Account>> actual2 = accStream1.groupById('ParentId');
        Map<Id, List<Account>> actual3 = accStream2.groupById(Account.ParentId);
        Map<String, List<Account>> actual4 = accStream3.groupByString(SObjectFunctions.get('Rating'));
        Map<String, List<Account>> actual5 = accStream4.groupByString('Rating');
        Map<String, List<Account>> actual6 = accStream5.groupByString(Account.Rating);
        // Then
        Map<Id, List<Account>> expected = (Map<Id, List<Account>>) SObjectStream.of(clone)
                .collect(SObjectCollectors.groupingById(Account.ParentId).cast(Map<Id, List<Account>>.class));
        Map<String, List<Account>> expected1 = (Map<String, List<Account>>) SObjectStream.of(clone)
                .collect(SObjectCollectors.groupingByString(Account.Rating).cast(Map<String, List<Account>>.class));
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected, actual2);
        Assert.areEqual(expected, actual3);
        Assert.areEqual(expected1, actual4);
        Assert.areEqual(expected1, actual5);
        Assert.areEqual(expected1, actual6);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
        Assert.isTrue(((SObjectStream) accStream3).isOperated);
        Assert.isTrue(((SObjectStream) accStream4).isOperated);
        Assert.isTrue(((SObjectStream) accStream5).isOperated);
    }

    /**
     * @see SObjectStream.partition
     */
    @IsTest
    private static void partition() {
        // Given
        ISupplier idGenerator = IdSuppliers.of(Account.SObjectType);
        Account acc = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc', NumberOfEmployees = 200);
        Account acc1 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc1', NumberOfEmployees = 100);
        Account acc2 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc2', NumberOfEmployees = 0);
        Account acc3 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc3', NumberOfEmployees = 400);
        Account acc4 = new Account(Id = (Id) idGenerator.get(), Name = 'Test Acc4');
        List<Account> input = new List<Account>{ acc1, acc, acc2, acc3, acc4 };
        List<Account> clone = IterTestUtils.deepClone(input);
        ISObjectPredicate predicate = SObjectPredicates.isGreater(Account.NumberOfEmployees, 150);
        ISObjectIterable accStream = SObjectStream.of(clone);
        ISObjectIterable accStream1 = SObjectStream.of(clone);
        ISObjectIterable accStream2 = SObjectStream.of(clone);
        // When
        Map<Boolean, List<Account>> actual = accStream.partition(predicate);
        Map<Boolean, List<Account>> actual1 = accStream1.partition('NumberOfEmployees', 100);
        Map<Boolean, List<Account>> actual2 = accStream2.partition(Account.NumberOfEmployees, 100);
        // Then
        Map<Boolean, List<Account>> expected = (Map<Boolean, List<Account>>) SObjectStream.of(clone)
                .collect(SObjectCollectors.partitioningBy(predicate).cast(Map<Boolean, List<Account>>.class));
        Map<Boolean, List<Account>> expected1 = new Map<Boolean, List<Account>>{
                true => new List<Account>{ acc1 },
                false => new List<Account>{ acc, acc2, acc3, acc4 }
        };
        Assert.areEqual(expected, actual);
        Assert.areEqual(expected1, actual1);
        Assert.areEqual(expected1, actual2);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
        Assert.isTrue(((SObjectStream) accStream).isOperated);
        Assert.isTrue(((SObjectStream) accStream1).isOperated);
        Assert.isTrue(((SObjectStream) accStream2).isOperated);
    }

}
