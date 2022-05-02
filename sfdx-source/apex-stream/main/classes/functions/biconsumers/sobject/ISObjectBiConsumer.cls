/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes two arguments of `SObject` type and returns no value.
 */
public interface ISObjectBiConsumer {

    /**
     * @description Performs the operation on the two input arguments. The method is expected to operate
     * via side-effects.
     * @param sObj1 the first input argument of `SObject` type
     * @param sObj2 the second input argument of `SObject` type
     */
    void accept(SObject sObj1, SObject sObj2);

}
