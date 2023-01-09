/**
 * @see IntSuppliers
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntSuppliersTest {

    static {
        new IntSuppliers();
    }

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
        Integer actual = incSupp.get();
        Integer actual1 = incSupp.get();
        Integer actual2 = incSupp1.get();
        Integer actual3 = incSupp1.get();
        Integer actual4 = fibonacciSupp.get();
        Integer actual5 = fibonacciSupp.get();
        Integer actual6 = fibonacciSupp.get();
        Integer actual7 = randomSupp.get();
        // Then
        Assert.areEqual(0, actual);
        Assert.areEqual(1, actual1);
        Assert.areEqual(0, actual2);
        Assert.areEqual(2, actual3);
        Assert.areEqual(1, actual4);
        Assert.areEqual(1, actual5);
        Assert.areEqual(2, actual6);
        Assert.isTrue((Object) actual7 instanceof Integer);
    }

}
