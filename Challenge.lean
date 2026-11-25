module

public import Mathlib.Algebra.Order.Archimedean.Real.Basic

/-!
# Composite terms in the floor sequence of `ξ (7/5)^n`

For every real number `ξ > 0`, the integer sequence `⌊ξ (7/5)^n⌋`
(`n = 0, 1, 2, …`) contains infinitely many composite terms.

The statement below expresses this without auxiliary definitions:

* `⌊x⌋` is Mathlib's integer floor `Int.floor` of the real number `x`;
* "infinitely many" is stated as "beyond every index `N` there is an index
  `n ≥ N`";
* "composite" is stated as "a product `u * v` of two integers `u, v > 1`".

For positive bases other than integers, compositeness of infinitely many
terms was previously known for `3/2` and `4/3` (Forman–Shapiro, 1967) and for
`5/4` (Dubickas–Novikas, 2005); the latter paper also treats the nearest
integers to `ξ (7/5)^n`. The source preprint cites no earlier proof for the
integer parts with base `7/5`, but novelty has not been independently
established; see `formalization.yaml` and the README for the sources and the
production process.
-/

@[expose] public section

namespace RationalFloor

/-- For every real `ξ > 0` and every index bound `N`, some term `⌊ξ (7/5)^n⌋`
with `n ≥ N` is composite: it is a product of two integers both greater than
one. Hence the sequence `⌊ξ (7/5)^n⌋` has infinitely many composite terms. -/
theorem floor_seven_fifths_infinitely_many_composite (ξ : ℝ) (hξ : 0 < ξ) (N : ℕ) :
    ∃ n : ℕ, N ≤ n ∧ ∃ u v : ℤ, 1 < u ∧ 1 < v ∧ ⌊ξ * (7 / 5 : ℝ) ^ n⌋ = u * v := by
  sorry

end RationalFloor
