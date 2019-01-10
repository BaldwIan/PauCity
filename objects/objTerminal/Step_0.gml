// player detection
if (distance_to_object(objPlayer) < 96) {
	activatable = true;
	textAlpha += 0.04;
}
else {
	activatable = false;
	textAlpha -= 0.02;
}
textAlpha = clamp(textAlpha, 0, 0.6);
