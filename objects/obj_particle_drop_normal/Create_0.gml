//image_xscale=choose(1,1,1,1,2,2,3,4,3,2);
//image_yscale=choose(1,1,1,1,2,2,3,4,3,2);


grav = -0.2; // Gravedad
spd = 0.3; // Velocidad horizontal base
hspd = 0; // Velocidad horizontal actual
vspd = 0; // Velocidad vertical actual
jspd = 12; // Fuerza del salto
wait_stepSnd = 2; // Tiempo entre sonidos de pasos
timedraw = 100; // Temporizador de animación

_hor = choose(-1,1,-2,2,-3,3)


timelife=choose(130,140,150,200,210);

fallen=false;
//audio_play_sound(snd_blop, 11, false);

image_speed=0;
image_index=choose(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);