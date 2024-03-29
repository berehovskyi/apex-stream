/**
 * @description Provides common implementations of `Time` {@link Function}
 * and related utilities.
 *
 * @see Function
 * 
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class TimeFunctions {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected TimeFunctions() {}

    //<editor-fold desc="Date Functions">
    // @start-group Date Functions
    /**
     * @description Returns a `Function` that adds `hours` to an input argument.
     *
     * @param hours the number of additional hours
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `hours` is null
     *
     * @see Time.addHours
     */
    public static Function addHours(final Integer hours) {
        return new AddHours(hours);
    }

    /**
     * @description Returns a `Function` that adds `milliseconds` to an input argument.
     *
     * @param milliseconds the number of additional milliseconds
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `milliseconds` is null
     *
     * @see Time.addMilliseconds
     */
    public static Function addMilliseconds(final Integer milliseconds) {
        return new AddMilliseconds(milliseconds);
    }

    /**
     * @description Returns a `Function` that adds `minutes` to an input argument.
     *
     * @param minutes the number of additional minutes
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `minutes` is null
     *
     * @see Time.addMinutes
     */
    public static Function addMinutes(final Integer minutes) {
        return new AddMinutes(minutes);
    }

    /**
     * @description Returns a `Function` that adds `seconds` to an input argument.
     *
     * @param seconds the number of additional seconds
     *
     * @return the `Function`
     *
     * @throws NullPointerException if `seconds` is null
     *
     * @see Time.addMinutes
     */
    public static Function addSeconds(final Integer seconds) {
        return new AddSeconds(seconds);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class AddHours extends Function {
        private final Integer hours;
        private AddHours(Integer hours) { Validate.notNull(hours); this.hours = hours; }
        public override Object apply(Object o) { return ((Time) o).addHours(hours); }
    }

    private class AddMilliseconds extends Function {
        private final Integer milliseconds;
        private AddMilliseconds(Integer milliseconds) {
            Validate.notNull(milliseconds);
            this.milliseconds = milliseconds;
        }
        public override Object apply(Object o) { return ((Time) o).addMilliseconds(milliseconds); }
    }

    private class AddMinutes extends Function {
        private final Integer minutes;
        private AddMinutes(Integer minutes) { Validate.notNull(minutes); this.minutes = minutes; }
        public override Object apply(Object o) { return ((Time) o).addMinutes(minutes); }
    }

    private class AddSeconds extends Function {
        private final Integer seconds;
        private AddSeconds(Integer seconds) { Validate.notNull(seconds); this.seconds = seconds; }
        public override Object apply(Object o) { return ((Time) o).addSeconds(seconds); }
    }
    // @end-group
    //</editor-fold>

}
