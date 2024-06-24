/**
 * @see Consumer
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexAssertionsShouldIncludeMessage, PMD.ApexUnitTestClassShouldHaveRunAs')
private class ConsumerTest {

    private static final List<Contact> CONTACTS = AfTestData.generateContacts2();
    private static final List<AfPerson> PEOPLE = AfTestData.generatePersons();

    /**
     * @see Consumer.andThen
     * @see Consumer.compose
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void default_sobject() {
        // Given
        Object constant = true;
        // When
        Consumer setDescFromDepartment = new AfTestCommons.SetFieldConsumer(Contact.Description, new AfTestCommons.GetFieldFunction(Contact.Department));
        Consumer setDoNotCall = new AfTestCommons.SetFieldConsumer(AfTestConsts.DO_NOT_CALL, Function.constant(constant));
        IConsumer cons = setDescFromDepartment.andThen(setDoNotCall);
        IConsumer cons1 = Consumer.compose(new List<IConsumer>{ setDescFromDepartment, setDoNotCall });
        // Then
        for (Contact con : CONTACTS) {
            SObject clone = AfTestCommons.deepClone(con);
            clone.put(Contact.Description, clone.get(Contact.Department));
            SObject cloneToConsume = AfTestCommons.deepClone(con);
            setDescFromDepartment.accept(cloneToConsume);
            Assert.areEqual(clone, cloneToConsume);

            SObject clone1 = AfTestCommons.deepClone(con);
            clone1.put(AfTestConsts.DO_NOT_CALL, constant);
            SObject cloneToConsume1 = AfTestCommons.deepClone(con);
            setDoNotCall.accept(cloneToConsume1);
            Assert.areEqual(clone1, cloneToConsume1);

            SObject clone2 = AfTestCommons.deepClone(con);
            clone2.put(Contact.Description, clone2.get(Contact.Department));
            clone2.put(AfTestConsts.DO_NOT_CALL, constant);
            SObject cloneToConsume2 = AfTestCommons.deepClone(con);
            cons.accept(cloneToConsume2);
            SObject cloneToConsume3 = AfTestCommons.deepClone(con);
            cons1.accept(cloneToConsume3);
            Assert.areEqual(clone2, cloneToConsume2);
            Assert.areEqual(clone2, cloneToConsume3);
        }
    }

    /**
     * @see Consumer.andThen
     * @see Consumer.compose
     */
    @IsTest
    static void default() {
        // Given
        String newName = 'John';
        Boolean isActive = false;
        // When
        Consumer setJohnNameConsumer = new AfTestCommons.SetNameConsumer(newName);
        Consumer setActiveFalseConsumer = new AfTestCommons.SetActiveConsumer(isActive);
        IConsumer cons = setJohnNameConsumer.andThen(setActiveFalseConsumer);
        IConsumer cons1 = Consumer.compose(new List<IConsumer>{ setJohnNameConsumer, setActiveFalseConsumer });
        // Then
        for (AfPerson person : PEOPLE) {
            AfPerson clone = (AfPerson) AfTestCommons.deepClone(person, AfPerson.class);
            clone.setName(newName);
            AfPerson cloneToConsume = (AfPerson) AfTestCommons.deepClone(person, AfPerson.class);
            setJohnNameConsumer.accept(cloneToConsume);
            Assert.areEqual(clone, cloneToConsume);

            AfPerson clone1 = (AfPerson) AfTestCommons.deepClone(person, AfPerson.class);
            clone1.setActive(isActive);
            AfPerson cloneToConsume1 = (AfPerson) AfTestCommons.deepClone(person, AfPerson.class);
            setActiveFalseConsumer.accept(cloneToConsume1);
            Assert.areEqual(clone1, cloneToConsume1);

            AfPerson clone2 = (AfPerson) AfTestCommons.deepClone(person, AfPerson.class);
            clone2.setActive(isActive);
            clone2.setName(newName);
            AfPerson cloneToConsume2 = (AfPerson) AfTestCommons.deepClone(person, AfPerson.class);
            AfPerson cloneToConsume3 = (AfPerson) AfTestCommons.deepClone(person, AfPerson.class);
            cons.accept(cloneToConsume2);
            cons1.accept(cloneToConsume3);
            Assert.areEqual(clone2, cloneToConsume2);
            Assert.areEqual(clone2, cloneToConsume3);
        }
    }

}
