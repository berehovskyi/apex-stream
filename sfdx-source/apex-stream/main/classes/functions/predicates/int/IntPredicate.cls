/**
 * @description Provides default and static methods of 
 * {@link IIntPredicate} functional interface.
 *
 * @see IIntPredicate
 * @see IIntIterable.filter
 * @see IIntIterable.take
 * @see IIntIterable.drop
 * @see IIntIterable.find
 * @see IIntIterable.some
 * @see IIntIterable.every
 * @see IIntIterable.none
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class IntPredicate implements IIntPredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(Integer i);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `IntPredicate` that applies short-circuiting logical
     * `OR` operator to `this` `IIntPredicate` and `other`
     * in that order.
     *
     * @param other the other `IIntPredicate`
     *
     * @return the composed `IntPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someIntPredicate1.orElse(someIntPredicate2);
     */
    public virtual IntPredicate orElse(final IIntPredicate other) {
        return some(new List<IIntPredicate>{ this, other });
    }

    /**
     * @description Returns a composed `IntPredicate` that applies short-circuiting logical
     * `AND` operator to `this` `IIntPredicate` and `other`
     * in that order.
     *
     * @param other the other `IIntPredicate`
     *
     * @return the composed `IIntPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someIntPredicate1.andAlso(someIntPredicate2);
     */
    public virtual IntPredicate andAlso(final IIntPredicate other) {
        return every(new List<IIntPredicate>{ this, other });
    }

    /**
     * @description Returns a `IntPredicate` that applies logical `NOT` operator
     * to `this` `IIntPredicate`.
     *
     * @return the negated `IntPredicate`
     *
     * @example
     * someIntPredicate.negate();
     */
    public virtual IntPredicate negate() {
        return negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `IntPredicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IIntPredicates`
     *
     * @return the composed `IntPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * IntPredicate.some(someIntPredicates);
     */
    public static IntPredicate some(final List<IIntPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new OrPredicates(predicates);
    }

    /**
     * @description Returns a composed `IntPredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IIntPredicates`
     *
     * @return the composed `IntPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * IntPredicate.every(someIntPredicates);
     */
    public static IntPredicate every(final List<IIntPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new AndPredicates(predicates);
    }

    /**
     * @description Returns a `IntPredicate` that applies logical `NOT` operator
     * to `predicate`.
     *
     * @param predicate the `IIntPredicate`
     *
     * @return the negated `IntPredicate`
     *
     * @example
     * IntPredicate.negate(someIntPredicate);
     */
    public static IntPredicate negate(final IIntPredicate predicate) {
        Validate.notNull(predicate);
        return new NegatePredicate(predicate);
    }

    /**
     * @description Returns a `IntPredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     *
     * @param value the evaluated value
     *
     * @return predicate the `IntPredicate`
     *
     * @throws NullPointerException if `value` is null
     *
     * @example
     * IntPredicate.always(true);
     */
    public static IntPredicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AndPredicates extends IntPredicate {
        private final List<IIntPredicate> predicates;
        public AndPredicates(List<IIntPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Integer j) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(j)) { return false; }
            }
            return true;
        }
    }

    private class OrPredicates extends IntPredicate {
        private final List<IIntPredicate> predicates;
        public OrPredicates(List<IIntPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Integer j) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(j)) { return true; }
            }
            return false;
        }
    }

    private class NegatePredicate extends IntPredicate {
        private final IIntPredicate predicate;
        public NegatePredicate(IIntPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Integer i) { return !predicate.test(i); }
    }

    private class Always extends IntPredicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(Integer i) { return value; }
    }
    // @end-group
    //</editor-fold>
    
}
