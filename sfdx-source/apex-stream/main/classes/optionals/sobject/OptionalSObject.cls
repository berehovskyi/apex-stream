/**
 * @author O. Berehovskyi
 * @group Optionals
 * @description A container which may or may not contain a non-null `SObject` value.
 */
public virtual inherited sharing class OptionalSObject {

    private static final OptionalSObject EMPTY = new OptionalSObject(null);
    private final SObject value;

    private OptionalSObject(final SObject value) {
        this.value = value;
    }

    /**
     * @description Returns an instance of `OptionalSObject`.
     * @param value the value to describe
     * @return the `OptionalSObject`
     * @throws NullPointerException if `value` is null
     */
    public static OptionalSObject of(final SObject value) {
        Validate.notNull(value);
        return new OptionalSObject(value);
    }

    /**
     * @description Returns an instance of `OptionalSObject` if non-null,
     * otherwise returns an empty `OptionalSObject`.
     * @param value the value to describe
     * @return the `OptionalSObject`
     */
    public static OptionalSObject ofNullable(final SObject value) {
        return value == null ? OptionalSObject.EMPTY : new OptionalSObject(value);
    }

    /**
     * @description Returns an empty instance of `OptionalSObject`.
     * @return the empty `OptionalSObject`
     */
    public static OptionalSObject empty() {
        return OptionalSObject.EMPTY;
    }

    /**
     * @description Returns `value` if a value is present,
     * otherwise throws `NoSuchElementException`.
     * @return the non-null `value`
     * @throws NoSuchElementException if `value` is null
     */
    public virtual SObject get() {
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
    public virtual void ifPresent(final ISObjectConsumer consumer) {
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
    public virtual void ifPresentOrElse(final ISObjectConsumer consumer, final IRunnable action) {
        Validate.notNull(consumer);
        Validate.notNull(action);
        if (isPresent()) {
            consumer.accept(value);
        } else {
            action.run();
        }
    }

    /**
     * @description Returns an `OptionalSObject` describing the value,
     * if `value` matches `predicate`, otherwise returns an empty `OptionalSObject`.
     * @param predicate the predicate to test a value
     * @return the nullable `OptionalSObject` or an empty `OptionalSObject`
     * @throws NullPointerException if `predicate` is null
     */
    public virtual OptionalSObject filter(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        return isEmpty() ? this : predicate.test(value) ? this : empty();
    }

    /**
     * @description Returns an `Optional` describing result of applying
     * `mapper` function to the value if the value is present,
     * otherwise returns an empty `Optional`.
     * @param mapper the operator
     * @return the nullable `Optional` or an empty `Optional`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual Optional mapTo(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return isEmpty() ? Optional.empty() : Optional.ofNullable(mapper.apply(value));
    }

    /**
     * @description Returns an `Optional` the result of applying the
     * `mapper` function to the value if the value is present,
     * otherwise returns an empty `Optional`.
     * @param mapper the function that returns an `Optional`
     * @return the nullable `Optional` or an empty `Optional`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual Optional flatMapTo(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return isEmpty() ? Optional.empty() : (Optional) mapper.apply(value);
    }

    /**
     * @description Returns an `OptionalSObject` describing the value if the value is present,
     * otherwise returns `OptionalSObject` produced by the supplying function.
     * @param supplier the supplying function
     * @return the nullable `OptionalSObject` or an empty `OptionalSObject`
     * @throws NullPointerException if `optionalSupplier` is null
     */
    public virtual OptionalSObject orGet(final ISObjectSupplier supplier) {
        Validate.notNull(supplier);
        return isPresent() ? this : OptionalSObject.ofNullable(supplier.get());
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise returns the fallback `other` SObject. May be null.
     * @param other the supplying function
     * @return the `SObject`
     */
    public virtual SObject orElse(final SObject other) {
        return isPresent() ? value : other;
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise returns the value provided by `supplier`.
     * @param supplier the supplying function
     * @return the `SObject`
     * @throws NullPointerException if `mapper` is null
     */
    public virtual SObject orElseGet(final ISObjectSupplier supplier) {
        Validate.notNull(supplier);
        return isPresent() ? value : supplier.get();
    }

    /**
     * @description Returns a value if the value is present,
     * otherwise throws an Exception provided by `exceptionSupplier`.
     * @param exceptionSupplier the exception supplying function
     * @return the `SObject`
     * @throws NullPointerException if `exceptionSupplier` is null
     * @throws Exception if no value is present
     */
    public virtual SObject orElseThrow(final ISupplier exceptionSupplier) {
        Validate.notNull(exceptionSupplier);
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
        if (!(obj instanceof OptionalSObject)) { return false; }
        SObject a = this.orElse(null);
        SObject b = ((OptionalSObject) obj).orElse(null);
        return a == b;
    }

    public virtual override Integer hashCode() {
        return value != null ? System.hashCode(value) : 0;
    }

}
