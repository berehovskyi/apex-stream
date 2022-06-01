/**
 * @description A functions that takes two arguments of `Long` type and returns an `Long`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ILongBinaryOperator {

    /**
     * @description Applies the operator to the two input arguments.
     *
     * @param l1 the first input argument of `Long` type
     * @param l2 the second input argument of `Long` type
     *
     * @return the result of the same `Long` type as the operands
     */
    Long apply(Long l1, Long l2);

}
