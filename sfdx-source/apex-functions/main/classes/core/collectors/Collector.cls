/**
 * @description Provides default and static methods of 
 * {@link ICollector} functional interface.
 * 
 * @see ICollector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class Collector implements ICollector {

    //<editor-fold desc="Functions">
    // @start-group Functions
    public abstract ISupplier supplier();

    public abstract IBiConsumer accumulator();

    public abstract IFunction finisher();
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `Collector` by the given `supplier` and `accumulator`.
     *
     * @param supplier the supplier function for the `Collector`
     * @param accumulator the accumulator function for the `Collector`
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `supplier` or `accumulator` is null
     */
    public static Collector of(final ISupplier supplier, final IBiConsumer accumulator) {
        return of(supplier, accumulator, null);
    }

    /**
     * @description Returns a `Collector` by the given `supplier`, `accumulator`,
     * and `finisher`.
     *
     * @param supplier the supplier function for the `Collector`
     * @param accumulator the accumulator function for the `Collector`
     * @param finisher the final transformation function for the `Collector`
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `supplier` or `accumulator` is null
     */
    public static Collector of(final ISupplier supplier, final IBiConsumer accumulator, final IFunction finisher) {
        return new CollectorOf(supplier, accumulator, finisher);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a `Collector` that recursively reconstructs collector's suppliers
     * and returns a new `Collector` according to a given container type.
     * <p>Supports casting list type for methods:</p>
     * <ul>
     *     <li>{@link #toList()}</li>
     *     <li>{@link #toList(IFunction)}</li>
     * </ul>
     * <p>Supports casting map value type (but not map key type) for methods:</p>
     * <ul>
     *     <li>{@link #toBy<T>map(IFunction)}</li>
     *     <li>{@link #groupingBy<T>(IFunction)}</li>
     *     <li>{@link #partitioningBy(IPredicate)}</li>
     *     <li>{@link #partitioningBy(IPredicate, ICollector)}</li>
     * </ul>
     *
     * @param t the Type to cast the result container to
     *
     * @return the `Collector`
     *
     * @throws NullPointerException if `t` is null
     * @throws TypeException if invalid `t` is provided
     *
     * @example
     * Collector.toList(getNameFunction).cast(List<String>.class);
     */
    public virtual Collector cast(final Type t) {
        Validate.notNull(t);
        BiConsumer accumulator = (BiConsumer) this.accumulator();
        String typeName = String.valueOf(t);
        while (accumulator?.downstream != null) {
            typeName = typeName.substringAfter(',').substringBeforeLast('>');
            if (!typeName.startsWith('Map') && !typeName.startsWith('List') && !typeName.startsWith('Set')) { break; }
            accumulator.downstream = new CollectorOf(
                Supplier.of(Type.forName(typeName)),
                accumulator.downstream.accumulator(),
                accumulator.downstream.finisher()
            );
            accumulator = (BiConsumer) accumulator.downstream?.accumulator();
        }
        return new CollectorOf(Supplier.of(t), this.accumulator(), this.finisher());
    }
    // @end-group
    //</editor-fold>
    
    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class CollectorOf extends Collector {
        private final ISupplier supplier;
        private final IBiConsumer accumulator;
        private final IFunction finisher;
        private CollectorOf(ISupplier supplier, IBiConsumer accumulator, IFunction finisher) {
            Validate.notNull(supplier);
            Validate.notNull(accumulator);
            this.supplier = supplier;
            this.accumulator = accumulator;
            this.finisher = finisher;
        }
        public override ISupplier supplier() { return supplier; }
        public override IBiConsumer accumulator() { return accumulator; }
        public override IFunction finisher() { return finisher; }
    }
    // @end-group
    //</editor-fold>

}
