/// @description generic tower AI
if (instance_exists(obj_enemy)){
	targetX = instance_nearest(x,y,targetType).x
	targetY =  instance_nearest(x,y,targetType).y


	if (!reloading and point_distance(x, y, targetX, targetY) <= range){
		bullet = instance_create_layer(x + bulletOffsetX, y + bulletOffsetY, "Instances", bulletType)
		bullet.direction = point_direction(x + bulletOffsetX, y + bulletOffsetY, targetX, targetY)
		reloading = true
		alarm[0] = fireRate
	}
}



