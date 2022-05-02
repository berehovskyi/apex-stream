/**
 * @author O. Berehovskyi
 * @group Functions
 * @description Provides common class level implementations, and related utilities for
 * `StringSuppliers`.
 */
public abstract inherited sharing class StringSupplier extends Supplier {

    //<editor-fold desc="Built-Ins">
    // @start-group Built-Ins
    /**
     * @description Returns a `Supplier` that returns the next uuid.
     * @example
     * ISupplier uuid = StringSupplier.uuid();
     * uuid.get(); // '563581af-5560-a1fd-2291-2b03582bf000'
     * uuid.get(); // '57b0a848-68e6-2eb8-96ce-2ec0691f51b8'
     * @return the `Supplier`
     */
    public static Supplier uuid() {
        return new UUID();
    }
    // @end-group
    //</editor-fold>

    //<editor-fold desc="Lambdas">
    // @start-group Lambdas
    private class UUID extends Supplier {
        private final String pattern = '{0}-{1}-{2}-{3}-{4}';
        private final String algorithmName = 'MD5';
        public override Object get() {
            String hex = randomHex();
            return String.format(pattern, new List<String>{
                    hex.substring(0, 8),
                    hex.substring(8, 12),
                    hex.substring(12, 16),
                    hex.substring(16, 20),
                    hex.substring(20)
            });
        }
        private String randomHex() {
            return EncodingUtil.convertToHex(
                    Crypto.generateDigest(
                            algorithmName,
                            Blob.valueOf(Crypto.getRandomLong().format()))
            );
        }
    }
    // @end-group
    //</editor-fold>

}
