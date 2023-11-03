/**
 * @description Provides default and static methods of 
 * {@link IPredicate} functional interface.
 *
 * @see IPredicate
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
        return new ForFunctionPredicate(mapper, predicate);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AndPredicates extends Predicate {
        private final List<IPredicate> predicates;
        private AndPredicates(List<IPredicate> predicates) {
            Validate.noNullElements(predicates);
            this.predicates = predicates;
        }
        public override Boolean test(Object o) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(o)) { return false; }
            }
            return true;
        }
    }

    private class OrPredicates extends Predicate {
        private final List<IPredicate> predicates;
        private OrPredicates(List<IPredicate> predicates) {
            Validate.noNullElements(predicates);
            this.predicates = predicates;
        }
        public override Boolean test(Object o) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(o)) { return true; }
            }
            return false;
        }
    }

    private class NegatePredicate extends Predicate {
        private final IPredicate predicate;
        private NegatePredicate(IPredicate predicate) {
            Validate.notNull(predicate);
            this.predicate = predicate;
        }
        public override Boolean test(Object o) { return !predicate.test(o); }
    }

    private class Always extends Predicate {
        private final Boolean value;
        private Always(Boolean value) {
            Validate.notNull(value);
            this.value = value;
        }
        public override Boolean test(Object o) { return value; }
    }

    private class ForFunctionPredicate extends Predicate {
        private final IFunction function;
        private final IPredicate predicate;
        private ForFunctionPredicate(IFunction function, IPredicate predicate) {
            Validate.notNull(function);
            Validate.notNull(predicate);
            this.function = function;
            this.predicate = predicate;
        }
        public override Boolean test(Object o) { return predicate.test(function.apply(o)); }
    }
    // @end-group
    //</editor-fold>

}
