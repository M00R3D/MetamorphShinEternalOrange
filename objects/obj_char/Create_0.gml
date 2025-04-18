/// Create Event
fellFromAir=true;
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

status = "life"; // Estado inicial del personaje (vivo)
hp = 10; // Puntos de vida

// Variables relacionadas con muerte y partículas
deathtime = 200; // Tiempo total de animación de muerte
particletime = 20; // Intervalo entre partículas al morir

// obj_jugador > Create Event
// Posición por defecto (por si no hay nada en global)
if (!variable_global_exists("tX")) {
    global.tX = x;
    global.tY= y;
}