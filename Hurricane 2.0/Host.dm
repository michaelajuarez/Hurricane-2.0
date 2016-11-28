var
	D = "Easy"
	Car = 3
	Tree = 5
	Can = 3
mob
	var
		Mute = 0
mob/Admin/
	verb
		Set_Difficulty()
			set category = "Administrative"
			if(GS == 0)
				D = input(usr, "Please select a difficulty to set the game to.",world.name)in list("Easy","Medium","Hard","Hell Hath No Fury Like a Hurricane")
				switch(D)
					if("Easy")
						Can = 3
						Tree = 5
						Car = 3
					if("Medium")
						Can = 3
						Tree = 10
						Car = 5
					if("Hard")
						Can = 3
						Tree = 15
						Car = 10
					if("Hell Hath No Fury Like a Hurricane")
						Can = 25
						Tree = 25
						Car = 25
				world<<"<b><font color =blue>The current difficulty has been changed to \"[D]!\""
		Select_Mode()
			set category = "Administrative"
			var/Sel = input(usr,"Select a game mode.",world.name)in list("Hurricane","Build Your Own Shelter","Last Man Standing")
			if(GS == 0)
				switch(Sel)
					if("Hurricane")
						Mode = "Hurricane"
						world<<"<b><font color =blue>The current selected mode is [Mode]!"
					if("Build Your Own Shelter")
						Mode = "BYOS"
						world<<"<b><font color =blue>The current selected mode is Build Your Own Shelter!"
					if("Last Man Standing")
						Mode = "Last Man Standing"
						world<<"<b><font color =blue>The current selected mode is [Mode]!"
		Announce(t as message)
			set category = "Administrative"
			world<<"<font color = blue><b>*Announce* [usr.key] : [t]"
		Boot(var/mob/M in world)
			set category = "Administrative"
			if(!M:key)
				return
			else
				if(M:key == "FinalFantasyFreak")
					usr<<"<font color =red>-=Error=- You cannot boot the creator of [world.name]."
				else
					if(M:key == Host)
						usr<<"<font color =red>-=Error=- You cannot boot the Host."
					else
						var/mob/M2 = new /mob/
						M2 = M
						M2.Owner = usr.key
						M2.loc = M.loc
						world<<"<font color =red><b>[usr] has booted [M]!"
						del(M)
		UnBan()
			set category = "Administrative"
			var/check_letter=1
			banlist+="Cancel"
			var/T=input("Which address would you like to unban?")in banlist
			if(T=="Cancel"){return}
			world<<"<b>[usr] has unbanned [T]!"
			var/banip
			start
			if(copytext(T,check_letter,check_letter+1)=="-")
				goto unban
			else
				banip+=copytext(T,check_letter,check_letter+1)
				check_letter+=1
				goto start
			unban
			ban.Remove(banip)
		Round_Ban(mob/M in world)
			set category = "Administrative"
			var/list/peoples
			if(M:key == "FinalFantasyFreak")
				return
			else
				if(M:key == Host)
					return
				else
					if(M.client)
						peoples+=M
					M<<"<b>You have been round banned."
					world<<"<b>[usr] has round banned [M]!"
					banlist+=M.key
					var/mob/M2 = new/mob/
					M2 = M
					M2.Owner = usr.key
					M2.loc = M.loc
					del(M)
		Mute(var/mob/M in world)
			set category = "Administrative"
			if(M.Mute == 0)
				world<<"<font color =blue><i>[usr] has muted [M]!"
				M.Mute = 1
			else
				world<<"<font color =blue><i>[usr] has un-muted [M]!"
				M.Mute = 0
		See_The_Dead()
			set category = "Administrative"
			usr.see_invisible = 100
		Reboot()
			set category = "Administrative"
			var/S = input(usr,"Are you sure that you want to reboot?","Reboot?")in list("Yes","No")
			if(S == "Yes")
				world<<"<font color =green><b>The world is now rebooting!"
				sleep(100)
				world.Reboot()
			else
				return
		Direction_of_the_Wind()
			set category = "Administrative"
			usr<<"<font color =blue>The direction of the wind : [Direction]."
			/*Ghost_Mode()
				set category = "Administrative"
				if(usr.icon_state == "Alive")
					usr.icon_state = "Dead"
					usr.density = 0
					usr.invisibility = 100
					usr.see_invisible = 100
					usr.overlays = 0
				else
					usr.icon_state = "Alive"
					usr.density = 1
					usr.invisibility = 0
					usr.overlays += usr.Shirt
					usr.overlays += usr.Shoes
					usr.overlays += usr.Hair*/
var/list{ban=list();banlist=list()}
