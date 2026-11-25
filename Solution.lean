module

public import MathPaper.Main

/-!
Proof of the Challenge statement from the kernel-checked one-step certificate
for the base 7/5 (`MathPaper.floor_seven_fifths_composite`).
-/

@[expose] public section

namespace RationalFloor

/-- For every real `ξ > 0` and every index bound `N`, some term `⌊ξ (7/5)^n⌋`
with `n ≥ N` is composite: it is a product of two integers both greater than
one. Hence the sequence `⌊ξ (7/5)^n⌋` has infinitely many composite terms. -/
theorem floor_seven_fifths_infinitely_many_composite (ξ : ℝ) (hξ : 0 < ξ) (N : ℕ) :
    ∃ n : ℕ, N ≤ n ∧ ∃ u v : ℤ, 1 < u ∧ 1 < v ∧ ⌊ξ * (7 / 5 : ℝ) ^ n⌋ = u * v := by
  obtain ⟨n, hn, hc⟩ := MathPaper.floor_seven_fifths_composite ξ hξ N
  exact ⟨n, le_trans (le_max_left N 1) hn, hc⟩

end RationalFloor
