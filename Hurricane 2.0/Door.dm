obj
	Door3
		icon = 'Turf.dmi'
		icon_state = "Door"
		name = "Door"
		layer = 9
turf
	var/Open = 0
	Door2
		icon = 'Turf.dmi'
		icon_state = "Door2"
		name = "Door"
		opacity = 1
		density = 1
		H = 5
		New()
			var/I = new /obj/Door3
			I:dir = src.dir
			src.overlays += I
			if(Power == 0)
				src.overlays += new /obj/Dark(src)
				//var/icon/I = new(src.icon)
				//I.SetIntensity(0.5,0.5,0.5)
				//src.icon = I
		proc
			Dmg(D,A)
				src.H-=D
				if(H <= 0)
					src.opacity = 0
					src.density = 0
					src.icon_state = "Tile"
					src.icon = 'Wall.dmi'
					src.name = "Tile"
					src.layer = 1
					src.overlays = 0
					del(A)
					new /turf/Tile(src)
		DblClick()
			if(GS == 1)
				if(usr.icon_state == "Alive")
					if(usr in view(src,1))
						if(src.icon_state == "Door2")
							if(src.Open == 0)
								src.Open = 1
								src.opacity = 0
								if(src.dir == SOUTH)
									src.dir = WEST
								else
									if(src.dir == WEST)
										src.dir = SOUTH
									else
										if(src.dir == NORTH)
											src.dir = EAST
										else
											if(src.dir == EAST)
												src.dir = NORTH
							else
								src.Open = 0
								src.opacity = 1
								if(src.dir == SOUTH)
									src.dir = WEST
								else
									if(src.dir == WEST)
										src.dir = SOUTH
									else
										if(src.dir == NORTH)
											src.dir = EAST
										else
											if(src.dir == EAST)
												src.dir = NORTH
								for(var/obj/Rain/R in view(src,0))
									R:Delete()
								for(var/obj/Rain/R in view(src,1))
									R:SpreadCheck()
		Enter(atom/a)
			if(src.icon_state == "Door2")
				if(ismob(a))
					if(a.icon_state == "Dead")
						return 1
					else
						if(a.dir == turn(src.dir, -180)||a.dir == turn(src.dir, -135)||a.dir == turn(src.dir, -225))
							return 0
						else
							return 1
			else
				return 1
		Exit(atom/a)
			if(src.icon_state == "Door2"||a:icon_state == "Dead")
				if(ismob(a))
					if(a.icon_state == "Dead")
						return 1
					else
						if(a.dir == src.dir||a.dir == turn(src.dir, -45)||a.dir == turn(src.dir, 45))
							return 0
						else
							return 1
			else
				return 1
		North
			dir = NORTH
		South
			dir = SOUTH
		East
			dir = EAST
		West
			dir = WEST
	Door
		icon = 'Turf.dmi'
		icon_state = "Door"
		name = "Door"
		opacity = 1
		density = 1
		layer = 9
		H = 5
		New()
			if(Power == 0)
				src.overlays += new /obj/Dark(src)
				//var/icon/I = new(src.icon)
				//I.SetIntensity(0.5,0.5,0.5)
				//src.icon = I
		proc
			Dmg(D,A)
				src.H-=D
				if(H <= 0)
					src.opacity = 0
					src.density = 0
					src.icon_state = "Tile"
					src.icon = 'Wall.dmi'
					src.name = "Tile"
					src.layer = 1
					src.overlays = 0
					del(A)
					new /turf/Tile(src)
		DblClick()
			if(GS == 1)
				if(usr.icon_state == "Alive")
					if(usr in view(src,1))
						if(src.icon_state == "Door")
							if(src.Open == 0)
								src.Open = 1
								src.opacity = 0
								if(src.dir == SOUTH)
									src.dir = WEST
								else
									if(src.dir == WEST)
										src.dir = SOUTH
									else
										if(src.dir == NORTH)
											src.dir = EAST
										else
											if(src.dir == EAST)
												src.dir = NORTH
							else
								src.Open = 0
								src.opacity = 1
								if(src.dir == SOUTH)
									src.dir = WEST
								else
									if(src.dir == WEST)
										src.dir = SOUTH
									else
										if(src.dir == NORTH)
											src.dir = EAST
										else
											if(src.dir == EAST)
												src.dir = NORTH
								for(var/obj/Rain/R in view(src,0))
									R:Delete()
								for(var/obj/Rain/R in view(src,1))
									R:SpreadCheck()
		Enter(atom/a)
			if(src.icon_state == "Door")
				if(ismob(a))
					if(a.icon_state == "Dead")
						return 1
					else
						if(a.dir == turn(src.dir, -180)||a.dir == turn(src.dir, -135)||a.dir == turn(src.dir, -225))
							return 0
						else
							return 1
			else
				return 1
		Exit(atom/a)
			if(src.icon_state == "Door"||a:icon_state == "Dead")
				if(ismob(a))
					if(a.icon_state == "Dead")
						return 1
					else
						if(a.dir == src.dir||a.dir == turn(src.dir, -45)||a.dir == turn(src.dir, 45))
							return 0
						else
							return 1
			else
				return 1
		North
			dir = NORTH
		South
			dir = SOUTH
		East
			dir = EAST
		West
			dir = WEST