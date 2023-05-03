/**
 * @description Provides common implementations of {@link Predicate}
 * and related utilities that are used for type checking.
 *
 * @see Predicate
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Built-In Classes
 */
public inherited sharing class TypePredicates {

    @TestVisible
    private TypePredicates() {}

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Boolean type.
     *
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfBool() {
        return new IsInstanceOfBoolean();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Id type.
     *
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfId() {
        return new IsInstanceOfId();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * String type.
     *
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfString() {
        return new IsInstanceOfString();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Blob type.
     *
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfBlob() {
        return new IsInstanceOfBlob();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Date type.
     *
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfDate() {
        return new IsInstanceOfDate();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Datetime type.
     *
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfDatetime() {
        return new IsInstanceOfDatetime();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Time type.
     *
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfTime() {
        return new IsInstanceOfTime();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Integer type.
     *
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfInt() {
        return new IsInstanceOfInt();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Long type.
     *
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfLong() {
        return new IsInstanceOfLong();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Double type.
     *
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfDouble() {
        return new IsInstanceOfDouble();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * SObject type.
     *
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfSObject() {
        return new IsInstanceOfSObject();
    }

    /**
     * @description Returns a `Predicate` that tests the input object if it is of
     * Comparable type.
     *
     * @return the `Predicate`
     */
    public static Predicate isInstanceOfComparable() {
        return new IsInstanceOfComparable();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class IsInstanceOfBoolean extends Predicate {
        public override Boolean test(Object o) { return o instanceof Boolean; }
    }

    private class IsInstanceOfBlob extends Predicate {
        public override Boolean test(Object o) { return o instanceof Blob; }
    }

    private class IsInstanceOfId extends Predicate {
        public override Boolean test(Object o) { return o instanceof Id; }
    }

    private class IsInstanceOfString extends Predicate {
        public override Boolean test(Object o) { return o instanceof String; }
    }

    private class IsInstanceOfDate extends Predicate {
        public override Boolean test(Object o) { return o instanceof Date; }
    }

    private class IsInstanceOfDatetime extends Predicate {
        public override Boolean test(Object o) { return o instanceof Datetime; }
    }

    private class IsInstanceOfTime extends Predicate {
        public override Boolean test(Object o) { return o instanceof Time; }
    }

    private class IsInstanceOfInt extends Predicate {
        public override Boolean test(Object o) { return o instanceof Integer; }
    }

    private class IsInstanceOfLong extends Predicate {
        public override Boolean test(Object o) { return o instanceof Long; }
    }

    private class IsInstanceOfDouble extends Predicate {
        public override Boolean test(Object o) { return o instanceof Double; }
    }

    private class IsInstanceOfSObject extends Predicate {
        public override Boolean test(Object o) { return o instanceof SObject && !(o instanceof List<SObject>); }
    }

    private class IsInstanceOfComparable extends Predicate {
        public override Boolean test(Object o) { return o instanceof Comparable; }
    }
    // @end-group
    //</editor-fold>

}
