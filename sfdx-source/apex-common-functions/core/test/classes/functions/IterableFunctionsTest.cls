/**
 * @see IterableFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc, PMD.ApexAssertionsShouldIncludeMessage')
private class IterableFunctionsTest {

    static {
        new IterableFunctions();
    }

    /**
     * @see  IterableFunctions.get
     */
    @IsTest
    @SuppressWarnings('PMD.ApexUnitTestClassShouldHaveRunAs')
    static void get() {
        // Given
        List<Object> iter = new List<String>{ '1', '2', '3' };
        Iterable<Object> iter1 = new Set<String>{ '1', '2', '3' };
        Integer i = 0;
        Integer i1 = 4;
        IFunction getFirstElementFunction = IterableFunctions.get(i);
        IFunction getFourthElementFunction = IterableFunctions.get(i1);
        // When
        Object actual = getFirstElementFunction.apply(iter);
        Object actual1 = getFirstElementFunction.apply(iter1);
        Exception exc;
        try {
            getFourthElementFunction.apply(iter);
        } catch (Exception ex) {
            exc = ex;
        }
        // Then
        Assert.areEqual(iter[i], actual);
        Assert.areEqual(iter1.iterator().next(), actual1);
        Assert.areEqual(IndexOutOfBoundsException.class.getName(), exc.getTypeName());
    }

}
