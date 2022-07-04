/**
 * @see LongConsumer
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongConsumerTest {

    private static List<Long> input = new List<Long>{ 0, null, 1L, -10L };

    /**
     * @see LongConsumer.andThen
     * @see LongConsumer.compose
     */
    @IsTest
    static void default() {
        // When
        LongConsumer cons = new IterTestUtils.DoNothingLongConsumer();
        ILongConsumer composed = LongConsumer.compose(new List<ILongConsumer>{ cons, cons });
        ILongConsumer composed1 = cons.andThen(cons);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            List<Long> clone = input.clone();
            cons.accept(clone[i]);
            composed.accept(clone[i]);
            composed1.accept(clone[i]);
            Validate.assertEquals(clone[i], input[i], Label.InputMutatedErrorMessage);
        }
    }

}
