/**
 * @description Provides common implementations of `String` {@link Supplier}
 * and related utilities.
 *
 * @see Supplier
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public virtual inherited sharing class StringSuppliers {

    @TestVisible
    @SuppressWarnings('PMD.EmptyStatementBlock')
    protected StringSuppliers() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Supplier` that returns the next uuid.
     *
     * @return the `Supplier`
     *
     * @example
     * ISupplier uuid = StringSuppliers.uuid();
     * uuid.get(); // '563581af-5560-a1fd-2291-2b03582bf000'
     * uuid.get(); // '57b0a848-68e6-2eb8-96ce-2ec0691f51b8'
     */
    public static Supplier uuid() {
        return new UuidSupplier();
    }

    /**
     * @description Returns a `Supplier` that returns the string in autonumber format.
     *
     * @param format autonumber format
     *
     * @return the `Supplier`
     *
     * @throws IllegalArgumentException if `format` does not match '\\S*\\{\\d+\\}' pattern
     *
     * @example
     * ISupplier autonumber = StringSuppliers.autonumber('A-{0000}');
     * autonumber.get(); // 'A-0000'
     * autonumber.get(); // 'A-0001'
     * autonumber.get(); // 'A-0002'
     */
    public static Supplier autonumber(final String format) {
        return new AutoNumber(format);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class UuidSupplier extends Supplier {
        public override Object get() { return UUID.randomUUID().toString(); }
    }

    private class AutoNumber extends Supplier {
        final String pattern = '\\S*\\{\\d+\\}\\S*';
        private final String zero = '0';
        private final String format;
        private final String prefix;
        private final String suffix;
        private final String displayNumber;
        private final Integer displayLength;
        private Integer i;
        private AutoNumber(String format) {
            Validate.matches(
                format,
                pattern,
                Label.AS_ErrorMessage_StringPatternMismatch,
                new List<Object>{ format, pattern }
            );
            this.format = format;
            this.prefix = format.substringBefore('{');
            this.suffix = format.substringAfter('}');
            this.displayNumber = format.substringBetween('{', '}');
            this.displayLength = displayNumber.length();
            this.i = Integer.valueOf(displayNumber);
        }
        public override Object get() { return prefix + String.valueOf(i++).leftPad(displayLength, zero) + suffix; }
    }
    // @end-group
    //</editor-fold>

}
