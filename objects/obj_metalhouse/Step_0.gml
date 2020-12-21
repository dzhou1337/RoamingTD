/// @description Insert description here
// You can write your code in this editor
if (!refillRecharging){
	scrap = min(scrap + refillAmount, maxScrap)
	refillRecharging = true
	alarm[0] = refillRate
}

