/**
 * @see AfSupport
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
@SuppressWarnings('PMD.ApexDoc')
private class AfSupportTest {
    @IsTest
    static void notNull() {
        // When
        new AfSupport();
        AfSupport.notNull('value');
        Exception exc;
        try {
            AfSupport.notNull(null);
        } catch (Exception e) {
            exc = e;
        }
        // Then
        Assert.areEqual(NullPointerException.class.getName(), exc.getTypeName());
        Assert.areEqual('Argument object is null', exc.getMessage());
    }

    @IsTest
    static void isNotNull() {
        // When
        AfSupport.isNotNull('value');
        Exception exc;
        try {
            AfSupport.isNotNull(null);
        } catch (Exception e) {
            exc = e;
        }
        // Then
        Assert.areEqual(IllegalArgumentException.class.getName(), exc.getTypeName());
        Assert.areEqual('Argument object is null', exc.getMessage());
    }

    @IsTest
    static void isTrue() {
        // When
        AfSupport.isTrue(true);
        AfSupport.isTrue(true, 'message');
        AfSupport.isTrue(true, 'message {0}', new List<Object>{ 'value' });
        Exception exc;
        Exception exc1;
        try {
            AfSupport.isTrue(false, 'Invalid {0} {value}', new List<Object>{ 'condition' });
        } catch (Exception e) {
            exc = e;
        }
        try {
            AfSupport.isTrue(true, null);
        } catch (Exception e) {
            exc1 = e;
        }
        // Then
        Assert.areEqual(IllegalArgumentException.class.getName(), exc.getTypeName());
        Assert.areEqual('Invalid condition (value)', exc.getMessage());
        Assert.areEqual(NullPointerException.class.getName(), exc1.getTypeName());
        Assert.areEqual('Exception message cannot be null', exc1.getMessage());
    }

    @IsTest
    static void noNullElements() {
        // When
        AfSupport.noNullElements(new List<Object>{ 1, 2 });
        Exception exc;
        try {
            AfSupport.noNullElements(new List<Object>{ 1, null });
        } catch (Exception e) {
            exc = e;
        }
        // Then
        Assert.areEqual(IllegalArgumentException.class.getName(), exc.getTypeName());
        Assert.areEqual('Argument iterable contains null element', exc.getMessage());
    }

    @IsTest
    static void notBlank() {
        // When
        AfSupport.notBlank('value');
        Exception exc;
        try {
            AfSupport.notBlank(' ');
        } catch (Exception e) {
            exc = e;
        }
        // Then
        Assert.areEqual(IllegalArgumentException.class.getName(), exc.getTypeName());
        Assert.areEqual('Argument string is blank', exc.getMessage());
    }

    @IsTest
    static void matches() {
        // When
        AfSupport.matches('A-1', '[A-Z]-\\d', 'Invalid {0}: {1}', new List<Object>{ 'value', 'pattern' });
        Exception exc;
        try {
            AfSupport.matches('invalid', '[A-Z]-\\d', 'Invalid {0}: {1}', new List<Object>{ 'value', 'pattern' });
        } catch (Exception e) {
            exc = e;
        }
        // Then
        Assert.areEqual(IllegalArgumentException.class.getName(), exc.getTypeName());
        Assert.areEqual('Invalid value: pattern', exc.getMessage());
    }

    @IsTest
    static void positive() {
        // When
        AfSupport.positive(1, 'Invalid {0}', new List<Object>{ 1 });
        Exception exc;
        try {
            AfSupport.positive(0, 'Invalid {0}', new List<Object>{ 0 });
        } catch (Exception e) {
            exc = e;
        }
        // Then
        Assert.areEqual(IllegalArgumentException.class.getName(), exc.getTypeName());
        Assert.areEqual('Invalid 0', exc.getMessage());
    }

    @IsTest
    static void state() {
        // When
        AfSupport.state(true, 'Invalid {0}', new List<Object>{ 'state' });
        Exception exc;
        try {
            AfSupport.state(false, 'Invalid {0}', new List<Object>{ 'state' });
        } catch (Exception e) {
            exc = e;
        }
        // Then
        Assert.areEqual(InvalidStateException.class.getName(), exc.getTypeName());
        Assert.areEqual('Invalid state', exc.getMessage());
    }
}
