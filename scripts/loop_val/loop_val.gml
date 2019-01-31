///@description 
///@param val
///@param min
///@param max
var val = argument0;
var min_ = argument1;
var max_ = argument2;

if (val > max_)
{
	val = min_;
} else if (val < min_)
{
	val = max_;
}
return val;
