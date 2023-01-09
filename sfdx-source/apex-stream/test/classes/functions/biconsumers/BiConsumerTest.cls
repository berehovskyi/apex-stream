/**
 * @see BiConsumer
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class BiConsumerTest {

    private static final List<IterTestUtils.Person> INPUT = IterTestUtils.generatePersons();

    /**
     * @see BiConsumer.andThen
     * @see BiConsumer.compose
     */
    @IsTest
    static void default() {
        IterTestUtils.Person sam = new IterTestUtils.Person('Sam', 15, Date.newInstance(1990, 1, 2), 5L, true);
        // Given
        BiConsumer setNameFromRight = new IterTestUtils.SetNameFromRight();
        BiConsumer setAgeFromLeft = new IterTestUtils.SetAgeFromLeft();
        IBiConsumer consumer = setNameFromRight.andThen(setAgeFromLeft);
        IBiConsumer consumer1 = setNameFromRight.compose(setAgeFromLeft);
        IBiConsumer consumer2 = BiConsumer.compose(new List<IBiConsumer>{ setNameFromRight, setAgeFromLeft });
        for (IterTestUtils.Person person : INPUT) {
            IterTestUtils.Person expectedO1 = (IterTestUtils.Person) IterTestUtils.deepClone(sam, IterTestUtils.Person.class);
            IterTestUtils.Person expectedO2 = (IterTestUtils.Person) IterTestUtils.deepClone(person, IterTestUtils.Person.class);
            expectedO1.setName(expectedO2.getName());
            expectedO2.setAge(expectedO1.getAge());
            
            IterTestUtils.Person o1 = (IterTestUtils.Person) IterTestUtils.deepClone(sam, IterTestUtils.Person.class);
            IterTestUtils.Person o2 = (IterTestUtils.Person) IterTestUtils.deepClone(person, IterTestUtils.Person.class);
            consumer.accept(o1, o2);
            Assert.areEqual(expectedO1, o1);
            Assert.areEqual(expectedO2, o2);

            IterTestUtils.Person o3 = (IterTestUtils.Person) IterTestUtils.deepClone(sam, IterTestUtils.Person.class);
            IterTestUtils.Person o4 = (IterTestUtils.Person) IterTestUtils.deepClone(person, IterTestUtils.Person.class);
            consumer1.accept(o3, o4);
            Assert.areEqual(expectedO1, o3);
            Assert.areEqual(expectedO2, o4);

            IterTestUtils.Person o5 = (IterTestUtils.Person) IterTestUtils.deepClone(sam, IterTestUtils.Person.class);
            IterTestUtils.Person o6 = (IterTestUtils.Person) IterTestUtils.deepClone(person, IterTestUtils.Person.class);
            consumer2.accept(o5, o6);
            Assert.areEqual(expectedO1, o5);
            Assert.areEqual(expectedO2, o6);
        }
    }
    
}
