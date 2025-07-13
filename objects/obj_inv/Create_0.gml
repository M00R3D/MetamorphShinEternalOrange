// Arreglo de objetos recogidos
inv = [];
selected_slot = 0; // De 0 a 9 (10 slots)
max_slots = 10;
persistent = true;
drop_charge = 0;         // 0 a 1, tiempo de carga
dropping = false;        // ¿Se está cargando para soltar?
drop_hold_time = 1;      // Cuánto tiempo mantener Q para soltar todos
drop_timer = 0;

// Método para añadir un objeto al inventario
function add_item(_index) {
    var name = "";
    var spr = noone;

    switch (_index) {
        case 1: name = "Cuchillo"; spr = spr_knive; break;
        case 2: name = "Vendedor"; spr = spr_vends_drop; break;
        case 3: name = "Batería"; spr = spr_battery_drop; break;
        case 4: name = "Energía"; spr = spr_energy_drop; break;
        case 5: name = "Llave oxidada"; spr = spr_rustykey1_drop; break;
        case 6: name = "Pistola vieja"; spr = spr_oldgun_drop; break;
        case 7: name = "Mapa sangriento"; spr = spr_bloodymap_drop; break;
        case 8: name = "Fragmento de espejo"; spr = spr_mirrorshard_drop; break;
        case 9: name = "Manual de supervivencia"; spr = spr_survival_drop; break;
        case 10: name = "Reproductor"; spr = spr_repro_drop; break;
    }

    // Buscar si ya está en el inventario
    for (var i = 0; i < array_length(inv); i++) {
        if (inv[i].tipo == _index) {
            inv[i].cantidad += 1;
            return;
        }
    }

    // Si no está, agregar nuevo item
    var new_item = {
        tipo: _index,
        cantidad: 1,
        nombre: name,
        sprite: spr
    };

    array_push(inv, new_item);
}

function drop_one_item() {
    if (selected_slot < array_length(inv)) {
        var item = inv[selected_slot];
        
        var drop = instance_create_layer(obj_char.x + choose(-5,5), obj_char.y - 18, "Instances", obj_drop);
        drop.index = item.tipo;

        // Quitar 1 del inventario
        item.cantidad -= 1;
        if (item.cantidad <= 0) {
            array_delete(inv, selected_slot, 1);
        }
    }
}

function drop_all_items() {
    if (selected_slot < array_length(inv)) {
        var item = inv[selected_slot];

        var drop = instance_create_layer(obj_char.x + choose(-5,5), obj_char.y - 18, "Instances", obj_drop);
        drop.index = item.tipo;

        // Si quieres que caigan en pila pero con más cantidad, puedes hacer:
        drop.extra_cantidad = item.cantidad; // Si decides soportarlo en obj_drop

        // Borrar del inventario
        array_delete(inv, selected_slot, 1);
    }
}
