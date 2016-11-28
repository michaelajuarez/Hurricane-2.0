obj
	var/Use = 1
	Dark
		name = " "
		icon = 'Rain.dmi'
		icon_state = "Dark"
		layer = MOB_LAYER+1000
	Rain
		icon = 'Rain.dmi'
		icon_state = "Rain"
		layer = MOB_LAYER+2000
		proc
			SpreadCheck()
				var/counter = 0
				for(var/obj/Rain/T in oview(src,1))
					if(get_dir(src,T)==Direction)
						counter = 1
						src.Use = 0
				if(counter == 0)
					src.Use = 1
			Spread()
				for(var/turf/T in oview(src,1))
					if(get_dir(src,T)==Direction)
						var/counter = 0
						for(var/obj/Rain/R in view(T,0))
							counter = 1
						if(counter == 0)
							if(T:name == "Door")
								if(T.Open == 1)
									var/obj/O = new /obj/Rain(T)
									O:dir = Direction
									O:loc = locate(T.x,T.y,T.z)
							else
								var/obj/O = new /obj/Rain(T)
								O:dir = Direction
								O:loc = locate(T.x,T.y,T.z)
			Delete()
				for(var/turf/T in oview(src,1))
					if(get_dir(src,T)==Direction)
						for(var/obj/Rain/R in view(T,0))
							if(T:name == "Wall"||T:name == "Window"||T:name == "Tile"||T:name == "Door")
								R:Delete()
				del(src)