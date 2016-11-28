turf
	Power_Line
		name = "Power Lines"
		icon = 'Turf.dmi'
		P1
			icon_state = "Power1"
			density = 1
		P2
			icon_state = "Power2"
			layer = MOB_LAYER+100
		P3
			icon_state = "Power3"
			layer = MOB_LAYER+100
		P4
			icon_state = "Power4"
			layer = MOB_LAYER+100

var
	Power = 1
proc
	Power()
		if(Power == 1)
			Power = 0
			for(var/turf/T in world)
				if(T:name == "Wall"||T:name == "Window"||T:name == "Tile"||T:name == "Door")
					T:overlays += new /obj/Dark(T)
					//var/icon/I = new(T:icon)
					//I.SetIntensity(0.5,0.5,0.5)
					//T:icon = I
			world<<sound('Spark.wav')
			world<<sound('Spark2.wav')
			world<<"<font color=red><b>*Hand Held Radio* Woman:<font color =blue> The power has been knocked out to all of Central Florida. Please, we advise <i>EVERYONE</i>  to stay inside! This hurricane will pass over soon enough."
			world<<sound('Interference.wav')
			if(prob(50))
				world<<"<font color=red><b>*Hand Held Radio* Woman:<font color =blue> An electrical fire has been started as a result of the power lines being hit!"
				Fire = 1
				for(var/turf/Power_Line/P1/P in world)
					var/obj/F = new /obj/Fire(P)
					F:loc = locate(P.x,P.y,P.z)