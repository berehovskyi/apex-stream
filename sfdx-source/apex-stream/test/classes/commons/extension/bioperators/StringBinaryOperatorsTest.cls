/**
 * @see StringBinaryOperators
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class StringBinaryOperatorsTest {

    private static List<String> strings = IterTestUtils.generateStrings();
    
    /**
     * @see StringBinaryOperators.concat
     */
    @IsTest
    static void concat() {
        // Given
        String s = 'Str';
        String delimiter = ';';
        // When
        new StringBinaryOperators();
        IBinaryOperator concat = StringBinaryOperators.concat();
        IBinaryOperator concat1 = StringBinaryOperators.concat(delimiter);
        // Then
        for (String o : strings) {
            Validate.assertEquals(o + s, concat.apply(o, s));
        }
        for (String o : strings) {
            Validate.assertEquals(o + delimiter + s, concat1.apply(o, s));
        }
    }
    
}
