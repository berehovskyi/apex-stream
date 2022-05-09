/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Inherits {@link IToLongFunction} functional interface and provides
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class ToLongFunction implements IToLongFunction {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Long apply(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `ToLongFunction` of the `ISObjectFunction`.
     * @param mapper the function
     * @return the `ToLongFunction`
     * @throws NullPointerException if `mapper` is null
     */
    public static ToLongFunction downcast(final ISObjectFunction mapper) {
        Validate.notNull(mapper);
        return new ForSObjectFunction(mapper);
    }

    /**
     * @description Returns a composed `ToLongFunction` of the `IFunction`.
     * @param mapper the function
     * @return the `ToLongFunction`
     * @throws NullPointerException if `mapper` is null
     */
    public static ToLongFunction downcast(final IFunction mapper) {
        Validate.notNull(mapper);
        return new ForFunction(mapper);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `ToLongFunction` that returns the Long value
     * of the Object input argument by casting it to an Long.
     * @return the `ToLongFunction`
     */
    public static ToLongFunction asLong() {
        return new AsLong();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class ForSObjectFunction extends ToLongFunction {
        private final ISObjectFunction mapper;
        private ForSObjectFunction(ISObjectFunction mapper) { this.mapper = mapper; }
        public override Long apply(Object o) { return (Long) mapper.apply((SObject) o); }
    }

    private class ForFunction extends ToLongFunction {
        private final IFunction mapper;
        private ForFunction(IFunction mapper) { this.mapper = mapper; }
        public override Long apply(Object o) { return (Long) mapper.apply(o); }
    }

    private class AsLong extends ToLongFunction {
        public override Long apply(Object o) { return (Long) o; }
    }
    // @end-group
    //</editor-fold>

}
