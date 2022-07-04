/**
 * @see IntConsumer
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntConsumerTest {

    private static List<Integer> input = new List<Integer>{ 0, null, 1, -10 };

    /**
     * @see IntConsumer.andThen
     * @see IntConsumer.compose
     */
    @IsTest
    static void default() {
        // When
        IntConsumer cons = new IterTestUtils.DoNothingIntConsumer();
        IIntConsumer composed = IntConsumer.compose(new List<IIntConsumer>{ cons, cons });
        IIntConsumer composed1 = cons.andThen(cons);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            List<Integer> clone = input.clone();
            cons.accept(clone[i]);
            composed.accept(clone[i]);
            composed1.accept(clone[i]);
            Validate.assertEquals(clone[i], input[i], Label.InputMutatedErrorMessage);
        }
    }

}
