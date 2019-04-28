/// @description TEMPORARY FOR TEXT EFFECT
var tmp = instance_create_layer(x, y, "Effect", oEText);
with (tmp)
{
	text = "<null>";
	rotationAmount = random_range(-5, 5);
	moveSpd = 0.01;
	xTo = random_range(0, room_width);
	yTo = random_range(0, room_height);
}
