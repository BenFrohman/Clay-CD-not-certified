# Build and axiom audit

This is a build and axiom audit, not a certificate or peer review.

**Paper:** A Diverging History Clock Is Not a Blow-up Proof: Lean-Checked Lemmas Showing Why a Section 10 Navier-Stokes Argument Does Not Establish Fefferman (C) or (D)
**Author:** Benjamin Stanley Frohman (frohmanbenjamin@gmail.com)
**PDF:** `paper/Clay_CD_not_certified_2026.pdf`

| Item | Value |
|---|---|
| Verified commit (v1; v2 verified by CI on the PR/merge) | `fa2b0998aaa65550892e1c82ee1727495f333d03` |
| Lean toolchain | `leanprover/lean4:v4.30.0-rc1` |
| Mathlib | v4.30.0-rc1 (commit 0c154d67103f74be3a0f2c509f72ccbf5be9f2a7) |
| CI run (build + axiom audit + no-sorry scan, passed) | https://github.com/BenFrohman/Clay-CD-not-certified/actions/runs/41794841523 |
| Source tarball SHA-256 (verified commit) | `ff15705c211c81390d26844b281edfbe1def08f3e0938c5b6322363ddeae50fa` |

- `lake build` succeeds with the pinned toolchain.
- No `sorry`, no `admit`, no `native_decide`, and no user-declared `axiom` in the Lean sources (enforced in CI by `scripts/check_no_sorry.py`).
- All 8 audited theorems depend only on Lean's standard axioms `propext`, `Classical.choice`, `Quot.sound` (or a subset).

## `#print axioms` output (`lean/AxiomAudit.lean`)

```
'ClayCD.NotBlowup.bounded_M_keeps_bkm_finite' depends on axioms: [propext, Classical.choice, Quot.sound]
'ClayCD.NotBlowup.history_can_grow_while_bkm_stays_finite' depends on axioms: [propext, Classical.choice, Quot.sound]
'ClayCD.BKMCalculus.bkm_integral_le_of_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
'ClayCD.BKMCalculus.le_half_one_add_sq' depends on axioms: [propext, Classical.choice, Quot.sound]
'ClayCD.BKMCalculus.bkm_integral_le_of_history' depends on axioms: [propext, Classical.choice, Quot.sound]
'ClayCD.BKMCalculus.history_diverges_at_infinity_bkm_finite' depends on axioms: [propext, Classical.choice, Quot.sound]
'ClayCD.BKMCalculus.blowup_profile_not_integrable' depends on axioms: [propext, Classical.choice, Quot.sound]
'ClayCD.BKMCalculus.blowup_profile_sq_not_integrable' depends on axioms: [propext, Classical.choice, Quot.sound]
```

The paper's claims correspond one-to-one with the Lean declarations listed in its "Correspondence between claims and Lean declarations" section; the Lean statements are the source of truth.
