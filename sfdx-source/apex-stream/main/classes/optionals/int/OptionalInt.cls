/**
 * @description A container which may or may not contain a non-null `Integer` value.
 *
 * @author Oleh Berehovskyi
 *
 * @group Optionals
 */
public virtual inherited sharing class OptionalInt {

    private static final OptionalInt EMPTY = new OptionalInt(null);
    private final Integer value;

    private OptionalInt(final Integer value) {
        this.value = value;
    }

    /**
     * @description Returns an instance of `OptionalInt`.
     *
     * @param value the value to describe
     *
     * @return the `OptionalInt`
     *
     * @throws NullPointerException if `value` is null
     */
    public static OptionalInt of(final Integer value) {
        Validate.notNull(value);
        return new OptionalInt(value);
    }

    /**
     * @description Returns an instance of `OptionalInt` if non-null,
     * otherwise returns an empty `OptionalInt`.
     *
     * @param value the value to describe
     *
     * @return the `OptionalInt`
     */
    public static OptionalInt ofNullable(final Integer value) {
        return value == null ? OptionalInt.EMPTY : new OptionalInt(value);
    }

    /**
     * @description Returns an empty instance of `OptionalInt`.
     *
     * @return the empty `OptionalInt`
     */
    public static OptionalInt empty() {
        return OptionalInt.EMPTY;
    }

    /**
     * @description Returns `value` if a value is present,
     * otherwise throws `NoSuchElementException`.
     *
     * @return the non-null `value`
     *
     * @throws NoSuchElementException if `value` is null
     */
    public virtual Integer get() {
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
    public virtual void ifPresent(final IIntConsumer consumer) {
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
    public virtual void ifPresentOrElse(final IIntConsumer consumer, final IRunnable action) {
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
     * otherwise returns the fallback `other` Integer. May be null.
     *
     * @param other the supplying function
     *
     * @return the `Integer`
     */
    public virtual Integer orElse(final Integer other) {
        return isPresent() ? value : other;
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise returns the value provided by `supplier`.
     *
     * @param supplier the supplying function
     *
     * @return the `Integer`
     *
     * @throws NullPointerException if `mapper` is null
     */
    public virtual Integer orElseGet(final IIntSupplier supplier) {
        Validate.notNull(supplier);
        return isPresent() ? value : supplier.get();
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise throws an Exception provided by `exceptionSupplier`.
     *
     * @param exceptionSupplier the exception supplying function
     *
     * @return the `Integer`
     *
     * @throws Exception if no value is present
     * @throws NullPointerException if `exceptionSupplier` is null
     */
    public virtual Integer orElseThrow(final ISupplier exceptionSupplier) {
        Validate.notNull(exceptionSupplier);
        if (isPresent()) { return value; }
        throw (Exception) exceptionSupplier.get();
    }

    private virtual void requireNonNullValue() {
        if (value == null) { throw new NoSuchElementException(Label.NoValuePresentErrorMessage); }
    }

    public virtual Boolean equals(Object obj) {
        if (obj == null) { return false; }
        if (!(obj instanceof OptionalInt)) { return false; }
        Integer a = this.orElse(null);
        Integer b = ((OptionalInt) obj).orElse(null);
        return a == b;
    }

    public virtual override Integer hashCode() {
        return isPresent() ? value : 0;
    }

}
