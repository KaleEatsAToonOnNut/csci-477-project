// Inherit the parent event
event_inherited();

moveSpeed = 4;
canSeePlayer = false;

addToStateList("STATE_CONTACT_HARM_PLAYER");

enum state {
	ATTACK,
	IDLE,
	SURROUND,
	APPROACH
}