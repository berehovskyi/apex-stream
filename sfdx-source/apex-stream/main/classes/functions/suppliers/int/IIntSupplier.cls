/**
 * @description A function that takes no arguments and returns an `Integer` value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface IIntSupplier {

    /**
     * @description Return an instance of `Integer` type.
     * The returned object may or may not be a new instance, depending on the implementation.
     *
     * @return the result of `Integer` type
     */
    Integer get();

}
