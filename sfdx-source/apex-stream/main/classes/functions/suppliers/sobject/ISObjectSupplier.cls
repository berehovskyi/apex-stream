/**
 * @description A function that takes no arguments and returns an `SObject` value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ISObjectSupplier {

    /**
     * @description Return an instance of `SObject` type.
     * The returned object may or may not be a new instance, depending on the implementation.
     *
     * @return the result of `SObject` type
     */
    SObject get();

}
