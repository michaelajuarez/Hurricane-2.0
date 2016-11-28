obj
	Road
		icon = 'Road.dmi'
		name = "Road"
		New()
			var/icon/I = new(src.icon)
			I.SetIntensity(0.5,0.5,0.5)
			src.icon = I
		Stop
			name = "Stop Sign"
			icon_state = "stop"
			density = 1
		Park1
			icon_state = "P1"
		Park2
			icon_state = "P2"
		Park3
			icon_state = "P3"
		Park4
			icon_state = "P4"
turf
	Flood_Start
		name = "Grass"
		Enter(atom/a)
			if(ismob(a))
				return 0
			else
				return 1
turf
	Road
		icon = 'Road.dmi'
		name = "Road"
		New()
			/*var/icon/I = new(src.icon)
			I.SetIntensity(0.5,0.5,0.5)
			src.icon = I*/
		o1
			icon_state = "l"
		o2
			icon_state = "ll"
		o3
			icon_state = "r"
		o4
			icon_state = "rr"
		o5
			icon_state = "1"
		o6
			icon_state = "2"
		o7
			icon_state = "3"
		o8
			icon_state = "4"
		o9
			icon_state = "5"
		Side
			icon_state = "s"
		Stop
			icon_state = "stop"
			name = "Stop Sign"
			density = 1
			/*Enter(atom/a)
				if(isobj(a))
					if(a:Deadly == 1)
						view(src)<<'Bang.wav'
						new /turf/Road/Side(src)
						del(a)
				else
					return 0*/
		Grass
			icon_state = "Grass"
			name = "Grass"
		Park1
			icon_state = "P1"
		Park2
			icon_state = "P2"
		Park3
			icon_state = "P3"
		Park4
			icon_state = "P4"
		Closed1
			icon_state = "C1"
			density = 1
		Closed2
			icon_state = "C2"
			density = 1
		Closed3
			icon_state = "C3"
			density = 1
		Closed4
			icon_state = "C4"
			density = 1

turf
	var
		H = 0
	Tile
		icon = 'Wall.dmi'
		icon_state = "Tile"
		New()
			if(Power == 0)
				src.overlays += new /obj/Dark(src)
			for(var/obj/Rain/R in view(src,0))
				R:Delete()
			for(var/obj/Rain/R in view(src,1))
				R:SpreadCheck()
			for(var/obj/Fluff/Seat/O in view(src,0))
				del(O)
			for(var/obj/Fluff/Table/O in view(src,0))
				del(O)
				//var/icon/I = new(src.icon)
				//I.SetIntensity(0.5,0.5,0.5)
				//src.icon = I
	Wall
		icon = 'Wall.dmi'
		icon_state = "10"
		density = 1
		opacity = 1
		H = 10
		New()
			src.dir = Direction
			for(var/obj/Rain/R in view(src,0))
				R:Delete()
			for(var/obj/Rain/R in view(src,1))
				R:SpreadCheck()
			for(var/obj/Fire/F in view(0,src))
				del(F)
			for(var/obj/Flood/F in view(0,src))
				del(F)
			for(var/obj/Fluff/Seat/O in view(src,0))
				del(O)
			for(var/obj/Fluff/Table/O in view(src,0))
				del(O)
			if(Power == 0)
				src.overlays += new /obj/Dark(src)
				//var/icon/I = new(src.icon)
				//I.SetIntensity(0.5,0.5,0.5)
				//src.icon = I
		proc
			Dmg(D)
				src.H-=D
				src.icon_state = "[H]"
				if(H <= 3)
					src.density = 0
					src.opacity = 0
					src.icon_state = "Tile"
					src.name = "Tile"
		DblClick()
			if(usr.icon_state == "Alive")
				if(src in view(usr,1))
					var/counter = 0
					for(var/obj/Objects/Welder/O in usr.contents)
						if(O:equiped == 1)
							if(O:Fuel >= 1)
								counter = 1
							else
								usr<<"<font color =red>Not enough propane!"
					if(counter == 1)
						if(src.icon_state == "Tile")
							..()
						else
							if(usr.dismantling == 0)
								usr.dismantling = 1
								usr.DismantlingS = src
								for(var/obj/Objects/Welder/O in usr.contents)
									if(O:equiped == 1)
										O:Fuel -= 1
										var/Fuel1 = O:Fuel
										O:suffix = "Using, Fuel Left: [Fuel1]"
								usr<<"<font color =blue><b>You begin disassembling the wall!"
								sleep(100)
								if(usr.dismantling == 1)
									if(usr.DismantlingS == src)
										if(usr.icon_state == "Alive")
											usr.dismantling = 0
											usr.DismantlingS = null
											var/obj/O = new /obj/BYOS/Metal(src)
											O:loc = locate(src.x,src.y,src.z)
											usr<<"<font color =blue><b>You disassembled the wall!"
											new /turf/Tile(src)
turf
	Window
		icon = 'Turf.dmi'
		icon_state = "Window"
		density = 1
		H = 3
		New()
			for(var/obj/Rain/R in view(src,0))
				R:Delete()
			for(var/obj/Rain/R in view(src,1))
				R:SpreadCheck()
			for(var/obj/Fluff/Seat/O in view(src,0))
				del(O)
			for(var/obj/Fluff/Table/O in view(src,0))
				del(O)
			if(Power == 0)
				src.overlays += new /obj/Dark(src)
				//var/icon/I = new(src.icon)
				//I.SetIntensity(0.5,0.5,0.5)
				//src.icon = I
		DblClick()
			if(usr.icon_state == "Alive")
				if(src in view(usr,1))
					var/counter = 0
					for(var/obj/Objects/Welder/O in usr.contents)
						if(O:equiped == 1)
							if(O:Fuel >= 1)
								counter = 1
							else
								usr<<"<font color =red>Not enough propane!"
					if(counter == 1)
						if(src.icon_state == "Tile")
							..()
						else
							if(usr.dismantling == 0)
								usr.dismantling = 1
								usr.DismantlingS = src
								for(var/obj/Objects/Welder/O in usr.contents)
									if(O:equiped == 1)
										O:Fuel -= 1
										O:suffix = "Using, Fuel Left: [O:Fuel]"
								usr<<"<font color =blue><b>You begin melting the window!"
								sleep(100)
								if(usr.dismantling == 1)
									if(usr.DismantlingS == src)
										if(usr.icon_state == "Alive")
											usr.dismantling = 0
											usr.DismantlingS = null
											var/obj/O = new /obj/BYOS/Glass(src)
											O:loc = locate(src.x,src.y,src.z)
											usr<<"<font color =blue><b>You melted the window into glass!"
											new /turf/Tile(src)

		proc
			Dmg(D)
				H-=D
				if(H == 2)
					var/obj/O = new /obj/Shattered_Glass/One(src)
					O:loc = locate(src.x,src.y,src.z)
					step(O,Direction)
				if(H == 1)
					var/obj/O = new /obj/Shattered_Glass/Two(src)
					O:loc = locate(src.x,src.y,src.z)
					step(O,Direction)
				if(H <= 0)
					var/obj/O = new /obj/Shattered_Glass/Three(src)
					O:loc = locate(src.x,src.y,src.z)
					step(O,Direction)
					src.density = 0
					src.opacity = 0
					src.icon_state = "Tile"
					src.name = "Tile"
					for(var/mob/M in world)
						var/t = sound('Glass.wav', volume=200)
						t:x += src.x-M.x.
						t:z += src.y-M.y
						M << t
obj
	var
		H = 0
	Grill
		icon = 'Objects.dmi'
		icon_state = "Grill"
		density = 1
		H = 5
		proc
			Dmg(D)
				H-=D
				if(H <= 0)
					del(src)
		DblClick()
			if(usr.icon_state == "Alive")
				if(src in view(usr,1))
					var/counter = 0
					for(var/obj/Objects/Wire_Cutters/O in usr.contents)
						if(O:equiped == 1)
							counter = 1
					if(counter == 1)
						var/obj/O = new /obj/Usables/Grill_Parts(src)
						O:loc = locate(src.x,src.y,src.z)
						del(src)
	Shattered_Glass
		icon = 'Objects.dmi'
		name = "Shattered Glass"
		One
			icon_state = "Glass1"
		Two
			icon_state = "Glass2"
		Three
			icon_state = "Glass3"