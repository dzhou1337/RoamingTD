/// @description Insert description here
// You can write your code in this editor
if(point_distance(mouse_x,mouse_y,obj_player.x,obj_player.y) <= obj_player.buildRange){
	inRange = true
} else {
	inRange = false
}
clear = true
if(inRange && clear){
	sprite_index = spr_turret_0_ghost
} else {
	sprite_index = spr_turret_0_ghost_bad	
}