/**
 * @description An entity that takes one argument of `SObject` type and returns a `Long`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ISObjectToLongFunction {

    /**
     * @description Applies the function to the input argument.
     *
     * @param sObj the input argument of `SObject` type
     *
     * @return the result
     */
    Long apply(SObject sObj);

}
