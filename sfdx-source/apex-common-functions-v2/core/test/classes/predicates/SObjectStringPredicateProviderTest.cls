/**
 * @see SObjectStringPredicateProvider
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
private class SObjectStringPredicateProviderTest {
    private static final List<Account> INPUT = AfTestData.generateAccounts();
    private static final SObjectStringPredicateProvider PRED = new SObjectStringPredicateProvider();

    /**
     * @see SObjectStringPredicateProvider.StringOperator.blank
     */
    @IsTest
    static void blank() {
        // Given
        SObjectField accTypeField = AfTestConsts.Account.Type;
        String typeFieldName = 'Type';
        IFunction getTypeFunction = new SObjectFunctionProvider().get(accTypeField);
        // When
        IPredicate typeIsBlankPredicate = PRED.is(getTypeFunction).blank();
        IPredicate typeIsBlankPredicate1 = PRED.is(typeFieldName).blank();
        IPredicate typeIsBlankPredicate2 = PRED.is(accTypeField).blank();
        IPredicate typeIsNotBlankPredicate = PRED.is(getTypeFunction).notx().blank();
        IPredicate typeIsNotBlankPredicate1 = PRED.is(typeFieldName).notx().blank();
        IPredicate typeIsNotBlankPredicate2 = PRED.is(accTypeField).notx().blank();
        // Then
        for (Account acc : INPUT) {
            String name = ((String) acc.get(accTypeField));
            String name1 = ((String) acc.get(typeFieldName));
            Assert.areEqual(String.isBlank(name), typeIsBlankPredicate.test(acc));
            Assert.areEqual(String.isBlank(name1), typeIsBlankPredicate1.test(acc));
            Assert.areEqual(String.isBlank(name1), typeIsBlankPredicate2.test(acc));
            Assert.areEqual(!String.isBlank(name), typeIsNotBlankPredicate.test(acc));
            Assert.areEqual(!String.isBlank(name1), typeIsNotBlankPredicate1.test(acc));
            Assert.areEqual(!String.isBlank(name1), typeIsNotBlankPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectStringPredicateProvider.StringOperator.empty
     */
    @IsTest
    static void empty() {
        // Given
        SObjectField accTypeField = AfTestConsts.Account.Type;
        String typeFieldName = 'Type';
        IFunction getTypeFunction = new SObjectFunctionProvider().get(accTypeField);
        // When
        IPredicate typeIsEmptyPredicate = PRED.is(getTypeFunction).empty();
        IPredicate typeIsEmptyPredicate1 = PRED.is(typeFieldName).empty();
        IPredicate typeIsEmptyPredicate2 = PRED.is(accTypeField).empty();
        IPredicate typeIsNotEmptyPredicate = PRED.is(getTypeFunction).notx().empty();
        IPredicate typeIsNotEmptyPredicate1 = PRED.is(typeFieldName).notx().empty();
        IPredicate typeIsNotEmptyPredicate2 = PRED.is(accTypeField).notx().empty();
        // Then
        for (Account acc : INPUT) {
            String name = ((String) acc.get(accTypeField));
            String name1 = ((String) acc.get(typeFieldName));
            Assert.areEqual(String.isEmpty(name), typeIsEmptyPredicate.test(acc));
            Assert.areEqual(String.isEmpty(name1), typeIsEmptyPredicate1.test(acc));
            Assert.areEqual(String.isEmpty(name1), typeIsEmptyPredicate2.test(acc));
            Assert.areEqual(!String.isEmpty(name), typeIsNotEmptyPredicate.test(acc));
            Assert.areEqual(!String.isEmpty(name1), typeIsNotEmptyPredicate1.test(acc));
            Assert.areEqual(!String.isEmpty(name1), typeIsNotEmptyPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectStringPredicateProvider.StringOperator.containing
     */
    @IsTest
    static void containing() {
        // Given
        SObjectField accNameField = AfTestConsts.Account.Name;
        String nameFieldName = 'Name';
        IFunction getNameFunction = new SObjectFunctionProvider().get(accNameField);
        String value = 'Test';
        // When
        IPredicate nameContainsTestPredicate = PRED.is(getNameFunction).containing(value);
        IPredicate nameContainsTestPredicate1 = PRED.is(nameFieldName).containing(value);
        IPredicate nameContainsTestPredicate2 = PRED.is(accNameField).containing(value);
        IPredicate nameNotContainsTestPredicate = PRED.is(getNameFunction).notx().containing(value);
        IPredicate nameNotContainsTestPredicate1 = PRED.is(nameFieldName).notx().containing(value);
        IPredicate nameNotContainsTestPredicate2 = PRED.is(accNameField).notx().containing(value);
        // Then
        for (Account acc : INPUT) {
            String name = ((String) acc.get(accNameField));
            String name1 = ((String) acc.get(nameFieldName));
            Assert.areEqual(name.contains(value), nameContainsTestPredicate.test(acc));
            Assert.areEqual(name1.contains(value), nameContainsTestPredicate1.test(acc));
            Assert.areEqual(name1.contains(value), nameContainsTestPredicate2.test(acc));
            Assert.areEqual(!name.contains(value), nameNotContainsTestPredicate.test(acc));
            Assert.areEqual(!name1.contains(value), nameNotContainsTestPredicate1.test(acc));
            Assert.areEqual(!name1.contains(value), nameNotContainsTestPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectStringPredicateProvider.StringOperator.containingIc
     */
    @IsTest
    static void containingIc() {
        // Given
        SObjectField accNameField = AfTestConsts.Account.Name;
        String nameFieldName = 'Name';
        IFunction getNameFunction = new SObjectFunctionProvider().get(accNameField);
        String value = 'Test';
        // When
        IPredicate nameContainsIgnoreCaseTestPredicate = PRED.is(getNameFunction).containingIc(value);
        IPredicate nameContainsIgnoreCaseTestPredicate1 = PRED.is(nameFieldName).containingIc(value);
        IPredicate nameContainsIgnoreCaseTestPredicate2 = PRED.is(accNameField).containingIc(value);
        IPredicate nameNotContainsIgnoreCaseTestPredicate = PRED.is(getNameFunction).notx().containingIc(value);
        IPredicate nameNotContainsIgnoreCaseTestPredicate1 = PRED.is(nameFieldName).notx().containingIc(value);
        IPredicate nameNotContainsIgnoreCaseTestPredicate2 = PRED.is(accNameField).notx().containingIc(value);
        // Then
        for (Account acc : INPUT) {
            String name = ((String) acc.get(accNameField));
            String name1 = ((String) acc.get(nameFieldName));
            Assert.areEqual(name.containsIgnoreCase(value), nameContainsIgnoreCaseTestPredicate.test(acc));
            Assert.areEqual(name1.containsIgnoreCase(value), nameContainsIgnoreCaseTestPredicate1.test(acc));
            Assert.areEqual(name1.containsIgnoreCase(value), nameContainsIgnoreCaseTestPredicate2.test(acc));
            Assert.areEqual(!name.containsIgnoreCase(value), nameNotContainsIgnoreCaseTestPredicate.test(acc));
            Assert.areEqual(!name1.containsIgnoreCase(value), nameNotContainsIgnoreCaseTestPredicate1.test(acc));
            Assert.areEqual(!name1.containsIgnoreCase(value), nameNotContainsIgnoreCaseTestPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectStringPredicateProvider.StringOperator.startingWith
     */
    @IsTest
    static void startingWith() {
        // Given
        SObjectField accNameField = AfTestConsts.Account.Name;
        String nameFieldName = 'Name';
        IFunction getNameFunction = new SObjectFunctionProvider().get(accNameField);
        String value = 'Test';
        // When
        IPredicate nameStartsWithTestPredicate = PRED.is(getNameFunction).startingWith(value);
        IPredicate nameStartsWithTestPredicate1 = PRED.is(nameFieldName).startingWith(value);
        IPredicate nameStartsWithTestPredicate2 = PRED.is(accNameField).startingWith(value);
        IPredicate nameNotStartsWithTestPredicate = PRED.is(getNameFunction).notx().startingWith(value);
        IPredicate nameNotStartsWithTestPredicate1 = PRED.is(nameFieldName).notx().startingWith(value);
        IPredicate nameNotStartsWithTestPredicate2 = PRED.is(accNameField).notx().startingWith(value);
        // Then
        for (Account acc : INPUT) {
            String name = ((String) acc.get(accNameField));
            String name1 = ((String) acc.get(nameFieldName));
            Assert.areEqual(name.startsWith(value), nameStartsWithTestPredicate.test(acc));
            Assert.areEqual(name1.startsWith(value), nameStartsWithTestPredicate1.test(acc));
            Assert.areEqual(name1.startsWith(value), nameStartsWithTestPredicate2.test(acc));
            Assert.areEqual(!name.startsWith(value), nameNotStartsWithTestPredicate.test(acc));
            Assert.areEqual(!name1.startsWith(value), nameNotStartsWithTestPredicate1.test(acc));
            Assert.areEqual(!name1.startsWith(value), nameNotStartsWithTestPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectStringPredicateProvider.StringOperator.startingWithIc
     */
    @IsTest
    static void startingWithIc() {
        // Given
        SObjectField accNameField = AfTestConsts.Account.Name;
        String nameFieldName = 'Name';
        IFunction getNameFunction = new SObjectFunctionProvider().get(accNameField);
        String value = 'Test';
        // When
        IPredicate nameStartsWithIgnoreCaseTestPredicate = PRED.is(getNameFunction).startingWithIc(value);
        IPredicate nameStartsWithIgnoreCaseTestPredicate1 = PRED.is(nameFieldName).startingWithIc(value);
        IPredicate nameStartsWithIgnoreCaseTestPredicate2 = PRED.is(accNameField).startingWithIc(value);
        IPredicate nameNotStartsWithIgnoreCaseTestPredicate = PRED.is(getNameFunction).notx().startingWithIc(value);
        IPredicate nameNotStartsWithIgnoreCaseTestPredicate1 = PRED.is(nameFieldName).notx().startingWithIc(value);
        IPredicate nameNotStartsWithIgnoreCaseTestPredicate2 = PRED.is(accNameField).notx().startingWithIc(value);
        // Then
        for (Account acc : INPUT) {
            String name = ((String) acc.get(accNameField));
            String name1 = ((String) acc.get(nameFieldName));
            Assert.areEqual(name.startsWithIgnoreCase(value), nameStartsWithIgnoreCaseTestPredicate.test(acc));
            Assert.areEqual(name1.startsWithIgnoreCase(value), nameStartsWithIgnoreCaseTestPredicate1.test(acc));
            Assert.areEqual(name1.startsWithIgnoreCase(value), nameStartsWithIgnoreCaseTestPredicate2.test(acc));
            Assert.areEqual(!name.startsWithIgnoreCase(value), nameNotStartsWithIgnoreCaseTestPredicate.test(acc));
            Assert.areEqual(!name1.startsWithIgnoreCase(value), nameNotStartsWithIgnoreCaseTestPredicate1.test(acc));
            Assert.areEqual(!name1.startsWithIgnoreCase(value), nameNotStartsWithIgnoreCaseTestPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectStringPredicateProvider.StringOperator.endingWith
     */
    @IsTest
    static void endingWith() {
        // Given
        SObjectField accNameField = AfTestConsts.Account.Name;
        String nameFieldName = 'Name';
        IFunction getNameFunction = new SObjectFunctionProvider().get(accNameField);
        String value = 'Test';
        // When
        IPredicate nameEndsWithTestPredicate = PRED.is(getNameFunction).endingWith(value);
        IPredicate nameEndsWithTestPredicate1 = PRED.is(nameFieldName).endingWith(value);
        IPredicate nameEndsWithTestPredicate2 = PRED.is(accNameField).endingWith(value);
        IPredicate nameNotEndsWithTestPredicate = PRED.is(getNameFunction).notx().endingWith(value);
        IPredicate nameNotEndsWithTestPredicate1 = PRED.is(nameFieldName).notx().endingWith(value);
        IPredicate nameNotEndsWithTestPredicate2 = PRED.is(accNameField).notx().endingWith(value);
        // Then
        for (Account acc : INPUT) {
            String name = ((String) acc.get(accNameField));
            String name1 = ((String) acc.get(nameFieldName));
            Assert.areEqual(name.endsWith(value), nameEndsWithTestPredicate.test(acc));
            Assert.areEqual(name1.endsWith(value), nameEndsWithTestPredicate1.test(acc));
            Assert.areEqual(name1.endsWith(value), nameEndsWithTestPredicate2.test(acc));
            Assert.areEqual(!name.endsWith(value), nameNotEndsWithTestPredicate.test(acc));
            Assert.areEqual(!name1.endsWith(value), nameNotEndsWithTestPredicate1.test(acc));
            Assert.areEqual(!name1.endsWith(value), nameNotEndsWithTestPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectStringPredicateProvider.StringOperator.endingWithIc
     */
    @IsTest
    static void endingWithIc() {
        // Given
        SObjectField accNameField = AfTestConsts.Account.Name;
        String nameFieldName = 'Name';
        IFunction getNameFunction = new SObjectFunctionProvider().get(accNameField);
        String value = 'Test';
        // When
        IPredicate nameEndsWithIcTestPredicate = PRED.is(getNameFunction).endingWithIc(value);
        IPredicate nameEndsWithIcTestPredicate1 = PRED.is(nameFieldName).endingWithIc(value);
        IPredicate nameEndsWithIcTestPredicate2 = PRED.is(accNameField).endingWithIc(value);
        IPredicate nameNotEndsWithIcTestPredicate = PRED.is(getNameFunction).notx().endingWithIc(value);
        IPredicate nameNotEndsWithIcTestPredicate1 = PRED.is(nameFieldName).notx().endingWithIc(value);
        IPredicate nameNotEndsWithIcTestPredicate2 = PRED.is(accNameField).notx().endingWithIc(value);
        // Then
        for (Account acc : INPUT) {
            String name = ((String) acc.get(accNameField));
            String name1 = ((String) acc.get(nameFieldName));
            Assert.areEqual(name.endsWithIgnoreCase(value), nameEndsWithIcTestPredicate.test(acc));
            Assert.areEqual(name1.endsWithIgnoreCase(value), nameEndsWithIcTestPredicate1.test(acc));
            Assert.areEqual(name1.endsWithIgnoreCase(value), nameEndsWithIcTestPredicate2.test(acc));
            Assert.areEqual(!name.endsWithIgnoreCase(value), nameNotEndsWithIcTestPredicate.test(acc));
            Assert.areEqual(!name1.endsWithIgnoreCase(value), nameNotEndsWithIcTestPredicate1.test(acc));
            Assert.areEqual(!name1.endsWithIgnoreCase(value), nameNotEndsWithIcTestPredicate2.test(acc));
        }
    }

    /**
     * @see SObjectStringPredicateProvider.StringOperator.likex
     */
    @IsTest
    static void likex() {
        // Given
        String likeString = 'T%';
        SObjectField accNameField = AfTestConsts.Account.Name;
        String nameFieldName = 'Name';
        IFunction getNameFunction = new SObjectFunctionProvider().get(accNameField);
        // When
        IPredicate nameLikePredicate = PRED.is(getNameFunction).likex(likeString);
        IPredicate nameLikePredicate1 = PRED.is(nameFieldName).likex(likeString);
        IPredicate nameLikePredicate2 = PRED.is(accNameField).likex(likeString);
        // Then
        for (Account acc : INPUT) {
            String name = ((String) acc.get(accNameField));
            String name1 = ((String) acc.get(nameFieldName));
            Boolean isLikeName = Pattern.matches(
                '(?i)^' + likeString.replaceAll('([^\\w%_ ])', '\\\\$1')
                    .replace('%', '.*?').replace('_', '.{1}?') + '$', name
            );
            Boolean isLikeName1 = Pattern.matches(
                '(?i)^' + likeString.replaceAll('([^\\w%_ ])', '\\\\$1')
                    .replace('%', '.*?').replace('_', '.{1}?') + '$', name1
            );
            Assert.areEqual(isLikeName, nameLikePredicate.test(acc));
            Assert.areEqual(isLikeName1, nameLikePredicate1.test(acc));
            Assert.areEqual(isLikeName, nameLikePredicate2.test(acc));
        }
    }
}
