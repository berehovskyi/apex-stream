/**
 * @see IntSupplier
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class IntSupplierTest {

    /**
     * @see IntSupplier.constant
     * @see IntSupplier.repeat
     */
    @IsTest
    static void default() {
        // Given
        Integer val = 1;
        Integer val1 = 4;
        Integer val2 = 8;
        List<Integer> values = new List<Integer>{ val, val1, val2 };
        IIntIterable intStream = IntStream.of(values);
        IIntSupplier constSupplier = IntSupplier.constant(val);
        IIntSupplier repeatSupplier = IntSupplier.repeat(values);
        IIntSupplier repeatSupplier1 = IntSupplier.repeat(intStream);
        // When
        Integer value = constSupplier.get();
        value = 50;
        Integer actual = constSupplier.get();
        Integer actual1 = constSupplier.get();
        Integer actual2 = repeatSupplier.get();
        Integer actual3 = repeatSupplier.get();
        Integer actual4 = repeatSupplier.get();
        Integer actual5 = repeatSupplier.get();
        Integer actual6 = repeatSupplier1.get();
        Integer actual7 = repeatSupplier1.get();
        Integer actual8 = repeatSupplier1.get();
        Integer actual9 = repeatSupplier1.get();
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
        Assert.isTrue(((IntStream) intStream).isOperated);
    }

}