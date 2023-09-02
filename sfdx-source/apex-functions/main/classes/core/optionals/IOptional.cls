/**
 * @description
 * @author Oleh Berehovskyi
 */
public interface IOptional {

    /**
     * @description Returns `value` if a value is present,
     * otherwise throws `NoSuchElementException`.
     *
     * @return the non-null `value`
     *
     * @throws NoSuchElementException if `value` is null
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
     *
     * @throws NullPointerException if `consumer` or `action` is null
     */
    void ifPresentOrElse(IConsumer consumer, IRunnable action);
    
    /**
     * @description Returns an `Optional` describing the value,
     * if `value` matches `predicate`, otherwise returns an empty `Optional`.
     *
     * @param predicate the predicate to test a value
     *
     * @return the nullable `Optional` or an empty `Optional`
     *
     * @throws NullPointerException if `predicate` is null
     */
    IOptional filter(IPredicate predicate);
    
    /**
     * @description Returns an `Optional` describing the result of applying the
     * `mapper` function to the value if the value is present,
     * otherwise returns an empty `Optional`.
     *
     * @param mapper the function
     *
     * @return the nullable `Optional` or an empty `Optional`
     *
     * @throws NullPointerException if `mapper` is null
     */
    IOptional mapTo(IFunction mapper);
    
    /**
     * @description Returns an `Optional` the result of applying the
     * `mapper` function to the value if the value is present,
     * otherwise returns an empty `Optional`.
     *
     * @param mapper the function that returns an `Optional`
     *
     * @return the nullable `Optional` or an empty `Optional`
     *
     * @throws NullPointerException if `mapper` is null
     */
    IOptional flatMapTo(IFunction mapper);
    
    /**
     * @description Returns an `Optional` describing the value if the value is present,
     * otherwise returns `Optional` produced by the supplying function.
     *
     * @param supplier the supplying function
     *
     * @return the nullable `Optional` or an empty `Optional`
     *
     * @throws NullPointerException if `supplier` is null
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
     *
     * @throws NullPointerException if `mapper` is null
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
     * @throws NullPointerException if `exceptionSupplier` is null
     */
    Object orElseThrow(ISupplier exceptionSupplier);

}