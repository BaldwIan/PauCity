/// @description Fade Out Black cts

if (ctsBlackAInc > 0 && ctsBlackA >= 1 ^^ ctsBlackAInc < 0 && ctsBlackA <= 0)
{
	if (ctsBlackAInc > 0) ctsBlackA = 1;
	else ctsBlackA = 0;
} else
{
	ctsBlackA += ctsBlackAInc;
	alarm[1] = 1;
}
