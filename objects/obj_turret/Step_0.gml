/// @description generic tower AI

target = instance_nearest(x,y,targetType)
aimDirection = target


if (!reloading and point_distance(x, y, target.x, target.y) <= range){
	bullet = instance_create_layer(x + bulletOffsetX, y + bulletOffsetY, "Instances", bulletType)
	bullet.direction = point_direction(x + bulletOffsetX, y + bulletOffsetY, target.x, target.y)
	reloading = true
	alarm[0] = fireRate
}



