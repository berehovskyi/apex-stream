/**
 * @description A function that takes one argument of `Double` type and returns a `Double`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IDoubleUnaryOperator {

    /**
     * @description Applies the operator to the input argument.
     *
     * @param operand the input argument of `Double` type
     *
     * @return the result
     */
    Double apply(Double operand);

}
