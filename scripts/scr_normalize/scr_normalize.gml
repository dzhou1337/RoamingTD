function scr_normalize(argument0, argument1, argument2, argument3, argument4) {
	var x1, y1, x2, y2, normfactor;

	x1 = argument0;
	y1 = argument1;
	x2 = argument2;
	y2 = argument3;
	normfactor = argument4;


	xDelta = x2 - x1;
	yDelta = y2 - y1;


	len = sqrt(sqr(xDelta) + sqr(yDelta))


	returnArray[2] = 0;

	returnArray[@0] = normfactor * xDelta/len
	returnArray[@1] = normfactor * yDelta/len

	return returnArray


}
