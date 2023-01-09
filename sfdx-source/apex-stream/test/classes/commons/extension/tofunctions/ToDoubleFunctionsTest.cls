/**
 * @see ToDoubleFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToDoubleFunctionsTest {

    static {
        new ToDoubleFunctions();
    }
    
   /**
    * @see ToDoubleFunctions.asDouble
    * @see ToDoubleFunctions.valueOf
    */
    @IsTest
    static void convert() {
        // Given
        List<Object> input = new List<Object>{ 1, 2.02, 3L };
        List<String> input1 = new List<String>{ '123', '1.02', '2.35', '-3', '33' };
        // When
        IToDoubleFunction asDouble = ToDoubleFunctions.asDouble();
        IToDoubleFunction doubleValue = ToDoubleFunctions.valueOf();
        // Then
        for (Object o : input) {
            Assert.areEqual((Double) o, asDouble.apply(o));
        }
        for (String s : input1) {
            Assert.areEqual(Double.valueOf(s), doubleValue.apply(s));
        }
    }
    
}
