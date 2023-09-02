/**
 * @see BiConsumer
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class BiConsumerTest {

    private static final List<Contact> CONTACTS = AfTestData.generateContacts();
    private static final List<AfPerson> PEOPLE = AfTestData.generatePersons();

    /**
     * @see BiConsumer.andThen
     * @see BiConsumer.compose
     */
    @IsTest
    @SuppressWarnings('PMD.MethodNamingConventions')
    static void default_sobject() {
        // Given
        Object constant = true;
        // When
        BiConsumer setDescFromDepartment = new AfTestCommons.SetFromRightBiConsumer(Contact.Description, Contact.Department);
        BiConsumer setDoNotCall = new AfTestCommons.SetFieldBiConsumer(AfTestConsts.DO_NOT_CALL, constant);
        IBiConsumer consumer = setDescFromDepartment.andThen(setDoNotCall);
        IBiConsumer consumer1 = setDoNotCall.compose(setDescFromDepartment);
        IBiConsumer consumer2 = BiConsumer.compose(new List<IBiConsumer>{ setDescFromDepartment, setDoNotCall });
        // Then
        Assert.areEqual(null, setDescFromDepartment.downstream);
        Assert.areEqual(null, setDoNotCall.downstream);
        for (Contact con : CONTACTS) {
            Contact expected = new Contact(Description = con.Department, DoNotCall = true);
            SObject src = AfTestCommons.deepClone(con);
            SObject target = new Contact();
            consumer.accept(src, target);
            Assert.areEqual(expected, target);
            
            SObject src1 = AfTestCommons.deepClone(con);
            SObject target1 = new Contact();
            consumer1.accept(src1, target1);
            Assert.areEqual(expected, target1);
            SObject src2 = AfTestCommons.deepClone(con);
            SObject target2 = new Contact();
            consumer2.accept(src2, target2);
            Assert.areEqual(expected, target2);
        }
    }

    /**
     * @see BiConsumer.andThen
     * @see BiConsumer.compose
     */
    @IsTest
    static void default() {
        // Given
        AfPerson sam = new AfPerson('Sam', 15, Date.newInstance(1990, 1, 2), 5L, true);
        // When
        BiConsumer setNameFromRight = new AfTestCommons.SetNameFromRight();
        BiConsumer setAgeFromLeft = new AfTestCommons.SetAgeFromLeft();
        IBiConsumer consumer = setNameFromRight.andThen(setAgeFromLeft);
        IBiConsumer consumer1 = setNameFromRight.compose(setAgeFromLeft);
        IBiConsumer consumer2 = BiConsumer.compose(new List<IBiConsumer>{ setNameFromRight, setAgeFromLeft });
        // When
        Assert.areEqual(null, setNameFromRight.downstream);
        Assert.areEqual(null, setAgeFromLeft.downstream);
        for (AfPerson person : PEOPLE) {
            AfPerson expectedO1 = (AfPerson) AfTestCommons.deepClone(sam, AfPerson.class);
            AfPerson expectedO2 = (AfPerson) AfTestCommons.deepClone(person, AfPerson.class);
            expectedO1.setName(expectedO2.getName());
            expectedO2.setAge(expectedO1.getAge());
            
            AfPerson o1 = (AfPerson) AfTestCommons.deepClone(sam, AfPerson.class);
            AfPerson o2 = (AfPerson) AfTestCommons.deepClone(person, AfPerson.class);
            consumer.accept(o1, o2);
            Assert.areEqual(expectedO1, o1);
            Assert.areEqual(expectedO2, o2);

            AfPerson o3 = (AfPerson) AfTestCommons.deepClone(sam, AfPerson.class);
            AfPerson o4 = (AfPerson) AfTestCommons.deepClone(person, AfPerson.class);
            consumer1.accept(o3, o4);
            Assert.areEqual(expectedO1, o3);
            Assert.areEqual(expectedO2, o4);

            AfPerson o5 = (AfPerson) AfTestCommons.deepClone(sam, AfPerson.class);
            AfPerson o6 = (AfPerson) AfTestCommons.deepClone(person, AfPerson.class);
            consumer2.accept(o5, o6);
            Assert.areEqual(expectedO1, o5);
            Assert.areEqual(expectedO2, o6);
        }
    }
    
}
