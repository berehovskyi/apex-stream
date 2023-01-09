/**
 * @see Consumer
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
public with sharing class ConsumerTest {

    private static final List<String> INPUT = new List<String>{ 'abcde', 'abc', 'fghi' };

    /**
     * @see Consumer.andThen
     * @see Consumer.compose
     */
    @IsTest
    static void default() {
        // When
        Consumer cons = new IterTestUtils.DoNothingConsumer();
        IConsumer composed = Consumer.compose(new List<IConsumer>{ cons, cons });
        IConsumer composed1 = cons.andThen(cons);
        // Then
        for (Integer i = 0, size = INPUT.size(); i < size; i++) {
            List<String> clone = INPUT.clone();
            cons.accept(clone[i]);
            composed.accept(clone[i]);
            composed1.accept(clone[i]);
            Assert.areEqual(clone[i], INPUT[i], Label.InputMutatedErrorMessage);
        }
    }

}
