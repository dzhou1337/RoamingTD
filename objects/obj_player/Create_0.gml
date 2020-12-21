/// @description initialize player

//movement numbers
maxspeed = 4;
accel = 1.8;
drag = .8;

//max range turrets can be interacted with
buildRange = 128

//normalization of mouse direction to simulate arm length
var xyVals = scr_normalize(x, y, mouse_x, mouse_y, 10)
xOffset = xyVals[0]
yOffset = xyVals[1]

//health
maxhp = 100
hp = 100

//weapon vals
weapon1BulletType = obj_bullet_player_shell
weapon1FireRate = 60
weapon1Recharging = false
alarm[1] = weapon1FireRate

weapon2BulletType = obj_bullet_player
weapon2FireRate = 10
weapon2Recharging = false
alarm[2] = weapon2FireRate

meleeFireRate = 30
meleeRecharging = false
alarm[3] = meleeFireRate

//ingame resource vals
maxScrap = 200
scrap = 200

money = 0

knocked = false

//camera vals for zooming in and out
cameraXScale = 0
cameraYScale = 0

//hotbar current player actions
enum tool{
	Tool,
	Weapon1,
	Weapon2,
	BuildDMG,
	BuildSUP,
	Demolish
}

active_tool = tool.Tool

aimDirection = point_direction(x,y,mouse_x,mouse_y);

ghostbuilding = 0

facingRight = false

