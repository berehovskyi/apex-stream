/**
 * @description Provides default and static methods of 
 * {@link IDoublePredicate} functional interface.
 *
 * @see IDoublePredicate
 * @see IDoubleIterable.filter
 * @see IDoubleIterable.take
 * @see IDoubleIterable.drop
 * @see IDoubleIterable.find
 * @see IDoubleIterable.some
 * @see IDoubleIterable.every
 * @see IDoubleIterable.none
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class DoublePredicate implements IDoublePredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(Double d);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `DoublePredicate` that applies short-circuiting logical
     * `OR` operator to `this` `IDoublePredicate` and `other`
     * in that order.
     *
     * @param other the other `IDoublePredicate`
     *
     * @return the composed `DoublePredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someDoublePredicate1.orElse(someDoublePredicate2);
     */
    public virtual DoublePredicate orElse(final IDoublePredicate other) {
        return some(new List<IDoublePredicate>{ this, other });
    }

    /**
     * @description Returns a composed `DoublePredicate` that applies short-circuiting logical
     * `AND` operator to `this` `IDoublePredicate` and `other`
     * in that order.
     *
     * @param other the other `IDoublePredicate`
     *
     * @return the composed `IDoublePredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someDoublePredicate1.andAlso(someDoublePredicate2);
     */
    public virtual DoublePredicate andAlso(final IDoublePredicate other) {
        return every(new List<IDoublePredicate>{ this, other });
    }

    /**
     * @description Returns a `DoublePredicate` that applies logical `NOT` operator
     * to `this` `IDoublePredicate`.
     *
     * @return the negated `DoublePredicate`
     *
     * @example
     * someDoublePredicate.negate();
     */
    public virtual DoublePredicate negate() {
        return negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `DoublePredicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IDoublePredicates`
     *
     * @return the composed `DoublePredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * DoublePredicate.some(someDoublePredicates);
     */
    public static DoublePredicate some(final List<IDoublePredicate> predicates) {
        Validate.noNullElements(predicates);
        return new OrPredicates(predicates);
    }

    /**
     * @description Returns a composed `DoublePredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IDoublePredicates`
     *
     * @return the composed `DoublePredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * DoublePredicate.every(someDoublePredicates);
     */
    public static DoublePredicate every(final List<IDoublePredicate> predicates) {
        Validate.noNullElements(predicates);
        return new AndPredicates(predicates);
    }

    /**
     * @description Returns a `DoublePredicate` that applies logical `NOT` operator
     * to `predicate`.
     *
     * @param predicate the `IDoublePredicate`
     *
     * @return the negated `DoublePredicate`
     *
     * @example
     * DoublePredicate.negate(someDoublePredicate);
     */
    public static DoublePredicate negate(final IDoublePredicate predicate) {
        Validate.notNull(predicate);
        return new NegatePredicate(predicate);
    }

    /**
     * @description Returns a `DoublePredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     *
     * @param value the evaluated value
     *
     * @return predicate the `DoublePredicate`
     *
     * @throws NullPointerException if `value` is null
     *
     * @example
     * DoublePredicate.always(true);
     */
    public static DoublePredicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AndPredicates extends DoublePredicate {
        private final List<IDoublePredicate> predicates;
        public AndPredicates(List<IDoublePredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Double d) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(d)) { return false; }
            }
            return true;
        }
    }

    private class OrPredicates extends DoublePredicate {
        private final List<IDoublePredicate> predicates;
        public OrPredicates(List<IDoublePredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Double d) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(d)) { return true; }
            }
            return false;
        }
    }

    private class NegatePredicate extends DoublePredicate {
        private final IDoublePredicate predicate;
        public NegatePredicate(IDoublePredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Double d) { return !predicate.test(d); }
    }

    private class Always extends DoublePredicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(Double d) { return value; }
    }
    // @end-group
    //</editor-fold>

}
