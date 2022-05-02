/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description An entity that takes one argument of `SObject` type and returns a `Object`
 * value.
 */
public interface ISObjectFunction {

    /**
     * @description Applies the function to the input argument.
     * @param sObj the input argument of `SObject` type
     * @return the result
     */
    Object apply(SObject sObj);

}
