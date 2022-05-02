/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description An entity that takes one argument of `SObject` type and returns an `Integer`
 * value.
 */
public interface ISObjectToIntFunction {

    /**
     * @description Applies the function to the input argument.
     * @param sObj the input argument of `SObject` type
     * @return the result
     */
    Integer apply(SObject sObj);

}
