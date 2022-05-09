/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Extends `Function` functions and provides `DateFunction`
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class DateFunction extends Function {

    //<editor-fold desc="Date Functions">
    // @start-group Date Functions
    /**
     * @description Returns a `Function` that adds `days` to an input argument.
     * @param days the number of additional days
     * @return the `Function`
     * @throws NullPointerException if `days` is null
     * @see Date.addDays
     */
    public static Function addDays(final Integer days) {
        Validate.notNull(days);
        return new AddDays(days);
    }

    /**
     * @description Returns a `Function` that adds `months` to an input argument.
     * @param months the number of additional months
     * @return the `Function`
     * @throws NullPointerException if `months` is null
     * @see Date.addMonths
     */
    public static Function addMonths(final Integer months) {
        Validate.notNull(months);
        return new AddMonths(months);
    }

    /**
     * @description Returns a `Function` that adds `years` to an input argument.
     * @param years the number of additional years
     * @return the `Function`
     * @throws NullPointerException if `years` is null
     * @see Date.addYears
     */
    public static Function addYears(final Integer years) {
        Validate.notNull(years);
        return new AddYears(years);
    }

    /**
     * @description Returns a `Function` that returns the date as a string
     * using the locale of the context user.
     * @return the `Function`
     * @see Date.format
     */
    public static Function format() {
        return new Format();
    }

    /**
     * @description Returns a `Function` that returns the first day of the month for an input argument.
     * @return the `Function`
     * @see Date.toStartOfMonth
     */
    public static Function toStartOfMonth() {
        return new ToStartOfMonth();
    }

    /**
     * @description Returns a `Function` that returns the first day of the week for an input argument.
     * @return the `Function`
     * @see Date.toStartOfWeek
     */
    public static Function toStartOfWeek() {
        return new ToStartOfWeek();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AddDays extends Function {
        private final Integer days;
        private AddDays(Integer days) { this.days = days; }
        public override Object apply(Object o) { return ((Date) o).addDays(days); }
    }

    private class AddMonths extends Function {
        private final Integer months;
        private AddMonths(Integer months) { this.months = months; }
        public override Object apply(Object o) { return ((Date) o).addMonths(months); }
    }

    private class AddYears extends Function {
        private final Integer years;
        private AddYears(Integer years) { this.years = years; }
        public override Object apply(Object o) { return ((Date) o).addYears(years); }
    }

    private class Format extends Function {
        public override Object apply(Object o) { return ((Date) o).format(); }
    }

    private class ToStartOfMonth extends Function {
        public override Object apply(Object o) { return ((Date) o).toStartOfMonth(); }
    }

    private class ToStartOfWeek extends Function {
        public override Object apply(Object o) { return ((Date) o).toStartOfWeek(); }
    }
    // @end-group
    //</editor-fold>

}
