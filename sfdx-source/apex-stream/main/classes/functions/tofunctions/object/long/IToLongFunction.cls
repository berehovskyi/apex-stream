/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description An entity that takes one argument of `Object` type and returns an `Long`
 * value.
 */
public interface IToLongFunction {

    /**
     * @description Applies the function to the input argument.
     * @param o the input argument of `Object` type
     * @return the result
     */
    Long apply(Object o);

}
