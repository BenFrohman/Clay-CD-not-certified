/-
Copyright (c) 2026 Benjamin Stanley Frohman. Apache-2.0.

Genuine (non-definitional) real-analysis lemmas about the scalar BKM bookkeeping.
Here `f : ℝ → ℝ` is an arbitrary scalar function standing in for `t ↦ ‖ω(t)‖_∞`.
No Navier–Stokes or Euler equation is formalized; the Beale–Kato–Majda theorem itself is
NOT formalized. These lemmas only concern integrals of real functions of time.
This does not prove or disprove Fefferman (C) or (D).
-/
import Mathlib

open MeasureTheory intervalIntegral Filter Set

namespace ClayCD.BKMCalculus

/-- A pointwise bound `f ≤ M` on `[0,T]` bounds the BKM-type integral by `M*T`. -/
theorem bkm_integral_le_of_bound {f : ℝ → ℝ} {M T : ℝ} (hT : 0 ≤ T)
    (hf : IntervalIntegrable f volume 0 T) (hb : ∀ t ∈ Icc 0 T, f t ≤ M) :
    ∫ t in (0:ℝ)..T, f t ≤ M * T := by
  have h := intervalIntegral.integral_mono_on hT hf _root_.intervalIntegrable_const hb
  simpa [intervalIntegral.integral_const, mul_comm] using h

/-- Elementary pointwise inequality `x ≤ (1 + x²)/2`. -/
theorem le_half_one_add_sq (x : ℝ) : x ≤ (1 + x ^ 2) / 2 := by
  nlinarith [sq_nonneg (x - 1)]

/-- A finite quadratic history on a bounded interval forces a finite BKM-type integral:
`∫₀ᵀ f ≤ (T + ∫₀ᵀ f²)/2`. Hence a quadratic history can only detect a finite-time BKM
singularity if it is itself infinite on a bounded interval. -/
theorem bkm_integral_le_of_history {f : ℝ → ℝ} {T : ℝ} (hT : 0 ≤ T)
    (hf : IntervalIntegrable f volume 0 T)
    (hf2 : IntervalIntegrable (fun t => f t ^ 2) volume 0 T) :
    ∫ t in (0:ℝ)..T, f t ≤ (T + ∫ t in (0:ℝ)..T, f t ^ 2) / 2 := by
  have hg : IntervalIntegrable (fun t => (1 + f t ^ 2) / 2) volume 0 T :=
    ((_root_.intervalIntegrable_const (c := (1:ℝ))).add hf2).div_const 2
  have h := intervalIntegral.integral_mono_on hT hf hg (fun t _ => le_half_one_add_sq (f t))
  have e : ∫ t in (0:ℝ)..T, (1 + f t ^ 2) / 2 = (T + ∫ t in (0:ℝ)..T, f t ^ 2) / 2 := by
    rw [intervalIntegral.integral_div, intervalIntegral.integral_add _root_.intervalIntegrable_const hf2]
    simp
  linarith

/-- Constant bound `M ≠ 0`: the quadratic history `∫₀ᵀ M²` tends to `+∞` as `T → ∞`,
while for every finite `T` the BKM integral `∫₀ᵀ M` equals the finite number `M*T`.
Divergence of a history clock as `T → ∞` is therefore not finite-time blow-up. -/
theorem history_diverges_at_infinity_bkm_finite (M : ℝ) (hM : M ≠ 0) :
    Tendsto (fun T : ℝ => ∫ _t in (0:ℝ)..T, M ^ 2) atTop atTop ∧
    ∀ T : ℝ, ∫ _t in (0:ℝ)..T, M = M * T := by
  refine ⟨?_, fun T => by simp [mul_comm]⟩
  have hpos : 0 < M ^ 2 := by positivity
  have : (fun T : ℝ => ∫ _t in (0:ℝ)..T, M ^ 2) = fun T => T * M ^ 2 := by
    funext T; simp
  rw [this]
  exact tendsto_id.atTop_mul_const hpos

/-- The model blow-up profile `t ↦ 1/(T* - t)` is not integrable on `[0, T*]`:
its BKM-type integral diverges at the finite time `T*`. -/
theorem blowup_profile_not_integrable {Ts : ℝ} (hTs : 0 < Ts) :
    ¬ IntervalIntegrable (fun t : ℝ => (Ts - t)⁻¹) volume 0 Ts := by
  intro h
  have h' : IntervalIntegrable (fun t : ℝ => (t - Ts)⁻¹) volume 0 Ts := by
    have := h.neg
    refine this.congr ?_
    intro t _
    simp [← inv_neg, neg_sub]
  rw [intervalIntegrable_sub_inv_iff] at h'
  rcases h' with h0 | hn
  · exact hTs.ne h0
  · exact hn (by simp [hTs.le])

/-- Consequently the square of the blow-up profile is also not integrable on `[0,T*]`
(otherwise `bkm_integral_le_of_history`-type control would make the profile integrable). -/
theorem blowup_profile_sq_not_integrable {Ts : ℝ} (hTs : 0 < Ts) :
    ¬ IntervalIntegrable (fun t : ℝ => ((Ts - t)⁻¹) ^ 2) volume 0 Ts := by
  intro h2
  apply blowup_profile_not_integrable hTs
  -- |g| ≤ (1 + g²)/2, so g is integrable if g² is (g is continuous off one point, hence a.e.-measurable)
  have hm : AEStronglyMeasurable (fun t : ℝ => (Ts - t)⁻¹) (volume.restrict (Set.uIoc (0:ℝ) Ts)) :=
    (measurable_const.sub measurable_id).inv.aestronglyMeasurable
  have hg : IntervalIntegrable (fun t : ℝ => (1 + ((Ts - t)⁻¹) ^ 2) / 2) volume 0 Ts :=
    ((_root_.intervalIntegrable_const (c := (1:ℝ))).add h2).div_const 2
  refine (intervalIntegrable_iff.mpr ?_)
  refine Integrable.mono' (intervalIntegrable_iff.mp hg) hm ?_
  filter_upwards with t
  rw [Real.norm_eq_abs, abs_le]
  constructor <;> nlinarith [sq_nonneg ((Ts - t)⁻¹ - 1), sq_nonneg ((Ts - t)⁻¹ + 1)]

end ClayCD.BKMCalculus
