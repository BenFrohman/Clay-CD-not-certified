# Clay-CD-not-certified

[![Lean build and axiom audit (print-axioms table)](https://github.com/BenFrohman/Clay-CD-not-certified/actions/workflows/axiom-table.yml/badge.svg?branch=main)](https://github.com/BenFrohman/Clay-CD-not-certified/actions/workflows/axiom-table.yml)
[![Paper PDF](https://github.com/BenFrohman/Clay-CD-not-certified/actions/workflows/paper.yml/badge.svg?branch=main)](https://github.com/BenFrohman/Clay-CD-not-certified/actions/workflows/paper.yml)
[![Lean 4](https://github.com/BenFrohman/Clay-CD-not-certified/actions/workflows/lean.yml/badge.svg?branch=main)](https://github.com/BenFrohman/Clay-CD-not-certified/actions/workflows/lean.yml)


[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23942334.svg)](https://doi.org/10.5281/zenodo.23942334) [![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

Author: Benjamin Stanley Frohman
Copyright (c) 2026 Benjamin Stanley Frohman
License: Apache License, Version 2.0

This repository is not a resolution of Fefferman (C) or (D).

A request to title a repository as a Clay C/D resolution, and to present a zero-sorry blowup proof from the Section 10 argument, is declined. The Section 10 materials do not prove that the Beale-Kato-Majda integral diverges in finite time.

Blowup in the BKM sense is divergence of $\int_0^{T^*} \lVert\omega(t)\rVert_{L^\infty}\,dt$ at a finite time $T^*$. The 2D and steady-Euler kill switch has $M$ bounded, so $\int_0^T M\,dt = MT$ stays finite, while $\int_0^T M^2\,dt$ grows only as $T\to\infty$. That is the opposite of a blowup proof.

Forced (C) and (D) are a different statement. An external claim exists in openai/NavierStokesAndEuler. This repository does not copy it and does not endorse it.

---
## Archival DOI & Cryptographic Provenance

- **Zenodo DOI (this version):** [10.5281/zenodo.23942334](https://doi.org/10.5281/zenodo.23942334); concept DOI (all versions) [10.5281/zenodo.23653014](https://doi.org/10.5281/zenodo.23653014)
- **Author:** Benjamin Stanley Frohman (ORCID: [0009-0006-7068-3718](https://orcid.org/0009-0006-7068-3718))
- **License:** Apache License, Version 2.0 (`Copyright (c) 2026 Benjamin Stanley Frohman`)
- **Earliest Commit Provenance:** `bf14a32b0944c88da889ce99ceaee2901df53802` (2026-10-07 07:27:11 AM CDT (UTC-5))
- **Provenance hashes:** SHA-256 Merkle root `b993215629eb5f10f28759483e8b437a9731cead12ae9c9f1321d22059544aa8` (`provenance/PROVENANCE_MERKLE_ROOT.json`) and per-file hashes (`provenance/PROVENANCE_HASHES.json`, Ed25519 key `b428fb72676f1c52`). Integrity fingerprints only, not a certificate of correctness or review.
- **Scope:** A worked illustration of why a diverging quadratic history clock on $[0,\infty)$ is not a finite-time BKM blowup proof; explicitly declines to claim Fefferman (C) or (D).

## Status summary (v2.0.0)

**Paper:** *A Diverging History Clock Is Not a Blow-up Proof: Lean-Checked Lemmas Showing Why a Section 10 Navier-Stokes Argument Does Not Establish Fefferman (C) or (D)* — [`paper/Clay_CD_not_certified_2026.pdf`](paper/Clay_CD_not_certified_2026.pdf).

**Proved in Lean (8 theorems, no `sorry`, standard axioms only; see `AXIOMS.md`):** scalar real-analysis facts in
`lean/BKMCalculus.lean`: a pointwise bound gives $\int_0^T f \le MT$; $\int_0^T f \le \tfrac12\bigl(T + \int_0^T f^2\bigr)$, so a quadratic history
finite on bounded intervals cannot witness finite-time BKM divergence; for constant $M \ne 0$ the history $\int_0^T M^2$ tends to
$+\infty$ as $T \to \infty$ while $\int_0^T M = MT$; and $(T^*-t)^{-1}$ and its square are not integrable on $[0,T^*]$. Plus the two
`rfl` identities from v1 in `lean/NotBlowup.lean`.

**Not formalized:** Navier-Stokes/Euler equations, vorticity fields, the BKM theorem itself (cited).

**Open / not addressed:** Fefferman (C) and (D) and every regularity or blow-up statement for Navier-Stokes.
Nothing here has been peer reviewed. Naming: [`NAMING.md`](NAMING.md).

## Build

```
cd lean
lake exe cache get
lake build
lake env lean AxiomReport.lean
lake env lean AxiomAudit.lean
```
CI (`.github/workflows/lean.yml`, `axiom-table.yml`) runs these and fails on `sorryAx` or any non-standard axiom. Build and axiom audit: [`AXIOM_AUDIT.md`](AXIOM_AUDIT.md) (not a certificate).


**PDF note:** the PDF is built from `paper/Clay_CD_not_certified_2026.tex` with Tectonic (CI: `.github/workflows/paper.yml`).
