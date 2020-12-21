/// @description Insert description here
// You can write your code in this editor
angleDelta = 5
angleTotalMovement += angleDelta
if(facingRight){
	direction -= angleDelta
} else {
	direction += angleDelta
}
image_angle = direction
x = obj_player.x + setOffsetX
y = obj_player.y + setOffsetY

if(angleTotalMovement > 70){
	instance_destroy()
}