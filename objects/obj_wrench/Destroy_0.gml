var i;
listSize = ds_list_size(enemies_hit)

for (i = 0; i < listSize; i += 1) {
	toClear = ds_list_find_value(enemies_hit, i)
	toClear.hitByWrench = false;
}
