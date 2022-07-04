/**
 * @description Provides common implementations of `Datetime` {@link ToIntFunction}
 * and related utilities.
 * 
 * @see ToIntFunction
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class DatetimeToIntFunctions {

    @TestVisible
    private DatetimeToIntFunctions(){}

    //<editor-fold desc="Datetime To Int Functions">
    // @start-group Datetime To Int Functions
    /**
     * @description Returns a `ToIntFunction` that returns the day-of-month component
     * of the Datetime input argument in the local time zone of the context user.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.day
     */
    public static ToIntFunction day() {
        return new Day();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the day-of-month component
     * of the Datetime input argument in the GMT time zone.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.dayGmt
     */
    public static ToIntFunction dayGmt() {
        return new DayGmt();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the day-of-year component
     * of the Datetime input argument in the local time zone of the context user.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.dayOfYear
     */
    public static ToIntFunction dayOfYear() {
        return new DayOfYear();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the day-of-year component
     * of the Datetime input argument in the GMT time zone.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.dayOfYearGmt
     */
    public static ToIntFunction dayOfYearGmt() {
        return new DayOfYearGmt();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the hour component
     * of the Datetime input argument in the local time zone of the context user.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.hour
     */
    public static ToIntFunction hour() {
        return new Hour();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the hour component
     * of the Datetime input argument in the GMT time zone.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.hourGmt
     */
    public static ToIntFunction hourGmt() {
        return new HourGmt();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the millisecond component
     * of the Datetime input argument in the local time zone of the context user.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.millisecond
     */
    public static ToIntFunction millisecond() {
        return new Millisecond();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the millisecond component
     * of the Datetime input argument in the GMT time zone.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.millisecondGmt
     */
    public static ToIntFunction millisecondGmt() {
        return new MillisecondGmt();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the minute component
     * of the Datetime input argument in the local time zone of the context user.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.minute
     */
    public static ToIntFunction minute() {
        return new Minute();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the minute component
     * of the Datetime input argument in the GMT time zone.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.minuteGmt
     */
    public static ToIntFunction minuteGmt() {
        return new MinuteGmt();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the month component
     * of the Datetime input argument in the local time zone of the context user (1 = Jan).
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.month
     */
    public static ToIntFunction month() {
        return new Month();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the month component
     * of the Datetime input argument in the GMT time zone (1 = Jan).
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.monthGmt
     */
    public static ToIntFunction monthGmt() {
        return new MonthGmt();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the second component
     * of the Datetime input argument in the local time zone of the context user.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.second
     */
    public static ToIntFunction second() {
        return new Second();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the second component
     * of the Datetime input argument in the GMT time zone.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.secondGmt
     */
    public static ToIntFunction secondGmt() {
        return new SecondGmt();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the year component
     * of the Datetime input argument in the local time zone of the context user.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.year
     */
    public static ToIntFunction year() {
        return new Year();
    }

    /**
     * @description Returns a `ToIntFunction` that returns the year component
     * of the Datetime input argument in the GMT time zone.
     *
     * @return the `ToIntFunction`
     *
     * @see Datetime.yearGmt
     */
    public static ToIntFunction yearGmt() {
        return new YearGmt();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Day extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).day(); }
    }

    private class DayGmt extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).dayGmt(); }
    }

    private class DayOfYear extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).dayOfYear(); }
    }

    private class DayOfYearGmt extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).dayOfYearGmt(); }
    }

    private class Hour extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).hour(); }
    }

    private class HourGmt extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).hourGmt(); }
    }

    private class Millisecond extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).millisecond(); }
    }

    private class MillisecondGmt extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).millisecondGmt(); }
    }

    private class Minute extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).minute(); }
    }

    private class MinuteGmt extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).minuteGmt(); }
    }

    private class Month extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).month(); }
    }

    private class MonthGmt extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).monthGmt(); }
    }

    private class Second extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).second(); }
    }

    private class SecondGmt extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).secondGmt(); }
    }

    private class Year extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).year(); }
    }

    private class YearGmt extends ToIntFunction {
        public override Integer apply(Object o) { return ((Datetime) o).yearGmt(); }
    }
    // @end-group
    //</editor-fold>

}
