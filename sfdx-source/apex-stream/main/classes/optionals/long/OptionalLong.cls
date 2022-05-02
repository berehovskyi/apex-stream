/**
 * @author O. Berehovskyi
 * @group Optionals
 * @description A container which may or may not contain a non-null `Long` value.
 */
public virtual inherited sharing class OptionalLong {

    private static final OptionalLong EMPTY = new OptionalLong(null);
    private final Long value;

    private OptionalLong(final Long value) {
        this.value = value;
    }

    /**
     * @description Returns an instance of `OptionalLong`.
     * @param value the value to describe
     * @return the `OptionalLong`
     * @throws NullPointerException if `value` is null
     */
    public static OptionalLong of(final Long value) {
        Validate.notNull(value);
        return new OptionalLong(value);
    }

    /**
     * @description Returns an instance of `OptionalLong` if non-null,
     * otherwise returns an empty `OptionalLong`.
     * @param value the value to describe
     * @return the `OptionalLong`
     */
    public static OptionalLong ofNullable(final Long value) {
        return value == null ? OptionalLong.EMPTY : new OptionalLong(value);
    }

    /**
     * @description Returns an empty instance of `OptionalLong`.
     * @return the empty `OptionalLong`
     */
    public static OptionalLong empty() {
        return OptionalLong.EMPTY;
    }

    /**
     * @description Returns `value` if a value is present,
     * otherwise throws `NoSuchElementException`.
     * @return the non-null `value`
     * @throws NoSuchElementException if `value` is null
     */
    public virtual Long get() {
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
    public virtual void ifPresent(final ILongConsumer consumer) {
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
    public virtual void ifPresentOrElse(final ILongConsumer consumer, final IRunnable action) {
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
     * otherwise returns the fallback `other` Long. May be null.
     * @param other the supplying function
     * @return the `Long`
     */
    public virtual Long orElse(final Long other) {
        return isPresent() ? value : other;
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise returns the value provided by `supplier`.
     * @param supplier the supplying function
     * @return the `Long`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual Long orElseGet(final ILongSupplier supplier) {
        Validate.notNull(supplier);
        return isPresent() ? value : supplier.get();
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise throws an Exception provided by `exceptionSupplier`.
     * @param exceptionSupplier the exception supplying function
     * @return the `Long`
     * @throws NullPointerException if `exceptionSupplier` is null
     * @throws Exception if no value is present
     */
    public virtual Long orElseThrow(final ISupplier exceptionSupplier) {
        Validate.notNull(exceptionSupplier);
        if (isPresent()) {
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
        if (!(obj instanceof OptionalLong)) { return false; }
        Long a = this.orElse(null);
        Long b = ((OptionalLong) obj).orElse(null);
        return a == b;
    }

    public virtual override Integer hashCode() {
        return value != null ? (Integer) (value ^ (value >>> 32)) : 0;
    }

}
