/**
 * @description An alias for {@link CollectorProvider}.
 *
 * @group Functional Built-In Class V2 Aliases
 */
public inherited sharing class Col extends CollectorProvider {
    /**
     * @description Initializes a new instance of the `CollectorProvider` class with the specified value type.
     *
     * @param valueType the type of values to be collected
     *
     * @throws NullPointerException if `valueType` is null
     */
    public Col(final Type valueType) {
        super(valueType);
    }
}
