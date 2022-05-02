/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description Provides a skeletal implementation of {@link IIntIterable}.
 */
public abstract inherited sharing class IntIterable implements IIntIterable {

    //<editor-fold desc="Conversion Operations">
    public virtual ILongIterable toLongIterable() {
        return mapToLong(IntToLongFunction.asLong());
    }

    public virtual IDoubleIterable toDoubleIterable() {
        return mapToDouble(IntToDoubleFunction.valueOf());
    }
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    public abstract IIntIterable filter(final IIntPredicate predicate);

    public virtual IIntIterable withoutNulls() {
        return filter(IntPredicate.isNotNull());
    }

    public abstract ILongIterable mapToLong(final IIntToLongFunction mapper);

    public abstract IDoubleIterable mapToDouble(final IIntToDoubleFunction mapper);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract OptionalInt reduce(final IIntBinaryOperator operator);

    public abstract Boolean some(final IIntPredicate predicate);

    public virtual Boolean none(final IIntPredicate predicate) {
        return !some(predicate);
    }

    public virtual OptionalInt max() {
        return reduce(IntBinaryOperator.max());
    }

    public virtual OptionalInt min() {
        return reduce(IntBinaryOperator.min());
    }
    //</editor-fold>

}
