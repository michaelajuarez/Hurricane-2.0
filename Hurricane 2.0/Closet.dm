obj
	Closet
		var/Open = 0
		icon = 'Turf.dmi'
		icon_state = "Closet"
		density = 1
		contents=list(new /obj/Usables/Grill_Parts, new /obj/Usables/Grill_Parts, new /obj/Usables/Grill_Parts, new /obj/Usables/Grill_Parts, new /obj/Usables/Grill_Parts, new /obj/Usables/Grill_Parts, new /obj/Usables/Grill_Parts, new /obj/Usables/Grill_Parts, new /obj/Usables/Grill_Parts, new /obj/Usables/Grill_Parts, new /obj/Usables/Grill_Parts, new /obj/Usables/Grill_Parts, new /obj/Objects/Wire_Cutters, new /obj/Objects/Wire_Cutters)
		DblClick()
			if(usr in view(src,1))
				if(src.Open == 0)
					src.Open = 1
					src.icon_state = "Closet O"
					src.verbs += /obj/Closet/Verbs/verb/Get
				else
					src.Open = 0
					src.icon_state = "Closet"
					src.verbs -= /obj/Closet/Verbs/verb/Get
		Verbs
			verb
				Get()
					set src in view(1)
					set category = "Closet"
					if(usr.icon_state == "Alive")
						var/counter = 0
						var/list/Inv = new()
						for(var/obj/O in src.contents)
							counter += 1
							Inv += O
						if(counter <= 0)
							Inv += "-Empty-"
						Inv += "Cancel"
						var/Get = input(usr,"What would you like to extract from the closet?",world.name)in Inv
						if(Get == "Cancel")
							return
						else
							if(Get == "-Empty-")
								return
							else
								src.contents.Remove(Get)
								usr.contents.Add(Get)

obj
	Usables
		Grill_Parts
			icon = 'Objects.dmi'
			icon_state = "Grill Parts"
			DblClick()
				if(src in view(usr,1))
					if(usr.icon_state == "Alive")
						if(src in usr.contents)
							new /obj/Grill(usr.loc)
							del(src)
						else
							if(src in view(usr,1))
								usr.contents += src
			verb
				Drop()
					set category = "Objects"
					if(usr.icon_state == "Alive")
						usr.contents.Remove(src)
						src.loc = usr.loc
		Tile_Parts
			icon = 'Objects.dmi'
			icon_state = "Tile Parts"
			var/Num = 4
			suffix = "4"
			verb
				Drop()
					set category = "Objects"
					if(usr.icon_state == "Alive")
						usr.contents.Remove(src)
						src.loc = usr.loc
			DblClick()
				if(src in view(usr,1))
					if(usr.icon_state == "Alive")
						if(src in usr.contents)
							var/counter = 0
							for(var/turf/T in view(usr,0))
								if(T:name == "Road")
									counter = 1
							if(counter == 0)
								if(src.Num >= 1)
									src.Num -= 1
									src.suffix = "[src.Num]"
									if(src.Num <= 0)
										usr.contents.Remove(src)
									new /turf/Tile(usr.loc)
								else
									..()
						else
							usr.contents += src
	/*Grill
		var/HP = 5
		icon = 'Objects.dmi'
		icon_state = "Grill"
		density = 1
		layer = 9
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
						del(src)*/
obj
	var/equiped = 0
	var/Fuel = 0
	Objects
		icon = 'Objects.dmi'
		Propane
			icon_state = "Propane"
			Fuel = 10
			DblClick()
				if(usr.icon_state == "Alive")
					if(src in usr.contents)
						return
					else
						if(src in view(usr,1))
							usr.contents += src
			verb
				Use()
					set category = "Objects"
					if(usr.icon_state == "Alive")
						var/list/W = new()
						for(var/obj/Objects/Welder/I in usr.contents)
							if(I:icon_state == "Welder")
								if(I:icon_state == "Welder")
									W += I
						W += "Cancel"
						var/Sel = input(usr,"What do you want to do with the propane?",world.name)in W
						if(Sel == "Cancel")
							return
						else
							Sel:icon_state = "WelderP"
							Sel:Fuel = src.Fuel
							Sel:suffix = "Fuel Left: [Sel:Fuel]"
							del(src)


				Drop()
					set category = "Objects"
					if(usr.icon_state == "Alive")
						usr.contents.Remove(src)
						src.loc = usr.loc
						src.equiped = 0
						src.suffix = ""
		Wire_Cutters
			icon_state = "Wire Cutters"
			DblClick()
				if(usr.icon_state == "Alive")
					if(src in usr.contents)
						return
					else
						if(src in view(usr,1))
							usr.contents += src
			verb
				Use()
					set category = "Objects"
					if(usr.icon_state == "Alive")
						if(src.equiped == 1)
							src.equiped = 0
							src.suffix = ""
						else
							for(var/obj/Objects/O in usr.contents)
								if(O:name == "Welder")
									O:icon_state = "WelderP"
									O:suffix = "Fuel Left: [O:Fuel]"
								O:equiped = 0
								O:suffix = ""
							src.equiped = 1
							src.suffix = "Using"
				Drop()
					set category = "Objects"
					if(usr.icon_state == "Alive")
						usr.contents.Remove(src)
						src.loc = usr.loc
						src.equiped = 0
						src.suffix = ""
		Welder
			icon_state = "Welder"
			DblClick()
				if(usr.icon_state == "Alive")
					if(src in usr.contents)
						if(src.icon_state == "WelderP")
							src.icon_state = "Welder"
							var/obj/O = new /obj/Objects/Propane
							O:Fuel = src.Fuel
							src.Fuel = 0
							src.suffix = ""
							O:suffix = "Fuel: [O:Fuel]"
							usr.contents += O
					else
						if(src in view(usr,1))
							usr.contents += src
			verb
				Use()
					set category = "Objects"
					if(usr.icon_state == "Alive")
						if(src.icon_state == "WelderP"||src.icon_state == "UWelderP")
							if(src.equiped == 1)
								src.equiped = 0
								src.suffix = ""
								src.icon_state = "WelderP"
								src.suffix = "Fuel Left: [src.Fuel]"
							else
								for(var/obj/Objects/O in usr.contents)
									if(O:name == "Welder")
										O:icon_state = "WelderP"
										O:suffix = "Fuel Left: [O:Fuel]"
									O:equiped = 0
									O:suffix = ""
								src.equiped = 1
								src.icon_state = "UWelderP"
								src.suffix = "Using, Fuel Left: [src.Fuel]"
				Drop()
					set category = "Objects"
					if(usr.icon_state == "Alive")
						usr.contents.Remove(src)
						src.loc = usr.loc
						src.equiped = 0
						src.suffix = ""