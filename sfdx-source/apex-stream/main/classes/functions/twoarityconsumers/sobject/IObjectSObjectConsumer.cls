/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes two arguments of `Object` and `SObject` types and
 * returns no value.
 */
public interface IObjectSObjectConsumer {

    /**
     * @description Performs the operation on the two input arguments. The method is expected to operate
     * via side-effects.
     * @param o the first input argument of `Object` type
     * @param sObj the second input argument of `SObject` type
     */
    void accept(Object o, SObject sObj);

}
