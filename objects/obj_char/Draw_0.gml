var inv = instance_find(obj_inv, 0); // Referencia a obj_inv

if (inv != noone && inv.selected_slot < array_length(inv.inv)) {
    var sel_item = inv.inv[inv.selected_slot];

    if (sel_item.sprite != noone) {
        // Dibuja el sprite seleccionado encima del personaje
		draw_self();
        draw_sprite(sel_item.sprite, 0, x, y - 32);
    }
}else{draw_self();}
