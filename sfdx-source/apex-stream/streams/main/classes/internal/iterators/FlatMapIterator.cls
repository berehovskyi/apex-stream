/**
 * @author Oleh Berehovskyi
 */
@SuppressWarnings('PMD.ApexDoc')
public inherited sharing class FlatMapIterator extends BaseIterator {
    private final Iterator<Object> iterator;
    private final IFunction mapper;
    private final Integer depth;
    private final Boolean wrapNonIterables;
    private Iterator<Object> innerIterator;

    public FlatMapIterator(final Iterator<Object> iterator, final IFunction mapper) {
        this(iterator, mapper, 1, false);
    }

    public FlatMapIterator(final Iterator<Object> iterator, final IFunction mapper, final Integer depth) {
        this(iterator, mapper, depth, true);
    }

    private FlatMapIterator(
        final Iterator<Object> iterator,
        final IFunction mapper,
        final Integer depth,
        final Boolean wrapNonIterables
    ) {
        AfSupport.notNull(iterator);
        AfSupport.notNull(mapper);
        AfSupport.notNull(depth);
        AfSupport.positive(depth, Label.AS_ErrorMessage_ArgumentNotPositive, new List<Object>{ depth });
        AfSupport.notNull(wrapNonIterables);
        this.iterator = iterator;
        this.mapper = mapper;
        this.depth = depth;
        this.wrapNonIterables = wrapNonIterables;
    }

    protected override void computeNext() {
        while (true) {
            if (innerIterator?.hasNext() ?? false) {
                next = innerIterator.next();
                hasNext = true;
                return;
            }
            innerIterator = null;
            if (!iterator.hasNext()) {
                hasNext = false;
                return;
            }
            final Object mapped = mapper.apply(iterator.next());
            final Iterable<Object> values = toIterable(mapped);
            if (values == null) {
                continue;
            }
            innerIterator = depth == 1
                ? values.iterator()
                : new FlatMapIterator(values.iterator(), Function.identity(), depth - 1, wrapNonIterables);
        }
    }

    private Iterable<Object> toIterable(final Object mapped) {
        if (mapped == null) {
            return wrapNonIterables ? new List<Object>{ null } : null;
        }
        if (mapped instanceof Iterable<Object>) {
            return (Iterable<Object>) mapped;
        }
        if (wrapNonIterables) {
            return new List<Object>{ mapped };
        }
        throw new InvalidStateException('Mapped value must implement Iterable<Object>');
    }
}
