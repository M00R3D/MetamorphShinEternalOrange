// Movimiento horizontal
if (_hor == 0) {
    hspd = 0;
} else {
    hspd = spd * _hor; // Velocidad horizontal ajustada por dirección
    if (_hor > 0) { _hor -= 0.1; }
    if (_hor < 0) { _hor += 0.1; }

    // Control del sonido de pasos
    if (wait_stepSnd > 0) {
        wait_stepSnd--;
    } else {
        wait_stepSnd = choose(14, 16, 17, 20);
    }
}

// Gravedad y caída
var wasFalling = (vspd > 0.001); // La partícula estaba cayendo

if (place_meeting(x, y + 1, obj_wall)) {
    if (fallen==false) { // Solo suena si estaba cayendo
        audio_play_sound(snd_fall, 11, false);
        fallen=true;
    }
    vspd = 0;
} else {
    vspd = min(vspd + grav, 10);
}

// Resolver colisiones horizontales
if (place_meeting(x + hspd, y, obj_wall)) {
    while (!place_meeting(x + sign(hspd), y, obj_wall)) {
        x += sign(hspd);
    }
    hspd = 0;
} else {
    x += hspd;
}

// Resolver colisiones verticales
if (place_meeting(x, y + vspd, obj_wall)) {
    while (!place_meeting(x, y + sign(vspd), obj_wall)) {
        y += sign(vspd);
    }
    vspd = 0;
} else {
    y += vspd;
}

// Temporizador para animaciones
if (timedraw > 0) {
    timedraw--;
}

// Desaparece cuando acaba su tiempo de vida
if (timelife > 0) { 
    timelife--; 
} 
if (timelife == 0) { 
    instance_destroy(self); 
}

// Ajustar transparencia gradualmente
image_alpha = 0.003 * (timelife + 100);
