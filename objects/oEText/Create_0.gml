text = "No Effect Text";
font = fntDefault;
fade = true;
fadeTime = room_speed * 5;	// Time to get destroyed and completely fade
alph = 1;					// Text alpha
rotationAmount = 0;			// Amount to rotate text, set 0 if no rotation wanted
angle = 0;					// Angle to draw text
moveSpd = 1;				// scale of 0-1, 0 is slowest, 1 is fastest
xTo = x;					// X pos to float to
yTo = y;					// Y pos to float to
xS = 1;						// xscale for text
yS = 1;						// yscale for text

c1 = c_white;
c2 = c_white;
c3 = c_white;
c4 = c_white;

// destroy timer
alarm[0] = fadeTime;
