/**
 * @see ToDoubleFunctions
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class ToDoubleFunctionsTest {
    
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
        new ToDoubleFunctions();
        IToDoubleFunction asDouble = ToDoubleFunctions.asDouble();
        IToDoubleFunction doubleValue = ToDoubleFunctions.valueOf();
        // Then
        for (Object o : input) {
            Validate.assertEquals((Double) o, asDouble.apply(o));
        }
        for (String s : input1) {
            Validate.assertEquals(Double.valueOf(s), doubleValue.apply(s));
        }
    }
    
}
