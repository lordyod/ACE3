//by commy2
#include "script_component.hpp"

["inventoryDisplayLoaded", {

    [{
        private "_dialog";

        _dialog = _this select 0;

        if (isNull _dialog) exitWith {
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };

        _dialog displayCtrl 111 ctrlSetText format ["%1 - %2 %3", [ACE_player] call EFUNC(common,getName), localize "STR_ACE_Movement_Weight", [ACE_player] call FUNC(getWeight)];

    }, 0, _this select 0] call CBA_fnc_addPerFrameHandler;

}] call EFUNC(common,addEventHandler);

["ACE3", QGVAR(climb), localize "STR_ACE_Movement_Climb",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if (ACE_player != (vehicle ACE_player)) exitWith {false};

    // Statement
    [ACE_player] call FUNC(climb);
    true
},
{false},
[47, [false, true, false]], false] call cba_fnc_addKeybind; //DIK_V + CTRL//STRG
