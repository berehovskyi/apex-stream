/**
 * @description Provides default and static methods of
 * {@link IBiPredicate} functional interface.
 *
 * @see IBiPredicate
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class BiPredicate implements IBiPredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(Object o1, Object o2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `BiPredicate` that applies short-circuiting logical
     * `OR` operator to `this` `IBiPredicate` and `other`
     * in that order.
     *
     * @param other the other `IBiPredicate`
     *
     * @return the composed `BiPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someBiPredicate1.orElse(someBiPredicate2);
     */
    public virtual BiPredicate orElse(final IBiPredicate other) {
        return some(new List<IBiPredicate>{ this, other });
    }

    /**
     * @description Returns a composed `BiPredicate` that applies short-circuiting logical
     * `AND` operator to `this` `IPredicate` and `other`
     * in that order.
     *
     * @param other the other `IBiPredicate`
     *
     * @return the composed `BiPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someBiPredicate1.andAlso(someBiPredicate2);
     */
    public virtual BiPredicate andAlso(final IBiPredicate other) {
        return every(new List<IBiPredicate>{ this, other });
    }

    /**
     * @description Returns a `BiPredicate` that applies logical `NOT` operator
     * to `this` `IBiPredicate`.
     *
     * @return the negated `BiPredicate`
     *
     * @example
     * someBiPredicate.negate();
     */
    public virtual BiPredicate negate() {
        return new Negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `BiPredicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IBiPredicate`
     *
     * @return the composed `BiPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * BiPredicate.some(someBiPredicates);
     */
    public static BiPredicate some(final List<IBiPredicate> predicates) {
        return new Some(predicates);
    }

    /**
     * @description Returns a composed `BiPredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`IBiPredicate`
     *
     * @return the composed `BiPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * BiPredicate.every(someBiPredicates);
     */
    public static BiPredicate every(final List<IBiPredicate> predicates) {
        return new Every(predicates);
    }

    /**
     * @description Returns a `BiPredicate` that applies logical `NOT` operator
     * to `predicate`.
     *
     * @param predicate the `IBiPredicate`
     *
     * @return the negated `BiPredicate`
     *
     * @example
     * BiPredicate.negate(someBiPredicate);
     */
    public static BiPredicate negate(final IBiPredicate predicate) {
        return new Negate(predicate);
    }

    /**
     * @description Returns a composed `BiPredicate` that applies short-circuiting logical
     * `OR` operator to `left` `IPredicate` and `right`
     * in that order applied to the first and the second input arguments respectively.
     *
     * @param left the predicate applied to the first input argument
     * @param right the predicate applied to the second input argument
     *
     * @return the composed `BiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * BiPredicate.some(somePredicate1, somePredicate2);
     */
    public static BiPredicate some(final IPredicate left, final IPredicate right) {
        return new SomePredicate(left, right);
    }

    /**
     * @description Returns a composed `BiPredicate` that applies short-circuiting logical
     * `AND` operator to `left` `IPredicate` and `right`
     * in that order applied to the first and the second input arguments respectively.
     *
     * @param left the predicate applied to the first input argument
     * @param right the predicate applied to the second input argument
     *
     * @return the composed `BiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * BiPredicate.every(somePredicate1, somePredicate2);
     */
    public static BiPredicate every(final IPredicate left, final IPredicate right) {
        return new EveryPredicate(left, right);
    }

    /**
     * @description Returns a `BiPredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     *
     * @param value the evaluated value
     *
     * @return predicate the `BiPredicate`
     *
     * @throws NullPointerException if `value` is null
     *
     * @example
     * BiPredicate.always(true);
     */
    public static BiPredicate always(final Boolean value) {
        return new Always(value);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Some extends BiPredicate {
        private final List<IBiPredicate> predicates;
        public Some(List<IBiPredicate> predicates) {
            Validate.noNullElements(predicates);
            this.predicates = predicates;
        }
        @SuppressWarnings('PMD.OneDeclarationPerLine')
        public override Boolean test(Object o1, Object o2) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(o1, o2)) { return true; }
            }
            return false;
        }
    }

    private class SomePredicate extends BiPredicate {
        private final IPredicate left;
        private final IPredicate right;
        public SomePredicate(IPredicate left, IPredicate right) {
            Validate.notNull(left);
            Validate.notNull(right);
            this.left = left;
            this.right = right;
        }
        public override Boolean test(Object o1, Object o2) { return left.test(o1) || right.test(o2); }
    }

    private class Every extends BiPredicate {
        private final List<IBiPredicate> predicates;
        public Every(List<IBiPredicate> predicates) {
            Validate.noNullElements(predicates);
            this.predicates = predicates;
        }
        @SuppressWarnings('PMD.OneDeclarationPerLine')
        public override Boolean test(Object o1, Object o2) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(o1, o2)) { return false; }
            }
            return true;
        }
    }

    private class EveryPredicate extends BiPredicate {
        private final IPredicate left;
        private final IPredicate right;
        public EveryPredicate(IPredicate left, IPredicate right) {
            Validate.notNull(left);
            Validate.notNull(right);
            this.left = left;
            this.right = right;
        }
        public override Boolean test(Object o1, Object o2) { return left.test(o1) && right.test(o2); }
    }

    private class Negate extends BiPredicate {
        private final IBiPredicate predicate;
        public Negate(IBiPredicate predicate) {
            Validate.notNull(predicate);
            this.predicate = predicate;
        }
        public override Boolean test(Object o1, Object o2) { return !predicate.test(o1, o2); }
    }

    private class Always extends BiPredicate {
        private final Boolean value;
        private Always(Boolean value) {
            Validate.notNull(value);
            this.value = value;
        }
        public override Boolean test(Object o1, Object o2) { return value; }
    }
    // @end-group
    //</editor-fold>

}
