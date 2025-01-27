// Movimiento horizontal
if (_hor == 0) {
    hspd = 0;
} else {
    hspd = spd * _hor; // Velocidad horizontal ajustada por dirección
    if(_hor>0){_hor-=0.1;}
    if(_hor<0){_hor+=0.1;}

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
    x += hspd; // Mover horizontalmente
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

if(timelife>0){timelife--;}
if(timelife==0){instance_destroy(self);}
image_alpha=0.003*(timelife+100);