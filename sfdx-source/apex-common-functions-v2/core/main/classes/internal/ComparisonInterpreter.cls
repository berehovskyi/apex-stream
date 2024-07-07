/**
 * @description Defines the comparison results (e.g., equal, not equal, greater, less).
 * <p><strong>Note: </strong></p>
 * <p>This is an internal class and should not be referenced outside of this package.</p>
 */
public virtual inherited sharing class ComparisonInterpreter {
    public virtual Set<Integer> eq() { return new Set<Integer>{ 0 }; }
    public virtual Set<Integer> ne() { return new Set<Integer>{ -1, 1 }; }
    public virtual Set<Integer> gt() { return new Set<Integer>{ 1 }; }
    public virtual Set<Integer> ge() { return new Set<Integer>{ 1, 0 }; }
    public virtual Set<Integer> lt() { return new Set<Integer>{ -1 }; }
    public virtual Set<Integer> le() { return new Set<Integer>{ -1, 0 }; }

    public virtual class NonAntisymmetric extends ComparisonInterpreter {
        public virtual override Set<Integer> ne() { return new Set<Integer>{ -1, 1, null }; }
    }
}
