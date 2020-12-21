/// @description reading input and performing persistent actions

//acceleration based movement
if(!knocked){
	if(keyboard_check(ord("W"))){
		vspeed -= accel;
	}

	if(keyboard_check(ord("A"))){
		hspeed -= accel;
	}

	if(keyboard_check(ord("S"))){
		vspeed += accel;
	}

	if(keyboard_check(ord("D"))){
		hspeed +=  accel;
	}
}

if(knocked){
	drag = .8
	maxspeed = 20
} else {
	drag = .8
	maxspeed = 4
}

//friction
if (speed > 0){
	speed -= drag;
	speed = max(speed, 0);
} else  if (speed < 0){
	speed += drag;
	speed = min(speed, 0);
}
//caps movement speed at maxspeed
speed = min(speed, maxspeed);
if (speed == 0){
	knocked = false
}


//better wall collision
if(place_meeting(x+hspeed,y,obj_wall)){
	while(!place_meeting(x+sign(hspeed), y, obj_wall)){
		x = x + sign(hspeed);
	}
	hspeed = 0;
}
if(place_meeting(x,y+vspeed,obj_wall)){
	while(!place_meeting(x, y+sign(vspeed), obj_wall)){
		y = y + sign(vspeed);
	}
	vspeed = 0;
}

//for sprite flipping
if(mouse_x > x) {
	facingRight = true
} else {
	facingRight = false
}

xyVals = scr_normalize(x, y, mouse_x, mouse_y, 10)
xOffset = xyVals[0]
yOffset = xyVals[1]

//non-movement keyboard inputs
switch (keyboard_key) {
	case ord("1"):
		active_tool = tool.Tool

		break;
		
	case ord("2"):
		active_tool = tool.Weapon1
		break;
		
	case ord("3"):
		active_tool = tool.Weapon2
		break;
		
	case ord("4"):
		active_tool = tool.BuildDMG
		if (ghostbuilding == 0){
			ghostbuilding = instance_create_layer(obj_game.activeTile_x, obj_game.activeTile_y, "Instances", obj_turret_0_ghost)
		}
		break;
		
	case ord("5"):
		active_tool = tool.BuildSUP
		break;
		
	case ord("6"):
		active_tool = tool.Demolish
		break;
}

//mouse click inputs
if(mouse_check_button_pressed(mb_left)){
	switch(active_tool){
		case tool.Tool:
			
			break;
			
		case tool.Weapon1:
			if(!weapon1Recharging){
				var i
				for(i = 0; i < 6; i += 1){
					bullet = instance_create_layer(x, y, "Instances", weapon1BulletType)
					bullet.direction = point_direction(x, y, mouse_x, mouse_y) + (-10 + 5*i)
				}
				weapon1Recharging = true
				alarm[1] = weapon1FireRate
			}
			break;
			
		case tool.Weapon2:
			if(!weapon2Recharging){
				bullet = instance_create_layer(x, y, "Instances", weapon2BulletType)

				weapon2Recharging = true
				alarm[2] = weapon2FireRate
			}
			break;
			
		case tool.BuildDMG:	
			if(ghostbuilding.inRange && ghostbuilding.clear){
				if (scrap >= 100){
				instance_create_layer(obj_game.activeTile_x, obj_game.activeTile_y, "Instances", obj_turret_0)
					scrap -= 100
				}
			}
			break;
		
		case tool.BuildSUP:
			break;
			
		case tool.Demolish:
			break;
	}
}

//mouse button held inputs
if(mouse_check_button(mb_left)){
	switch(active_tool){
		case tool.Tool:
			if(!meleeRecharging){
				
				melee = instance_create_layer(x + xOffset, y + yOffset, "Instances", obj_wrench)

				meleeRecharging = true
				alarm[3] = meleeFireRate
			}
			break;
			
		case tool.Weapon1:
			break;
			
		case tool.Weapon2:
			break;
			
		case tool.BuildDMG:	
			break;
		
		case tool.BuildSUP:
			break;
			
		case tool.Demolish:
			break;
	}
}

switch(active_tool){
	case tool.Tool:
		if(ghostbuilding != 0){
			instance_destroy(ghostbuilding)
			ghostbuilding = 0
		}
		break;
			
	case tool.Weapon1:
		if(ghostbuilding != 0){
			instance_destroy(ghostbuilding)
			ghostbuilding = 0
		}
		break;
			
	case tool.Weapon2:
		if(ghostbuilding != 0){
			instance_destroy(ghostbuilding)
			ghostbuilding = 0
		}
		break;
			
	case tool.BuildDMG:
	    ghostbuilding.x = obj_game.activeTile_x
		ghostbuilding.y = obj_game.activeTile_y
		break;
		
	case tool.BuildSUP:
		if(ghostbuilding != 0){
			instance_destroy(ghostbuilding)
			ghostbuilding = 0
		}
		break;
		
	case tool.Demolish:
		if(ghostbuilding != 0){
			instance_destroy(ghostbuilding)
			ghostbuilding = 0
		}
		break;
}

if(mouse_wheel_down()){
	cameraXScale = min(cameraXScale + 64, 640)
	cameraYScale = min(cameraYScale + 36, 360)
	
} else if (mouse_wheel_up()){
	cameraXScale = max(cameraXScale - 64, -640)
	cameraYScale = max(cameraYScale - 36, -360)
}

//better camera tracking
cameraX = x - 640;
cameraY = y - 360;

mouseToPlayerX = mouse_x - x;
mouseToPlayerY = mouse_y - y;

cameraX += mouseToPlayerX*.1;
cameraY += mouseToPlayerY*.1;


camera_set_view_size(view_camera[0], 1280 + cameraXScale, 720 + cameraYScale)
camera_set_view_pos(view_camera[0], cameraX - cameraXScale/2 , cameraY - cameraYScale/2);
aimDirection = point_direction(x,y,mouse_x,mouse_y);






