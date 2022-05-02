/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes one argument of `Double` type and returns a `Double`
 * value.
 */
public interface IDoubleUnaryOperator {

    /**
     * @description Applies the operator to the input argument.
     * @param operand the input argument of `Double` type
     * @return the result
     */
    Double apply(Double operand);

}
