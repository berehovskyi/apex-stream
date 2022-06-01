/**
 * @description A function that takes two arguments of `Object` and `SObject` types and
 * returns no value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IObjectSObjectConsumer {

    /**
     * @description Performs the operation on the two input arguments. The method is expected to operate
     * via side-effects.
     *
     * @param o the first input argument of `Object` type
     * @param sObj the second input argument of `SObject` type
     */
    void accept(Object o, SObject sObj);

}
