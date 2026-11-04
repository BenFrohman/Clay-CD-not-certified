-- Axiom audit: prints the axioms of every theorem/lemma in the project.
-- CI fails unless each depends only on propext, Classical.choice, Quot.sound (or none).
import NotBlowup
import BKMCalculus

#print axioms ClayCD.NotBlowup.bounded_M_keeps_bkm_finite
#print axioms ClayCD.NotBlowup.history_can_grow_while_bkm_stays_finite
#print axioms ClayCD.BKMCalculus.bkm_integral_le_of_bound
#print axioms ClayCD.BKMCalculus.le_half_one_add_sq
#print axioms ClayCD.BKMCalculus.bkm_integral_le_of_history
#print axioms ClayCD.BKMCalculus.history_diverges_at_infinity_bkm_finite
#print axioms ClayCD.BKMCalculus.blowup_profile_not_integrable
#print axioms ClayCD.BKMCalculus.blowup_profile_sq_not_integrable
