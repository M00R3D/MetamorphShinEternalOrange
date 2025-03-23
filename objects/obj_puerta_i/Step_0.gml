if place_meeting(x, y, obj_char) {
    // Guardar el punto de entrada en el JSON
    var ruta = working_directory + "datos.json";
    var datos = {
        lado: "derecha", // Lo leerá el obj_char cuando vuelva al room anterior
        pos_x: x,        // Si quieres usar coordenadas exactas
        pos_y: y
    };

    var json_string = json_encode(datos);
    var archivo = file_text_open_write(ruta);
    file_text_write_string(archivo, json_string);
    file_text_close(archivo);

    // Ir al room anterior
    room_goto(lvl);
}
