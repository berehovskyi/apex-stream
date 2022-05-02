/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A functions that takes two arguments of `SObject` type and returns an `SObject`
 * value.
 */
public interface ISObjectBinaryOperator {

    /**
     * @description Applies the operator to the two input arguments.
     * @param sObj1 the first input argument of `SObject` type
     * @param sObj2 the second input argument of `SObject` type
     * @return the result of the same `SObject` type as the operands
     */
    SObject apply(SObject sObj1, SObject sObj2);

}
