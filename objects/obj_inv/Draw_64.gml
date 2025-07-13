var x_start = 20;
var y_start = 20;
var box_size = 36;

for (var i = 0; i < max_slots; i++) {
    var x_pos = x_start + i * 44;
    var y_pos = y_start;

    var is_selected = (i == selected_slot);

    // Colores vivos
    var r = 128 + 127 * sin(current_time / 300 + i * 0.8);
    var g = 128 + 127 * sin(current_time / 400 + i * 0.6 + 10);
    var b = 128 + 127 * sin(current_time / 500 + i * 0.4 + 20);
    var col = make_color_rgb(r, g, b);
    var col_dark = make_color_rgb(r * 0.5, g * 0.5, b * 0.5);
	if (is_selected) {
        draw_set_color(c_white);
        draw_rectangle(x_pos - 4, y_pos - 4, x_pos + box_size + 4, y_pos + box_size + 4, false);
    }
    // Borde externo (más grande)
    draw_set_color(col_dark);
    draw_rectangle(x_pos - 2, y_pos - 2, x_pos + box_size + 2, y_pos + box_size + 2, false);

    // Rectángulo base
    draw_set_color(col);
    draw_rectangle(x_pos, y_pos, x_pos + box_size, y_pos + box_size, false);

    // Si hay ítem, lo dibuja
    if (i < array_length(inv)) {
        var item = inv[i];
        draw_sprite(item.sprite, 0, x_pos + 4, y_pos + 4);
        draw_set_color(c_white);
        draw_text(x_pos + 18, y_pos + 22, string(item.cantidad));
    }

    // Borde especial si está seleccionado
   
}


if (dropping) {
    var bar_x = 20;
    var bar_y = 80;
    var bar_w = 120;
    var bar_h = 12;
    
    draw_set_color(c_white);
    draw_rectangle(bar_x - 2, bar_y - 2, bar_x + bar_w + 2, bar_y + bar_h + 2, false);
    
    draw_set_color(c_red);
    draw_rectangle(bar_x, bar_y, bar_x + bar_w * drop_charge, bar_y + bar_h, false);

    draw_text(bar_x + bar_w + 6, bar_y - 2, drop_charge >= 1 ? "Soltar todo" : "Soltar 1");
}
