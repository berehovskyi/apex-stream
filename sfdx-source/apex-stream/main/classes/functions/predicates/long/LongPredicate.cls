/**
 * @description Provides default and static methods of 
 * {@link ILongPredicate} functional interface.
 *
 * @see ILongPredicate
 * @see ILongIterable.filter
 * @see ILongIterable.take
 * @see ILongIterable.drop
 * @see ILongIterable.find
 * @see ILongIterable.some
 * @see ILongIterable.every
 * @see ILongIterable.none
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class LongPredicate implements ILongPredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(Long l);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `LongPredicate` that applies short-circuiting logical
     * `OR` operator to `this` `ILongPredicate` and `other`
     * in that order.
     *
     * @param other the other `ILongPredicate`
     *
     * @return the composed `LongPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someLongPredicate1.orElse(someLongPredicate2);
     */
    public virtual LongPredicate orElse(final ILongPredicate other) {
        return some(new List<ILongPredicate>{ this, other });
    }

    /**
     * @description Returns a composed `LongPredicate` that applies short-circuiting logical
     * `AND` operator to `this` `ILongPredicate` and `other`
     * in that order.
     *
     * @param other the other `ILongPredicate`
     *
     * @return the composed `LongPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someLongPredicate1.andAlso(someLongPredicate2);
     */
    public virtual LongPredicate andAlso(final ILongPredicate other) {
        return every(new List<ILongPredicate>{ this, other });
    }

    /**
     * @description Returns a `LongPredicate` that applies logical `NOT` operator
     * to `this` `ILongPredicate`.
     *
     * @return the negated `LongPredicate`
     *
     * @example
     * someLongPredicate.negate();
     */
    public virtual LongPredicate negate() {
        return negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `LongPredicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`ILongPredicate`
     *
     * @return the composed `LongPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * LongPredicate.some(someLongPredicates);
     */
    public static LongPredicate some(final List<ILongPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new OrPredicates(predicates);
    }

    /**
     * @description Returns a composed `LongPredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`ILongPredicates`
     *
     * @return the composed `LongPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * LongPredicate.every(someLongPredicates);
     */
    public static LongPredicate every(final List<ILongPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new AndPredicates(predicates);
    }

    /**
     * @description Returns a `LongPredicate` that applies logical `NOT` operator
     * to `predicate`.
     *
     * @param predicate the `ILongPredicate`
     *
     * @return the negated `LongPredicate`
     *
     * @example
     * LongPredicate.negate(someLongPredicate);
     */
    public static LongPredicate negate(final ILongPredicate predicate) {
        Validate.notNull(predicate);
        return new NegatePredicate(predicate);
    }

    /**
     * @description Returns a `LongPredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     *
     * @param value the evaluated value
     *
     * @return predicate the `LongPredicate`
     *
     * @throws NullPointerException if `value` is null
     *
     * @example
     * LongPredicate.always(true);
     */
    public static LongPredicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AndPredicates extends LongPredicate {
        private final List<ILongPredicate> predicates;
        public AndPredicates(List<ILongPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Long l) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(l)) { return false; }
            }
            return true;
        }
    }

    private class OrPredicates extends LongPredicate {
        private final List<ILongPredicate> predicates;
        public OrPredicates(List<ILongPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(Long l) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(l)) { return true; }
            }
            return false;
        }
    }

    private class NegatePredicate extends LongPredicate {
        private final ILongPredicate predicate;
        public NegatePredicate(ILongPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(Long l) { return !predicate.test(l); }
    }

    private class Always extends LongPredicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(Long l) { return value; }
    }
    // @end-group
    //</editor-fold>
    
}
