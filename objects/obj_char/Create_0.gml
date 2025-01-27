/// Create Event

// Variables para movimiento y colisiones
grav = 0.7; // Gravedad
spd = 3; // Velocidad horizontal base
hspd = 0; // Velocidad horizontal actual
vspd = 0; // Velocidad vertical actual
jspd = 12; // Fuerza del salto
wait_stepSnd = 2; // Tiempo entre sonidos de pasos
timedraw = 100; // Temporizador de animación
global.char_hspd_plus = 0; // Ajuste adicional para velocidad horizontal
image_speed = 0.2; // Velocidad de animación del sprite

// Estado inicial del personaje
sprite_index = spr_orangeguy_stand;

hp=10;