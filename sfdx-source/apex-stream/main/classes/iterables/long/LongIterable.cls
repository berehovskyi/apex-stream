/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description Provides a skeletal implementation of {@link ILongIterable}.
 */
public abstract inherited sharing class LongIterable implements ILongIterable {

    //<editor-fold desc="Conversion Operations">
    public virtual IIntIterable toIntIterable() {
        return mapToInt(LongToIntFunction.valueOf());
    }

    public virtual IDoubleIterable toDoubleIterable() {
        return mapToDouble(LongToDoubleFunction.valueOf());
    }
    //</editor-fold>

    //<editor-fold desc="Intermediate Operations">
    public abstract ILongIterable filter(final ILongPredicate predicate);

    public virtual ILongIterable withoutNulls() {
        return filter(LongPredicate.isNotNull());
    }

    public abstract IIntIterable mapToInt(final ILongToIntFunction mapper);

    public abstract IDoubleIterable mapToDouble(final ILongToDoubleFunction mapper);
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract OptionalLong reduce(final ILongBinaryOperator operator);

    public abstract Boolean some(final ILongPredicate predicate);

    public virtual Boolean none(final ILongPredicate predicate) {
        return !some(predicate);
    }

    public virtual OptionalLong max() {
        return reduce(LongBinaryOperator.max());
    }

    public virtual OptionalLong min() {
        return reduce(LongBinaryOperator.min());
    }
    //</editor-fold>

}
