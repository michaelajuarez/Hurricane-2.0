var
	Direction = pick(NORTH,SOUTH,EAST,WEST,NORTHEAST,NORTHWEST,SOUTHEAST,SOUTHWEST)
	GS = 0
	Host = null
	//<--Time-->
	M = 9
	S1 = 5
	S2 = 9
	Mode = "Hurricane"
	Hr = 4
	St = 5.5
	Fire = 0
	Flood = 0
	GS1 = 5
	GS2 = 9
	BM = 5
	BS1 = 5
	BS2 = 9
	BYOSS = 0
	BYOSSt = 0
	Version = "Hurricane 2.0.4"
	T2 = "Inf."


//#include <dantom/hublib>

world
	hub = "FinalFantasyFreak.Hurricane"
	New()
		sleep(50)
		world<<"<b>The game will start in one minute!"
		CD
		sleep(10)
		GS2-=1
		if(GS2 < 0)
			GS1 -= 1
			GS2 = 9
			if(GS1 < 0)
				goto Mcheck
		goto CD
		Mcheck
		world<<"<font color =green><b>The current mode is [Mode]!"
		if(Mode == "BYOS")
			BYOSS = 1
			world:status = "<font color=red><b>[Version]||Host: [Host]||Building in \"Build Your Own Shelter\" Mode</b></font>"
			for(var/mob/M in world)
				M.loc = locate(M.x,M.y,2)
				var/counter1 = 0
				var/counter2 = 0
				for(var/obj/BYOS/Metal/M1 in M.contents)
					counter1 = 1
					M1:Num += 100
					M1:suffix = "[M1:Num]"
					M1:icon_state = "Metal"
				for(var/obj/BYOS/Glass/M1 in M.contents)
					counter2 = 1
					M1:Num += 50
					M1:suffix = "[M1:Num]"
					M1:icon_state = "Glass"
				if(counter1 == 0)
					var/obj/O1 = new /obj/BYOS/Metal
					O1:Num = 100
					O1:suffix = "100"
					M.contents += O1
				if(counter2 == 0)
					var/obj/O2 = new /obj/BYOS/Glass
					O2:Num = 50
					O2:suffix = "50"
					M.contents += O2
				var/obj/O = new /obj/Objects/Propane
				O:Fuel = 10
				O:suffix = "Fuel: [O:Fuel]"
				M.contents += O
				var/obj/O1 = new /obj/Objects/Propane
				O1:Fuel = 10
				O1:suffix = "Fuel: [O:Fuel]"
				M.contents += O1
				M.contents += new /obj/Objects/Wire_Cutters(usr)
				M.contents += new /obj/Objects/Welder(usr)
			Loop2
			sleep(10)
			BYOSSt = 1
			BS2 -= 1
			if(BM == 0 && BS1 == 0 && BS2 == 0)
				BYOSSt = 0
				goto Start
			else
				if(BS2 == 0)
					BS1 -= 1
					BS2 = 9
					if(BS1 < 0)
						BM -= 1
						BS1 = 5
				goto Loop2
		else
			goto Start
		Start
		world<<"<b>The game has started!"
		GS = 1
		if(Mode == "BYOS")
			world:status = "<font color=red><b>[Version]||Host: [Host]||Mode: Build Your Own Shelter</b></font>"
		else
			world:status = "<font color=red><b>[Version]||Host: [Host]||Mode: [Mode]</b></font>"
		for(var/turf/T in world)
			if(T:name == "Wall"||T:name == "Window"||T:name == "Tile"||T:name == "Door")
				..()
			else
				if(/obj/Rain in view(T,0))
					..()
				else
					var/obj/O = new /obj/Rain(T)
					O:dir = Direction
					O:loc = locate(T.x,T.y,T.z)
		for(var/obj/Rain/R in world)
			for(var/obj/Rain/T in oview(R,1))
				if(get_dir(R,T)==Direction)
					R:Use = 0
		//world<<sound("Rain.ogg",1,volume=100)
		loop
		sleep(5)
		Hr-=1
		if(Hr == 0)
			Hr = 4
			world<<sound('Hurricane.wav')
		St-=0.5
		if(St == 0)
			St = 5.5
			world<<sound('Storm.wav')
		if(Mode == "Last Man Standing")
			var/counter = 0
			for(var/mob/M in world)
				if(M.icon_state == "Alive")
					counter += 1
			if(counter <= 1)
				goto End
			else
				if(prob(0.5))
					if(Flood == 0)
						world<<"<font color=red><b>*Hand Held Radio* Woman:<font color =blue> Most of Central Florida has now begun to flood! You heard right, not just one county, but many!"
						world<<sound('Interference.wav')
						Flood = 1
						for(var/turf/Flood_Start/P in world)
							var/obj/F = new /obj/Flood(P)
							F:loc = locate(P.x,P.y,P.z)
		else
			S2 -= 1
			if(M == 0 && S1 == 0 && S2 == 0)
				goto End
			else
				if(S2 == 0)
					S1 -= 1
					S2 = 9
					if(S1 < 0)
						M -= 1
						S1 = 5
			if(M == 3 && S1 == 5 && S2 == 9)
				world<<"<font color=red><b>*Hand Held Radio* Woman:<font color =blue> There is a possibility that a flooding may occur in the following county's; Orange, Osceola, Seminole, Volusia, Flagler an Lake. I repeat, there is a flood watch in the following county's; Orange, Osceola, Seminole, Volusia, Flagler an Lake."
				world<<sound('Interference.wav')
			if(M == 2 && S1 == 5 && S2 == 9)
				if(prob(50))
					world<<"<font color=red><b>*Hand Held Radio* Woman:<font color =blue> Most of Central Florida has now begun to flood! You heard right, not just one county, but many!"
					world<<sound('Interference.wav')
					Flood = 1
					for(var/turf/Flood_Start/P in world)
						var/obj/F = new /obj/Flood(P)
						F:loc = locate(P.x,P.y,P.z)
		if(prob(5))
			world<<sound('Thunder.wav')
		for(var/turf/Launcher/L in world)
			L:Launch()
		if(Fire == 1)
			for(var/obj/Fire/F in world)
				F:CCheck()
				if(F:icon_state == "Fire")
					F:Cont()
		if(Flood == 1)
			for(var/obj/Flood/F in world)
				F:CCheck()
				if(F:icon_state == "Water")
					F:Cont()
		for(var/obj/Rain/R in world)
			if(R:Use == 1)
				for(var/turf/T in view(R,1))
					if(get_dir(R,T)==Direction)
						if(T.density == 1||T.opacity == 1)
							if(T.name == "Door")
								R:Spread()
							else
								..()
						else
							R:Spread()
		for(var/obj/Debris/T in world)
			var/Dir = Direction
			T:dir = Dir
			if(Dir == SOUTH)
				if(prob(20))
					step(T,SOUTHEAST)
				else
					if(prob(20))
						step(T,SOUTHWEST)
			if(Dir == NORTH)
				if(prob(20))
					step(T,NORTHEAST)
				else
					if(prob(20))
						step(T,NORTHWEST)
			if(Dir == EAST)
				if(prob(20))
					step(T,NORTHEAST)
				else
					if(prob(20))
						step(T,SOUTHEAST)
			if(Dir == WEST)
				if(prob(20))
					step(T,NORTHWEST)
				else
					if(prob(20))
						step(T,SOUTHWEST)
			if(Dir == SOUTHWEST)
				if(prob(20))
					step(T,WEST)
				else
					if(prob(20))
						step(T,SOUTH)
			if(Dir == SOUTHEAST)
				if(prob(20))
					step(T,EAST)
				else
					if(prob(20))
						step(T,SOUTH)
			if(Dir == NORTHEAST)
				if(prob(20))
					step(T,EAST)
				else
					if(prob(20))
						step(T,NORTH)
			if(Dir == NORTHWEST)
				if(prob(20))
					step(T,WEST)
				else
					if(prob(20))
						step(T,NORTH)
		sleep(5)
		St-=0.5
		if(St == 0)
			St = 5.5
			world<<sound('Storm.wav')
		for(var/obj/Debris/T in world)
			var/Dir = Direction
			T:dir = Dir
			if(Dir == SOUTH)
				if(prob(20))
					step(T,SOUTHEAST)
				else
					if(prob(20))
						step(T,SOUTHWEST)
			if(Dir == NORTH)
				if(prob(20))
					step(T,NORTHEAST)
				else
					if(prob(20))
						step(T,NORTHWEST)
			if(Dir == EAST)
				if(prob(20))
					step(T,NORTHEAST)
				else
					if(prob(20))
						step(T,SOUTHEAST)
			if(Dir == WEST)
				if(prob(20))
					step(T,NORTHWEST)
				else
					if(prob(20))
						step(T,SOUTHWEST)
			if(Dir == SOUTHWEST)
				if(prob(20))
					step(T,WEST)
				else
					if(prob(20))
						step(T,SOUTH)
			if(Dir == SOUTHEAST)
				if(prob(20))
					step(T,EAST)
				else
					if(prob(20))
						step(T,SOUTH)
			if(Dir == NORTHEAST)
				if(prob(20))
					step(T,EAST)
				else
					if(prob(20))
						step(T,NORTH)
			if(Dir == NORTHWEST)
				if(prob(20))
					step(T,WEST)
				else
					if(prob(20))
						step(T,NORTH)
		goto loop
		End
		if(Mode == "Last Man Standing")
			..()
		else
			world<<"<font color=red><b>*Hand Held Radio* Woman:<font color =blue> The hurricane has finally passed over Central Florida! Help should be coming soon."
			world<<sound('Interference.wav')
		var/scores[0]
		world<<"<b>These players have survived:"
		for(var/mob/M in world)
			if(M.icon_state == "Alive")
				world<<"[M]"
				scores[M] = 1
			else
				scores[M] = 0
		/*if(scores.len <= 1)
			..()
		else
			byondhub.ReportScores(scores)*/
		sleep(10)
		world<<"<font color =red><i>Rebooting in 10 seconds!"
		sleep(100)
		world.Reboot()


mob
	var/LoggedIn = 0
	var/Owner
	Logout()
		if(usr.LoggedIn == 1)
			usr.LoggedIn = 0
			world<<"<b>[usr] has logged out!"
		else
			del(usr)
	Login()
		if(Host == null)
			Host = usr
			world:status = "<font color=red><b>[Version]||Host: [Host]||STARTING</b></font>"
		usr<<"<b><font color =green> The current version of this game is [Version]!"
		if(ban.Find(src.client.address))
			src << "<b>You are round banned."
			del (src)
		if(Host == usr||usr.key=="Artemio"||usr.key == "FinalFantasyFreak"||usr.key == "Pala"||usr.key == "Kiose0"||usr.key == "Stealthfighter721")
			usr.verbs += /mob/Admin/verb/Set_Difficulty
			usr.verbs += /mob/Admin/verb/Select_Mode
			usr.verbs += /mob/Admin/verb/Announce
			usr.verbs += /mob/Admin/verb/Boot
			usr.verbs += /mob/Admin/verb/Round_Ban
			//usr.verbs += /mob/Admin/verb/UnBan
			usr.verbs += /mob/Admin/verb/See_The_Dead
			usr.verbs += /mob/Admin/verb/Reboot
			usr.verbs += /mob/Admin/verb/Mute
			//usr.verbs += /mob/Admin/verb/Listen_To_The_Dead
			//usr.verbs += /mob/Admin/verb/Direction_of_the_Wind
		world<<"<b>[usr] has logged in!"
		usr << browse(Story,"Story")
		var/counter = 0
		for(var/mob/M in world)
			if(M.Owner == usr.key)
				counter = 1
				usr = M
				if(usr.icon_state == "Alive")
					usr.density = 1
				else
					usr.density = 0
				usr.LoggedIn = 1
		if(counter == 0)
			var/Sel = alert(usr,"Welcome to [world.name].",world.name,"Join Game","Observe","Quit")
			switch(Sel)
				if("Join Game")
					usr.Owner = usr.key
					usr.LoggedIn = 1
					usr.loc = locate(23,32,1)
					if(Mode == "BYOS"&&BYOSS==1)
						src.loc = locate(src.x,src.y,2)
						var/counter1 = 0
						var/counter2 = 0
						for(var/obj/BYOS/Metal/M1 in usr.contents)
							M1:Num += 100
							M1:suffix = "[M1:Num]"
							M1:icon_state = "Metal"
						for(var/obj/BYOS/Glass/M1 in usr.contents)
							M1:Num += 50
							M1:suffix = "[M1:Num]"
							M1:icon_state = "Glass"
						if(counter1 == 0)
							var/obj/O1 = new /obj/BYOS/Metal
							O1:Num = 100
							O1:suffix = "100"
							usr.contents += O1
						if(counter2 == 0)
							var/obj/O2 = new /obj/BYOS/Glass
							O2:Num = 50
							O2:suffix = "50"
							usr.contents += O2
						var/obj/O = new /obj/Objects/Propane
						O:Fuel = 10
						O:suffix = "Fuel: [O:Fuel]"
						usr.contents += O
						var/obj/O1 = new /obj/Objects/Propane
						O1:Fuel = 10
						O1:suffix = "Fuel: [O:Fuel]"
						usr.contents += O1
						usr.contents += new /obj/Objects/Wire_Cutters(usr)
						usr.contents += new /obj/Objects/Welder(usr)
					//usr<<sound('Wind.ogg',1,volume=50)
					var/savefile/F = new("SaveFiles/[usr.key].sav")
					//F["YA"] >> usr.YA
					//F["NA"] >> usr.NA
					F["Shirt"] >> usr.Shirt
					F["Hair"] >> usr.Hair
					F["Shoes"] >> usr.Shoes
					if(usr.Shirt == null)
						usr.Shirt = /obj/Attire/Shirts/Black_Shirt
					if(usr.Shoes == null)
						usr.Shoes = /obj/Attire/Shoes/Black_Shoes
					if(usr.Hair == null)
						usr.Hair = /obj/Attire/Hair/Black_Hair
					usr.overlays += usr.Shirt
					usr.overlays += usr.Hair
					usr.overlays += usr.Shoes
					usr.icon = 'Mob2.dmi'
					usr.icon_state = "Alive"
					world<<"<font color=blue><b>[usr] has joined the game!"
					usr<<"<font color =red><b>*You have received a Hand Held Radio*"
					usr.client.screen += new/obj/Hud/Open
				if("Observe")
					usr.Owner = usr.key
					usr.LoggedIn = 1
					world << "<i>[usr] is observing!"
					usr.loc = locate(23,32,1)
					if(Mode == "BYOS"&&BYOSS==1)
						src.loc = locate(src.x,src.y,2)
					//usr<<sound('Wind.ogg',1,volume=50)
					usr.Health = 0
					src.invisibility = 100
					src.see_invisible = 100
					src.density = 0
					src.overlays = 0
					usr.icon = 'Mob2.dmi'
					src.icon_state = "Dead"
				if("Quit")
					del(usr)