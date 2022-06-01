/**
 * @description A function that takes one argument of `Long` type and returns a `Long`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ILongUnaryOperator {

    /**
     * @description Applies the operator to the input argument.
     *
     * @param operand the input argument of `Long` type
     *
     * @return the result
     */
    Long apply(Long operand);

}
