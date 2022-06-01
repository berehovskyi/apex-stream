/**
 * @description Extends `ToIntFunction` functions and provides `DateToIntFunction`
 * common class level implementations, and related utilities.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Abstract Classes
 */
public abstract inherited sharing class DateToIntFunction extends ToIntFunction {

    //<editor-fold desc="Date To Int Functions">
    // @start-group Date To Int Functions
    /**
     * @description Returns a `ToIntFunction` that returns the day-of-month component
     * of the Date input argument in the local time zone of the context user.
     *
     * @return the `ToIntFunction`
     *
     * @see Date.day
     */
    public static ToIntFunction day() {
        return new Day();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the day-of-year component
     * of the Date input argument in the local time zone of the context user.
     *
     * @return the `ToIntFunction`
     *
     * @see Date.day
     */
    public static ToIntFunction dayOfYear() {
        return new DayOfYear();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the number of days between
     * the Date input argument and the `other` Date.
     *
     * @param other the Date to compare
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `other` is null
     *
     * @see Date.daysBetween
     */
    public static ToIntFunction daysBetween(final Date other) {
        Validate.notNull(other);
        return new DaysBetween(other);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the month component
     * of the Date input argument in the local time zone of the context user (1 = Jan).
     *
     * @return the `ToIntFunction`
     *
     * @see Date.month
     */
    public static ToIntFunction month() {
        return new Month();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the number of months between
     * the Date input argument and the `other` Date, ignoring the difference in days.
     *
     * @param other the Date to compare
     *
     * @return the `ToIntFunction`
     *
     * @throws NullPointerException if `other` is null
     *
     * @see Date.monthsBetween
     */
    public static ToIntFunction monthsBetween(final Date other) {
        Validate.notNull(other);
        return new MonthsBetween(other);
    }

    /**
     * @description Returns a `ToIntFunction` that returns the year component
     * of the Date input argument in the local time zone of the context user.
     *
     * @return the `ToIntFunction`
     *
     * @see Date.year
     */
    public static ToIntFunction year() {
        return new Year();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Day extends ToIntFunction {
        public override Integer apply(Object o) { return ((Date) o).day(); }
    }

    private class DayOfYear extends ToIntFunction {
        public override Integer apply(Object o) { return ((Date) o).dayOfYear(); }
    }

    private class DaysBetween extends ToIntFunction {
        private final Date other;
        private DaysBetween(Date other) { this.other = other; }
        public override Integer apply(Object o) { return ((Date) o).daysBetween(other); }
    }

    private class Month extends ToIntFunction {
        public override Integer apply(Object o) { return ((Date) o).month(); }
    }

    private class MonthsBetween extends ToIntFunction {
        private final Date other;
        private MonthsBetween(Date other) { this.other = other; }
        public override Integer apply(Object o) { return ((Date) o).monthsBetween(other); }
    }

    private class Year extends ToIntFunction {
        public override Integer apply(Object o) { return ((Date) o).year(); }
    }
    // @end-group
    //</editor-fold>

}
