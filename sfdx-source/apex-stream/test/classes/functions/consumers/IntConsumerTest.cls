/**
 * @author O. Berehovskyi
 * @see IntConsumer
 */
@IsTest(IsParallel = true)
private class IntConsumerTest {

    private static List<Integer> input = new List<Integer>{ 0, null, 1, -10 };

    /**
     * @see IntConsumer.andThen
     * @see IntConsumer.compose
     */
    @IsTest
    static void defaultMethods() {
        // When
        IntConsumer debugConsumer = IntConsumer.debug();
        IIntConsumer composed = IntConsumer.compose(new List<IIntConsumer>{ debugConsumer, debugConsumer });
        IIntConsumer composed1 = debugConsumer.andThen(debugConsumer);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            List<Integer> clone = input.clone();
            debugConsumer.accept(clone[i]);
            composed.accept(clone[i]);
            composed1.accept(clone[i]);
            Validate.assertEquals(clone[i], input[i], Label.InputMutatedErrorMessage);
        }
    }

    /**
     * @see IntConsumer.debug
     */
    @IsTest
    static void debug() {
        // Given
        String message = 'message ';
        // When
        IIntConsumer debugConsumer = IntConsumer.debug();
        IIntConsumer debugConsumer1 = IntConsumer.debug(LoggingLevel.DEBUG);
        IIntConsumer debugConsumer2 = IntConsumer.debug(message);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            List<Integer> clone = input.clone();
            debugConsumer.accept(clone[i]);
            debugConsumer1.accept(clone[i]);
            debugConsumer2.accept(clone[i]);
            Validate.assertEquals(clone[i], input[i], Label.InputMutatedErrorMessage);
        }
    }

}
