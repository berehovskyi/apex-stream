/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Inherits {@link IToIntFunction} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class ToIntFunction implements IToIntFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Integer apply(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `ToDoubleFunction` of the `ISObjectFunction`.
     * @param mapper the function
     * @return the `ToIntFunction`
     * @throws NullPointerException if `mapper` is null
     */
    public static ToIntFunction downcast(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new ForSObjectFunction(mapper);
    }

    /**
     * @description Returns a composed `ToDoubleFunction` of the `IFunction`.
     * @param mapper the function
     * @return the `ToIntFunction`
     * @throws NullPointerException if `mapper` is null
     */
    public static ToIntFunction downcast(final IFunction mapper) {
        Validate.notNull(mapper);
        return new ForFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Object To Int Functions">
    // @start-group Object To Int Functions
    /**
     * @description Returns a `ToIntFunction` that returns the Integer value
     * of the Object input argument by casting it to an Integer.
     * @return the `ToIntFunction`
     */
    public static ToIntFunction asInt() {
        return new AsInt();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the Integer value
     * of the Object input argument.
     * @return the `ToIntFunction`
     * @see Integer.valueOf
     */
    public static ToIntFunction valueOf() {
        return new IntValueOf();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ForFunction extends ToIntFunction {
        private final IFunction mapper;
        private ForFunction(IFunction mapper) { this.mapper = mapper; }
        public override Integer apply(Object o) { return (Integer) mapper.apply(o); }
    }

    private class ForSObjectFunction extends ToIntFunction {
        private final ISObjectFunction mapper;
        private ForSObjectFunction(ISObjectFunction mapper) { this.mapper = mapper; }
        public override Integer apply(Object o) { return (Integer) mapper.apply((SObject) o); }
    }

    private class IntValueOf extends ToIntFunction {
        public override Integer apply(Object o) { return Integer.valueOf(o); }
    }

    private class AsInt extends ToIntFunction {
        public override Integer apply(Object o) { return (Integer) o; }
    }
    // @end-group
    //</editor-fold>

}
