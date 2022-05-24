/**
 * @author O. Berehovskyi
 * @group Functional Interfaces
 * @description A function that takes no arguments and returns a `Double` value.
 */
public interface IDoubleSupplier {

    /**
    * @description Return an instance of `Double` type.
    * The returned object may or may not be a new instance, depending on the implementation.
    * @return the result of `Double` type
    */
    Double get();

}
