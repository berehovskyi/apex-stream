/**
 * @see LongSupplier
 * 
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class LongSupplierTest {

    /**
     * @see LongSupplier.constant
     * @see LongSupplier.repeat
     */
    @IsTest
    static void default() {
        // Given
        Long val = 1L;
        Long val1 = 4L;
        Long val2 = 8L;
        List<Long> values = new List<Long>{ val, val1, val2 };
        ILongIterable longStream = LongStream.of(values);
        ILongSupplier constSupplier = LongSupplier.constant(val);
        ILongSupplier repeatSupplier = LongSupplier.repeat(values);
        ILongSupplier repeatSupplier1 = LongSupplier.repeat(longStream);
        // When
        Long value = constSupplier.get();
        value = 50L;
        Long actual = constSupplier.get();
        Long actual1 = constSupplier.get();
        Long actual2 = repeatSupplier.get();
        Long actual3 = repeatSupplier.get();
        Long actual4 = repeatSupplier.get();
        Long actual5 = repeatSupplier.get();
        Long actual6 = repeatSupplier1.get();
        Long actual7 = repeatSupplier1.get();
        Long actual8 = repeatSupplier1.get();
        Long actual9 = repeatSupplier1.get();
        // Then
        Validate.assertEquals(val, actual);
        Validate.assertEquals(val, actual1);
        Validate.assertEquals(val, actual2);
        Validate.assertEquals(val1, actual3);
        Validate.assertEquals(val2, actual4);
        Validate.assertEquals(val, actual5);
        Validate.assertEquals(val, actual6);
        Validate.assertEquals(val1, actual7);
        Validate.assertEquals(val2, actual8);
        Validate.assertEquals(val, actual9);
        Validate.assert(((LongStream) longStream).isOperated);
    }
    
}