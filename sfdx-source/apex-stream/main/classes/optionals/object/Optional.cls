/**
 * @author O. Berehovskyi
 * @group Optionals
 * @description A container which may or may not contain a non-null `Object` value.
 */
public virtual inherited sharing class Optional {

    private static final Optional EMPTY = new Optional(null);
    private final Object value;

    private Optional(final Object value) {
        this.value = value;
    }

    /**
     * @description Returns an instance of `Optional`.
     * @param value the value to describe
     * @return the `Optional`
     * @throws NullPointerException if `value` is null
     */
    public static Optional of(final Object value) {
        Validate.notNull(value);
        return new Optional(value);
    }

    /**
     * @description Returns an instance of `Optional` if non-null,
     * otherwise returns an empty `Optional`.
     * @param value the value to describe
     * @return the `Optional`
     */
    public static Optional ofNullable(final Object value) {
        return value == null ? Optional.EMPTY : new Optional(value);
    }

    /**
     * @description Returns an empty instance of `Optional`.
     * @return the empty `Optional`
     */
    public static Optional empty() {
        return Optional.EMPTY;
    }

    /**
     * @description Returns `value` if a value is present,
     * otherwise throws `NoSuchElementException`.
     * @return the non-null `value`
     * @throws NoSuchElementException if `value` is null
     */
    public virtual Object get() {
        requireNonNullValue();
        return value;
    }

    /**
     * @description Returns `true` if a value is present, otherwise `false`.
     * @return `true` or `false`
     */
    public virtual Boolean isPresent() {
        return value != null;
    }

    /**
     * @description Returns `true` if a value is not present, otherwise `false`.
     * @return `true` or `false`
     */
    public virtual Boolean isEmpty() {
        return !isPresent();
    }

    /**
     * @description If a value is present, performs `consumer` action with `value`,
     * otherwise does nothing.
     * @param consumer the consumer action to perform
     */
    public virtual void ifPresent(final IConsumer consumer) {
        Validate.notNull(consumer);
        if (isPresent()) {
            consumer.accept(value);
        }
    }

    /**
     * @description If a value is present, performs `consumer` action with `value`,
     * otherwise performs runnable `action`.
     * @param consumer the consumer action
     * @param action the runnable action
     * @throws NullPointerException if `consumer` or `action` is null
     */
    public virtual void ifPresentOrElse(final IConsumer consumer, final IRunnable action) {
        Validate.notNull(consumer);
        Validate.notNull(action);
        if (isPresent()) {
            consumer.accept(value);
        } else {
            action.run();
        }
    }

    /**
     * @description Returns an `Optional` describing the value,
     * if `value` matches `predicate`, otherwise returns an empty `Optional`.
     * @param predicate the predicate to test a value
     * @return the nullable `Optional` or an empty `Optional`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual Optional filter(final IPredicate predicate) {
        Validate.notNull(predicate);
        return isEmpty() ? this : predicate.test(value) ? this : empty();
    }

    /**
     * @description Returns an `Optional` describing the result of applying the
     * `mapper` function to the value if the value is present,
     * otherwise returns an empty `Optional`.
     * @param mapper the function
     * @return the nullable `Optional` or an empty `Optional`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual Optional mapTo(final IFunction mapper) {
        Validate.notNull(mapper);
        return isEmpty() ? empty() : Optional.ofNullable(mapper.apply(value));
    }

    /**
     * @description Returns an `Optional` the result of applying the
     * `mapper` function to the value if the value is present,
     * otherwise returns an empty `Optional`.
     * @param mapper the function that returns an `Optional`
     * @return the nullable `Optional` or an empty `Optional`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual Optional flatMapTo(final IFunction mapper) {
        Validate.notNull(mapper);
        return isEmpty() ? empty() : (Optional) mapper.apply(value);
    }

    /**
     * @description Returns an `Optional` describing the value if the value is present,
     * otherwise returns `Optional` produced by the supplying function.
     * @param supplier the supplying function
     * @return the nullable `Optional` or an empty `Optional`
     * @throws NullPointerException if `supplier` is null
     */
    public virtual Optional orGet(final ISupplier supplier) {
        Validate.notNull(supplier);
        return isPresent() ? this : Optional.ofNullable(supplier.get());
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise returns the fallback `other` Object. May be null.
     * @param other the supplying function
     * @return the `Object`
     */
    public virtual Object orElse(final Object other) {
        return isPresent() ? value : other;
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise returns the value provided by `supplier`.
     * @param supplier the supplying function
     * @return the `Object`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual Object orElseGet(final ISupplier supplier) {
        Validate.notNull(supplier);
        return isPresent() ? value : supplier.get();
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise throws an Exception provided by `exceptionSupplier`.
     * @param exceptionSupplier the exception supplying function
     * @return the `Object`
     * @throws NullPointerException if `exceptionSupplier` is null
     * @throws Exception if no value is present
     */
    public virtual Object orElseThrow(final ISupplier exceptionSupplier) {
        if (value != null) {
            return value;
        }
        throw (Exception) exceptionSupplier.get();
    }

    private void requireNonNullValue() {
        if (value == null) {
            throw new NoSuchElementException('No value present');
        }
    }

    public virtual Boolean equals(Object obj) {
        if (obj == null) { return false; }
        if (!(obj instanceof Optional)) { return false; }
        Object a = this.orElse(null);
        Object b = ((Optional) obj).orElse(null);
        return a == b;
    }

    public virtual override Integer hashCode() {
        return value != null ? System.hashCode(value) : 0;
    }

}
