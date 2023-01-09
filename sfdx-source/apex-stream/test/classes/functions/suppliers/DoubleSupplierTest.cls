/**
 * @see DoubleSupplier
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class DoubleSupplierTest {

    /**
     * @see DoubleSupplier.constant
     * @see DoubleSupplier.repeat
     */
    @IsTest
    static void default() {
        // Given
        Double val = 1.5;
        Double val1 = 4.5;
        Double val2 = 8.25;
        List<Double> values = new List<Double>{ val, val1, val2 };
        IDoubleIterable doubleStream = DoubleStream.of(values);
        IDoubleSupplier constSupplier = DoubleSupplier.constant(val);
        IDoubleSupplier repeatSupplier = DoubleSupplier.repeat(values);
        IDoubleSupplier repeatSupplier1 = DoubleSupplier.repeat(doubleStream);
        // When
        Double value = constSupplier.get();
        value = 50.51;
        Double actual = constSupplier.get();
        Double actual1 = constSupplier.get();
        Double actual2 = repeatSupplier.get();
        Double actual3 = repeatSupplier.get();
        Double actual4 = repeatSupplier.get();
        Double actual5 = repeatSupplier.get();
        Double actual6 = repeatSupplier1.get();
        Double actual7 = repeatSupplier1.get();
        Double actual8 = repeatSupplier1.get();
        Double actual9 = repeatSupplier1.get();
        // Then
        Assert.areEqual(val, actual);
        Assert.areEqual(val, actual1);
        Assert.areEqual(val, actual2);
        Assert.areEqual(val1, actual3);
        Assert.areEqual(val2, actual4);
        Assert.areEqual(val, actual5);
        Assert.areEqual(val, actual6);
        Assert.areEqual(val1, actual7);
        Assert.areEqual(val2, actual8);
        Assert.areEqual(val, actual9);
        Assert.isTrue(((DoubleStream) doubleStream).isOperated);
    }

}