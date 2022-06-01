/**
 * @description An entity that takes one argument of `SObject` type and returns an `Integer`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ISObjectToIntFunction {

    /**
     * @description Applies the function to the input argument.
     *
     * @param sObj the input argument of `SObject` type
     *
     * @return the result
     */
    Integer apply(SObject sObj);

}
