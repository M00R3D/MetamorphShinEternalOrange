if (!variable_instance_exists(self, "index")) {
    index = irandom_range(1, 10); // Fallback
}

// Velocidades iniciales
hspd = choose(-6, 6);
vspd = random_range(-3, -1); // <-- Ahora sí está definido

grav = 0.5;
max_vspd = 10;

globe = 1;
globeflg = true;
floti = 0;

spd_part = 4;
spd_partMax = 4;
