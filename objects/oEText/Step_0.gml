if (fade)
{
	alph = alarm[0] / fadeTime;
}

angle += rotationAmount;
x = lerp(x, xTo, moveSpd);
y = lerp(y, yTo, moveSpd);
