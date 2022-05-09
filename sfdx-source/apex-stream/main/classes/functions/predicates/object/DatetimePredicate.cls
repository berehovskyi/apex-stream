/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Extends `Predicate` functions and provides `DatetimePredicate`
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class DatetimePredicate extends Predicate {

    //<editor-fold desc="Datetime Predicates">
    // @start-group Datetime Predicates
    /**
     * @description Returns a `Predicate` that tests the input datetime if it is the same
     * as the specified `datetimeToCompare` in the local time zone of the context user.
     * @param datetimeToCompare datetime
     * @return the `Predicate`
     * @throws NullPointerException if the `dateToCompare` is null
     * @see Datetime.isSameDay
     */
    public static Predicate isSameDay(final Datetime datetimeToCompare) {
        Validate.notNull(datetimeToCompare);
        return new IsSameDayDatetime(datetimeToCompare);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class IsSameDayDatetime extends Predicate {
        private final Datetime datetimeToCompare;
        public IsSameDayDatetime(Datetime datetimeToCompare) { this.datetimeToCompare = datetimeToCompare; }
        public override Boolean test(Object d) { return ((Datetime) d).isSameDay(datetimeToCompare); }
    }
    // @end-group
    //</editor-fold>

}
