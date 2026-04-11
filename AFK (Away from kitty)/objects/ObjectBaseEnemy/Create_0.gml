// Inherit the parent event
event_inherited();

meleeWeapon = "contact"
rangedWeapon = noone

moveSpeed = 4;
canSeePlayer = false;


addToStateList("STATE_ATTACKING");
addToStateList("STATE_CONTACT_HARM_PLAYER");

enum state {
	ATTACK,
	IDLE,
	SURROUND,
	APPROACH
}