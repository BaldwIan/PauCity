/// @arg file_name
var file = argument[0];

if (file_exists(file))
{
	var fileOpen = file_text_open_read(file);
	var myString = "";
	
	while (!file_text_eof(fileOpen))
	{
		myString += file_text_read_string(fileOpen);
		file_text_readln(fileOpen);
	}
	
	file_text_close(fileOpen);
	
	return myString;
	
} else
{
	return "file_not_found";
}
