/**
 * @description An entity that takes one argument of `Long` type and returns an `SObject`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ILongToSObjectFunction {

    /**
     * @description Applies this function to the given argument.
     *
     * @param l the function argument
     *
     * @return the function result
     */
    SObject apply(Long l);

}
