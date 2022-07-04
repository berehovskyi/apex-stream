/**
 * @description Provides default and static methods of 
 * {@link ISObjectBiPredicate} functional interface.
 * 
 * @see ISObjectBiPredicate
 * @see SObjectStream.zip
 * @see SObjectSequence.zip
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectBiPredicate implements ISObjectBiPredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(SObject sObj1, SObject sObj2);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `SObjectBiPredicate` that applies short-circuiting logical
     * `OR` operator to `this` `ISObjectBiPredicate` and `other`
     * in that order.
     *
     * @param other the other `ISObjectBiPredicate`
     *
     * @return the composed `SObjectBiPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someSObjectBiPredicate1.orElse(someSObjectBiPredicate2);
     */
    public virtual SObjectBiPredicate orElse(final ISObjectBiPredicate other) {
        return some(new List<ISObjectBiPredicate>{ this, other });
    }

    /**
     * @description Returns a composed `SObjectBiPredicate` that applies short-circuiting logical
     * `AND` operator to `this` `ISObjectPredicate` and `other`
     * in that order.
     *
     * @param other the other `ISObjectBiPredicate`
     *
     * @return the composed `SObjectBiPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someSObjectBiPredicate1.andAlso(someSObjectBiPredicate2);
     */
    public virtual SObjectBiPredicate andAlso(final ISObjectBiPredicate other) {
        return every(new List<ISObjectBiPredicate>{ this, other });
    }

    /**
     * @description Returns a `SObjectBiPredicate` that applies logical `NOT` operator
     * to `this` `ISObjectBiPredicate`.
     *
     * @return the negated `SObjectBiPredicate`
     *
     * @example
     * someSObjectBiPredicate.negate();
     */
    public virtual SObjectBiPredicate negate() {
        return new Negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `SObjectBiPredicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`ISObjectBiPredicate`
     *
     * @return the composed `SObjectBiPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * SObjectBiPredicate.some(someSObjectBiPredicates);
     */
    public static SObjectBiPredicate some(final List<ISObjectBiPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new Some(predicates);
    }

    /**
     * @description Returns a composed `SObjectBiPredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`ISObjectBiPredicate`
     *
     * @return the composed `SObjectBiPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * SObjectBiPredicate.every(someSObjectBiPredicates);
     */
    public static SObjectBiPredicate every(final List<ISObjectBiPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new Every(predicates);
    }

    /**
     * @description Returns a `SObjectBiPredicate` that applies logical `NOT` operator
     * to `predicate`.
     *
     * @param predicate the `ISObjectBiPredicate`
     *
     * @return the negated `SObjectBiPredicate`
     *
     * @example
     * SObjectBiPredicate.negate(someSObjectBiPredicate);
     */
    public static SObjectBiPredicate negate(final ISObjectBiPredicate predicate) {
        Validate.notNull(predicate);
        return new Negate(predicate);
    }

    /**
     * @description Returns a composed `SObjectBiPredicate` that applies short-circuiting logical
     * `OR` operator to `left` `ISObjectPredicate` and `right`
     * in that order applied to the first and the second input arguments respectively.
     *
     * @param left the predicate applied to the first input argument
     * @param right the predicate applied to the second input argument
     *
     * @return the composed `SObjectBiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * SObjectBiPredicate.some(someSObjectPredicate1, someSObjectPredicate2);
     */
    public static SObjectBiPredicate some(final ISObjectPredicate left, final ISObjectPredicate right) {
        Validate.notNull(left);
        Validate.notNull(right);
        return new SomePredicate(left, right);
    }

    /**
     * @description Returns a composed `SObjectBiPredicate` that applies short-circuiting logical
     * `AND` operator to `left` `ISObjectPredicate` and `right`
     * in that order applied to the first and the second input arguments respectively.
     *
     * @param left the predicate applied to the first input argument
     * @param right the predicate applied to the second input argument
     *
     * @return the composed `SObjectBiPredicate`
     *
     * @throws NullPointerException if `left` or `right` is null
     *
     * @example
     * SObjectBiPredicate.every(someSObjectPredicate1, someSObjectPredicate2);
     */
    public static SObjectBiPredicate every(final ISObjectPredicate left, final ISObjectPredicate right) {
        Validate.notNull(left);
        Validate.notNull(right);
        return new EveryPredicate(left, right);
    }

    /**
     * @description Returns a `SObjectBiPredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     *
     * @param value the evaluated value
     *
     * @return predicate the `SObjectBiPredicate`
     *
     * @throws NullPointerException if `value` is null
     *
     * @example
     * SObjectBiPredicate.always(true);
     */
    public static SObjectBiPredicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Some extends SObjectBiPredicate {
        private final List<ISObjectBiPredicate> predicates;
        public Some(List<ISObjectBiPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(SObject sObj1, SObject sObj2) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(sObj1, sObj2)) { return true; }
            }
            return false;
        }
    }

    private class SomePredicate extends SObjectBiPredicate {
        private final ISObjectPredicate left;
        private final ISObjectPredicate right;
        public SomePredicate(ISObjectPredicate left, ISObjectPredicate right) {
            this.left = left;
            this.right = right;
        }
        public override Boolean test(SObject sObj1, SObject sObj2) { return left.test(sObj1) || right.test(sObj2); }
    }

    private class Every extends SObjectBiPredicate {
        private final List<ISObjectBiPredicate> predicates;
        public Every(List<ISObjectBiPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(SObject sObj1, SObject sObj2) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(sObj1, sObj2)) { return false; }
            }
            return true;
        }
    }

    private class EveryPredicate extends SObjectBiPredicate {
        private final ISObjectPredicate left;
        private final ISObjectPredicate right;
        public EveryPredicate(ISObjectPredicate left, ISObjectPredicate right) {
            this.left = left;
            this.right = right;
        }
        public override Boolean test(SObject sObj1, SObject sObj2) { return left.test(sObj1) && right.test(sObj2); }
    }

    private class Negate extends SObjectBiPredicate {
        private final ISObjectBiPredicate predicate;
        public Negate(ISObjectBiPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(SObject sObj1, SObject sObj2) { return !predicate.test(sObj1, sObj2); }
    }

    private class Always extends SObjectBiPredicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(SObject sObj1, SObject sObj2) { return value; }
    }
    // @end-group
    //</editor-fold>

}
