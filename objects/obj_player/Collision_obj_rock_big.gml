/// @description


if (powerup_invo_active) {
	effect_create_above(ef_explosion, x, y, 1, c_white);
	instance_destroy(other);
	instance_create_layer(0 - (other.sprite_width / 2), other.y, "Instances", obj_rock_big);
	score += 150;
} else {
	effect_create_above(ef_firework, x, y, 1, c_white);
	instance_destroy(obj_rocket);
	instance_destroy();	
	obj_game.alarm[0] = 120;
}