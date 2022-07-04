/**
 * @see DoubleFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleFunctionsTest {

    /**
     * @see DoubleFunctions.toString
     * @see DoubleFunctions.format
     */
    @IsTest
    static void default() {
        // Given
        List<Double> input = new List<Double>{ -5.5, 0, 1.0, 3, 8.99, Math.PI };
        IDoubleFunction toString = DoubleFunctions.toString();
        IDoubleFunction format = DoubleFunctions.format();
        // When
        new DoubleFunctions();
        for (Double d : input) {
            Validate.assertEquals(String.valueOf(d), toString.apply(d));
            Validate.assertEquals(d.format(), format.apply(d));
        }
    }

}
