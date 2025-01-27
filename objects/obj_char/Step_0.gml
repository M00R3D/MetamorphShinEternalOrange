/// Step Event

// Control de teclas
var rkey = keyboard_check(ord("D")); // Tecla para moverse a la derecha
var lkey = keyboard_check(ord("A")); // Tecla para moverse a la izquierda
var jkey = keyboard_check(ord("W")); // Tecla para saltar
var _hor = rkey - lkey; // Dirección horizontal (derecha: 1, izquierda: -1)

// Movimiento horizontal
if (_hor == 0) {
    hspd = 0;
    sprite_index = spr_orangeguy_stand; // Sprite de personaje quieto
} else {
    hspd = spd * _hor; // Velocidad horizontal ajustada por dirección
    sprite_index = spr_orangeguy_walk; // Sprite de personaje caminando
    
    // Invertir sprite según dirección
    if (rkey) image_xscale = 1;
    if (lkey) image_xscale = -1;

    // Control del sonido de pasos
    if (wait_stepSnd > 0) {
        wait_stepSnd--;
    } else {
        wait_stepSnd = choose(14, 16, 17, 20); // Tiempo aleatorio para el siguiente paso
        // audio_play_sound(snd_step, 10, false);
    }
}

// Gravedad y salto
if (place_meeting(x, y + 1, obj_wall)) {
    vspd = 0; // Detener velocidad vertical al estar en el suelo
    if (jkey) {
        vspd = -jspd; // Aplicar fuerza de salto
        // audio_play_sound(snd_jump, 10, false);
    }
} else {
    vspd = min(vspd + grav, 10); // Aplicar gravedad y limitar velocidad máxima
}

// Resolver colisiones horizontales
if (place_meeting(x + hspd, y, obj_wall)) {
    while (!place_meeting(x + sign(hspd), y, obj_wall)) {
        x += sign(hspd); // Ajustar posición al borde del objeto
    }
    hspd = 0; // Detener movimiento horizontal al chocar
} else {
    x += hspd + global.char_hspd_plus; // Mover horizontalmente
}

// Resolver colisiones verticales
if (place_meeting(x, y + vspd, obj_wall)) {
    while (!place_meeting(x, y + sign(vspd), obj_wall)) {
        y += sign(vspd); // Ajustar posición al borde del objeto
    }
    vspd = 0; // Detener movimiento vertical al chocar
} else {
    y += vspd; // Mover verticalmente
}

// Temporizador para animaciones
if (timedraw > 0) {
    timedraw--;
}
if (hp==0)
{
	x=416;
	y=496;
	hp=10;
}