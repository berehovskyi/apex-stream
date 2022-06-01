/**
 * @description An entity that takes two arguments of `SObject` type and returns an `Object`
 * value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ISObjectBiFunction {

    /**
     * @description Applies the function to the two input arguments.
     *
     * @param sObj1 the first input argument of `SObject` type
     * @param sObj2 the second input argument of `SObject` type
     *
     * @return the result
     */
    Object apply(SObject sObj1, SObject sObj2);

}
