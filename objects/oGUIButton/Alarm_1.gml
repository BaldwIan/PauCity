/// @description Set Text
var rmText = room_get_name(_room);	//TEMP
var actionTexts = ["NaN", "Exit Game", "Destroy Self", rmText, "Journal", "Puzzle", "Stay in Pau", "Ascend"];
text = actionTexts[action]; // Get text corresponding to action
