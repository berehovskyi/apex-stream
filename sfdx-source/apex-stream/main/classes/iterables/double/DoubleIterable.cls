/**
 * @author O. Berehovskyi
 * @group Iterables
 * @description Provides a skeletal implementation of {@link IDoubleIterable}.
 */
public abstract inherited sharing class DoubleIterable implements IDoubleIterable {

    //<editor-fold desc="Intermediate Operations">
    public abstract IDoubleIterable filter(IDoublePredicate predicate);

    public virtual IDoubleIterable withoutNulls() {
        return filter(DoublePredicate.isNotNull());
    }
    //</editor-fold>

    //<editor-fold desc="Terminal Operations">
    public abstract OptionalDouble reduce(final IDoubleBinaryOperator operator);

    public abstract Object collect(final ISupplier supplier, final IObjectDoubleConsumer accumulator);

    public abstract Boolean some(final IDoublePredicate predicate);

    public virtual Boolean none(final IDoublePredicate predicate) {
        return !some(predicate);
    }

    public virtual OptionalDouble max() {
        return reduce(DoubleBinaryOperator.max());
    }

    public virtual OptionalDouble min() {
        return reduce(DoubleBinaryOperator.min());
    }

    public virtual Double sum() {
        return (Double) CollectorFunction.summingDouble()
                .apply(collect(Supplier.summingDouble(), ListDoubleConsumer.summingDouble()));
    }

    public virtual OptionalDouble avg() {
        List<Double> avg = (List<Double>) collect(Supplier.averagingDouble(), ListDoubleConsumer.averagingDouble());
        return avg[2] == 0 ? OptionalDouble.empty() : OptionalDouble.of((avg[0] + avg[1]) / avg[2]);
    }
    //</editor-fold>

}
