/**
 * @see StringSuppliers
 *
 * @author Oleh Berehovskyi
 */
@IsTest(IsParallel = true)
private class StringSuppliersTest {

    static {
        new StringSuppliers();
    }

    /**
     * @see StringSuppliers.uuid
     * @see StringSuppliers.autonumber
     */
    @IsTest
    static void default() {
        // Given
        ISupplier uuidSupp = StringSuppliers.uuid();
        ISupplier autonumberSupp1 = StringSuppliers.autonumber('A-{0000}');
        ISupplier autonumberSupp2 = StringSuppliers.autonumber('{1234}');
        ISupplier autonumberSupp3 = StringSuppliers.autonumber('A-{9}--N9');
        // When
        String actual = (String) uuidSupp.get();
        String actual1 = (String) uuidSupp.get();
        String actual2 = (String) uuidSupp.get();
        String actual3 = (String) autonumberSupp1.get();
        String actual4 = (String) autonumberSupp1.get();
        String actual5 = (String) autonumberSupp1.get();
        String actual6 = (String) autonumberSupp2.get();
        String actual7 = (String) autonumberSupp2.get();
        String actual8 = (String) autonumberSupp2.get();
        String actual9 = (String) autonumberSupp3.get();
        String actual10 = (String) autonumberSupp3.get();
        String actual11 = (String) autonumberSupp3.get();
        // Then
        String uuidRegex = '[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}';
        Validate.assert(Pattern.matches(uuidRegex, actual));
        Validate.assert(Pattern.matches(uuidRegex, actual1));
        Validate.assert(Pattern.matches(uuidRegex, actual2));
        Validate.assertEquals('A-0000', actual3);
        Validate.assertEquals('A-0001', actual4);
        Validate.assertEquals('A-0002', actual5);
        Validate.assertEquals('1234', actual6);
        Validate.assertEquals('1235', actual7);
        Validate.assertEquals('1236', actual8);
        Validate.assertEquals('A-9--N9', actual9);
        Validate.assertEquals('A-10--N9', actual10);
        Validate.assertEquals('A-11--N9', actual11);
    }
    
}