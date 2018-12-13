// Check if movement
var hspd = (keyboard_check(rKey) - keyboard_check(lKey)) * genSpd;
var vspd = (keyboard_check(dKey) - keyboard_check(uKey)) * genSpd;

// Update position
x += hspd;
y += vspd;
