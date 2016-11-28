turf
	var
		Fire = 0
obj
	Fire
		icon = 'Objects.dmi'
		icon_state = "Fire"
		Use = 1
		var/Tick = 0
		var/Use1 = 1
		proc
			CCheck()
				var/counter = 0
				var/c = 0
				src.Use1 = 1
				for(var/turf/F in oview(src,1))
					if(F:Fire == 1)
						counter += 1
				for(var/turf/F2 in oview(src,1))
					c += 1
				if(counter == c)
					src.Use1 = 0
			Cont()
				if(src.Tick == 50)
					src.icon_state = "Dead"
				else
					src.Tick += 1
					if(src.Use1 == 1)
						for(var/turf/T in view(src,1))
							var/c = 0
							for(var/turf/Door/D in view(src,0))
								if(D:name == "Door")
									if(D:Open == 0)
										if(get_dir(src,T) == D.dir)
											c = 1
										else
											if(D:dir == SOUTH)
												if(get_dir(D,T) == SOUTH||get_dir(D,T) == SOUTHEAST||get_dir(D,T) == SOUTHWEST)
													c = 1
											else
												if(D:dir == WEST)
													if(get_dir(D,T) == WEST||get_dir(D,T) == NORTHWEST||get_dir(D,T) == SOUTHWEST)
														c = 1
												else
													if(D:dir == NORTH)
														if(get_dir(D,T) == NORTH||get_dir(D,T) == NORTHEAST||get_dir(D,T) == NORTHWEST)
															c = 1
													else
														if(D:dir == EAST)
															if(get_dir(D,T) == EAST||get_dir(D,T) == NORTHEAST||get_dir(D,T) == SOUTHEAST)
																c = 1
							if(c == 0)
								if(T:name == "Wall"||T:name == "Window")
									..()
								else
									var/counter = 0
									for(var/obj/Fire/F in view(T,0))
										counter = 1
									if(counter == 0)
										if(T:name == "Door")
											if(T:Open == 0)
												if(T:dir == SOUTH)
													if(get_dir(T,src) == NORTH||get_dir(T,src) == NORTHEAST||get_dir(T,src) == NORTHWEST)
														T:Fire = 1
														var/obj/O = new /obj/Fire(T)
														O:dir = Direction
														O:loc = locate(T.x,T.y,T.z)
												else
													if(T:dir == WEST)
														if(get_dir(T,src) == EAST||get_dir(T,src) == NORTHEAST||get_dir(T,src) == SOUTHEAST)
															T:Fire = 1
															var/obj/O = new /obj/Fire(T)
															O:dir = Direction
															O:loc = locate(T.x,T.y,T.z)
													else
														if(T:dir == NORTH)
															if(get_dir(T,src) == SOUTH||get_dir(T,src) == SOUTHEAST||get_dir(T,src) == SOUTHWEST)
																T:Fire = 1
																var/obj/O = new /obj/Fire(T)
																O:dir = Direction
																O:loc = locate(T.x,T.y,T.z)
														else
															if(T:dir == EAST)
																if(get_dir(T,src) == WEST||get_dir(T,src) == NORTHWEST||get_dir(T,src) == SOUTHWEST)
																	T:Fire = 1
																	var/obj/O = new /obj/Fire(T)
																	O:dir = Direction
																	O:loc = locate(T.x,T.y,T.z)
											else
												T:Fire = 1
												var/obj/O = new /obj/Fire(T)
												O:dir = Direction
												O:loc = locate(T.x,T.y,T.z)
										else
											T:Fire = 1
											var/obj/O = new /obj/Fire(T)
											O:dir = Direction
											O:loc = locate(T.x,T.y,T.z)