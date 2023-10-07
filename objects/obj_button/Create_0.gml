/// @description Insert description here
// You can write your code in this editor


get_button_input = function() {
	
	if (self.button_name == "Start") {
		room_goto_next();
	} else if (self.button_name == "Help") {
		help_button_toggle();
	} else if (self.button_name == "Exit") {
		game_end();
	}	
	
}


help_button_toggle = function() {

	if (instance_exists(obj_controls)){
	instance_destroy(obj_controls);
	} else {
	instance_create_layer(room_width / 2, room_height - 100, "Instances_menu", obj_controls);
	}
	
}
