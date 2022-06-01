/**
 * @description A function that takes one argument of `SObject` type and returns a `SObject`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ISObjectUnaryOperator {

    /**
     * @description Applies the operator to the input argument.
     *
     * @param operand the input argument of `SObject` type
     *
     * @return the result
     */
    SObject apply(SObject operand);

}
