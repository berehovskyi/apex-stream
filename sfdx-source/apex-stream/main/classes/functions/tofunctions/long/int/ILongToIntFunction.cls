/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description An entity that takes one argument of `Long` type and returns an `Integer`
 * value.
 */
public interface ILongToIntFunction {

    /**
     * @description Applies this function to the given argument.
     * @param l the function argument
     * @return the function result
     */
    Integer apply(Long l);

}
