/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes one argument of `SObject` type and returns a `SObject`
 * value.
 */
public interface ISObjectUnaryOperator {

    /**
     * @description Applies the operator to the input argument.
     * @param operand the input argument of `SObject` type
     * @return the result
     */
    SObject apply(SObject operand);

}
