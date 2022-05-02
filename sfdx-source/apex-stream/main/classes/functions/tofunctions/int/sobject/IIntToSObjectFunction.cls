/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description An entity that takes one argument of `Integer` type and returns an `SObject`
 * value.
 */
public interface IIntToSObjectFunction {

    /**
     * @description Applies the function to the input argument.
     * @param i the input argument of `Integer` type
     * @return the result
     */
    SObject apply(Integer i);

}
