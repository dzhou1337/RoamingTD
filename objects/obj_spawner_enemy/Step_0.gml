/// @description Insert description here
// You can write your code in this editor
if(!recharging){
	instance_create_layer(x,y,"Instances",obj_enemy)
	recharging = true
	alarm[0] = spawnRate
}