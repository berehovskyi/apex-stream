/**
 * @description Provides default and static methods of 
 * {@link ISObjectPredicate} functional interface.
 *
 * @see ISObjectPredicate
 * @see ISObjectIterable.filter
 * @see ISObjectIterable.take
 * @see ISObjectIterable.drop
 * @see ISObjectIterable.find
 * @see ISObjectIterable.some
 * @see ISObjectIterable.every
 * @see ISObjectIterable.none
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class SObjectPredicate implements ISObjectPredicate {

    //<editor-fold desc="Function">
    // @start-group Function
    public abstract Boolean test(SObject sObj);
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Default Methods">
    // @start-group Default Methods
    /**
     * @description Returns a composed `SObjectPredicate` that applies short-circuiting logical
     * `OR` operator to `this` `ISObjectPredicate` and `other`
     * in that order.
     *
     * @param other the other `ISObjectPredicate`
     *
     * @return the composed `SObjectPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someSObjectPredicate1.orElse(someSObjectPredicate2);
     */
    public virtual SObjectPredicate orElse(final ISObjectPredicate other) {
        return some(new List<ISObjectPredicate>{ this, other });
    }

    /**
     * @description Returns a composed `SObjectPredicate` that applies short-circuiting logical
     * `AND` operator to `this` `ISObjectPredicate` and `other`
     * in that order.
     *
     * @param other the other `ISObjectPredicate`
     *
     * @return the composed `SObjectPredicate`
     *
     * @throws NullPointerException if `other` is null
     *
     * @example
     * someSObjectPredicate1.andAlso(someSObjectPredicate2);
     */
    public virtual SObjectPredicate andAlso(final ISObjectPredicate other) {
        return every(new List<ISObjectPredicate>{ this, other });
    }

    /**
     * @description Returns a `SObjectPredicate` that applies logical `NOT` operator
     * to `this` `ISObjectPredicate`.
     *
     * @return the negated `SObjectPredicate`
     *
     * @example
     * someSObjectPredicate.negate();
     */
    public virtual SObjectPredicate negate() {
        return negate(this);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Static Methods">
    // @start-group Static Methods
    /**
     * @description Returns a composed `SObjectPredicate` that applies sequentially short-circuiting
     * logical `OR` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`ISObjectPredicates`
     *
     * @return the composed `SObjectPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * SObjectPredicate.some(someSObjectPredicates);
     */
    public static SObjectPredicate some(final List<ISObjectPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new Some(predicates);
    }

    /**
     * @description Returns a composed `SObjectPredicate` that applies sequentially short-circuiting
     * logical `AND` operator to `predicates` in the same order as the order of the input list.
     *
     * @param predicates the list of`ISObjectPredicates`
     *
     * @return the composed `SObjectPredicate`
     *
     * @throws NullPointerException if `other` is null or some of the list element is null
     *
     * @example
     * SObjectPredicate.every(someSObjectPredicates);
     */
    public static SObjectPredicate every(final List<ISObjectPredicate> predicates) {
        Validate.noNullElements(predicates);
        return new Every(predicates);
    }

    /**
     * @description Returns a `SObjectPredicate` that applies logical `NOT` operator
     * to `predicate`.
     *
     * @param predicate the `ISObjectPredicate`
     *
     * @return the negated `SObjectPredicate`
     *
     * @example
     * SObjectPredicate.negate(someSObjectPredicate);
     */
    public static SObjectPredicate negate(final ISObjectPredicate predicate) {
        Validate.notNull(predicate);
        return new Negate(predicate);
    }

    /**
     * @description Returns a `SObjectPredicate` that always evaluates to the Boolean `value`
     * (`true` or `false`).
     *
     * @param value the evaluated value
     *
     * @return predicate the `SObjectPredicate`
     *
     * @throws NullPointerException if `value` is null
     *
     * @example
     * SObjectPredicate.always(true);
     */
    public static SObjectPredicate always(final Boolean value) {
        Validate.notNull(value);
        return new Always(value);
    }

    /**
     * @description Returns a composed `SObjectPredicate` of the `ISObjectFunction` and
     * the `IPredicate`.
     *
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     *
     * @return the composed `SObjectPredicate`
     *
     * @throws NullPointerException if `mapper` or `predicate` is null
     *
     * @example
     * SObjectPredicate.compose(someSObjectFunction, somePredicate);
     * SObjectPredicate.compose(SObjectFunctions.get('Name'), StringPredicate.startsWith('A'));
     */
    public static SObjectPredicate compose(final ISObjectFunction mapper, final IPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `SObjectPredicate` of the `ISObjectToIntFunction` and
     * the `IIntPredicate`.
     *
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     *
     * @return the composed `SObjectPredicate`
     *
     * @throws NullPointerException if `mapper` or `predicate` is null
     *
     * @example
     * SObjectPredicate.compose(someSObjectToIntFunction, someIntPredicate);
     * SObjectPredicate.compose(
     *     SObjectToIntFunctions.get('NumberOfEmployees'),
     *     IntPredicates.isEven()
     * );
     */
    public static SObjectPredicate compose(final ISObjectToIntFunction mapper, final IIntPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfIntPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `SObjectPredicate` of the `ISObjectToLongFunction` and
     * the `ILongPredicate`.
     *
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     *
     * @return the composed `SObjectPredicate`
     *
     * @throws NullPointerException if `mapper` or `predicate` is null
     *
     * @example
     * SObjectPredicate.compose(someSObjectToLongFunction, someLongPredicate);
     * SObjectPredicate.compose(
     *     SObjectToLongFunctions.get('NumberOfEmployees'),
     *     LongPredicates.isEven()
     * );
     */
    public static SObjectPredicate compose(final ISObjectToLongFunction mapper, final ILongPredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfLongPredicate(mapper, predicate);
    }

    /**
     * @description Returns a composed `SObjectPredicate` of the `ISObjectToDoubleFunction` and
     * the `IDoublePredicate`.
     *
     * @param mapper the function applied to the input argument
     * @param predicate the predicate to the result returned by the `mapper`
     *
     * @return the composed `SObjectPredicate`
     *
     * @throws NullPointerException if `mapper` or `predicate` is null
     *
     * @example
     * SObjectPredicate.compose(someSObjectToDoubleFunction, someDoublePredicate);
     * SObjectPredicate.compose(
     *     SObjectToDoubleFunctions.get('ShippingLatitude'),
     *     DoublePredicates.isPositive()
     * );
     */
    public static SObjectPredicate compose(final ISObjectToDoubleFunction mapper, final IDoublePredicate predicate) {
        Validate.notNull(mapper);
        Validate.notNull(predicate);
        return new OfDoublePredicate(mapper, predicate);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Every extends SObjectPredicate {
        private final List<ISObjectPredicate> predicates;
        public Every(List<ISObjectPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(SObject sObj) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (!predicates[i].test(sObj)) { return false; }
            }
            return true;
        }
    }

    private class Some extends SObjectPredicate {
        private final List<ISObjectPredicate> predicates;
        public Some(List<ISObjectPredicate> predicates) { this.predicates = predicates; }
        public override Boolean test(SObject sObj) {
            for (Integer i = 0, size = predicates.size(); i < size; i++) {
                if (predicates[i].test(sObj)) { return true; }
            }
            return false;
        }
    }

    private class Negate extends SObjectPredicate {
        private final ISObjectPredicate predicate;
        public Negate(ISObjectPredicate predicate) { this.predicate = predicate; }
        public override Boolean test(SObject sObj) { return !predicate.test(sObj); }
    }

    private class Always extends SObjectPredicate {
        private final Boolean value;
        private Always(Boolean value) { this.value = value; }
        public override Boolean test(SObject sObj) { return value; }
    }

    private class OfPredicate extends SObjectPredicate {
        private final ISObjectFunction mapper;
        private final IPredicate predicate;
        private OfPredicate(ISObjectFunction mapper, IPredicate predicate) {
            this.mapper = mapper;
            this.predicate = predicate;
        }
        public override Boolean test(SObject sObj) { return predicate.test(mapper.apply(sObj)); }
    }

    private class OfIntPredicate extends SObjectPredicate {
        private final ISObjectToIntFunction mapper;
        private final IIntPredicate predicate;
        private OfIntPredicate(ISObjectToIntFunction mapper, IIntPredicate predicate) {
            this.mapper = mapper;
            this.predicate = predicate;
        }
        public override Boolean test(SObject sObj) { return predicate.test(mapper.apply(sObj)); }
    }

    private class OfLongPredicate extends SObjectPredicate {
        private final ISObjectToLongFunction mapper;
        private final ILongPredicate predicate;
        private OfLongPredicate(ISObjectToLongFunction mapper, ILongPredicate predicate) {
            this.mapper = mapper;
            this.predicate = predicate;
        }
        public override Boolean test(SObject sObj) { return predicate.test(mapper.apply(sObj)); }
    }

    private class OfDoublePredicate extends SObjectPredicate {
        private final ISObjectToDoubleFunction mapper;
        private final IDoublePredicate predicate;
        private OfDoublePredicate(ISObjectToDoubleFunction mapper, IDoublePredicate predicate) {
            this.mapper = mapper;
            this.predicate = predicate;
        }
        public override Boolean test(SObject sObj) { return predicate.test(mapper.apply(sObj)); }
    }
    // @end-group
    //</editor-fold>
}
