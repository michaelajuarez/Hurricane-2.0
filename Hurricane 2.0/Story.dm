//<----------General---------->

var/const/Story = {"
<html>
<meta http-equiv="Page-Enter" content="blendtrans(duration=3.0)">
<style
type="text/css">BODY { color: white; background: #000000 url(http://i6.photobucket.com/albums/y247/PojoZell/T.jpg) fixed; margin-right: 0px; margin-left: 0px; cursor:crosshair }
img { border: 0px; } a:link, a:visited {color: #FFFF00; text-decoration: ;cursor:crosshair } a:hover { color: #FFFF00; text-decoration: underline overline; cursor:crosshair; font-size:14pt }</style>
<style>
body{font-family:arial;}
table{}
a{}
a:hover{}
td.menu{}
table.menu
{
font-size:100%;
position:absolute;
visibility:hidden;
}
</style>
<script type="text/javascript">
function showmenu(elmnt)
{
document.getElementById(elmnt).style.visibility="visible"
}
function hidemenu(elmnt)
{
document.getElementById(elmnt).style.visibility="hidden"
}
</script>
<center><a href='http://games.byond.com/hub/FinalFantasyFreak/Hurricane' target=_self><img src='http://games.byond.com/banners/11236.png' alt='' border=0></a> <br>by <i><a href=http://games.byond.com/people/FinalFantasyFreak>FinalFantasyFreak</a></i></center>
<p><p><center>
<table width="0%">
 <tr>
  <td onmouseover="showmenu('General')" onmouseout="hidemenu('General')">
   <a href=?reference=Story'>General</a><br />
   <table class="menu" id="General" width="120">
   </table>
  </td>
  <td onmouseover="showmenu('Updates')" onmouseout="hidemenu('Updates')">
   <a href='?reference=Updates'>Updates</a><br />
   <table class="menu" id="Updates" width="120">
   </table>
  </td>
  <td onmouseover="showmenu('Help')" onmouseout="hidemenu('Help')">
   <a href='?reference=Help'>Help<br />
   <table class="menu" id="Help" width="200">
   <tr><td class="menu">> <a href='?reference=Functions'>Functions</a></td></tr>
   <tr><td class="menu">> <a href='?reference=UsingObjects'>Using Objects</a></td></tr>
   <tr><td class="menu">> <a href='?reference=Hud Commands'>Hud Commands</a></td></tr>
   </table>
  </td>
 </tr>
</table>
</center>
<p><p>
<b>Story:</b>
<p>
The year is 2015; hurricanes of increasing magnitude, starting in the year 2004, have been forming during the hurricane season each year. Topping scales of 300 MPH, in which the National Oceanic and Atmospheric Administration still refuses the classify these hurricanes as “Mega Hurricane's” (following the trend done for Mega Volcano's and Mega Earthquake's). Therefore they're still considered a mere Category 5 hurricane.
<p>
They have, however, determined that the cause for the sudden increase in size and wind speed has been due to the increase in global warming over recent years, though world leaders refuse to take action. As a result, many hurricane shelters were funded for by various government agencies such as the Federal Emergency Management Agency (FEMA) and erected at selected locations that are potential victims for hurricanes. Most are located in southern Georgia, all throughout Florida and bordering states in the Gulf of Mexico. They were designed to be safe havens during Hurricane's and generally be well supplied.
<p>
Advancements in technology have since been invented as well, such as the Doppler 13000 which has the ability to predict, 95% of the time, the direct path of hurricane's and the U.S. Government could then safely evacuate the probable ”hit” areas of the hurricane.
<p>
All seemed to be going rather well. However, one little fact had been left out of all previous equations:     Traffic. For most people, the first thing they do when they here that a hurricane is predicted to hit their area and that the government plans to evacuate is panic. They all try leaving at once, with or without the evacuation in process yet. Because of this, it leaves many people stranded in the predicted danger zone, who are -- starting when this first incident occurred -- then directed to hurricane shelters. And with the increasing wind speeds of the hurricane's, this almost meant certain death for more than half of the people forced to stay back.
<p><p>
<b>Scenario:</b>
<p>
And so our story begins. You're in one of the various predicaments, being forced to stay behind and try and withstand the hurricane's mighty force. You are a resident of Central Florida (Of the United States of America) -- of Orange County to be exact. There being only one hurricane shelter in your district, many people are forced to be crammed in along with you. Luckily, however, you location is only expected to get the edge of the hurricane for roughly 10 grueling minutes, at which the speeds are only 200 MPH compared to near the  Eye of the storm, estimated to be around 325 MPH (topping the record book)!
<p>
You must survive by any means possible, however you may not like them.
<p>
Good luck!

</body>
</html>
"}

//<----------Other---------->

client/proc/Story()
   usr << browse(Story,"Story")
mob/proc/Help()
   usr << browse(Help,"Help")
client/Topic(href,href_list[])
	if(href_list["reference"])
		switch(href_list["reference"])
			if("Help")
				mob << browse(Help,"Help")
			if("Story")
				mob << browse(Story,"Story")
			if("Updates")
				mob << browse(Updates,"Updates")
			if("Functions")
				mob << browse(Functions,"Functions")
			if("UsingObjects")
				src.Obj()
			if("Hud Commands")
				src.Hud()
	else
		var/T = copytext(href,1,16)
		var/T2 = copytext(href,17)
		if(T == "Private Message")
			var/PM = input(usr,"Private Message(PM) [T2].",world.name)as null|text
			if(PM == null)
				..()
			else
				var/mob/B = new/mob/Bubble
				for(var/mob/M in world)
					if(M.key == T2)
						M<<"<a href='?Private Message [usr]'>\icon[B]</a> <font color =green><b>\[PM] {Received from}<font color =blue> [usr] <font color =black>>> </b> [PM]"
				usr<<"<a href='?Private Message [T2]'>\icon[B]</a> <font color =green><b>\[PM] {Sent to}<font color =blue> [T2] <font color =black><< </b> [PM]"


//<----------Updates---------->

var/const/Updates = {"
<html>
<meta http-equiv="Page-Enter" content="blendtrans(duration=3.0)">
<style
type="text/css">BODY { color: white; background: #000000 url(http://i6.photobucket.com/albums/y247/PojoZell/T.jpg) fixed; margin-right: 0px; margin-left: 0px; cursor:crosshair }
img { border: 0px; } a:link, a:visited {color: #FFFF00; text-decoration: ;cursor:crosshair } a:hover { color: #FFFF00; text-decoration: underline overline; cursor:crosshair; font-size:14pt }</style>
<style>
body{font-family:arial;}
table{}
a{}
a:hover{}
td.menu{}
table.menu
{
font-size:100%;
position:absolute;
visibility:hidden;
}
</style>
<script type="text/javascript">
function showmenu(elmnt)
{
document.getElementById(elmnt).style.visibility="visible"
}
function hidemenu(elmnt)
{
document.getElementById(elmnt).style.visibility="hidden"
}
</script>
<center><a href='http://games.byond.com/hub/FinalFantasyFreak/Hurricane' target=_self><img src='http://games.byond.com/banners/11236.png' alt='' border=0></a> <br>by <i><a href=http://games.byond.com/people/FinalFantasyFreak>FinalFantasyFreak</a></i></center>
<p><p><center>
<table width="0%">
 <tr>
  <td onmouseover="showmenu('General')" onmouseout="hidemenu('General')">
   <a href='?reference=Story'>General</a><br />
   <table class="menu" id="General" width="120">
   </table>
  </td>
  <td onmouseover="showmenu('Updates')" onmouseout="hidemenu('Updates')">
   <a href='?reference=Updates'>Updates</a><br />
   <table class="menu" id="Updates" width="120">
   </table>
  </td>
  <td onmouseover="showmenu('Help')" onmouseout="hidemenu('Help')">
   <a href='?reference=Help'>Help<br />
   <table class="menu" id="Help" width="200">
   <tr><td class="menu">> <a href='?reference=Functions'>Functions</a></td></tr>
   <tr><td class="menu">> <a href='?reference=UsingObjects'>Using Objects</a></td></tr>
   <tr><td class="menu">> <a href='?reference=Hud Commands'>Hud Commands</a></td></tr>
   </table>
  </td>
 </tr>
</table>
</center>
<p><p>
<b> Version 2.0.5</b>:<p>
-- Added in the mode 'Last Man Standing.'
<p><p>
<b> Version 2.0.4</b>:<p>
-- I made the doors as strong as grills.
<p>
-- Also, I added actions. Basically, it's a hud selection of either entering a persons area when you bump into them, or pushing them. Check the 'Help' section.
<p><p>
<b> Version 2.0.3</b>:<p>
-- Upgraded this games web browser (the old one was all dark and dray and didn't really fit the theme of the game). (Note - I spent a day working on this layout and adding stuff. Mainly because I've never really done a browser to this extent before in the BYOND language (yes, this isn't an actual website, but is, instead, part of the games internal coding).)
<p>-- I extended  the length of floods. They will now last two minutes! (Partly because I wanted to make the game a bit more challenging when it comes towards the end of the game.)
<p>-- Fixed a few icons and spelling errors here and there.
</body>
</html>
"}

//<----------Help---------->

var/const/Help = {"
<html>
<meta http-equiv="Page-Enter" content="blendtrans(duration=3.0)">
<style
type="text/css">BODY { color: white; background: #000000 url(http://i6.photobucket.com/albums/y247/PojoZell/T.jpg) fixed; margin-right: 0px; margin-left: 0px; cursor:crosshair }
img { border: 0px; } a:link, a:visited {color: #FFFF00; text-decoration: ;cursor:crosshair } a:hover { color: #FFFF00; text-decoration: underline overline; cursor:crosshair; font-size:14pt }</style>
<style>
body{font-family:arial;}
table{}
a{}
a:hover{}
td.menu{}
table.menu
{
font-size:100%;
position:absolute;
visibility:hidden;
}
</style>
<script type="text/javascript">
function showmenu(elmnt)
{
document.getElementById(elmnt).style.visibility="visible"
}
function hidemenu(elmnt)
{
document.getElementById(elmnt).style.visibility="hidden"
}
</script>
<center><a href='http://games.byond.com/hub/FinalFantasyFreak/Hurricane' target=_self><img src='http://games.byond.com/banners/11236.png' alt='' border=0></a> <br>by <i><a href=http://games.byond.com/people/FinalFantasyFreak>FinalFantasyFreak</a></i></center>
<p><p><center>
<table width="0%">
 <tr>
  <td onmouseover="showmenu('General')" onmouseout="hidemenu('General')">
   <a href='?reference=Story'>General</a><br />
   <table class="menu" id="General" width="120">
   </table>
  </td>
  <td onmouseover="showmenu('Updates')" onmouseout="hidemenu('Updates')">
   <a href='?reference=Updates'>Updates</a><br />
   <table class="menu" id="Updates" width="120">
   </table>
  </td>
  <td onmouseover="showmenu('Help')" onmouseout="hidemenu('Help')">
   <a href='?reference=Help'>Help<br />
   <table class="menu" id="Help" width="200">
   <tr><td class="menu">> <a href='?reference=Functions'>Functions</a></td></tr>
   <tr><td class="menu">> <a href='?reference=UsingObjects'>Using Objects</a></td></tr>
   <tr><td class="menu">> <a href='?reference=Hud Commands'>Hud Commands</a></td></tr>
   </table>
  </td>
 </tr>
</table>
</center>
<p><p>
<b> Help</b>:<br>
> <a href='?reference=Functions'>Functions</a><br>
> <a href='?reference=UsingObjects'>Using Objects</a><br>
> <a href='?reference=Hud Commands'>Hud Commands</a>

</body>
</html>
"}

//<----------Functions---------->

var/const/Functions = {"
<html>
<meta http-equiv="Page-Enter" content="blendtrans(duration=3.0)">
<style
type="text/css">BODY { color: white; background: #000000 url(http://i6.photobucket.com/albums/y247/PojoZell/T.jpg) fixed; margin-right: 0px; margin-left: 0px; cursor:crosshair }
img { border: 0px; } a:link, a:visited {color: #FFFF00; text-decoration: ;cursor:crosshair } a:hover { color: #FFFF00; text-decoration: underline overline; cursor:crosshair; font-size:14pt }</style>
<style>
body{font-family:arial;}
table{}
a{}
a:hover{}
td.menu{}
table.menu
{
font-size:100%;
position:absolute;
visibility:hidden;
}
</style>
<script type="text/javascript">
function showmenu(elmnt)
{
document.getElementById(elmnt).style.visibility="visible"
}
function hidemenu(elmnt)
{
document.getElementById(elmnt).style.visibility="hidden"
}
</script>
<center><a href='http://games.byond.com/hub/FinalFantasyFreak/Hurricane' target=_self><img src='http://games.byond.com/banners/11236.png' alt='' border=0></a> <br>by <i><a href=http://games.byond.com/people/FinalFantasyFreak>FinalFantasyFreak</a></i></center>
<p><p><center>
<table width="0%">
 <tr>
  <td onmouseover="showmenu('General')" onmouseout="hidemenu('General')">
   <a href='?reference=Story'>General</a><br />
   <table class="menu" id="General" width="120">
   </table>
  </td>
  <td onmouseover="showmenu('Updates')" onmouseout="hidemenu('Updates')">
   <a href='?reference=Updates'>Updates</a><br />
   <table class="menu" id="Updates" width="120">
   </table>
  </td>
  <td onmouseover="showmenu('Help')" onmouseout="hidemenu('Help')">
   <a href='?reference=Help'>Help<br />
   <table class="menu" id="Help" width="200">
   <tr><td class="menu">> <a href='?reference=Functions'>Functions</a></td></tr>
   <tr><td class="menu">> <a href='?reference=UsingObjects'>Using Objects</a></td></tr>
   <tr><td class="menu">> <a href='?reference=Hud Commands'>Hud Commands</a></td></tr>
   </table>
  </td>
 </tr>
</table>
</center>
<p><p>
<b> Functions</b>:<p>
There are, thankfully, very little functions within the game.
<p>
To start, the basics: Chatting. The game features three main means of talking.
<br>--<u>Say</u> : Just go to the 'Commands' tab and press "Say." Whatever you type there, after pressing 'OK', will be sent to everyone around you. Or, if you're dead, everyone else who is dead.
<br>--<u>OOC</u> : This is the most common form. Towards the bottom of your screen you will see a pink box with ">  " in it. Type anything after that arrow, hit enter and you're done. It will send a message to the world.
<br>--<u>Private Messaging</u> : Less used but is popular when it comes to wanting to tell only one person something. Simply press the little bubble with 'PM' in it next to the persons name you want to PM and  a box will appear. Type what you want in there and click 'OK.' That person will then receive your message.

<p>Now here's the more asked questions, now answered!
<br>--<u>Using Doors</u> : Believe it or not, this is a common question. To use doors, simply double click them (this only works <b>ONCE</b> the game has started).
<br>--<u>Using Closets</u> : To use a closet, like a door, double click it to open it (double clicking it again, also like a door, will close it). Then right click  the closet and selet 'Get.' Now you will get up to two objects listed. Grill Parts, Wire Cutters or one of the two depending on if the closet has been used before or not. Double click the name to get that item.
</body>
</html>
"}

//<----------FUsing Objects---------->

client/proc/Obj()
	mob << browse_rsc('Objects/Metal.jpg')
	mob << browse_rsc('Objects/GrillParts.jpg')
	mob << browse_rsc('Objects/WC.jpg')
	mob << browse_rsc('Objects/Glass.jpg')
	mob << browse_rsc('Objects/TP.jpg')
	mob << browse_rsc('Objects/P.jpg')
	mob << browse_rsc('Objects/Welder.jpg')
	mob << browse({"
<html>
<meta http-equiv="Page-Enter" content="blendtrans(duration=3.0)">
<style
type="text/css">BODY { color: white; background: #000000 url(http://i6.photobucket.com/albums/y247/PojoZell/T.jpg) fixed; margin-right: 0px; margin-left: 0px; cursor:crosshair }
img { border: 0px; } a:link, a:visited {color: #FFFF00; text-decoration: ;cursor:crosshair } a:hover { color: #FFFF00; text-decoration: underline overline; cursor:crosshair; font-size:14pt }
</style>
<style>
body{font-family:arial;}
table{}
a{}
a:hover{}
td.menu{}
table.menu
{
font-size:100%;
position:absolute;
visibility:hidden;
}
</style>
<script type="text/javascript">
function showmenu(elmnt)
{
document.getElementById(elmnt).style.visibility="visible"
}
function hidemenu(elmnt)
{
document.getElementById(elmnt).style.visibility="hidden"
}
</script>
<center><a href='http://games.byond.com/hub/FinalFantasyFreak/Hurricane' target=_self><img src='http://games.byond.com/banners/11236.png' alt='' border=0></a> <br>by <i><a href=http://games.byond.com/people/FinalFantasyFreak>FinalFantasyFreak</a></i></center>
<p><p><center>
<table width="0%">
 <tr>
  <td onmouseover="showmenu('General')" onmouseout="hidemenu('General')">
   <a href='?reference=Story'>General</a><br />
   <table class="menu" id="General" width="120">
   </table>
  </td>
  <td onmouseover="showmenu('Updates')" onmouseout="hidemenu('Updates')">
   <a href='?reference=Updates'>Updates</a><br />
   <table class="menu" id="Updates" width="120">
   </table>
  </td>
  <td onmouseover="showmenu('Help')" onmouseout="hidemenu('Help')">
   <a href='?reference=Help'>Help<br />
   <table class="menu" id="Help" width="200">
   <tr><td class="menu">> <a href='?reference=Functions'>Functions</a></td></tr>
   <tr><td class="menu">> <a href='?reference=UsingObjects'>Using Objects</a></td></tr>
   <tr><td class="menu">> <a href='?reference=Hud Commands'>Hud Commands</a></td></tr>
   </table>
  </td>
 </tr>
</table>
</center>
<p><p>
<b>Objects:</b><p>
The game offers a variety of different objects to help survive. Doors to block fires and floods, metal to build walls, glass and the like. And even the objects to tear them down. But a question that often arises from new players is how to use them. Well, if you were ever wondwering how to use a certain object, then you've come to the right place. Just scroll down, find the object you need help on and read the information listed about it.
<p><i>(All objects that can be picked up (Grill Parts, Wire Cutters, Metal, Glass, Propane and Welders) are picked up by double clicking them.)
</i><hr>
<p>
<img src=Metal.jpg> <b><font size=6>M</font>etal</b>: This is a heavily desired object within the game. Quite simply because it will literally save your characters life in most games. With this object you can create a variety of different items, such as Grill Parts, Doors, Tile Parts, Tables and Walls. Quite a wide selection to pick from. However, the different functions of each object will be discussed later on down this list.
<p><b><font size=6>U</font>se</b>: It's very simple to use metal. Simply pick some up and double click it while it's in your inventory. This will bring up a menu with the listed objects on it that you can build. Select one and hit 'OK' and the object will be created at your location. (Note - If the object can be picked up, like Grill Parts, you'll have to double click them to get them.)
<p><p>
<img src=Glass.jpg>
<b><font size=6>G</font>lass</b>: Used the same way as Metal, however, it can only mkae windows at the moment.
<p><p>
<img src=GrillParts.jpg>
<b><font size=6>G</font>rill Parts</b>: Second to Metal, Grill Parts are extremely desirable. As the name suggest, by double clicking the item while it's in your inventory it will create a grill. granted grills have half the strangth of walls, placed over a wall (which can be done) will create a reinforced wall that makes it that much hard to be borken by debris.
<p><p>
<img src=WC.jpg>
<b><font size=6>W</font>ire Cutters</b>: This is the counter item for grills. This can be used to cut grills and re-use the grill parts.
<p><b><font size=6>U</font>se</b>: Right click the item when it;s in your inventory and select 'Use,' then double click on a grill around you to cut it.
<p><p>
<img src=TP.jpg>
<b><font size=6>T</font>ile Parts</b>: You can only get this item via using metal.
<p><b><font size=6>U</font>se</b>: Double click to use. Creates a tile under your character. (Note - This will delete anything under you already like Walls, Windows and such accept certain items like Tables)
<p><p>
<img src=P.jpg>
<b><font size=6>P</font>ropane</b>: Really this object is useless alone. Right click and select 'Use', then select a welder (if you have one in your inventory) to make a fully fueled welder.
<p><b><font size=6>U</font>se</b>: Stated above. To remove the propane from the welder, make sure you aren't using the wleder with propane (if you are just select 'Use' again) and double click it. This will detach the propane.
<p><p>
<img src=Welder.jpg>
<b><font size=6>W</font>elder</b>: Once you have propane equipped (read about propane) right click this item and select 'Use' to use the item.
<p><b><font size=6>U</font>se</b>: Welder's can only, at the moment, be used on walls and windows. Double click one while you're near one. Then, after a few moments the wall/window will be converted into Metal/Glass. However, if you move anytime during the process the welding won't finish.
</body>
</html>
"})

/*
<p><p>
<img src=.jpg>
<b><font size=6></font></b>:
<p><b><font size=6>U</font>se</b>:
*/

client/proc/Hud()
	mob << browse_rsc('Objects/Close.jpg')
	mob << browse_rsc('Objects/Open.jpg')
	mob << browse_rsc('Objects/Enter.jpg')
	mob << browse_rsc('Objects/Push.jpg')
	mob << browse({"
<html>
<meta http-equiv="Page-Enter" content="blendtrans(duration=3.0)">
<style
type="text/css">BODY { color: white; background: #000000 url(http://i6.photobucket.com/albums/y247/PojoZell/T.jpg) fixed; margin-right: 0px; margin-left: 0px; cursor:crosshair }
img { border: 0px; } a:link, a:visited {color: #FFFF00; text-decoration: ;cursor:crosshair } a:hover { color: #FFFF00; text-decoration: underline overline; cursor:crosshair; font-size:14pt }
</style>
<style>
body{font-family:arial;}
table{}
a{}
a:hover{}
td.menu{}
table.menu
{
font-size:100%;
position:absolute;
visibility:hidden;
}
</style>
<script type="text/javascript">
function showmenu(elmnt)
{
document.getElementById(elmnt).style.visibility="visible"
}
function hidemenu(elmnt)
{
document.getElementById(elmnt).style.visibility="hidden"
}
</script>
<center><a href='http://games.byond.com/hub/FinalFantasyFreak/Hurricane' target=_self><img src='http://games.byond.com/banners/11236.png' alt='' border=0></a> <br>by <i><a href=http://games.byond.com/people/FinalFantasyFreak>FinalFantasyFreak</a></i></center>
<p><p><center>
<table width="0%">
 <tr>
  <td onmouseover="showmenu('General')" onmouseout="hidemenu('General')">
   <a href='?reference=Story'>General</a><br />
   <table class="menu" id="General" width="120">
   </table>
  </td>
  <td onmouseover="showmenu('Updates')" onmouseout="hidemenu('Updates')">
   <a href='?reference=Updates'>Updates</a><br />
   <table class="menu" id="Updates" width="120">
   </table>
  </td>
  <td onmouseover="showmenu('Help')" onmouseout="hidemenu('Help')">
   <a href='?reference=Help'>Help<br />
   <table class="menu" id="Help" width="200">
   <tr><td class="menu">> <a href='?reference=Functions'>Functions</a></td></tr>
   <tr><td class="menu">> <a href='?reference=UsingObjects'>Using Objects</a></td></tr>
   <tr><td class="menu">> <a href='?reference=Hud Commands'>Hud Commands</a></td></tr>
   </table>
  </td>
 </tr>
</table>
</center>
<p><p>
<b>Hud Commands:</b><p>
This section will discuss in-game Hud commands. Basically, a Hud is any object on your screen that only you can see and control.
<hr>
<p>
<b>Action Hud:</b><p>
The action hud is currently the only hud available. It allows you to pick whether you want to push someone when you bump into them, or simply enter their area (most prefered).
<p> To do this, click the 'Open' button(<img src=Open.jpg>). next you will see two more tabs open along with the 'Close' tab(<img src=Enter.jpg><img src=Push.jpg><img src=Close.jpg>). At the beginning of the game a red square will be over the first box (which is 'Enter' <img src=Enter.jpg>). This means that it is currently selected. You can choose 'Push' (<img src=Push.jpg>) by double clicking it, and vice versa for 'Enter.' When you're done selecting, press the 'Close' (<img src=Close.jpg>) button to close the tabs and you'll be doing whatever you selected when bumping into someone.
<p><b>Entering</b>: Basically, all this does for you is allow you, as well as anyone else with this selected, to all get cramped up in one spot instead of being spread out.
<p><b>Pushing</b>: The reverse of entering, pushing does as its name says. You push people whenever you would bump into them. Survival of the fittest it's called, and this is an example of that.
<p><p>
</body>
</html>
"})

/*
<p><p>
<img src=.jpg>
<b><font size=6></font></b>:
<p><b><font size=6>U</font>se</b>:
*/