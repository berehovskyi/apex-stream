/**
 * @author Oleh Berehovskyi
 * @see Consumer
 */
@IsTest(IsParallel = true)
public with sharing class ConsumerTest {

    private static List<String> input = new List<String>{ 'abcde', 'abc', 'fghi' };

    /**
     * @see Consumer.andThen
     * @see Consumer.compose
     */
    @IsTest
    static void defaultMethods() {
        // When
        Consumer debugConsumer = Consumer.debug();
        Consumer debugPrettyConsumer = Consumer.debugPretty();
        IConsumer composed = Consumer.compose(new List<IConsumer>{ debugConsumer, debugPrettyConsumer });
        IConsumer composed1 = debugConsumer.andThen(debugPrettyConsumer);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            List<String> clone = input.clone();
            debugConsumer.accept(clone[i]);
            debugPrettyConsumer.accept(clone[i]);
            composed.accept(clone[i]);
            composed1.accept(clone[i]);
            Validate.assertEquals(clone[i], input[i], Label.InputMutatedErrorMessage);
        }
    }

    /**
     * @see Consumer.debug
     * @see Consumer.debugPretty
     */
    @IsTest
    static void debug() {
        // Given
        String message = 'message ';
        // When
        Consumer debugConsumer = Consumer.debug();
        Consumer debugPrettyConsumer = Consumer.debugPretty();
        Consumer debugConsumer1 = Consumer.debug(LoggingLevel.DEBUG, message);
        Consumer debugPrettyConsumer1 = Consumer.debugPretty(LoggingLevel.DEBUG, message);
        // Then
        for (Integer i = 0, size = input.size(); i < size; i++) {
            List<String> clone = input.clone();
            debugConsumer.accept(clone[i]);
            debugPrettyConsumer.accept(clone[i]);
            debugConsumer1.accept(clone[i]);
            debugPrettyConsumer1.accept(clone[i]);
            Validate.assertEquals(clone[i], input[i], Label.InputMutatedErrorMessage);
        }
    }

}
