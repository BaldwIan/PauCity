if (fade)
{
	alph = alarm[0] / fadeTime;
}

angle += rotation;
x = lerp(x, xTo, moveSpd);
y = lerp(y, yTo, moveSpd);
