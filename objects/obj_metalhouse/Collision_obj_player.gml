/// @description Insert description here
// You can write your code in this editor
if(!outputRecharging && other.scrap != other.maxScrap){
	scrapGiven =  min(outputAmount, scrap, other.maxScrap - other.scrap)
	other.scrap += scrapGiven
	scrap -= scrapGiven
	outputRecharging = true
	alarm[1] = outputRate
}