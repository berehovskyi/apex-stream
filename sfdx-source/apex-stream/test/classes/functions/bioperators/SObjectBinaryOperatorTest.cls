/**
 * @author O. Berehovskyi
 * @see SObjectBinaryOperator
 */
@IsTest(IsParallel = true)
private class SObjectBinaryOperatorTest {

    private static List<Account> input = IterTestUtils.generateAccounts();

    /**
     * @see SObjectBinaryOperator.left
     * @see SObjectBinaryOperator.right
     * @see SObjectBinaryOperator.minBy
     * @see SObjectBinaryOperator.maxBy
     * @see SObjectBinaryOperator.forBiConsumer
     */
    @IsTest
    static void defaultMethods() {
        // When
        ISObjectComparator comparator = SObjectComparator.comparing(IterTestUtils.CONSTS.Account.NumberOfEmployees);
        ISObjectBiConsumer consumer = SObjectBiConsumer.set(IterTestUtils.CONSTS.Contact.Department, SObjectFunction.get(IterTestUtils.CONSTS.Account.Type))
                .andThen(SObjectBiConsumer.set(IterTestUtils.CONSTS.ACCOUNT_ID, SObjectFunction.get(IterTestUtils.CONSTS.ID)));
        ISObjectBinaryOperator left = SObjectBinaryOperator.left();
        ISObjectBinaryOperator right = SObjectBinaryOperator.right();
        ISObjectBinaryOperator minBy = SObjectBinaryOperator.minBy(comparator);
        ISObjectBinaryOperator maxBy = SObjectBinaryOperator.maxBy(comparator);
        ISObjectBinaryOperator ofBiConsumer = SObjectBinaryOperator.forBiConsumer(consumer);
        ISObjectBinaryOperator ofBiConsumerMergingToLeft = SObjectBinaryOperator.combine(consumer, SObjectBinaryOperator.left());
        // Then
        for (Account acc : input) {
            SObject target = new Contact();
            Validate.assertEquals(acc, left.apply(acc, target));
            Validate.assertEquals(target, right.apply(acc, target));
            SObject target1 = new Account(NumberOfEmployees = 100);
            SObject actual = minBy.apply(acc, target1);
            SObject actual1 = maxBy.apply(acc, target1);
            SObject expected = acc.NumberOfEmployees == null
                    ? acc
                    : acc.NumberOfEmployees >= (Integer) target1.get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) ? target1 : acc;
            SObject expected1 = acc.NumberOfEmployees == null
                    ? target1
                    : acc.NumberOfEmployees <= (Integer) target1.get(IterTestUtils.CONSTS.NUMBER_OF_EMPLOYEES) ? target1 : acc;
            Validate.assertEquals(expected, actual);
            Validate.assertEquals(expected1, actual1);

            SObject expected2 = new Contact(Department = acc.Type, AccountId = acc.Id);
            SObject target2 = new Contact();
            SObject src = IterTestUtils.deepClone(acc);
            SObject actual2 = ofBiConsumer.apply(src, target2);
            Validate.assertEquals(expected2, actual2);
            SObject target3 = new Contact();
            SObject src1 = IterTestUtils.deepClone(acc);
            SObject actual3 = ofBiConsumerMergingToLeft.apply(src1, target3);
            Validate.assertEquals(src1, actual3);
        }
    }
}
