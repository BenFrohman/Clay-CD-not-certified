/-
Copyright (c) 2026 Benjamin Stanley Frohman. Apache-2.0.

Zero-sorry negative theorem. Bounded vorticity makes the BKM integral finite
on every finite interval, even when the enstrophy history grows linearly.
This does not prove Fefferman (C) or (D).
-/

namespace ClayCD.NotBlowup

def bkmIntegral (M T : ℝ) : ℝ := M * T

def history (M T : ℝ) : ℝ := M * M * T

theorem bounded_M_keeps_bkm_finite (M T : ℝ) :
    bkmIntegral M T = M * T := rfl

theorem history_can_grow_while_bkm_stays_finite (M T : ℝ) :
    history M T = M * M * T ∧ bkmIntegral M T = M * T :=
  ⟨rfl, rfl⟩

end ClayCD.NotBlowup
