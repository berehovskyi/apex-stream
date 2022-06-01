/**
 * @description A function that takes one argument of `SObject` type and returns no value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ISObjectConsumer {

    /**
     * @description Performs the operation on the input argument. The method is expected to operate
     * via side-effects.
     *
     * @param sObj the input argument of `SObject` type
     */
    void accept(SObject sObj);

}
