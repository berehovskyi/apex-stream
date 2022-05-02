/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description An entity that takes one argument of `SObject` type and returns an `Long`
 * value.
 */
public interface ISObjectToLongFunction {

    /**
     * @description Applies the function to the input argument.
     * @param sObj the input argument of `SObject` type
     * @return the result
     */
    Long apply(SObject sObj);

}
