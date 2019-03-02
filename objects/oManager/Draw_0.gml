/// @description TEMPORARY FOR DEBUGGING
if (instance_exists(oPlayer))
{
	draw_text(oPlayer.x, oPlayer.y - 100, "Door list: " + string(global.PDoors));
	draw_text(oPlayer.x, oPlayer.y - 50, "Global curPDoor: " + string(global.curPDoor));
}
