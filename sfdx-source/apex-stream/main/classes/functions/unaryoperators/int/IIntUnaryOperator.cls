/**
 * @description A function that takes one argument of `Integer` type and returns a `Integer`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IIntUnaryOperator {

    /**
     * @description Applies the operator to the input argument.
     *
     * @param operand the input argument of `Integer` type
     *
     * @return the result
     */
    Integer apply(Integer operand);

}
