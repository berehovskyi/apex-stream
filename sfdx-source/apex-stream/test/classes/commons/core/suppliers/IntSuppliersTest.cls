/**
 * @see IntSuppliers
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntSuppliersTest {

    /**
     * @see IntSuppliers.increment
     * @see IntSuppliers.fibonacci
     * @see IntSuppliers.random
     */
    @IsTest
    static void default() {
        // Given
        IIntSupplier incSupp = IntSuppliers.increment();
        IIntSupplier incSupp1 = IntSuppliers.increment(0, 2);
        IIntSupplier fibonacciSupp = IntSuppliers.fibonacci();
        IIntSupplier randomSupp = IntSuppliers.random();
        // When
        new IntSuppliers();
        Integer actual = incSupp.get();
        Integer actual1 = incSupp.get();
        Integer actual2 = incSupp1.get();
        Integer actual3 = incSupp1.get();
        Integer actual4 = fibonacciSupp.get();
        Integer actual5 = fibonacciSupp.get();
        Integer actual6 = fibonacciSupp.get();
        Integer actual7 = randomSupp.get();
        // Then
        Validate.assertEquals(0, actual);
        Validate.assertEquals(1, actual1);
        Validate.assertEquals(0, actual2);
        Validate.assertEquals(2, actual3);
        Validate.assertEquals(1, actual4);
        Validate.assertEquals(1, actual5);
        Validate.assertEquals(2, actual6);
        Validate.assert((Object) actual7 instanceof Integer);
    }

}
