/**
 * @description A container which may or may not contain a value.
 *
 * @author Oleh Berehovskyi
 * 
 * @group Functional Interfaces
 */
public interface IOptional {

    /**
     * @description Returns `value` if a value is present,
     * otherwise throws `NoSuchElementException`.
     *
     * @return the non-null `value`
     */
     Object get();

    /**
     * @description Returns `true` if a value is present, otherwise `false`.
     *
     * @return `true` or `false`
     */
    Boolean isPresent();
    
    /**
     * @description Returns `true` if a value is not present, otherwise `false`.
     *
     * @return `true` or `false`
     */
    Boolean isEmpty();
    
    /**
     * @description If a value is present, performs `consumer` action with `value`,
     * otherwise does nothing.
     *
     * @param consumer the consumer action to perform
     */
    void ifPresent(IConsumer consumer);

    /**
     * @description If a value is present, performs `consumer` action with `value`,
     * otherwise performs runnable `action`.
     *
     * @param consumer the consumer action
     * @param action the runnable action
     */
    void ifPresentOrElse(IConsumer consumer, IRunnable action);
    
    /**
     * @description Returns an `IOptional` describing the value,
     * if `value` matches `predicate`, otherwise returns an empty `IOptional`.
     *
     * @param predicate the predicate to test a value
     *
     * @return the nullable `IOptional` or an empty `IOptional`
     */
    IOptional filter(IPredicate predicate);
    
    /**
     * @description Returns an `IOptional` describing the result of applying the
     * `mapper` function to the value if the value is present,
     * otherwise returns an empty `IOptional`.
     *
     * @param mapper the function
     *
     * @return the nullable `IOptional` or an empty `IOptional`
     */
    IOptional mapTo(IFunction mapper);
    
    /**
     * @description Returns an `IOptional` the result of applying the
     * `mapper` function to the value if the value is present,
     * otherwise returns an empty `IOptional`.
     *
     * @param mapper the function that returns an `IOptional`
     *
     * @return the nullable `IOptional` or an empty `IOptional`
     */
    IOptional flatMapTo(IFunction mapper);
    
    /**
     * @description Returns an `IOptional` describing the value if the value is present,
     * otherwise returns `IOptional` produced by the supplying function.
     *
     * @param supplier the supplying function
     *
     * @return the nullable `IOptional` or an empty `IOptional`
     */
    IOptional orGet(ISupplier supplier);
    
    /**
     * @description Returns a value if the value is present,
     * otherwise returns the fallback `other` Object. May be null.
     *
     * @param other the fallback value
     *
     * @return the `Object`
     */
    Object orElse(Object other);
    
    /**
     * @description Returns a value if the value is present,
     * otherwise returns the value provided by `supplier`.
     *
     * @param supplier the supplying function
     *
     * @return the `Object`
     */
    Object orElseGet(ISupplier supplier);
    
    /**
     * @description Returns a value if the value is present,
     * otherwise throws an Exception provided by `exceptionSupplier`.
     *
     * @param exceptionSupplier the exception supplying function
     *
     * @return the `Object`
     *
     * @throws Exception if no value is present
     */
    Object orElseThrow(ISupplier exceptionSupplier);

}
