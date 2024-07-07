/**
 * @description A provider class that supplies `Supplier` instances for generating various types of strings.
 * This includes generating unique UUIDs and creating strings in a customizable autonumber format.
 *
 * @example
 * ISupplier uuidSupplier = new StringSupplierProvider().uuid();
 * uuidSupplier.get(); // '563581af-5560-a1fd-2291-2b03582bf000'
 * uuidSupplier.get(); // '57b0a848-68e6-2eb8-96ce-2ec0691f51b8'
 *
 * ISupplier autoNumberSupplier = new StringSupplierProvider().autonumber('A-{0000}');
 * autoNumberSupplier.get(); // 'A-0000'
 * autoNumberSupplier.get(); // 'A-0001'
 */
public virtual inherited sharing class StringSupplierProvider {
    /**
     * @description Returns a `Supplier` that returns the next uuid.
     *
     * @return the `Supplier`
     *
     * @example
     * ISupplier uuidSupplier = new StringSupplierProvider().uuid();
     * uuidSupplier.get(); // '563581af-5560-a1fd-2291-2b03582bf000'
     * uuidSupplier.get(); // '57b0a848-68e6-2eb8-96ce-2ec0691f51b8'
     */
    public virtual Supplier uuid() {
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
     * ISupplier autoNumberSupplier = new StringSupplierProvider().autonumber('A-{0000}');
     * autoNumberSupplier.get(); // 'A-0000'
     * autoNumberSupplier.get(); // 'A-0001'
     * autoNumberSupplier.get(); // 'A-0002'
     */
    public virtual Supplier autonumber(final String format) {
        return new AutoNumberSupplier(format);
    }

    private class UuidSupplier extends Supplier {
        public override Object get() { return UUID.randomUUID().toString(); }
    }

    private class AutoNumberSupplier extends Supplier {
        private final String pattern = '\\S*\\{\\d+\\}\\S*';
        private final String zero = '0';
        private final String format;
        private final String prefix;
        private final String suffix;
        private final String displayNumber;
        private final Integer displayLength;
        private Integer i;
        private AutoNumberSupplier(String format) {
            Validate.matches(
                format,
                pattern,
                Label.AFB_ErrorMessage_StringPatternMismatch,
                new List<Object>{ format, pattern }
            );
            this.format = format;
            prefix = format.substringBefore('{');
            suffix = format.substringAfter('}');
            displayNumber = format.substringBetween('{', '}');
            displayLength = displayNumber.length();
            i = Integer.valueOf(displayNumber);
        }
        public override Object get() { return prefix + String.valueOf(i++).leftPad(displayLength, zero) + suffix; }
    }
}
