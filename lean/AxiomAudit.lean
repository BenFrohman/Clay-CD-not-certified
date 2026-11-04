-- Axiom audit: prints the axioms of every theorem/lemma in the project.
-- CI fails unless each depends only on propext, Classical.choice, Quot.sound (or none).
import NotBlowup

#print axioms ClayCD.NotBlowup.bounded_M_keeps_bkm_finite
#print axioms ClayCD.NotBlowup.history_can_grow_while_bkm_stays_finite
