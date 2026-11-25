module

public import MathPaper.Finite.Checker

@[expose] public section

namespace MathPaper.Finite

/-- Composition of two finite checks; no reevaluation of an accepted prefix. -/
theorem allBelow_join (n m : Nat) (p : Nat → Bool)
    (hn : allBelow n p = true)
    (hm : allBelow m (fun i => p (n + i)) = true) :
    allBelow (n + m) p = true := by
  induction m with
  | zero => simpa using hn
  | succ m ih =>
    simp only [allBelow, Bool.and_eq_true] at hm
    show allBelow (n + m + 1) p = true
    simp only [allBelow, Bool.and_eq_true]
    exact ⟨ih hm.1, hm.2⟩

/-- This is definitionally the row predicate of `checkInitial`. -/
def initialRow (T : Tree) (q : Nat) : Bool :=
  if Nat.gcd q 4290 = 1 then allBelow 32 fun j => present T 32 (q, j) else true

end MathPaper.Finite
