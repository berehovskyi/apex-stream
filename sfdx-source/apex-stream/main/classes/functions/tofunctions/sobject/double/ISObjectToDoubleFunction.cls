/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description An entity that takes one argument of `SObject` type and returns an `Double`
 * value.
 */
public interface ISObjectToDoubleFunction {

    /**
     * @description Applies the function to the input argument.
     * @param sObj the input argument of `SObject` type
     * @return the result
     */
    Double apply(SObject sObj);

}
