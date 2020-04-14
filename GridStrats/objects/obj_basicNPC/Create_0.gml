event_inherited();

hp = 10;
thinkTime = 2;
think = 0;
ticks = 0;
trackHP = hp;
FOV = 10*global.TILE_SIZE; //How far an NPC Can see
tileRange = 2;


#region States
STATE_STATIC = 0;
STATE_ATTACK = 1;
STATE_HUNT = 2;

state = STATE_STATIC;
#endregion
