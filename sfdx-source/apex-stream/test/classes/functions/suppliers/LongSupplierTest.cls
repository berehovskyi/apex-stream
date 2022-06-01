/**
 * @author Oleh Berehovskyi
 * @see LongSupplier
 */
@IsTest(IsParallel = true)
private class LongSupplierTest {

    /**
     * @see LongSupplier.increment
     * @see LongSupplier.fibonacci
     */
    @IsTest
    static void default() {
        // Given
        ILongSupplier incSupp = LongSupplier.increment();
        ILongSupplier incSupp1 = LongSupplier.increment(0L, 2);
        ILongSupplier fibonacciSupp = LongSupplier.fibonacci();
        // When
        Long actual = incSupp.get();
        Long actual1 = incSupp.get();
        Long actual2 = incSupp1.get();
        Long actual3 = incSupp1.get();
        Long actual4 = fibonacciSupp.get();
        Long actual5 = fibonacciSupp.get();
        Long actual6 = fibonacciSupp.get();
        // Then
        Validate.assertEquals(0L, actual);
        Validate.assertEquals(1L, actual1);
        Validate.assertEquals(0L, actual2);
        Validate.assertEquals(2L, actual3);
        Validate.assertEquals(1L, actual4);
        Validate.assertEquals(1L, actual5);
        Validate.assertEquals(2L, actual6);
    }

}
