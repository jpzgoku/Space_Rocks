/// @description Reset Score For New Game

score = 0;

is_being_spawned = false;

spawn_powerups = function() {
	
	if (!instance_exists(obj_powerup) && !is_being_spawned) {
		
		is_being_spawned = true;
		alarm[1] = 20;
		
	}
	
}

set_powerup_spawn_location = function() {
	
	var _spr_width = sprite_get_width(spr_powerup_spread);

	var _x_pos = choose(0 - _spr_width, room_width + _spr_width);
	var _y_pos = random_range(room_height / 4, (room_height / 4) * 3);

	instance_create_layer(_x_pos, _y_pos, "Instances", obj_powerup);

	is_being_spawned = false;	

}