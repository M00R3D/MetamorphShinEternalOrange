/// Step Event

// Control de teclas
var rkey = keyboard_check(ord("D")); // Tecla derecha
var lkey = keyboard_check(ord("A")); // Tecla izquierda
var jkey = keyboard_check(ord("W")); // Tecla de salto
var skey = keyboard_check(ord("S")); // Tecla de agacharse,bajar
var _hor = rkey - lkey; // Dirección horizontal (1: derecha, -1: izquierda)

// Estado "life": Movimiento y colisiones
if (status == "life") {
    // Movimiento horizontal
    if (_hor == 0) {
        hspd = 0;
        sprite_index = spr_orangeguy_stand; // Sprite quieto
    } else {
        hspd = spd * _hor;
        sprite_index = spr_orangeguy_walk; // Sprite caminando
        image_xscale = rkey ? 1 : -1; // Invertir sprite según dirección

        // Sonido de pasos con cooldown
        if (wait_stepSnd > 0) {
            wait_stepSnd--;
        } else {
            wait_stepSnd = choose(14, 16, 17, 20); // Tiempo aleatorio
            if (vspd == 0 && !audio_is_playing(snd_step)) { 
                audio_play_sound(snd_step, 5, false); 
            }
        }
    }

    // Registrar si estaba cayendo
    if (vspd > 1) {
        fellFromAir = true;
    }

    // Gravedad y salto
    if (place_meeting(x, y + 1, obj_wall)) {
        if (fellFromAir) { 
            audio_play_sound(snd_fall, 8, false); // Sonido de caída
            fellFromAir = false; // Resetear la bandera
        }

        vspd = 0; // Detener velocidad vertical

        // Salto
        if (jkey && !audio_is_playing(snd_jump)) { 
            vspd = -jspd; // Saltar
            audio_play_sound(snd_jump, 10, false); // Prioridad alta
        }
    } else {
        vspd = min(vspd + grav, 10) * (!place_meeting(x,y,obj_ladder)); // Aplicar gravedad
		if(jkey){y--;} else if(skey){y++;}
    }

    // Resolver colisiones horizontales
    if (place_meeting(x + hspd, y, obj_wall)) {
        while (!place_meeting(x + sign(hspd), y, obj_wall)) {
            x += sign(hspd);
        }
        hspd = 0;
    } else {
        x += hspd + global.char_hspd_plus;
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

    // Verificar si el personaje murió
    if (hp <= 0) {
        status = "death"; // Cambiar estado a muerte
        deathtime = 200; // Reiniciar temporizador de muerte
    }
}

// Estado "death": Animación de partículas y reinicio
if (status == "death") {
    if (particletime > 0) {
        particletime--;
    } else {
        particletime = 20; // Reiniciar temporizador de partículas
        with (instance_create_layer(x, y - 4, "Instances", obj_particle)) {
            vspd = choose(-10, -12, -15); // Configurar movimiento de partículas
        }
    }

    // Cambiar sprite a animación de dolor
    if (deathtime == 40) {
        sprite_index = spr_orangeguy_pain;
    }

    // Reiniciar al personaje cuando termine la animación de muerte
    if (deathtime <= 0) {
        x = 416; // Posición inicial (ajústalo según el juego)
        y = 496;
        hp = 10; // Restaurar puntos de vida
        status = "life"; // Cambiar estado a vivo
        sprite_index = spr_orangeguy_stand; // Cambiar sprite
    } else {
        deathtime--; // Reducir temporizador de muerte
    }
}
