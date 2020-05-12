/// @description behavior when touching an enemy

//knockback applied when touching an enemy
knocked = true
direction = point_direction(other.x, other.y, x, y)
speed += other.push
hp -= other.damage
