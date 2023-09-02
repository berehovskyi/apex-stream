/**
 * @description A function that takes no arguments and returns an `Object` value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ISupplier {

    /**
     * @description Return an instance of `Object` type.
     * The returned object may or may not be a new instance, depending on the implementation.
     *
     * @return the result of `Object` type
     */
    Object get();

}
