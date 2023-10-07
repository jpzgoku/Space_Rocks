/// @description Set Powerup Statuses


if (other.powerup_type == "spread") {
	powerup_pweapon_active = true;
	image_blend = c_yellow;
	alarm[0] = 240;
} else if (other.powerup_type == "invo") {
	powerup_invo_active = true;
	alarm[0] = 300;
	image_alpha = 0.6;
}


instance_destroy(other);