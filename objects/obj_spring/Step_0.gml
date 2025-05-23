if(place_meeting(x, y + 4, obj_char) and modo=="normal")
{
	modo="cerrado";
}


if(modo=="cerrado" and c<10){c++;}
if(modo=="cerrado" and c==10)
	{
		obj_char.vspd-=20;
		obj_char.y-=3;
		modo="abierto";
		audio_play_sound(snd_spring, 5, false); 
		c=0;
	}

if(modo=="abierto" and c<40){c++;}
if(modo=="abierto" and c==40)
	{modo="normal";
		c=0;}




//animaciones
if(modo=="normal"){image_index=0;}
if(modo=="cerrado"){image_index=2;}
if(modo=="abierto"){image_index=4;}