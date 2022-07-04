/**
 * @description A mutable reduction operation that accumulates input arguments
 * into a mutable result `container`, optionally transforming the accumulated result into
 * a final representation after all input elements have been processed.
 *
 * @author Oleh Berehovskyi
 *
 * @group Functional Interfaces
 */
public interface ISObjectCollector {

    /**
     * @description Returns a `ISupplier` that creates and returns a new mutable result `container`.
     *
     * @return the `ISupplier`
     */
    ISupplier supplier();

    /**
     * @description Returns a `IObjectSObjectConsumer` that incorporates a new data element
     * into a result `container`.
     *
     * @return the `IObjectSObjectConsumer`
     */
    IObjectSObjectConsumer accumulator();

    /**
     * @description Returns a `IFunction` that performs an optional final transform on the `container`.
     *
     * @return the `IFunction`
     */
    IFunction finisher();

}
