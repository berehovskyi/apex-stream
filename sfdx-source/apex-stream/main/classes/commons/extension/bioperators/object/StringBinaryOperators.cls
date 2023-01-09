/**
 * @description Provides common implementations of `String` {@link BinaryOperator}
 * and related utilities.
 *
 * @see BinaryOperator
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class StringBinaryOperators {

    @TestVisible
    private StringBinaryOperators() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `SObjectBinaryOperator` that concatenates string input argument.
     *
     * @return the `SObjectBinaryOperator`
     */
    public static BinaryOperator concat() {
        return new Concat();
    }

    /**
     * @description Returns a `SObjectBinaryOperator` that concatenates string input argument
     * using the `delimiter`.
     *
     * @param delimiter delimiter to be used between each element
     *
     * @return the `SObjectBinaryOperator`
     */
    public static BinaryOperator concat(final String delimiter) {
        Validate.notNull(delimiter);
        return new ConcatWithDelimiter(delimiter);
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class Concat extends BinaryOperator {
        public override Object apply(Object str1, Object str2) { return (String) str1 + (String) str2; }
    }

    private class ConcatWithDelimiter extends BinaryOperator {
        private final String delimiter;
        private ConcatWithDelimiter(String delimiter) { this.delimiter = delimiter; }
        public override Object apply(Object str1, Object str2) { return (String) str1 + delimiter + (String) str2; }
    }
    // @end-group
    //</editor-fold>

}
