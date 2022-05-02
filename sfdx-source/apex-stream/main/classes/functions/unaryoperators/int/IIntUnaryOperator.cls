/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes one argument of `Integer` type and returns a `Integer`
 * value.
 */
public interface IIntUnaryOperator {

    /**
     * @description Applies the operator to the input argument.
     * @param operand the input argument of `Integer` type
     * @return the result
     */
    Integer apply(Integer operand);

}
