/// @description Insert description here
// You can write your code in this editor
if(obj_player.facingRight){
	image_xscale = -1
	direction = point_direction(mouse_x, mouse_y, obj_player.x,  obj_player.y) + 180;
} else {
	direction = point_direction(mouse_x, mouse_y, obj_player.x, obj_player.y);
}
facingRight = obj_player.facingRight
setOffsetX = obj_player.xOffset
setOffsetY = obj_player.yOffset
image_angle = direction

enemies_hit = ds_list_create()
ds_list_clear(enemies_hit)


angleDelta = 0
angleTotalMovement = 0

damage = 5
push = 5

