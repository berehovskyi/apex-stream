/**
 * @author O. Berehovskyi
 * @group Functional Abstract Classes
 * @description Extends `Function` functions and provides `DatetimeFunction`
 * common class level implementations, and related utilities.
 */
public abstract inherited sharing class DatetimeFunction extends Function {

    //<editor-fold desc="Date Functions">
    // @start-group Date Functions
    /**
     * @description Returns a `Function` that adds `days` to an input argument.
     * @param days the number of additional days
     * @return the `Function`
     * @throws NullPointerException if `days` is null
     * @see Datetime.addDays
     */
    public static Function addDays(final Integer days) {
        Validate.notNull(days);
        return new AddDays(days);
    }

    /**
     * @description Returns a `Function` that adds `hours` to an input argument.
     * @param hours the number of additional hours
     * @return the `Function`
     * @throws NullPointerException if `hours` is null
     * @see Datetime.addHours
     */
    public static Function addHours(final Integer hours) {
        Validate.notNull(hours);
        return new AddHours(hours);
    }

    /**
     * @description Returns a `Function` that adds `minutes` to an input argument.
     * @param minutes the number of additional minutes
     * @return the `Function`
     * @throws NullPointerException if `minutes` is null
     * @see Datetime.addMinutes
     */
    public static Function addMinutes(final Integer minutes) {
        Validate.notNull(minutes);
        return new AddMinutes(minutes);
    }

    /**
     * @description Returns a `Function` that adds `months` to an input argument.
     * @param months the number of additional months
     * @return the `Function`
     * @throws NullPointerException if `months` is null
     * @see Datetime.addMonths
     */
    public static Function addMonths(final Integer months) {
        Validate.notNull(months);
        return new AddMonths(months);
    }

    /**
     * @description Returns a `Function` that adds `seconds` to an input argument.
     * @param seconds the number of additional seconds
     * @return the `Function`
     * @throws NullPointerException if `seconds` is null
     * @see Datetime.addSeconds
     */
    public static Function addSeconds(final Integer seconds) {
        Validate.notNull(seconds);
        return new AddSeconds(seconds);
    }

    /**
     * @description Returns a `Function` that adds `years` to an input argument.
     * @param years the number of additional years
     * @return the `Function`
     * @throws NullPointerException if `years` is null
     * @see Datetime.addYears
     */
    public static Function addYears(final Integer years) {
        Validate.notNull(years);
        return new AddYears(years);
    }

    /**
     * @description Returns a `Function` that returns the date component of a datetime
     * input argument in the local time zone of the context user.
     * @return the `Function`
     * @see Datetime.date
     */
    public static Function getDate() {
        return new Dat();
    }

    /**
     * @description Returns a `Function` that returns the date component of a datetime
     * input argument in the GMT time zone.
     * @return the `Function`
     * @see Datetime.dateGmt
     */
    public static Function dateGmt() {
        return new DateGmt();
    }

    /**
     * @description Returns a `Function` that returns the datetime as a string
     * using the locale of the context user.
     * @return the `Function`
     * @see Datetime.format
     */
    public static Function format() {
        return new Format(null);
    }

    /**
     * @description Returns a `Function` that returns the datetime for the local time zone as a string
     * using the supplied Java simple `dateformat`. If the time zone cannot be determined, GMT is used.
     * @param dateformat the date format
     * @return the `Function`
     * @throws NullPointerException if `dateformat` is null
     * @see Datetime.format
     */
    public static Function format(final String dateformat) {
        Validate.notNull(dateformat);
        return new Format(dateformat);
    }

    /**
     * @description Returns a `Function` that returns the datetime for the specified time zone as a string
     * using the supplied Java simple `dateformat`. If the time zone cannot be determined, GMT is used.
     * @param dateformat the date format
     * @param timezone the time zone
     * @return the `Function`
     * @throws NullPointerException if `dateformat` or `timezone` is null
     * @see Datetime.format
     */
    public static Function format(final String dateformat, final String timezone) {
        Validate.notNull(dateformat);
        Validate.notNull(timezone);
        return new Format(dateformat, timezone);
    }

    /**
     * @description Returns a `Function` that returns the datetime as a string
     * using the supplied Java simple `dateformat` and the GMT time zone.
     * @param dateformat the date format
     * @return the `Function`
     * @throws NullPointerException if `dateformat` is null
     * @see Datetime.formatGmt
     */
    public static Function formatGmt(final String dateformat) {
        Validate.notNull(dateformat);
        return new FormatGmt(dateformat);
    }

    public static Function formatLong() {
        return new FormatLong();
    }

    /**
     * @description Returns a `Function` that returns the time component of a datetime
     * input argument in the local time zone of the context user.
     * @return the `Function`
     * @see Datetime.time
     */
    public static Function getTime() {
        return new Tm();
    }

    /**
     * @description Returns a `Function` that returns the time component of a datetime
     * input argument in the GMT time zone.
     * @return the `Function`
     * @see Datetime.timeGmt
     */
    public static Function timeGmt() {
        return new TimeGmt();
    }

    /**
     * @description Returns a `Function` that returns the string that represents
     * the specified datetime in the standard “yyyy-MM-dd HH:mm:ss” format for the GMT time zone.
     * @return the `Function`
     * @see String.valueOfGmt
     */
    public static Function stringValueOfGmt() {
        return new StringValueOfGmt();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AddDays extends Function {
        private final Integer days;
        private AddDays(Integer days) { this.days = days; }
        public override Object apply(Object o) { return ((Datetime) o).addDays(days); }
    }

    private class AddHours extends Function {
        private final Integer hours;
        private AddHours(Integer hours) { this.hours = hours; }
        public override Object apply(Object o) { return ((Datetime) o).addHours(hours); }
    }

    private class AddMinutes extends Function {
        private final Integer minutes;
        private AddMinutes(Integer minutes) { this.minutes = minutes; }
        public override Object apply(Object o) { return ((Datetime) o).addMinutes(minutes); }
    }

    private class AddMonths extends Function {
        private final Integer months;
        private AddMonths(Integer months) { this.months = months; }
        public override Object apply(Object o) { return ((Datetime) o).addMonths(months); }
    }

    private class AddSeconds extends Function {
        private final Integer seconds;
        private AddSeconds(Integer seconds) { this.seconds = seconds; }
        public override Object apply(Object o) { return ((Datetime) o).addSeconds(seconds); }
    }

    private class AddYears extends Function {
        private final Integer years;
        private AddYears(Integer years) { this.years = years; }
        public override Object apply(Object o) { return ((Datetime) o).addYears(years); }
    }

    private class Dat extends Function {
        public override Object apply(Object o) { return ((Datetime) o).date(); }
    }

    private class DateGmt extends Function {
        public override Object apply(Object o) { return ((Datetime) o).dateGmt(); }
    }

    private class Format extends Function {
        private final String dateformat;
        private final String timezone;
        private Format(String dateformat) { this(dateformat, null); }
        private Format(String dateformat, String timezone) { this.dateformat = dateformat; this.timezone = timezone; }
        public override Object apply(Object o) {
            if (dateformat == null) { return ((Datetime) o).format(); }
            if (timezone == null) { return ((Datetime) o).format(dateformat); }
            return ((Datetime) o).format(dateformat, timezone);
        }
    }

    private class FormatGmt extends Function {
        private final String dateformat;
        private FormatGmt(String dateformat) { this.dateformat = dateformat; }
        public override Object apply(Object o) { return ((Datetime) o).formatGmt(dateformat); }
    }

    private class FormatLong extends Function {
        public override Object apply(Object o) { return ((Datetime) o).formatLong(); }
    }

    private class Tm extends Function {
        public override Object apply(Object o) { return ((Datetime) o).time(); }
    }

    private class TimeGmt extends Function {
        public override Object apply(Object o) { return ((Datetime) o).timeGmt(); }
    }

    private class StringValueOfGmt extends Function {
        public override Object apply(Object o) { return String.valueOfGmt((Datetime) o); }
    }
    // @end-group
    //</editor-fold>

}
