/**
 * @see EnumerablePipeline
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexAssertionsShouldIncludeMessage, PMD.ApexUnitTestClassShouldHaveRunAs')
private class EnumerablePipelineTest {

    private static final List<Integer> INTS = AsTestData.generateInts();

    /**
     * @see EnumerablePipeline.sort
     */
    @IsTest
    private static void sort() {
        // Given
        AsPerson john = new AsPerson('John', 31, Date.newInstance(1990, 1, 2), 1L, true);
        AsPerson jake = new AsPerson('Jake', 33, Date.newInstance(1991, 2, 3), 2L, true);
        AsPerson sam = new AsPerson('Sam', 16, Date.newInstance(2005, 2, 3), 0L, true);
        AsPerson lucy = new AsPerson('Lucy', 25, Date.newInstance(1991, 2, 3), 3L, true);
        List<AsPerson> input = new List<AsPerson>{ john, jake, null, sam, lucy };
        List<String> input1 = new List<String>{ 'foo', 'bar', 'baz', '', null };
        List<AsPerson> clone = new List<AsPerson>{ john, jake, null, sam, lucy };
        List<String> clone1 = (List<String>) AsTestCommons.deepClone(input1, List<String>.class);
        // When
        List<Object> actual2 = EnumerablePipeline.sort(clone, Comparer.nullsLast(Comparer.defaultOrder()));
        List<Object> actual3 = EnumerablePipeline.sort(clone1, Comparer.reverseOrder());
        // Then
        List<Object> expected2 = new List<Object>{ sam, john, jake, lucy, null };
        List<Object> expected3 = new List<Object>{ 'foo', 'baz', 'bar', '', null };
        Assert.areEqual(expected2, actual2);
        Assert.areEqual(expected3, actual3);
        Assert.areEqual(input, clone, Label.AS_ErrorMessage_InputMutated);
    }

    /**
     * @see EnumerablePipeline.toList
     */
    @IsTest
    private static void toList() {
        // When
        List<Object> actual = EnumerablePipeline.toList(INTS);
        List<Long> actual1 = (List<Long>) EnumerablePipeline.toList(INTS, Long.class);
        // Then
        List<Long> expected = new List<Long>();
        for (Integer i : INTS) {
            expected.add(i);
        }
        Assert.areEqual(INTS, actual);
        Assert.areEqual(expected, actual1);
    }

    /**
     * @see EnumerablePipeline.toObjectSet
     */
    @IsTest
    private static void toObjectSet() {
        // Given
        Integer value = 1;
        // When
        Set<Object> actual = EnumerablePipeline.toObjectSet(INTS, new AsTestCommons.AddIntOp(value));
        // Then
        Set<Object> expected = new Set<Object>();
        for (Integer i : INTS) {
            expected.add(i + value);
        }
        Assert.areEqual(expected, actual);
    }
}
