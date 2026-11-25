# Infinitely many composite terms in ⌊ξ(7/5)^n⌋ — Lean 4 proof

This repository contains a Lean 4 proof, checked entirely by the Lean kernel,
of the following statement.

> For every real number ξ > 0, the sequence ⌊ξ(7/5)^n⌋ (n = 0, 1, 2, …)
> contains infinitely many composite terms.

The formal statement is in [`Challenge.lean`](Challenge.lean):

```lean
theorem RationalFloor.floor_seven_fifths_infinitely_many_composite
    (ξ : ℝ) (hξ : 0 < ξ) (N : ℕ) :
    ∃ n : ℕ, N ≤ n ∧ ∃ u v : ℤ, 1 < u ∧ 1 < v ∧ ⌊ξ * (7 / 5 : ℝ) ^ n⌋ = u * v
```

[`Solution.lean`](Solution.lean) proves it, and
[`comparator.json`](comparator.json) is the
[Comparator](https://github.com/leanprover/comparator) configuration relating
the two. The proof uses only the axioms `propext`, `Classical.choice` and
`Quot.sound`. It does not use `native_decide`.

## Source and scope

The result and its proof come from the preprint

> Yuri Odagiri, *Finite graph certificates for composite terms in rational
> floor sequences*, Zenodo, version 3.0.1 (2026),
> [doi:10.5281/zenodo.22997709](https://doi.org/10.5281/zenodo.22997709),

Theorem 1(i) and Corollary 2 for the base 7/5. The preprint, its verification
programs and the original Lean development (Lean v4.29.1) are in
[ixixi/rational-floor-certificates](https://github.com/ixixi/rational-floor-certificates).

This repository is a port of the one-step proof for 7/5 from that development
to Lean v4.36.0 and the Lean module system. It contains only the files that
proof needs. The preprint's results for the bases 5/2 and 5/3 are not here:
their Lean proofs evaluate a finite pipeline with `native_decide`, which adds
trust in the Lean compiler.

Compositeness of infinitely many integer parts was previously known for the
bases 3/2 and 4/3 (Forman–Shapiro, 1967) and 5/4 (Dubickas–Novikas, 2005).
Dubickas and Novikas also treated the nearest integers to ξ(7/5)^n. The
preprint cites no earlier proof for the integer parts with base 7/5. Novelty
has not been independently established, and the preprint has not been peer
reviewed.

## Outline of the proof

`MathPaper.floor_seven_fifths_visits` proves the stronger statement that
infinitely many terms share a nontrivial divisor with 4290 = 2·3·5·11·13.

1. An orbit ⌊ξ(7/5)^n⌋ is tracked by its residue modulo 4290 and the cell of
   its fractional part among K equal cells. Consecutive states are joined by
   an edge labelled with a signed carry (`MathPaper/Orbit.lean`,
   `MathPaper/Graph.lean`).
2. The carry sequence of an orbit is not eventually periodic
   (`MathPaper/Nonperiodic.lean`).
3. A rank and phase certificate on a finite graph shows that an orbit that
   avoids the five primes would eventually stay in a part of the graph where
   its carries are periodic (`MathPaper/Certificate.lean`,
   `MathPaper/Success.lean`). The cells are refined in four stages,
   K = 32, 128, 512, 2048, and no state is left after the last stage.
4. The concrete certificate data are in `MathPaper/Finite/Data*.lean`. A
   checker written in Lean is proved sound (`MathPaper/Finite/Checker.lean`,
   `Fast.lean`), and its evaluation on the data is carried out in the kernel
   with `decide +kernel` (`MathPaper/Finite/Verify*.lean`, `Refine*.lean`,
   `Initial*.lean`, `Empty*.lean`).
5. A term exceeding 4290 that shares a divisor with 4290 is composite.

## Building

```
lake exe cache get
lake build
```

The kernel evaluation of the certificate takes several minutes.

## How this was produced

All mathematics and all Lean code in this repository were produced by AI
systems. The original Lean development was written by GPT-6 Astra in Codex;
the port to Lean v4.36.0 and the module system, and the files `Challenge.lean`,
`Solution.lean` and `formalization.yaml`, were written by Claude Fable 5.2 in
Claude Code. The human author asked for the work to be done and did not
contribute mathematical content to the proof. No human has reviewed the Lean
proofs line by line; the author has confirmed that Lean accepts them. The
preprint's section "Acknowledgments and disclosure of AI involvement" gives
the full account. Structured metadata are in
[`formalization.yaml`](formalization.yaml).

## Licence

Apache License 2.0; see [`LICENSE`](LICENSE).
