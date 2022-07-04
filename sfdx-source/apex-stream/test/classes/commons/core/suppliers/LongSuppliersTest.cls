/**
 * @see LongSuppliers
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongSuppliersTest {

    /**
     * @see LongSuppliers.increment
     * @see LongSuppliers.fibonacci
     * @see LongSuppliers.random
     */
    @IsTest
    static void default() {
        // Given
        ILongSupplier incSupp = LongSuppliers.increment();
        ILongSupplier incSupp1 = LongSuppliers.increment(0L, 2);
        ILongSupplier fibonacciSupp = LongSuppliers.fibonacci();
        ILongSupplier randomSupp = LongSuppliers.random();
        // When
        new LongSuppliers();
        Long actual = incSupp.get();
        Long actual1 = incSupp.get();
        Long actual2 = incSupp1.get();
        Long actual3 = incSupp1.get();
        Long actual4 = fibonacciSupp.get();
        Long actual5 = fibonacciSupp.get();
        Long actual6 = fibonacciSupp.get();
        Long actual7 = randomSupp.get();
        // Then
        Validate.assertEquals(0L, actual);
        Validate.assertEquals(1L, actual1);
        Validate.assertEquals(0L, actual2);
        Validate.assertEquals(2L, actual3);
        Validate.assertEquals(1L, actual4);
        Validate.assertEquals(1L, actual5);
        Validate.assertEquals(2L, actual6);
        Validate.assert((Object) actual7 instanceof Long);
    }

}
