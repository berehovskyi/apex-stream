/**
 * @author O. Berehovskyi
 * @see DoubleFunction
 */
@IsTest(IsParallel = true)
private class DoubleFunctionTest {

    /**
     * @see DoubleFunction.toString
     * @see DoubleFunction.format
     */
    @IsTest
    static void default() {
        // Given
        List<Double> input = new List<Double>{ -5.5, 0, 1.0, 3, 8.99, Math.PI };
        IDoubleFunction toString = DoubleFunction.toString();
        IDoubleFunction format = DoubleFunction.format();
        // When
        for (Double d : input) {
            Validate.assertEquals(String.valueOf(d), toString.apply(d));
            Validate.assertEquals(d.format(), format.apply(d));
        }
    }

}
