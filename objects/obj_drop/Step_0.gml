// Aplicar gravedad
vspd = min(vspd + grav, max_vspd);

// Resolver colisiones horizontales con paredes
if (place_meeting(x + hspd, y, obj_wall)) {
    while (!place_meeting(x + sign(hspd), y, obj_wall)) {
        x += sign(hspd);
    }
    hspd = 0;
} else {
    x += hspd;
}

// Resolver colisiones verticales con paredes
if (place_meeting(x, y + vspd, obj_wall)) {
    while (!place_meeting(x, y + sign(vspd), obj_wall)) {
        y += sign(vspd);
    }
    hspd = 0;
    vspd = 0;
} else {
    y += vspd;
}

// Empuje entre drops
with (obj_drop) {
    if (id != other.id && place_meeting(x, y, other)) {
        var dir = sign(x - other.x);
        if (dir == 0) dir = choose(-1, 1); // Por si están exactamente alineados
        x += dir * 1; // Empuje en X (ajusta fuerza si quieres)
    }
}

// Destruir al colisionar con el jugador
if (place_meeting(x, y, obj_char)) {
    for (var i = 0; i < 5; i++) {
        with (instance_create_layer(x, y, "Instances", obj_particle)) {
            hspd = random_range(-2, 2);
            vspd = random_range(-4, -1);
        }
    }
    instance_destroy();
}


// Movimiento normal
if (globeflg) {
    globe*=1.6;
    if (globe >= 0.5) {
        globeflg = false;
    }
} else {
    globe*=0.6;
    if (globe <= 0) {
        globeflg = true;
    }
}
if(floti>0 && floti<3)
{floti++;}else{floti=0;}