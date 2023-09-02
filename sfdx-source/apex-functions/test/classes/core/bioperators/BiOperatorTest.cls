/**
 * @see BiOperator
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class BiOperatorTest {

    private static final List<AfPerson> PEOPLE = AfTestData.generatePersons();
    private static final List<Account> ACCOUNTS = AfTestData.generateAccounts();

    /**
     * @see BiOperator.left
     * @see BiOperator.right
     * @see BiOperator.minBy
     * @see BiOperator.maxBy
     * @see BiOperator.combine
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void default_sobject() {
        // When
        IComparer comp = Comparer.comparing(new AfTestCommons.GetFieldFunction(Account.NumberOfEmployees));
        IBiConsumer consumer = new AfTestCommons.SetFromRightBiConsumer(Contact.Department, Account.Type)
            .andThen(new AfTestCommons.SetFromRightBiConsumer(Contact.AccountId, Account.Id));
        IBiOperator left = BiOperator.left();
        IBiOperator right = BiOperator.right();
        IBiOperator minBy = BiOperator.minBy(comp);
        IBiOperator minBy1 = BiOperator.minBy(Comparer.comparing(new AfTestCommons.GetFieldFunction(Account.NumberOfEmployees)));
        IBiOperator minBy2 = BiOperator.minBy(Comparer.comparing(new AfTestCommons.GetFieldFunction(AfTestConsts.NUMBER_OF_EMPLOYEES)));
        IBiOperator maxBy = BiOperator.maxBy(comp);
        IBiOperator maxBy1 = BiOperator.maxBy(Comparer.comparing(new AfTestCommons.GetFieldFunction(Account.NumberOfEmployees)));
        IBiOperator maxBy2 = BiOperator.maxBy(Comparer.comparing(new AfTestCommons.GetFieldFunction(AfTestConsts.NUMBER_OF_EMPLOYEES)));
        IBiOperator ofBiConsumer = BiOperator.combine(consumer);
        IBiOperator ofBiConsumerMergingToLeft = BiOperator.combine(consumer, BiOperator.left());
        // Then
        for (Account acc : ACCOUNTS) {
            SObject target = new Contact();
            Assert.areEqual(acc, left.apply(acc, target));
            Assert.areEqual(target, right.apply(acc, target));
            SObject target1 = new Account(NumberOfEmployees = 100);
            SObject actual = (SObject) minBy.apply(acc, target1);
            SObject actual1 = (SObject) minBy1.apply(acc, target1);
            SObject actual2 = (SObject) minBy2.apply(acc, target1);
            SObject actual3 = (SObject) maxBy.apply(acc, target1);
            SObject actual4 = (SObject) maxBy1.apply(acc, target1);
            SObject actual5 = (SObject) maxBy2.apply(acc, target1);
            SObject expected = acc.NumberOfEmployees == null
                ? acc
                : acc.NumberOfEmployees >= (Integer) target1.get(AfTestConsts.NUMBER_OF_EMPLOYEES) ? target1 : acc;
            SObject expected1 = acc.NumberOfEmployees == null
                ? target1
                : acc.NumberOfEmployees <= (Integer) target1.get(AfTestConsts.NUMBER_OF_EMPLOYEES) ? target1 : acc;
            Assert.areEqual(expected, actual);
            Assert.areEqual(expected, actual1);
            Assert.areEqual(expected, actual2);
            Assert.areEqual(expected1, actual3);
            Assert.areEqual(expected1, actual4);
            Assert.areEqual(expected1, actual5);

            SObject expected2 = new Contact(Department = acc.Type, AccountId = acc.Id);
            SObject target2 = new Contact();
            SObject src = AfTestCommons.deepClone(acc);
            SObject actual6 = (SObject) ofBiConsumer.apply(src, target2);
            Assert.areEqual(expected2, actual6);
            SObject target3 = new Contact();
            SObject src1 = AfTestCommons.deepClone(acc);
            SObject actual7 = (SObject) ofBiConsumerMergingToLeft.apply(src1, target3);
            Assert.areEqual(src1, actual7);
        }
    }

    /**
     * @see BiOperator.left
     * @see BiOperator.right
     * @see BiOperator.minBy
     * @see BiOperator.maxBy
     */
    @IsTest
    static void default() {
        // When
        IComparer comparer = Comparer.comparing(new AfTestCommons.GetAgeFunction());
        IBiOperator left = BiOperator.left();
        IBiOperator right = BiOperator.right();
        IBiOperator minBy = BiOperator.minBy(comparer);
        IBiOperator maxBy = BiOperator.maxBy(comparer);
        // Then
        for (AfPerson person : PEOPLE) {
            AfPerson jhene = new AfPerson('Jhene', 18, Date.newInstance(1990, 1, 2), 5L, true);
            Assert.areEqual(person, left.apply(person, jhene));
            Assert.areEqual(jhene, right.apply(person, jhene));
            Object actual = minBy.apply(person, jhene);
            Object actual1 = maxBy.apply(person, jhene);
            AfPerson expected = person.getAge() == null
                    ? person
                    : person.getAge() >= (Integer) jhene.getAge() ? jhene : person;
            AfPerson expected1 = person.getAge() == null
                    ? jhene
                    : person.getAge() <= (Integer) jhene.getAge() ? jhene : person;
            Assert.areEqual(expected, actual);
            Assert.areEqual(expected1, actual1);
        }
    }

}
