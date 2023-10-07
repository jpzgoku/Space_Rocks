/// @description

direction = random(360);
image_angle = random(360);
image_movement = random_range(-0.5, 0.5);


take_damage = function() {
	
	explode();
	instance_destroy(other);
	effect_create_above(ef_explosion, x, y, 1, c_white);
	direction = random(360);

	if (sprite_index == spr_rock_big) {
		sprite_index = spr_rock_small;
		instance_copy(true);
	} else {
		sprite_index = spr_rock_big;
		x = 0 - (sprite_height / 2);
		score += 50;
	}	
	
}

explode = function() {

	if (other.object_index == 7 && other.explosion_buff) {
		instance_create_layer(other.x, other.y, "Instances", obj_explosion);
	}
	
}