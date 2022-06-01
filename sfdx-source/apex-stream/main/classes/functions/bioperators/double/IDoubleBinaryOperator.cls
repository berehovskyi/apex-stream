/**
 * @description A function that takes two arguments of `Double` type and returns a `Double`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IDoubleBinaryOperator {

    /**
     * @description Applies the operator to the two input arguments.
     *
     * @param d1 the first input argument of `Double` type
     * @param d2 the second input argument of `Double` type
     *
     * @return the result of the same `Double` type as the operands
     */
    Double apply(Double d1, Double d2);

}
