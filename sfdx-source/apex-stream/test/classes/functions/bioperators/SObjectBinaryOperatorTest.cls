/**
 * @see SObjectBinaryOperator
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class SObjectBinaryOperatorTest {

    private static final List<Account> INPUT = IterTestUtils.generateAccounts();

    /**
     * @see SObjectBinaryOperator.left
     * @see SObjectBinaryOperator.right
     * @see SObjectBinaryOperator.minBy
     * @see SObjectBinaryOperator.maxBy
     * @see SObjectBinaryOperator.forBiConsumer
     */
    @IsTest
    static void default() {
        // When
        ISObjectComparator comparator = SObjectComparator.comparing(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        ISObjectBiConsumer consumer = SObjectBiConsumers.set(IterTestUtils.CONSTS.Contact.Department, SObjectFunctions.get(IterTestUtils.CONSTS.Account.Type))
                .andThen(SObjectBiConsumers.set(IterTestUtils.CONSTS.ACCOUNT_ID, SObjectFunctions.get(IterTestUtils.CONSTS.ID)));
        ISObjectBinaryOperator left = SObjectBinaryOperator.left();
        ISObjectBinaryOperator right = SObjectBinaryOperator.right();
        ISObjectBinaryOperator minBy = SObjectBinaryOperator.minBy(comparator);
        ISObjectBinaryOperator minBy1 = SObjectBinaryOperator.minBy(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        ISObjectBinaryOperator minBy2 = SObjectBinaryOperator.minBy(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES);
        ISObjectBinaryOperator maxBy = SObjectBinaryOperator.maxBy(comparator);
        ISObjectBinaryOperator maxBy1 = SObjectBinaryOperator.maxBy(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        ISObjectBinaryOperator maxBy2 = SObjectBinaryOperator.maxBy(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES);
        ISObjectBinaryOperator ofBiConsumer = SObjectBinaryOperator.forBiConsumer(consumer);
        ISObjectBinaryOperator ofBiConsumerMergingToLeft = SObjectBinaryOperator.combine(consumer, SObjectBinaryOperator.left());
        // Then
        for (Account acc : INPUT) {
            SObject target = new Contact();
            Validate.assertEquals(acc, left.apply(acc, target));
            Validate.assertEquals(target, right.apply(acc, target));
            SObject target1 = new Account(NumberOfEmployees = 100);
            SObject actual = minBy.apply(acc, target1);
            SObject actual1 = minBy1.apply(acc, target1);
            SObject actual2 = minBy2.apply(acc, target1);
            SObject actual3 = maxBy.apply(acc, target1);
            SObject actual4 = maxBy1.apply(acc, target1);
            SObject actual5 = maxBy2.apply(acc, target1);
            SObject expected = acc.NumberOfEmployees == null
                    ? acc
                    : acc.NumberOfEmployees >= (Integer) target1.get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) ? target1 : acc;
            SObject expected1 = acc.NumberOfEmployees == null
                    ? target1
                    : acc.NumberOfEmployees <= (Integer) target1.get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) ? target1 : acc;
            Validate.assertEquals(expected, actual);
            Validate.assertEquals(expected, actual1);
            Validate.assertEquals(expected, actual2);
            Validate.assertEquals(expected1, actual3);
            Validate.assertEquals(expected1, actual4);
            Validate.assertEquals(expected1, actual5);

            SObject expected2 = new Contact(Department = acc.Type, AccountId = acc.Id);
            SObject target2 = new Contact();
            SObject src = IterTestUtils.deepClone(acc);
            SObject actual6 = ofBiConsumer.apply(src, target2);
            Validate.assertEquals(expected2, actual6);
            SObject target3 = new Contact();
            SObject src1 = IterTestUtils.deepClone(acc);
            SObject actual7 = ofBiConsumerMergingToLeft.apply(src1, target3);
            Validate.assertEquals(src1, actual7);
        }
    }
    
}
