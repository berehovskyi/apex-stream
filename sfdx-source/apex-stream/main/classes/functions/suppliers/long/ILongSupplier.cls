/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes no arguments and returns an `Long` value.
 */
public interface ILongSupplier {

    /**
    * @description Return an instance of `Long` type.
    * The returned object may or may not be a new instance, depending on the implementation.
    * @return the result of `Long` type
    */
    Long get();

}
