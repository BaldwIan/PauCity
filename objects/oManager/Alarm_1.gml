/// @description Fade Out Black cts

if (ctsBlackA >= 1)
{
	ctsBlackA = 1;
} else
{
	ctsBlackA += 0.004;
	alarm[1] = 1;
}
