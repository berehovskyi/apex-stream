/**
 * @description An entity that takes one argument of `Long` type and returns an `Integer`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ILongToIntFunction {

    /**
     * @description Applies this function to the given argument.
     *
     * @param l the function argument
     *
     * @return the function result
     */
    Integer apply(Long l);

}
