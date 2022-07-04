/**
 * @description Provides default and static methods of 
 * {@link IPredicate} functional interface.
 *
 * @see IPredicate
 * @see IObjectIterable.filter
 * @see IObjectIterable.take
 * @see IObjectIterable.drop
 * @see IObjectIterable.find
 * @see IObjectIterable.some
 * @see IObjectIterable.every
 * @see IObjectIterable.none
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class Predicate implements IPredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(Object o);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `Predicate` that applies short-circuiting logical
     * OR} operator to `this` `IPredicate` and `other`
     * in that order.
     *
     * @param other the other `Predicate`
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * somePredicate1.orElse(somePredicate2);
     */
    public virtual Predicate orElse(final IPredicate other) {
        return some(new List<IPredicate>{ this, other });
    }

    /**
     * @description Returns a composed `Predicate` that applies short-circuiting logical
     * AND} operator to `this` `IPredicate` and `other`
     * in that order.
     *
     * @param other the other `Predicate`
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * somePredicate1.andAlso(somePredicate2);
     */
    public virtual Predicate andAlso(final IPredicate other) {
        return every(new List<IPredicate>{ this, other });
    }

    /**
     * @description Returns a `Predicate` that applies logical `NOT` operator
     * to `this` `IPredicate`.
     *
     * @return the negated `Predicate`
     *
     * @example
     * somePredicate1.negate();
     */
    public virtual Predicate negate() {
        return negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `Predicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IPredicates`
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * Predicate.some(somePredicates);
     */
    public static Predicate some(final List<IPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new OrPredicates(predicates);
    }

    /**
     * @description Returns a composed `Predicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IPredicates`
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * Predicate.every(somePredicates);
     */
    public static Predicate every(final List<IPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new AndPredicates(predicates);
    }

    /**
     * @description Returns a `Predicate` that applies logical `NOT` operator
     * to `predicate`.
     *
     * @param predicate the `IPredicate`
     *
     * @return the negated `Predicate`
     *
     * @example
     * Predicate.negate(somePredicate);
     */
    public static Predicate negate(final IPredicate predicate) {
        Validate.notNull(predicate);
        return new NegatePredicate(predicate);
    }

    /**
     * @description Returns a `Predicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     *
     * @param value the evaluated value
     *
     * @return predicate the `Predicate`
     *
     * @throws NullPointerException if `value` is null
     *
     * @example
     * Predicate.always(true);
     */
    public static Predicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }

    /**
     * @description Returns a composed `Predicate` of the `IFunction` and
     * the `IPredicate`.
     *
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `mapper` or `predicate` is null
     *
     * @example
     * Predicate.compose(someFunction, somePredicate);
     */
    public static Predicate compose(final IFunction mapper, final IPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new ForFunctionPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `IToIntFunction` and
     * the `IIntPredicate`.
     *
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `mapper` or `predicate` is null
     *
     * @example
     * Predicate.compose(someToIntFunction, someIntPredicate);
     */
    public static Predicate compose(final IToIntFunction mapper, final IIntPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new ForIntFunctionPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `IToLongFunction` and
     * the `ILongPredicate`.
     *
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `mapper` or `predicate` is null
     *
     * @example
     * Predicate.compose(someToLongFunction, someLongPredicate);
     */
    public static Predicate compose(final IToLongFunction mapper, final ILongPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new ForLongFunctionPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `IToDoubleFunction` and
     * the `IDoublePredicate`.
     *
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `mapper` or `predicate` is null
     *
     * @example
     * Predicate.compose(someToDoubleFunction, someDoublePredicate);
     */
    public static Predicate compose(final IToDoubleFunction mapper, final IDoublePredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new ForDoubleFunctionPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `IToSObjectFunction` and
     * the `ISObjectPredicate`.
     *
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `mapper` or `predicate` is null
     *
     * @example
     * Predicate.compose(someToSObjectFunction, someSObjectPredicate);
     */
    public static Predicate compose(final IToSObjectFunction mapper, final ISObjectPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new ForSObjectFunctionPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `IIntPredicate`.
     *
     * @param predicate the predicate
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Predicate.compose(someIntPredicate);
     */
    public static Predicate compose(final IIntPredicate predicate) {
        Validate.notNull(predicate);
        return new ForIntPredicate(predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `ILongPredicate`.
     *
     * @param predicate the predicate
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Predicate.compose(someLongPredicate);
     */
    public static Predicate compose(final ILongPredicate predicate) {
        Validate.notNull(predicate);
        return new ForLongPredicate(predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `IDoublePredicate`.
     *
     * @param predicate the predicate
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Predicate.compose(someDoublePredicate);
     */
    public static Predicate compose(final IDoublePredicate predicate) {
        Validate.notNull(predicate);
        return new ForDoublePredicate(predicate);
    }

    /**
     * @description Returns a composed `Predicate` of the `ISObjectPredicate`.
     *
     * @param predicate the predicate
     *
     * @return the composed `Predicate`
     *
     * @throws NullPointerException if `predicate` is null
     *
     * @example
     * Predicate.compose(someSObjectPredicate);
     */
    public static Predicate compose(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        return new ForSObjectPredicate(predicate);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AndPredicates extends Predicate {
        private final List<IPredicate> predicates;
        private AndPredicates(List<IPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Object o) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(o)) { return false; }
            }
            return true;
        }
    }

    private class OrPredicates extends Predicate {
        private final List<IPredicate> predicates;
        private OrPredicates(List<IPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Object o) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(o)) { return true; }
            }
            return false;
        }
    }

    private class NegatePredicate extends Predicate {
        private final IPredicate predicate;
        private NegatePredicate(IPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Object o) { return !predicate.test(o); }
    }

    private class Always extends Predicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(Object o) { return value; }
    }

    private class ForFunctionPredicate extends Predicate {
        private final IFunction function;
        private final IPredicate predicate;
        private ForFunctionPredicate(IFunction function, IPredicate predicate) {
            this.function = function;
            this.predicate = predicate;
        }
        public override Boolean test(Object o) { return predicate.test(function.apply(o)); }
    }

    private class ForIntFunctionPredicate extends Predicate {
        private final IToIntFunction function;
        private final IIntPredicate predicate;
        private ForIntFunctionPredicate(IToIntFunction function, IIntPredicate predicate) {
            this.function = function;
            this.predicate = predicate;
        }
        public override Boolean test(Object o) { return predicate.test(function.apply(o)); }
    }

    private class ForLongFunctionPredicate extends Predicate {
        private final IToLongFunction function;
        private final ILongPredicate predicate;
        private ForLongFunctionPredicate(IToLongFunction function, ILongPredicate predicate) {
            this.function = function;
            this.predicate = predicate;
        }
        public override Boolean test(Object o) { return predicate.test(function.apply(o)); }
    }

    private class ForDoubleFunctionPredicate extends Predicate {
        private final IToDoubleFunction function;
        private final IDoublePredicate predicate;
        private ForDoubleFunctionPredicate(IToDoubleFunction function, IDoublePredicate predicate) {
            this.function = function;
            this.predicate = predicate;
        }
        public override Boolean test(Object o) { return predicate.test(function.apply(o)); }
    }

    private class ForSObjectFunctionPredicate extends Predicate {
        private final IToSObjectFunction function;
        private final ISObjectPredicate predicate;
        private ForSObjectFunctionPredicate(IToSObjectFunction function, ISObjectPredicate predicate) {
            this.function = function;
            this.predicate = predicate;
        }
        public override Boolean test(Object o) { return predicate.test(function.apply(o)); }
    }

    private class ForIntPredicate extends Predicate {
        private final IIntPredicate predicate;
        private ForIntPredicate(IIntPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Object o) { return predicate.test((Integer) o); }
    }

    private class ForLongPredicate extends Predicate {
        private final ILongPredicate predicate;
        private ForLongPredicate(ILongPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Object o) { return predicate.test((Long) o); }
    }

    private class ForDoublePredicate extends Predicate {
        private final IDoublePredicate predicate;
        private ForDoublePredicate(IDoublePredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Object o) { return predicate.test((Double) o); }
    }

    private class ForSObjectPredicate extends Predicate {
        private final ISObjectPredicate predicate;
        private ForSObjectPredicate(ISObjectPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Object o) { return predicate.test((SObject) o); }
    }
    // @end-group
    //</editor-fold>

}
