// CONTROL CON TECLAS 1–0
for (var i = 0; i < 10; i++) {
    if (keyboard_check_pressed(ord(string(i == 9 ? 0 : i + 1)))) {
        selected_slot = i;
    }
}

// CONTROL CON SCROLL DEL RATÓN
var scroll = mouse_wheel_up() - mouse_wheel_down();
if (scroll != 0) {
    selected_slot = (selected_slot - scroll + max_slots) mod max_slots;
}


// Presionar Q inicia el "modo de soltar"
if (keyboard_check_pressed(ord("Q"))) {
    dropping = true;
    drop_timer = 0;
}

// Mientras se mantiene presionada
if (dropping && keyboard_check(ord("Q"))) {
    drop_timer += delta_time / 1000000; // delta_time está en microsegundos
    drop_charge = clamp(drop_timer / drop_hold_time, 0, 1);
}

// Si se suelta la Q
if (dropping && keyboard_check_released(ord("Q"))) {
    if (drop_charge < 1) {
        // Suelta solo 1
        drop_one_item();
    } else {
        // Suelta todos del slot actual
        drop_all_items();
    }

    // Reset
    dropping = false;
    drop_timer = 0;
    drop_charge = 0;
}
