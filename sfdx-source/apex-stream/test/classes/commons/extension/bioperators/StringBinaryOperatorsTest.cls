/**
 * @see StringBinaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class StringBinaryOperatorsTest {

    private static final List<String> INPUT = IterTestUtils.generateStrings();

    static {
        new StringBinaryOperators();
    }
    
    /**
     * @see StringBinaryOperators.concat
     */
    @IsTest
    static void concat() {
        // Given
        String s = 'Str';
        String delimiter = ';';
        // When
        IBinaryOperator concat = StringBinaryOperators.concat();
        IBinaryOperator concat1 = StringBinaryOperators.concat(delimiter);
        // Then
        for (String o : INPUT) {
            Assert.areEqual(o + s, concat.apply(o, s));
        }
        for (String o : INPUT) {
            Assert.areEqual(o + delimiter + s, concat1.apply(o, s));
        }
    }
    
}
