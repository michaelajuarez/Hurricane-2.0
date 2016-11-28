
obj
	Attire
		icon = 'Mob2.dmi'
		Shirts
			Black_Shirt
				icon_state = "blashirt"
				layer = 9
			Red_Shirt
				icon_state = "reshirt"
				layer = 9
			Blue_Shirt
				icon_state = "blushirt"
				layer = 9
			Orange_Shirt
				icon_state = "orshirt"
				layer = 9
			Yellow_Shirt
				icon_state = "yeshirt"
				layer = 9
			Green_Shirt
				icon_state = "greenshirt"
				layer = 9
			Grey_Shirt
				icon_state = "greyshirt"
				layer = 9
		Shoes
			Black_Shoes
				icon_state = "blashoe"
				layer = 9
			Brown_Shoes
				icon_state = "broshoe"
				layer = 9
		Hair
			Brown_Hair
				icon_state = "hair1 bro"
				layer = 9
			Blond_Hair
				icon_state = "hair1 blo"
				layer = 9
			Black_Hair
				icon_state = "hair1 bla"
				layer = 9
			Grey_Hair
				icon_state = "hair1 gre"
				layer = 9
			Orange_Hair
				icon_state = "hair1 gin"
				layer = 9
			Red_Hair
				icon_state = "hair1 red"
				layer = 9
mob
	var
		Hair
		Shoes
		Shirt
	verb
		Change_Shoe_Color()
			if(usr.icon_state == "Alive")
				var/list/Hair1 = new()
				Hair1 += "Black Shoes"
				Hair1 += "Brown Shoes"
				Hair1 += "Cancel"
				var/Sel = input(usr,"Select a shoe color you want to have.",world.name)in Hair1
				if(usr.icon_state == "Alive")
					if(Sel == "Cancel")
						return
					else
						switch(Sel)
							if("Black Shoes")
								if(usr.icon_state == "Alive")
									usr.Shoes = /obj/Attire/Shoes/Black_Shoes
							if("Brown Shoes")
								if(usr.icon_state == "Alive")
									usr.Shoes = /obj/Attire/Shoes/Brown_Shoes
				var/savefile/F = new("SaveFiles/[usr.key].sav")
				usr.overlays = 0
				usr.overlays += usr.Shirt
				usr.overlays += usr.Shoes
				usr.overlays += usr.Hair
				F["Shirt"] << usr.Shirt
				F["Hair"] << usr.Hair
				F["Shoes"] << usr.Shoes
		Change_Shirt_Color()
			if(usr.icon_state == "Alive")
				var/list/Hair1 = new()
				Hair1 += "Black Shirt"
				Hair1 += "Blue Shirt"
				Hair1 += "Green Shirt"
				Hair1 += "Grey Shirt"
				Hair1 += "Orange Shirt"
				Hair1 += "Red Shirt"
				Hair1 += "Yellow Shirt"
				Hair1 += "Cancel"
				var/Sel = input(usr,"Select a shirt color you want to have.",world.name)in Hair1
				if(usr.icon_state == "Alive")
					if(Sel == "Cancel")
						return
					else
						switch(Sel)
							if("Black Shirt")
								if(usr.icon_state == "Alive")
									usr.Shirt = /obj/Attire/Shirts/Black_Shirt
							if("Yellow Shirt")
								if(usr.icon_state == "Alive")
									usr.Shirt = /obj/Attire/Shirts/Yellow_Shirt
							if("Blue Shirt")
								if(usr.icon_state == "Alive")
									usr.Shirt = /obj/Attire/Shirts/Blue_Shirt
							if("Green Shirt")
								if(usr.icon_state == "Alive")
									usr.Shirt = /obj/Attire/Shirts/Green_Shirt
							if("Grey Shirt")
								if(usr.icon_state == "Alive")
									usr.Shirt = /obj/Attire/Shirts/Grey_Shirt
							if("Orange Shirt")
								if(usr.icon_state == "Alive")
									usr.Shirt = /obj/Attire/Shirts/Orange_Shirt
							if("Red Shirt")
								if(usr.icon_state == "Alive")
									usr.Shirt = /obj/Attire/Shirts/Red_Shirt
				var/savefile/F = new("SaveFiles/[usr.key].sav")
				usr.overlays = 0
				usr.overlays += usr.Shirt
				usr.overlays += usr.Shoes
				usr.overlays += usr.Hair
				F["Shirt"] << usr.Shirt
				F["Hair"] << usr.Hair
				F["Shoes"] << usr.Shoes
		Change_Hair_Color()
			if(usr.icon_state == "Alive")
				var/list/Hair1 = new()
				Hair1 += "Black Hair"
				Hair1 += "Blond Hair"
				Hair1 += "Brown Hair"
				Hair1 += "Grey Hair"
				Hair1 += "Orange Hair"
				Hair1 += "Red Hair"
				Hair1 += "Cancel"
				var/Sel = input(usr,"Select a hair color you want to have.",world.name)in Hair1
				if(usr.icon_state == "Alive")
					if(Sel == "Cancel")
						return
					else
						switch(Sel)
							if("Black Hair")
								if(usr.icon_state == "Alive")
									usr.Hair = /obj/Attire/Hair/Black_Hair
							if("Blond Hair")
								if(usr.icon_state == "Alive")
									usr.Hair = /obj/Attire/Hair/Blond_Hair
							if("Brown Hair")
								if(usr.icon_state == "Alive")
									usr.Hair = /obj/Attire/Hair/Brown_Hair
							if("Grey Hair")
								if(usr.icon_state == "Alive")
									usr.Hair = /obj/Attire/Hair/Grey_Hair
							if("Orange Hair")
								if(usr.icon_state == "Alive")
									usr.Hair = /obj/Attire/Hair/Orange_Hair
							if("Red Hair")
								if(usr.icon_state == "Alive")
									usr.Hair = /obj/Attire/Hair/Red_Hair
				var/savefile/F = new("SaveFiles/[usr.key].sav")
				usr.overlays = 0
				usr.overlays += usr.Shirt
				usr.overlays += usr.Shoes
				usr.overlays += usr.Hair
				F["Shirt"] << usr.Shirt
				F["Hair"] << usr.Hair
				F["Shoes"] << usr.Shoes
