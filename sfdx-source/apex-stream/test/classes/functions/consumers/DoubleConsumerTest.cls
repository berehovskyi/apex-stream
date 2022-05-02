/**
 * @author O. Berehovskyi
 * @see DoubleConsumer
 */
@IsTest(IsParallel = true)
private class DoubleConsumerTest {

    private static List<Double> input = new List<Double>{ 0, null, 1L, -10L };

    /**
     * @see DoubleConsumer.andThen
     * @see DoubleConsumer.compose
     */
    @IsTest
    static void defaultMethods() {
        // When
        DoubleConsumer debugConsumer = DoubleConsumer.debug();
        IDoubleConsumer composed = DoubleConsumer.compose(new List<IDoubleConsumer>{ debugConsumer, debugConsumer });
        IDoubleConsumer composed1 = debugConsumer.andThen(debugConsumer);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            List<Double> clone = input.clone();
            debugConsumer.accept(clone[i]);
            composed.accept(clone[i]);
            composed1.accept(clone[i]);
            Validate.assertEquals(clone[i], input[i], Label.InputMutatedErrorMessage);
        }
    }

    /**
     * @see DoubleConsumer.debug
     */
    @IsTest
    static void debug() {
        // Given
        String message = 'message ';
        // When
        IDoubleConsumer debugConsumer = DoubleConsumer.debug();
        IDoubleConsumer debugConsumer1 = DoubleConsumer.debug(LoggingLevel.DEBUG);
        IDoubleConsumer debugConsumer2 = DoubleConsumer.debug(message);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            List<Double> clone = input.clone();
            debugConsumer.accept(clone[i]);
            debugConsumer1.accept(clone[i]);
            debugConsumer2.accept(clone[i]);
            Validate.assertEquals(clone[i], input[i], Label.InputMutatedErrorMessage);
        }
    }

}
