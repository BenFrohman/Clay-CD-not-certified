# Clay-CD-not-certified

[![Lean certificate](https://github.com/BenFrohman/Clay-CD-not-certified/actions/workflows/certify.yml/badge.svg?branch=main)](https://github.com/BenFrohman/Clay-CD-not-certified/actions/workflows/certify.yml)
[![Lean 4](https://github.com/BenFrohman/Clay-CD-not-certified/actions/workflows/lean.yml/badge.svg?branch=main)](https://github.com/BenFrohman/Clay-CD-not-certified/actions/workflows/lean.yml)


[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23653015.svg)](https://doi.org/10.5281/zenodo.23653015) [![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

Author: Benjamin Stanley Frohman
Copyright (c) 2026 Benjamin Stanley Frohman
License: Apache License, Version 2.0

This repository is not a resolution of Fefferman (C) or (D).

A request to title a repository as a Clay C/D resolution, and to certify a zero-sorry blowup proof from the Section 10 argument, is declined. The Section 10 materials do not prove that the Beale–Kato–Majda integral diverges in finite time.

Blowup in the BKM sense is divergence of ∫ ‖ω‖_∞ dt. The 2D and steady-Euler kill switch has M bounded, so ∫_0^T M dt = M T stays finite, while ∫ M² grows. That is the opposite of a blowup proof.

Forced (C) and (D) are a different statement. An external claim exists in openai/NavierStokesAndEuler. This repository does not copy it and does not certify it.

---
## Archival DOI & Cryptographic Provenance

- **Zenodo DOI (v1.0.0):** [10.5281/zenodo.23653015](https://doi.org/10.5281/zenodo.23653015)
- **Author:** Benjamin Stanley Frohman (ORCID: [0009-0006-7068-3718](https://orcid.org/0009-0006-7068-3718))
- **License:** Apache License, Version 2.0 (`Copyright (c) 2026 Benjamin Stanley Frohman`)
- **Earliest Commit Provenance:** `bf14a32b0944c88da889ce99ceaee2901df53802` (2026-10-07 07:27:11 AM CDT (UTC-5))
- **Provenance hashes:** SHA-256 Merkle root `b993215629eb5f10f28759483e8b437a9731cead12ae9c9f1321d22059544aa8` (`provenance/PROVENANCE_MERKLE_ROOT.json`) and per-file hashes (`provenance/PROVENANCE_HASHES.json`, Ed25519 key `b428fb72676f1c52`). Integrity fingerprints only, not a certificate of correctness or review.
- **Scope:** A worked illustration of why a diverging quadratic history clock on [0, infty) is not a finite-time BKM blowup proof; explicitly declines to certify Fefferman (C) or (D).

## Status summary

**Mathematical results proved here: none.** `lean/NotBlowup.lean` contains two Lean statements,
`bounded_M_keeps_bkm_finite` and `history_can_grow_while_bkm_stays_finite`, each closed by `rfl` (standard axioms only;
see `AXIOMS.md`). They are definitional unfoldings of the model functions (with `M` constant, `M * T` versus
`M * M * T`), included as a worked illustration. They are **not counted as mathematical results** and say nothing
about Navier–Stokes solutions.

**Conditional on:** nothing (no hypotheses).

**Open / not addressed:** Fefferman (C) and (D), and every regularity or blow-up statement for Navier–Stokes.
Nothing here has been peer reviewed. Naming: [`NAMING.md`](NAMING.md).

## Build

```
cd lean
lake exe cache get
lake build
lake env lean AxiomReport.lean
```
CI (`.github/workflows/lean.yml`) runs these and fails on `sorryAx` or any non-standard axiom.


**PDF note:** the PDFs were rebuilt from the `.tex` sources with Tectonic 0.17.0 on 2026-11-02.
