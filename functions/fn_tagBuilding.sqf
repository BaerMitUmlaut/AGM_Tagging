private ["_target", "_player", "_sprayDir", "_playerDir", "_tester", "_spray", "_moveVector", "_counter"];

_target = _this select 0;
_player = _this select 1;
_sprayDir = direction _target;
_playerDir = direction _player;

<<<<<<< HEAD
//_player switchMove "Acts_PercMstpSlowWrflDnon_handup1b";

=======
>>>>>>> 87a85e83e1b9fc37157c2b00cff98b8bc502426d
//The following ensures that it is aligned to one of the walls
// +it will be very well aligned to walls
// -does not work well with round or roundish buildings
while {abs (_sprayDir - _playerDir) > 45} do {
	_sprayDir = _sprayDir + 90;
	if (_sprayDir > 360) then {_sprayDir = _sprayDir - 360;};
};

//Create invisible tester object to detect the exact position of the wall
_tester = createVehicle ["Sign_Sphere10cm_F", ASLToATL eyePos _player, [], 0, "CAN_COLLIDE"];
[_tester, "{_this setObjectTextureGlobal [0, '']}", 1] call AGM_Core_fnc_execRemoteFnc;

_spray = createVehicle ["UserTexture1m_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_spray setDir _sprayDir;

//moveVector is a vector with the length of 10cm pointing towards the wall
_moveVector = (vectorDir _spray) vectorMultiply 0.1;
_counter = 0;

//Move tester forward 10cm each step until it hits the wall or it was moved 5m and still didn't hit anything - then something went wrong and the player is not facing a wall
while {!(lineIntersects [eyePos _player, getPosASL _tester, _player, _tester]) && _counter < 50} do {
	_tester setPosATL ((getPosATL _tester) vectorAdd _moveVector);
	_counter = _counter + 1;
};

if (_counter < 30) then {
	//Move spray to tester position -10cm back again, else it would be within the wall
	_spray setPosATL ((getPosATL _tester) vectorDiff (_moveVector));
	//Texturize spray
	[_spray, "{_this setObjectTextureGlobal [0, 'AGM_Tagging\UI\x_black_" + str(floor (random 5)) + ".paa']}", 1] call AGM_Core_fnc_execRemoteFnc;
} else {
	deleteVehicle _spray;
	["You are not close enough to a wall."] call AGM_Core_fnc_displayTextStructured;
};

<<<<<<< HEAD
deleteVehicle _tester;
=======
deleteVehicle _tester;
>>>>>>> 87a85e83e1b9fc37157c2b00cff98b8bc502426d
