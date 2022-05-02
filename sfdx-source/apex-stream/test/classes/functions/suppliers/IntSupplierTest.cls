/**
 * @author O. Berehovskyi
 * @see IntSupplier
 */
@IsTest(IsParallel = true)
private class IntSupplierTest {

    /**
     * @see IntSupplier.increment
     * @see IntSupplier.fibonacci
     */
    @IsTest
    static void default() {
        // Given
        IIntSupplier incSupp = IntSupplier.increment();
        IIntSupplier incSupp1 = IntSupplier.increment(0, 2);
        IIntSupplier fibonacciSupp = IntSupplier.fibonacci();
        // When
        Integer actual = incSupp.get();
        Integer actual1 = incSupp.get();
        Integer actual2 = incSupp1.get();
        Integer actual3 = incSupp1.get();
        Integer actual4 = fibonacciSupp.get();
        Integer actual5 = fibonacciSupp.get();
        Integer actual6 = fibonacciSupp.get();
        // Then
        Validate.assertEquals(0, actual);
        Validate.assertEquals(1, actual1);
        Validate.assertEquals(0, actual2);
        Validate.assertEquals(2, actual3);
        Validate.assertEquals(1, actual4);
        Validate.assertEquals(1, actual5);
        Validate.assertEquals(2, actual6);
    }

}
