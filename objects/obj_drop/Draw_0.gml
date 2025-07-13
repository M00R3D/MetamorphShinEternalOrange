//Dibujar
if (index != "") {
    var spr = noone;

    switch (index) {
        case 1: spr = spr_knive; break;
        case 2: spr = spr_vends_drop; break;
        case 3: spr = spr_battery_drop; break;
        case 4: spr = spr_energy_drop; break;
        case 5: spr = spr_rustykey1_drop; break;
        case 6: spr = spr_oldgun_drop; break;
        case 7: spr = spr_bloodymap_drop; break;
        case 8: spr = spr_mirrorshard_drop; break;
        case 9: spr = spr_survival_drop; break;
        case 10: spr = spr_repro_drop; break;
    }
	sprite_index=spr;
    if (spr != noone) {
        //draw_sprite();
        var globee=globe/2;
        var f=floti-1 * 2;
		draw_sprite_stretched(spr, 0, x-globee, y-f-7-globe,7+globe,7+globe);
    }
}
