/// @description Track Weapon


move = function() {

	if (keyboard_check(ord("W")) || keyboard_check(vk_up)) {
		motion_add(image_angle, 0.1)
	}
	
	if (keyboard_check(ord("D")) || keyboard_check(vk_right)) {
		image_angle -= 4;
	}
	
	if (keyboard_check(ord("A")) || keyboard_check(vk_left)) {
		image_angle += 4;
	}
	
	if (!powerup_invo_active) {
		return;	
	}
	
	if (keyboard_check(ord("D")) || keyboard_check(vk_down)) {
		speed *= 0.95;
	}

}


attack = function() {
	
	if (keyboard_check_pressed(vk_space)) {
		weapon_select();
	}
	
	
}


weapon_select = function() {

	switch (weapon) {
		case ("standard_shot"):
			standard_shot();
			break;
		case ("guided_rocket"):
			guided_rocket();
			break;
		case ("fast_rocket"):
			fast_rocket();
			break;
		case ("shotgun_blast"):
			shotgun_blast();
			break;
	}
	
}


standard_shot = function() {

	instance_create_layer(x, y, "Instances", obj_bullet);
	spread_shot();
	
}


spread_shot = function() {
	
	if (powerup_pweapon_active) {
		var _bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction += 10;
		_bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		_bullet.direction -= 10;
	}
}


shotgun_blast = function() {
	
	if (time_in_between_shots >= 80) {
		
		if (!powerup_pweapon_active) {
			motion_add(image_angle, -1.65);
		}
		
		repeat(10){
			var _bullet = instance_create_layer(x, y, "Instances", obj_bullet);
			_bullet.direction += irandom_range(-20, 20);
		}
		
		time_in_between_shots = 0;
	}
	
}



guided_rocket = function() {
	
	struct_guided_rocket.explosion_buff = powerup_pweapon_active;
	instance_create_layer(x, y, "Instances", obj_rocket, struct_guided_rocket);
	
}


fast_rocket = function() {

	instance_create_layer(x, y, "Instances", obj_rocket, struct_fast_rocket);
	
}


struct_fast_rocket = {
	
	speed: 	0,
	propulsion: 0.1,
	propulsion_multiplier: 1.05,
	explosion_buff: true,
}


struct_guided_rocket = {
	
	speed: 	1,
	propulsion: 0.2,
	propulsion_multiplier: 1,
	flight_dir: obj_player,
	explosion_buff: powerup_pweapon_active,
	
}
