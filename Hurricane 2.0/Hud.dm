obj
	Hud
		icon = 'Hud.dmi'
		Open
			icon_state = "Open"
			layer = MOB_LAYER+1000000
			New()
				set src in usr.client.screen
				src.screen_loc = "1,1"
			DblClick()
				usr.client.screen += new/obj/Hud/Enter
				usr.client.screen += new/obj/Hud/Push
				usr.client.screen += new/obj/Hud/Close
				usr.client.screen += new/obj/Hud/Select
				del(src)
		Close
			icon_state = "Close"
			layer = MOB_LAYER+1000000
			New()
				set src in usr.client.screen
				src.screen_loc = "3,1"
			DblClick()
				usr.client.screen = null
				usr.client.screen += new/obj/Hud/Open
		Enter
			icon_state = "Enter"
			layer = MOB_LAYER+1000000
			New()
				set src in usr.client.screen
				src.screen_loc = "1,1"
			DblClick()
				usr.Action = "Enter"
				for(var/obj/Hud/Select/S in usr.client.screen)
					del(S)
				usr.client.screen += new/obj/Hud/Select
		Push
			icon_state = "Push"
			layer = MOB_LAYER+1000000
			New()
				set src in usr.client.screen
				src.screen_loc = "2,1"
			DblClick()
				usr.Action = "Push"
				for(var/obj/Hud/Select/S in usr.client.screen)
					del(S)
				usr.client.screen += new/obj/Hud/Select
		Select
			icon_state = "Sel"
			layer = MOB_LAYER+1000000
			New()
				set src in usr.client.screen
				if(usr.Action == "Push")
					src.screen_loc = "2,1"
				else
					if(usr.Action == "Enter")
						src.screen_loc = "1,1"