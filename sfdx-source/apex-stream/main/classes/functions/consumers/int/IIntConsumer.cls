/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes one argument of `Integer` type and returns no value.
 */
public interface IIntConsumer {

    /**
     * @description Performs the operation on the input argument.
     * @param i the input argument of `Integer` type
     */
    void accept(Integer i);

}
