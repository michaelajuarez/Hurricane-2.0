mob
	Helicopter
		icon = 'Helicopter.dmi'
		name = "Helicopter"
		density = 1
		Two
			icon_state = "1"
			density = 1
			layer = MOB_LAYER+10000000
		One
			icon_state = "2"
			density = 1
			dir = NORTH
			New()
				var/mob/T = new /mob/Helicopter/Two
				T.pixel_y -= 32
				src.overlays += T
				src.overlays += /obj/Helicopter/TTwo
				var/obj/T2 = new /obj/Helicopter/TOne
				T2:pixel_y -= 32
				src.overlays += T2
				var/obj/T3 = new /obj/Helicopter/TThree
				T3:pixel_y -= 32
				T3:pixel_x += 32
				src.overlays += T3
				var/obj/T4 = new /obj/Helicopter/TFour
				T4:pixel_y -= 32
				T4:pixel_x -= 32
				src.overlays += T4
				var/obj/T5 = new /obj/Helicopter/TFive
				T5:pixel_y += 32
				src.overlays += T5
obj
	Helicopter
		icon = 'Helicopter.dmi'
		name = "Helicopter"
		TOne
			icon_state = "T1"
			density = 1
			layer = MOB_LAYER+100000000000
			dir = NORTH
		TTwo
			icon_state = "T2"
			density = 1
			layer = MOB_LAYER+100000000000
			dir = NORTH
		TThree
			icon_state = "T3"
			density = 1
			layer = MOB_LAYER+100000000000
			dir = NORTH
		TFour
			icon_state = "T4"
			density = 1
			layer = MOB_LAYER+100000000000
			dir = NORTH
		TFive
			icon_state = "T5"
			density = 1
			layer = MOB_LAYER+100000000000
			dir = NORTH