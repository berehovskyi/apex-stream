/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IToDoubleFunction} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class ToDoubleFunction implements IToDoubleFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Double apply(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `ToDoubleFunction` of the `ISObjectFunction`.
     * @param mapper the function
     * @return the `ToDoubleFunction`
     * @throws NullPointerException if `mapper` is null
     */
    public static ToDoubleFunction downcast(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new ForSObjectFunction(mapper);
    }

    /**
     * @description Returns a composed `ToDoubleFunction` of the `IFunction`.
     * @param mapper the function
     * @return the `ToDoubleFunction`
     * @throws NullPointerException if `mapper` is null
     */
    public static ToDoubleFunction downcast(final IFunction mapper) {
        Validate.notNull(mapper);
        return new ForFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `ToDoubleFunction` that returns the Double value
     * of the Object input argument by casting it to an Double.
     * @return the `ToDoubleFunction`
     */
    public static ToDoubleFunction asDouble() {
        return new AsDouble();
    }

    /**
     * @description Returns a `ToDoubleFunction` that returns the Double value
     * of the Object input argument.
     * @return the `ToDoubleFunction`
     * @see Double.valueOf
     */
    public static ToDoubleFunction valueOf() {
        return new DoubleValueOf();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ForFunction extends ToDoubleFunction {
        private final IFunction mapper;
        private ForFunction(IFunction mapper) { this.mapper = mapper; }
        public override Double apply(Object o) { return (Double) mapper.apply(o); }
    }

    private class ForSObjectFunction extends ToDoubleFunction {
        private final ISObjectFunction mapper;
        private ForSObjectFunction(ISObjectFunction mapper) { this.mapper = mapper; }
        public override Double apply(Object o) { return (Double) mapper.apply((SObject) o); }
    }

    private class DoubleValueOf extends ToDoubleFunction {
        public override Double apply(Object o) { return Double.valueOf(o); }
    }

    private class AsDouble extends ToDoubleFunction {
        public override Double apply(Object o) { return (Double) o; }
    }
    // @end-group
    //</editor-fold>

}
