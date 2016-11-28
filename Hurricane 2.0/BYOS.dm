

obj
	BYOS
		Glass
			icon = 'Objects.dmi'
			icon_state = "Glass"
			var/Num = 1
			suffix = "1"
			DblClick()
				if(src in view(usr,1))
					if(usr.icon_state == "Alive")
						if(src in usr.contents)
							var/C = 0
							for(var/turf/Launcher/L in view(usr,0))
								C = 1
							if(C == 0)
								src.Build()
						else
							var/counter = 0
							for(var/obj/BYOS/Glass/M in usr.contents)
								counter = 1
								M:Num += src:Num
								M:suffix = "[M:Num]"
							if(counter == 0)
								usr.contents += src
							else
								del(src)
			verb
				Drop()
					set category = "Objects"
					if(usr.icon_state == "Alive")
						usr.contents.Remove(src)
						src.loc = usr.loc
			proc
				Build()
					var/list/Build = new()
					Build += "Window"
					Build += "Cancel"
					var/Sel = input(usr,"What do you want to build?",world.name)in Build
					if(src in usr.contents)
						var/counter = 0
						for(var/turf/T in view(usr,0))
							if(T:name == "Road")
								counter = 1
						if(counter == 0)
							if(usr.icon_state == "Alive")
								switch(Sel)
									if("Cancel")
										return
									if("Window")
										src.Num -= 1
										src.suffix = "[src.Num]"
										if(Num <= 0)
											usr.contents.Remove(src)
										new /turf/Window(usr.loc)
		Metal
			icon = 'Objects.dmi'
			icon_state = "Metal"
			var/Num = 1
			suffix = "1"
			DblClick()
				if(src in view(usr,1))
					if(usr.icon_state == "Alive")
						if(src in usr.contents)
							var/counter = 0
							for(var/turf/T in view(usr,0))
								if(T:name == "Road")
									counter = 1
							if(counter == 0)
								var/C = 0
								for(var/turf/Launcher/L in view(usr,0))
									C = 1
								if(C == 0)
									src.Build()
							else
								usr<<"<b>You cannot build on the road or sidewalk!"
						else
							var/counter = 0
							for(var/obj/BYOS/Metal/M in usr.contents)
								counter = 1
								M:Num += src:Num
								M:suffix = "[M:Num]"
							if(counter == 0)
								usr.contents += src
							else
								del(src)
			verb
				Drop()
					set category = "Objects"
					if(usr.icon_state == "Alive")
						usr.contents.Remove(src)
						src.loc = usr.loc
			proc
				Build()
					var/list/Build = new()
					Build += "Wall"
					Build += "Table"
					Build += "Door"
					Build += "Tile Parts"
					Build += "Grill Parts"
					Build += "Cancel"
					var/Sel = input(usr,"What do you want to build?",world.name)in Build
					if(src in usr.contents)
						var/counter = 0
						for(var/turf/T in view(usr,0))
							if(T:name == "Road")
								counter = 1
						if(counter == 0)
							if(usr.icon_state == "Alive")
								switch(Sel)
									if("Cancel")
										return
									if("Wall")
										src.Num -= 1
										src.suffix = "[src.Num]"
										if(Num <= 0)
											usr.contents.Remove(src)
										//var/DIR1 = get_step(usr,usr.dir)
										new /turf/Wall(usr.loc)//(DIR1)
									/*if("Seat")
										src.Num -= 1
										src.suffix = "[src.Num]"
										if(Num <= 0)
											usr.contents.Remove(src)
										new /turf/Seat(usr.loc)*/
									if("Door")
										src.Num -= 1
										src.suffix = "[src.Num]"
										if(Num <= 0)
											usr.contents.Remove(src)
										var/NSEW = input(usr,"Which direction?",world.name)in list("North","South","East","West")
										var/counter1 = 0
										for(var/turf/T in view(usr,0))
											if(T:name == "Road")
												counter1 = 1
										if(counter1 == 0)
											if(usr.icon_state == "Alive")
												if(NSEW == "North")
													new /turf/Tile(usr.loc)
													new /turf/Door2/North(usr.loc)
												else
													if(NSEW == "South")
														new /turf/Tile(usr.loc)
														new /turf/Door2/South(usr.loc)
													else
														if(NSEW == "East")
															new /turf/Tile(usr.loc)
															new /turf/Door2/East(usr.loc)
														else
															if(NSEW == "West")
																new /turf/Tile(usr.loc)
																new /turf/Door2/West(usr.loc)
									if("Table")
										src.Num -= 1
										src.suffix = "[src.Num]"
										if(Num <= 0)
											usr.contents.Remove(src)
										new /obj/Fluff/Table(usr.loc)
									if("Tile Parts")
										src.Num -= 1
										src.suffix = "[src.Num]"
										if(Num <= 0)
											usr.contents.Remove(src)
										usr.contents += new /obj/Usables/Tile_Parts(usr)
									if("Grill Parts")
										src.Num -= 1
										src.suffix = "[src.Num]"
										if(Num <= 0)
											usr.contents.Remove(src)
										new /obj/Usables/Grill_Parts(usr.loc)