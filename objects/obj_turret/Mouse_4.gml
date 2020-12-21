//Behavior for mouse clicks on turrets
if (position_meeting(mouse_x,mouse_y,id) && obj_player.active_tool == tool.Demolish){
	 instance_destroy()
}