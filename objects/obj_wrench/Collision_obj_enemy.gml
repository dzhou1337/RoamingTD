
if (!other.hitByWrench){
	if (other.hp - damage > 0) {
		ds_list_add(enemies_hit, other)
	}
	other.hp -= damage
	other.knocked = true
	other.direction = point_direction( obj_player.x, obj_player.y, other.x, other.y)
	other.speed = push
	other.hitByWrench = true
	
}