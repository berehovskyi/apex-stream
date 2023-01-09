/**
 * @see DoubleConsumer
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleConsumerTest {

    private static final List<Double> INPUT = new List<Double>{ 0, null, 1L, -10L };

    /**
     * @see DoubleConsumer.andThen
     * @see DoubleConsumer.compose
     */
    @IsTest
    static void default() {
        // When
        DoubleConsumer cons = new IterTestUtils.DoNothingDoubleConsumer();
        IDoubleConsumer composed = DoubleConsumer.compose(new List<IDoubleConsumer>{ cons, cons });
        IDoubleConsumer composed1 = cons.andThen(cons);
        // Then
        for (Integer i = 0, size = INPUT.size(); i < size; i++) {
            List<Double> clone = INPUT.clone();
            cons.accept(clone[i]);
            composed.accept(clone[i]);
            composed1.accept(clone[i]);
            Validate.assertEquals(clone[i], INPUT[i], Label.InputMutatedErrorMessage);
        }
    }

}
