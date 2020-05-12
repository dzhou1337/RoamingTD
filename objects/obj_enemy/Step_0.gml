/// @description generic enemy AI

speed += accel

if (speed > 0){
	speed -= drag;
	speed = max(speed, 0);
} else  if (speed < 0){
	speed += drag;
	speed = min(speed, 0);
}
//caps movement speed at maxspeed
speed = min(speed, maxspeed);

var n = noone
var d, t //d for closest distance, t for check distance.
with obj_waypoint_enemy {
    if waypoint = other.waypoint {
        t = point_distance(x, y, other.x, other.y);
        if n == noone or t < d { //If distance is less than current target distance, then apply new distance and instance id.
            d = t
            n = id
        }
    }
}

nextStep = n

if (n != noone){
	direction = point_direction(x,y,nextStep.x,nextStep.y)
} else {
	speed = 0
}
