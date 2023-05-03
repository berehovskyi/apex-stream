/**
 * @description A container which may or may not contain a non-null `Double` value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Optionals
 */
public virtual inherited sharing class OptionalDouble {

    private static final OptionalDouble EMPTY = new OptionalDouble(null);
    private final Double value;

    private OptionalDouble(final Double value) {
        this.value = value;
    }

    /**
     * @description Returns an instance of `OptionalDouble`.
     *
     * @param value the value to describe
     *
     * @return the `OptionalDouble`
     *
     * @throws NullPointerException if `value` is null
     */
    public static OptionalDouble of(final Double value) {
        Validate.notNull(value);
        return new OptionalDouble(value);
    }

    /**
     * @description Returns an instance of `OptionalDouble` if non-null,
     * otherwise returns an empty `OptionalDouble`.
     *
     * @param value the value to describe
     *
     * @return the `OptionalDouble`
     */
    public static OptionalDouble ofNullable(final Double value) {
        return value == null ? OptionalDouble.EMPTY : new OptionalDouble(value);
    }

    /**
     * @description Returns an empty instance of `OptionalDouble`.
     *
     * @return the empty `OptionalDouble`
     */
    public static OptionalDouble empty() {
        return OptionalDouble.EMPTY;
    }

    /**
     * @description Returns `value` if a value is present,
     * otherwise throws `NoSuchElementException`.
     *
     * @return the non-null `value`
     *
     * @throws NoSuchElementException if `value` is null
     */
    public virtual Double get() {
        requireNonNullValue();
        return value;
    }

    /**
     * @description Returns `true` if a value is present, otherwise `false`.
     *
     * @return `true` or `false`
     */
    public virtual Boolean isPresent() {
        return value != null;
    }

    /**
     * @description Returns `true` if a value is not present, otherwise `false`.
     *
     * @return `true` or `false`
     */
    public virtual Boolean isEmpty() {
        return !isPresent();
    }

    /**
     * @description If a value is present, performs `consumer` action with `value`,
     * otherwise does nothing.
     *
     * @param consumer the consumer action to perform
     */
    public virtual void ifPresent(final IDoubleConsumer consumer) {
        Validate.notNull(consumer);
        if (isPresent()) {
            consumer.accept(value);
        }
    }

    /**
     * @description If a value is present, performs `consumer` action with `value`,
     * otherwise performs runnable `action`.
     *
     * @param consumer the consumer action
     * @param action the runnable action
     *
     * @throws NullPointerException if `consumer` or `action` is null
     */
    public virtual void ifPresentOrElse(final IDoubleConsumer consumer, final IRunnable action) {
        Validate.notNull(consumer);
        Validate.notNull(action);
        if (isPresent()) {
            consumer.accept(value);
        } else {
            action.run();
        }
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise returns the fallback `other` SObject. May be null.
     *
     * @param other the supplying function
     *
     * @return the `Double`
     */
    public virtual Double orElse(final Double other) {
        return isPresent() ? value : other;
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise returns the value provided by `supplier`.
     *
     * @param supplier the supplying function
     *
     * @return the `Double`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual Double orElseGet(final IDoubleSupplier supplier) {
        Validate.notNull(supplier);
        return isPresent() ? value : supplier.get();
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise throws an Exception provided by `exceptionSupplier`.
     *
     * @param exceptionSupplier the exception supplying function
     *
     * @return the `Double`
     *
     * @throws Exception if no value is present
     * @throws NullPointerException if `exceptionSupplier` is null
     */
    public virtual Double orElseThrow(final ISupplier exceptionSupplier) {
        Validate.notNull(exceptionSupplier);
        if (isPresent()) { return value; }
        throw (Exception) exceptionSupplier.get();
    }

    private void requireNonNullValue() {
        if (value == null) { throw new NoSuchElementException(Label.AS_ErrorMessage_NoValuePresent); }
    }

    public virtual Boolean equals(Object obj) {
        if (obj == null) { return false; }
        if (!(obj instanceof OptionalDouble)) { return false; }
        Double a = this.orElse(null);
        Double b = ((OptionalDouble) obj).orElse(null);
        return a == b;
    }

    public virtual override Integer hashCode() {
        return value != null ? System.hashCode(value) : 0;
    }

}
