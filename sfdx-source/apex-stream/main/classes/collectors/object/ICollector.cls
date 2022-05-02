/**
 * @author O. Berehovskyi
 * @group Collectors
 * @description A mutable reduction operation that accumulates input arguments
 * into a mutable result `container`, optionally transforming the accumulated result into
 * a final representation after all input elements have been processed.
 */
public interface ICollector {

    /**
     * @description Returns a `ISupplier` that creates and returns a new mutable result `container`.
     * @return the `ISupplier`
     */
    ISupplier supplier();

    /**
     * @description Returns a `IBiConsumer` that incorporates a new data element
     * into a result `container`.
     * @return the `IBiConsumer`
     */
    IBiConsumer accumulator();

    /**
     * @description Returns a `IFunction` that performs an optional final transform on the `container`.
     * @return the `IFunction`
     */
    IFunction finisher();

}
