/**
 * @description A functions that takes two arguments of `Integer` type and returns an `Integer`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IIntBinaryOperator {

    /**
     * @description Applies the operator to the two input arguments.
     *
     * @param i1 the first input argument of `Integer` type
     * @param i2 the second input argument of `Integer` type
     *
     * @return the result of the same `Integer` type as the operands
     */
    Integer apply(Integer i1, Integer i2);
}
