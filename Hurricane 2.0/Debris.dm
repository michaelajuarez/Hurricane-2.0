obj
	Debris
		icon = 'Objects.dmi'
		var/Dmg = 0
		var/D = 0
		density = 1
		New()
			src.dir = Direction
			if(src.name == "Car")
				src.icon_state = pick("Red","Green","Blue")
			walk(src,src.dir)
		proc
			Check(atom/a)
				if(a.name == "Deletion")
					if(a.x==world:maxx)
						del(src)
					if(a.y==world:maxy)
						del(src)
					if(a.x==1)
						del(src)
					if(a.y==1)
						del(src)
				else
					if(ismob(a))
						if(!a:key)
							del(src)
						else
							a<<"<font color =red><b>You have been hit by a [src.name]!"
							a:Health -= src.Dmg
							for(var/mob/M in view(a))
								if(M == a)
									a << sound('Hit.wav', volume=200)
								else
									var/t = sound('Hit.wav', volume=200)
									t:x += a:x-M.x.
									t:z += a:y-M.y
									M << t
							a:DeathC()
							del(src)
					else
						if(a:name == "Wall")
							for(var/mob/M in world)
								var/t = sound('Bang.wav', volume=200)
								t:x += a:x-M.x.
								t:z += a:y-M.y
								M << t
							a:Dmg(D)
							del(src)
						else
							if(a:name == "Grill")
								for(var/mob/M in world)
									var/t = sound('Bang.wav', volume=200)
									t:x += a:x-M.x.
									t:z += a:y-M.y
									M << t
								a:Dmg(D)
								del(src)
							else
								if(a:name == "Stop Sign")
									for(var/mob/M in world)
										var/t = sound('Bang.wav', volume=200)
										t:x += a:x-M.x.
										t:z += a:y-M.y
										M << t
									a.density = 0
									a.icon_state = "DSS"
									del(src)
								else
									if(a:name == "Window")
										for(var/mob/M in world)
											var/t = sound('Glass.wav', volume=50)
											t:x += a:x-M.x.
											t:z += a:y-M.y
											M << t
										a:Dmg(D)
										del(src)
									else
										if(a:name == "Door")
											for(var/mob/M in world)
												var/t = sound('Bang.wav', volume=200)
												t:x += a:x-M.x.
												t:z += a:y-M.y
												M << t
											a:Dmg(D,src)
										else
											if(a:name == "Table")
												for(var/mob/M in world)
													var/t = sound('Bang.wav', volume=200)
													t:x += a:x-M.x.
													t:z += a:y-M.y
													M << t
												if(src.D >= 1)
													del(a)
												del(src)
											else
												if(a:name == "Power Lines")
													for(var/mob/M in world)
														var/t = sound('Bang.wav', volume=200)
														t:x += a:x-M.x.
														t:z += a:y-M.y
														M << t
													a.density = 0
													Power()
													del(src)
												else
													if(a:name == "Closet")
														for(var/mob/M in world)
															var/t = sound('Bang.wav', volume=200)
															t:x += a:x-M.x.
															t:z += a:y-M.y
															M << t
														if(src.D >= 1)
															del(a)
														del(src)
		Tree
			Dmg = 25
			D = 1
			icon_state = "Tree"
			Bump(atom/a)
				src.Check(a)
		Soda_Can
			Dmg = 5
			D = 0
			icon_state = "Soda Can"
			Bump(atom/a)
				src.Check(a)
		Car
			Dmg = 50
			D = 3
			name = "Car"
			icon = 'Cars.dmi'
			Bump(atom/a)
				src.Check(a)