/*
Contains most of the procs that are called when a xeno is attacked by something
*/

/mob/living/carbon/xenomorph/screech_act(mob/living/carbon/xenomorph/queen/Q)
	return

/mob/living/carbon/xenomorph/has_smoke_protection()
	return TRUE

/mob/living/carbon/xenomorph/smoke_contact(obj/effect/particle_effect/smoke/S)
	var/protection = max(1 - get_permeability_protection() * S.bio_protection) //0.2 by default
	if(CHECK_BITFIELD(S.smoke_traits, SMOKE_BLISTERING))
		adjustFireLoss(12 * (protection + 0.6))
	if(CHECK_BITFIELD(S.smoke_traits, SMOKE_PLASMALOSS))
		use_plasma(15)
		if(prob(15))
			to_chat(src, "<span class='xenowarning'>We feel our plasma reserves being drained.</span>")
	if(CHECK_BITFIELD(S.smoke_traits, SMOKE_CHEM))
		S.reagents?.reaction(src, TOUCH, S.fraction)

/mob/living/carbon/xenomorph/Stun(amount, ignore_canstun) //TO DO: make this a mob modifier
	amount *= 0.2
	return ..()

/mob/living/carbon/xenomorph/Knockdown(amount, ignore_canstun)
	amount *= 0.2 // replaces the old knock_down -5
	return ..()

/mob/living/carbon/xenomorph/Immobilize(amount, ignore_canstun)
	amount *= 0.2
	return ..()

/mob/living/carbon/xenomorph/Paralyze(amount, ignore_canstun)
	amount *= 0.2
	return ..()

/mob/living/carbon/xenomorph/DisableHands(amount, ignore_canstun)
	amount *= 0.2
	return ..()

/mob/living/carbon/xenomorph/Wormed(amount, ignore_canstun)
	amount *= 0.2
	return ..()
