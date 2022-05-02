/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description An entity that takes one argument of `Object` type and returns an `SObject`
 * value.
 */
public interface IToSObjectFunction {

    /**
     * @description Applies the function to the input argument.
     * @param o the input argument of `Object` type
     * @return the result
     */
    SObject apply(Object o);

}
