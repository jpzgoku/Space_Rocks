/// @description Insert description here
// You can write your code in this editor

speed = 1;


destroy_if_outside_room = function() {
	
	if (x < 0 - (sprite_width * 2) || x > room_width + (sprite_width * 2)){
		instance_destroy();
	}
	
	if (y < 0 - (sprite_height * 2) || y > room_height + (sprite_height * 2)){
		instance_destroy();
	}
	
}


set_direction = function() {
	
	if (x < 0) {
		direction = random_range(-20, 20);
	} else if (x > room_width) {
		direction = random_range(160, 200);
	}
		
}

set_powerup = function() {
	
	var _rsprite = choose(spr_powerup_spread, spr_powerup_invo);
	sprite_index = _rsprite;
	
	if (_rsprite == spr_powerup_spread) {
		self.powerup_type = "spread";	
	} else if (_rsprite == spr_powerup_invo) {
		self.powerup_type = "invo";
	}
}


set_direction();
set_powerup();