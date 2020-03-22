/datum/round_event_control/tigercarp_migration
	name = "Tiger carp Migration"
	typepath = /datum/round_event/tigercarp_migration
	weight = 15
	min_players = 2
	earliest_start = 15 MINUTES
	max_occurrences = 6
	gamemode_blacklist = list("dynamic")

/datum/round_event/tigercarp_migration
	announceWhen	= 3
	startWhen = 50

/datum/round_event/tigercarp_migration/setup()
	startWhen = rand(40, 60)

/datum/round_event/tigercarp_migration/announce(fake)
	if(prob(50))
		priority_announce("Unknown biological entities have been detected near [station_name()], please stand-by.", "Lifesign Alert")
	else
		print_command_report("Unknown biological entities have been detected near [station_name()], you may wish to break out arms.", "Biological entities")


/datum/round_event/tigercarp_migration/start()
	for(var/obj/effect/landmark/carpspawn/C in GLOB.landmarks_list)
		if(prob(95))
			new /mob/living/simple_animal/hostile/carp/tigercarp(C.loc)
		else
			new /mob/living/simple_animal/hostile/carp/megacarp(C.loc)


