/**
 * @author O. Berehovskyi
 * @see LongConsumer
 */
@IsTest(IsParallel = true)
private class LongConsumerTest {

    private static List<Long> input = new List<Long>{ 0, null, 1L, -10L };

    /**
     * @see LongConsumer.andThen
     * @see LongConsumer.compose
     */
    @IsTest
    static void defaultMethods() {
        // When
        LongConsumer debugConsumer = LongConsumer.debug();
        ILongConsumer composed = LongConsumer.compose(new List<ILongConsumer>{ debugConsumer, debugConsumer });
        ILongConsumer composed1 = debugConsumer.andThen(debugConsumer);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            List<Long> clone = input.clone();
            debugConsumer.accept(clone[i]);
            composed.accept(clone[i]);
            composed1.accept(clone[i]);
            Validate.assertEquals(clone[i], input[i], Label.InputMutatedErrorMessage);
        }
    }

    /**
     * @see LongConsumer.debug
     */
    @IsTest
    static void debug() {
        // Given
        String message = 'message ';
        // When
        ILongConsumer debugConsumer = LongConsumer.debug();
        ILongConsumer debugConsumer1 = LongConsumer.debug(LoggingLevel.DEBUG);
        ILongConsumer debugConsumer2 = LongConsumer.debug(message);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            List<Long> clone = input.clone();
            debugConsumer.accept(clone[i]);
            debugConsumer1.accept(clone[i]);
            debugConsumer2.accept(clone[i]);
            Validate.assertEquals(clone[i], input[i], Label.InputMutatedErrorMessage);
        }
    }

}
