client
	North()
		if(usr.icon_state == "Alive")
			if(usr.Shiv == 1)
				return
			else
				..()
		else
			..()
	South()
		if(usr.icon_state == "Alive")
			if(usr.Shiv == 1)
				return
			else
				..()
		else
			..()
	East()
		if(usr.icon_state == "Alive")
			if(usr.Shiv == 1)
				return
			else
				..()
		else
			..()
	West()
		if(usr.icon_state == "Alive")
			if(usr.Shiv == 1)
				return
			else
				..()
		else
			..()
	Northeast()
		if(usr.icon_state == "Alive")
			if(usr.Shiv == 1)
				return
			else
				..()
		else
			..()
	Northwest()
		if(usr.icon_state == "Alive")
			if(usr.Shiv == 1)
				return
			else
				..()
		else
			..()
	Southeast()
		if(usr.icon_state == "Alive")
			if(usr.Shiv == 1)
				return
			else
				..()
		else
			..()
	Southwest()
		if(usr.icon_state == "Alive")
			if(usr.Shiv == 1)
				return
			else
				..()
		else
			..()
mob
	var/Hypo = 0
	var/Temp = 98.6
	var/Action = "Enter"
	Move()
		if(usr.icon_state == "Alive")
			if(usr.Hypo == 0)
				if(usr.Stamina <= 0)
					return
				else
					usr.dismantling = 0
					usr.DismantlingS = null
					usr.Stamina -= 0.5
					for(var/obj/Flood/F in view(usr,0))
						if(F:icon_state == "Water")
							usr.Stamina -= 7
							if(usr.Stamina <= 0)
								usr<<"<font color =red><b>You have drowned to death!"
								usr.Health = 0
								usr.DeathC()
					for(var/obj/Rain/F in view(usr,0))
						if(F:icon_state == "Water")
							usr.Stamina -= 1
					..()
			else
				..()
		else
			..()
	var
		Health = 100
		dismantling = 0
		DismantlingS = 0
		Step = 0
		Stamina = 100
		S = 5
		Shiv = 0
	proc
		DeathC()
			if(src.Health<=0)
				src.invisibility = 100
				src.see_invisible = 100
				src.density = 0
				src.overlays = 0
				src.icon_state = "Dead"
				world<<"<font color=red><b>[src] has died!"
				src<<"<font color=red><i>You have died!"
	Stat()
		if(usr.icon_state == "Alive")
			usr.Temp += 2
			if(usr.Temp > 98.6)
				usr.Temp = 98.6
			usr.Stamina += 2
			if(usr.Stamina > 100)
				usr.Stamina = 100
			var/C = 1
			var/counter = 0
			if(Shiv == 0)
				if(usr.Temp <= 97)
					if(prob(30))
						usr.Shiv = 1
						view(usr)<<"<font color =green><b>*[usr] shivers.*"
			else
				usr.S -= 1
				if(usr.S == 0)
					usr.S = 5
					usr.Shiv = 0
			for(var/obj/Rain/R in view(src,0))
				counter = 1
				C = 0
				var/ST = usr.Temp - 2
				usr.Temp -= 2.05
				if((usr.Temp <= 95) && (ST >= 95))
					usr<<"<font color =blue><b>Your core temeperature has dropped below 95 degrees F, you have gone into Hypothermic shock."
					usr.Hypo = 1
				if((usr.Temp <= 90))
					if(prob(5))
						usr<<"<font color =blue><b>Your core body temperature has dropped too low, you have drowned to death while in shock."
						usr.Hypo = 0
						usr.Health = 0
						usr.DeathC()
			if(usr.icon_state == "Alive")
				if(counter == 1)
					usr.Step +=1
					if(usr.Step == 2)
						usr.Step = 0
						step(usr,Direction)
				for(var/obj/Fire/F in view(usr,0))
					if(F:icon_state == "Fire")
						usr.Health -= 5
						usr<<"<font color =red><b>You have been burnt!"
						usr.DeathC()
				for(var/obj/Flood/F in view(usr,0))
					if(F:icon_state == "Water")
						usr.Stamina -= 2.5
						if(usr.Stamina <= 0)
							usr<<"<font color =red><b>You have drowned to death!"
							usr.Health = 0
							usr.DeathC()
						else
							C = 0
							var/ST = usr.Temp - 2
							usr.Temp -= 2.1
							if((usr.Temp <= 95) && (ST >= 95))
								usr<<"<font color =blue><b>Your core temeperature has dropped below 95 degrees F, you have gone into Hypothermic shock."
								usr.Hypo = 1
							if((usr.Temp <= 90))
								if(prob(5))
									usr<<"<font color =blue><b>Your core body temperature has dropped too low, you have drowned to death while in shock."
									usr.Hypo = 0
									usr.Health = 0
									usr.DeathC()
			if(C == 1)
				usr.Hypo = 0
		statpanel("Information")
		stat("Health:","[Health]%")
		stat("Stamina:","[Stamina]%")
		stat("Temperature:","[Temp] F")
		stat("")
		stat("Action:",usr.Action)
		stat("")
		if(GS == 1)
			if(Mode == "Last Man Standing")
				stat("Time Left:","[T2]")
			else
				stat("Time Left:","[M]:[S1][S2]")
		else
			if(Mode == "BYOS" && BYOSSt == 1)
				stat("Game Starts In:","[BM]:[BS1][BS2]")
			else
				stat("Game Starts In:","0:[GS1][GS2]")
		stat("")
		stat("Mode:",Mode)
		stat("Difficulty:",D)
		statpanel("Inventory",usr.contents)
		statpanel("Who")
		var/Counter = 0
		for(var/mob/M in world)
			if(!M.key)
				..()
			else
				Counter+=1
				var/a
				if(M.icon_state == "Alive")
					a = "Alive"
				else
					a = "Dead"
				stat(M.key,"([a])")
		stat("Players:",Counter)

mob
	Bump(atom/a)
		if(ismob(a))
			if(a:name == "Helicopter")
				return
			else
				if(usr.icon_state == "Alive")
					if(usr.Action == "Enter")
						usr.loc = a.loc
					else
						if(usr.Action == "Push")
							step(a,usr.dir)
				else
					usr.loc = a.loc
		else
			return
	Bubble
		icon = 'Mob2.dmi'
		icon_state = "Bubble"


client
	preload_rsc = 2
	command_text = "> "
	verb/command(C as command_text)
		set name = ">"
		set hidden = 1
		var/mob/B = new/mob/Bubble
		var/T = "[html_encode(C)]"
		if(usr.Mute == 0)
			world << "<a href='?Private Message [src]'>\icon[B]</a> <b>[usr]: </b>[copytext("[T]",1,255)]"
mob/verb
	Say(C as text)
		var/mob/B = new/mob/Bubble
		var/T = "<font color =red><i>[html_encode(C)]"
		if(usr.Mute == 0)
			if(usr.icon_state == "Alive")
				view(usr) << "<font color =blue><b><i><a href='?Private Message [src]'>\icon[B]</a>*Say* [usr]:</b> [copytext("[T]",1,255)]"
			else
				if(usr.icon_state == "Dead")
					for(var/mob/M in world)
						if(M.icon_state == "Dead")
							M << "<font color =blue><b><i><a href='?Private Message [src]'>\icon[B]</a> <b>*Dead* [usr]:</font> <font color=red></b>[copytext("[T]",1,255)]"

