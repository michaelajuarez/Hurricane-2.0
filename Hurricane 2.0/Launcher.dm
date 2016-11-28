turf
	Launcher
		proc/Launch()
			if(GS == 1)
				if(prob(Can))
					var/obj/O = new /obj/Debris/Soda_Can(src)
					O:loc = locate(src.x,src.y,src.z)
				else
					if(prob(Tree))
						var/obj/O = new /obj/Debris/Tree(src)
						O:loc = locate(src.x,src.y,src.z)
					else
						if(prob(Car))
							var/obj/O = new /obj/Debris/Car(src)
							O:loc = locate(src.x,src.y,src.z)
		Enter(atom/a)
			if(ismob(a))
				return 0
			else
				return 1
	Deletion
		density = 1
	No_Mob
		Enter(atom/a)
			if(ismob(a))
				return 0
			else
				return 1