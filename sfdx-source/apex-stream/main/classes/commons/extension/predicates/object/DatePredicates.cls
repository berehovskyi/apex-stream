/**
 * @description Provides common implementations of `Date` {@link Predicate}
 * and related utilities.
 *
 * @see Predicate
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class DatePredicates {

    @TestVisible
    private DatePredicates() {}

    //<editor-fold desc="Date Predicates">
    // @start-group Date Predicates
    /**
     * @description Returns a `Predicate` that tests the input date if it is the same
     * as the specified `dateToCompare` in the local time zone of the context user.
     *
     * @param dateToCompare date
     *
     * @return the `Predicate`
     *
     * @throws NullPointerException if `dateToCompare` is null
     *
     * @see Date.isSameDay
     */
    public static Predicate isSameDay(final Date dateToCompare) {
        Validate.notNull(dateToCompare);
        return new IsSameDay(dateToCompare);
    }

    /**
     * @description Returns a `Predicate` that tests the input date if it is the year
     * is the leap year.
     *
     * @return the `Predicate`
     *
     * @see Date.isLeapYear
     */
    public static Predicate isLeapYear() {
        return new IsLeapYear();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class IsSameDay extends Predicate {
        private final Date dateToCompare;
        public IsSameDay(Date dateToCompare) { this.dateToCompare = dateToCompare; }
        public override Boolean test(Object d) { return ((Date) d).isSameDay(dateToCompare); }
    }

    private class IsLeapYear extends Predicate {
        public override Boolean test(Object o) { return Date.isLeapYear(((Date) o).year()); }
    }
    // @end-group
    //</editor-fold>

}
