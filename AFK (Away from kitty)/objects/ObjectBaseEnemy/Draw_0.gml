draw_self();

var yOffset = 30;
var hHeight = 10;
var hWidth = 100;
var xPos = x - (hWidth / 2);
var yPos = y - yOffset;

draw_rectangle_colour(xPos, yPos, xPos + ((hp / maxHP) * hWidth), yPos + hHeight, c_red, c_red, c_red, c_red, false)