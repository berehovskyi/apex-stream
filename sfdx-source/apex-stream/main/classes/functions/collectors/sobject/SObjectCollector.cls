/**
 * @description Provides default and static methods of 
 * {@link ISObjectCollector} functional interface.
 * 
 * @see ISObjectCollector
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectCollector implements ISObjectCollector {

    //<editor-fold desc="Functions">
    // @start-group Functions
    public abstract ISupplier supplier();

    public abstract IObjectSObjectConsumer accumulator();

    public abstract IFunction finisher();
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a `SObjectCollector` by the given `supplier` and `accumulator`.
     *
     * @param supplier the supplier function for the `SObjectCollector`
     * @param accumulator the accumulator function for the `SObjectCollector`
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `supplier` or `accumulator` is null
     */
    public static SObjectCollector of(final ISupplier supplier, final IObjectSObjectConsumer accumulator) {
        return of(supplier, accumulator, null);
    }

    /**
     * @description Returns a `SObjectCollector` by the given `supplier`, `accumulator`,
     * and `finisher`.
     *
     * @param supplier the supplier function for the `SObjectCollector`
     * @param accumulator the accumulator function for the `SObjectCollector`
     * @param finisher the final transformation function for the `SObjectCollector`
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `supplier` or `accumulator` is null
     */
    public static SObjectCollector of(
            final ISupplier supplier,
            final IObjectSObjectConsumer accumulator,
            final IFunction finisher
    ) {
        Validate.notNull(supplier);
        Validate.notNull(accumulator);
        return new SObjectCollectorOf(supplier, accumulator, finisher);
    }

    /**
     * @description Returns a `SObjectCollector` that recursively reconstructs collector's suppliers
     * and returns a new `SObjectCollector` according to a given container type.
     * <p>Supports casting list type for methods:</p>
     * <ul>
     *     <li>{@link #toList(ISObjectFunction)}</li>
     *     <li>{@link #toList(String)}</li>
     *     <li>{@link #toList(SObjectField)}</li>
     * <p/>
     * </ul>
     * <p>Supports casting map value type (but not map key type) for methods:</p>
     * <ul>
     *     <li>{@link #toBy<T>map(ISObjectFunction)}</li>
     *     <li>{@link #toBy<T>map(String)}</li>
     *     <li>{@link #toBy<T>map(SObjectField)}</li>
     *     <li>{@link #groupingBy<T>(ISObjectFunction)}</li>
     *     <li>{@link #groupingBy<T>(String)}</li>
     *     <li>{@link #groupingBy<T>(SObjectField)}</li>
     *     <li>{@link #partitioningBy(ISObjectPredicate)}</li>
     *     <li>{@link #partitioningBy(ISObjectPredicate, ISObjectCollector)}</li>
     * </ul>
     *
     * @param t the Type to cast the result container to
     *
     * @return the `SObjectCollector`
     *
     * @throws NullPointerException if `t` is null
     * @throws TypeException if invalid `t` is provided
     *
     * @example
     * SObjectCollector.toList('Name').cast(List<String>.class);
     */
    public virtual SObjectCollector cast(final Type t) {
        Validate.notNull(t);
        ObjectSObjectConsumer accumulator = (ObjectSObjectConsumer) this.accumulator();
        String typeName = String.valueOf(t);
        while (accumulator?.downstream != null) {
            typeName = typeName.substringAfter(',').substringBeforeLast('>');
            if (!typeName.startsWith('Map') && !typeName.startsWith('List') && !typeName.startsWith('Set')) { break; }
            accumulator.downstream = new SObjectCollectorOf(
                    Supplier.of(Type.forName(typeName)),
                    accumulator.downstream.accumulator(),
                    accumulator.downstream.finisher()
            );
            accumulator = (ObjectSObjectConsumer) accumulator.downstream?.accumulator();
        }
        return new SObjectCollectorOf(Supplier.of(t), this.accumulator(), this.finisher());
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class SObjectCollectorOf extends SObjectCollector {
        private final ISupplier supplier;
        private final IObjectSObjectConsumer accumulator;
        private final IFunction finisher;
        private SObjectCollectorOf(ISupplier supplier, IObjectSObjectConsumer accumulator, IFunction finisher) {
            this.supplier = supplier;
            this.accumulator = accumulator;
            this.finisher = finisher;
        }
        public override ISupplier supplier() { return supplier; }
        public override IObjectSObjectConsumer accumulator() { return accumulator; }
        public override IFunction finisher() { return finisher; }
    }
    // @end-group
    //</editor-fold>

}
